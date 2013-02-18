From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 22:36:32 +0100
Subject: [Buildroot] autopoint [was: Re:  multchoice menu with kconfig]
In-Reply-To: <512257AB.6040001@petroprogram.com>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
 <5122506E.8030008@petroprogram.com> <512251F3.7060101@mind.be>
 <512253C8.2050309@petroprogram.com> <51225580.3060206@mind.be>
 <512257AB.6040001@petroprogram.com>
Message-ID: <51229EE0.2000706@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 17:32, Stefan Fr?berg wrote:
> Speaking of autoconf (or actually autoreconf):
>
> I have a prelink package ready here and I had to do PRELINK_AUTORECONF =
> YES what happens is that it complains about
> missing ./ABOUT-NLS and ./config.rpath .
> I tried to give PRELINK_AUTORECONF_OPTS = --install --force so that it
> would create those missing files but it did not change anything.
>
> The only thing that worked was doing the following horrible looking stuff:
>
> define PRELINK_POST_PATCH_FIXUP
>      (cd $(@D); \
>      autopoint)
> endef
>
> PRELINK_POST_PATCH_HOOKS += PRELINK_POST_PATCH_FIXUP
>
> Im still using 2012.08 version of buildroot so could that be the reason
> that buildroots autoreconf does not create those two missing files ?

  Packages that require autopoint can't be reconfigured by buildroot - 
I'm not sure why. The autopoint program is not one of our dependencies, 
so we can't rely on autopoint being present.

  However, now that there is a host-gettext package, we could probably 
add the possibility to add autopoint support to autoreconf.

  Just touching ABOUT-NLS and config.rpath may also work, though.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
