From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Mar 2012 13:29:39 +0100
Subject: [Buildroot] [PATCH 5/6] Fix installation for the lighttpd
	package
In-Reply-To: <4F68510C.2030306@free-electrons.com>
References: <cover.1332172636.git.maxime.ripard@free-electrons.com>
 <201203200051.48409.arnout@mind.be> <4F68510C.2030306@free-electrons.com>
Message-ID: <201203201329.39513.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 20 March 2012 10:42:36 Maxime Ripard wrote:
> Le 20/03/2012 00:51, Arnout Vandecappelle a ?crit :
> > On Monday 19 March 2012 16:59:39 Maxime Ripard wrote:
> >>  package/lighttpd/lighttpd.conf |  445 ++++++++++++++++++++++++++++++++++++++++
> > 
> >  Same remark as for systemd: wouldn't it be better to patch the upstream
> > file instead of copying it?  Also, why did you revert the disabling of
> > range requests for pdf documents?
> 
> Well, here, the default values are sensible.
> I mean, for a default configuration file, it is a normal behaviour for a
> modern webserver to start it with its own UID/GID and to enable ipv6.
> I don't see why they would accept a patch that disable these.

 With 'patching the upstream file' I mean adding a patch to buildroot
that modifies the upstream source file.  Although I like Peter's 
suggestion to fixup the files with SED as well.  But for this one, that
would be difficult.

> For PDF ranges option, it relies on a regex, and we don't always compile
> with pcre, so I turned it down.

 That's a good reason.

[snip]

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
