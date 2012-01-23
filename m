From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Jan 2012 21:31:09 +0100
Subject: [Buildroot] [PATCH 1/2] re: new package
In-Reply-To: <20120123111235.58b957ff@skate>
References: <1327240226-6082-1-git-send-email-arnout@mind.be>
 <20120123111235.58b957ff@skate>
Message-ID: <201201232131.09850.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 23 January 2012 11:12:35 Thomas Petazzoni wrote:
> Le Sun, 22 Jan 2012 14:50:24 +0100,
> "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :
> 
> >  package/Config.in    |    1 +
> >  package/re/Config.in |   11 +++++++++++
> >  package/re/re.mk     |   49 +++++++++++++++++++++++++++++++++++++++++++++++++
> 
> Upstream, the package seems to be named 'libre' (the tarball is named
> re-..., but the library is documented as libre on the website),
> shouldn't we use the same name in Buildroot?

 I also found libre a more logical name, but since the tar was called 
re-$(VERSION).tar.gz I thought to keep that.  I hadn't thought of looking
at the official name on the website, though.

 I'll make a respin with libre instead of re.

> > +define RE_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -m 644 -D $(@D)/libre.so $(TARGET_DIR)/usr/lib/libre.so
> > +endef
> 
> I guess that the package build system doesn't use .so versioning?

 Not that I could find, no.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
