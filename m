From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jun 2012 09:22:21 +0200
Subject: [Buildroot] [PATCH v2] Update gdisk (gptfdisk) to version 0.8.5.
In-Reply-To: <20120614090408.18178089@skate>
References: <1339626043-11946-1-git-send-email-jmaggard10@gmail.com>
 <4FD91F63.5030806@mind.be> <20120614090408.18178089@skate>
Message-ID: <4FD9912D.9060403@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/14/12 09:04, Thomas Petazzoni wrote:
> Le Thu, 14 Jun 2012 01:16:51 +0200,
> Arnout Vandecappelle<arnout@mind.be>  a ?crit :
>
> >> >  >  -GDISK_VERSION = 0.6.14
> >> >  >  +GDISK_VERSION = 0.8.5
> >> >  >     GDISK_SITE =
> >> >  >  http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/gptfdisk
> >> >  >  -GDISK_SOURCE = gdisk-$(GDISK_VERSION).tgz +GDISK_SOURCE =
> >> >  >  gptfdisk-$(GDISK_VERSION).tar.gz
> >> >  >
> >> >  >     GDISK_TARGETS_$(BR2_PACKAGE_GDISK_GDISK) += gdisk
> >> >  >     GDISK_TARGETS_$(BR2_PACKAGE_GDISK_SGDISK) += sgdisk
> > >
> > >     Since the upstream name has changed, I would change the buildroot
> > >  package name as well.  Again, it's a bit more work though.  Also it
> > >  would make existing config files that select gdisk invalid - I'm not
> > >  sure if Peter allows that.
> You can rename the package, and do something like:
>
> config BR2_PACKAGE_NEW_NAME
>     bool "new-name"
>     help
>       Blabla
>
> # This is a transitional option kept for compatibility
> # reasons with the old name of this package. It can be removed
> # in 2013.05
> config BR2_PACKAGE_OLD_NAME
>     bool
>     select BR2_PACKAGE_NEW_NAME
>
> So that existing configurations continue to work for one year.

  I thought so too, but I tried it yesterday and it didn't seem to work...

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
