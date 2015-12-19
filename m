From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Dec 2015 17:57:54 +0100
Subject: [Buildroot] [PATCH v4
 2/2]package/x11r7/xdriver_xf86-video-nouveau:new package
References: <1450534925-9099-1-git-send-email-bernd.kuhls@t-online.de>
 <1450534925-9099-2-git-send-email-bernd.kuhls@t-online.de>
 <20151219155647.0a4ca4b8@free-electrons.com>
Message-ID: <itegkcxlsq.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Sat, 19 Dec 2015 15:56:47 +0100 schrieb Thomas Petazzoni:

> Dear Bernd Kuhls,
> [...]
> I've still applied your package because this issue needs to be fixed
> separately, and address for all three Config.in options.

thanks!

> Essentially, this happens because I'm building on ARM, and the
> BR2_PACKAGE_LIBDRM_NOUVEAU option is only available on i386 and x86_64.
> However, I wonder why BR2_PACKAGE_LIBDRM_NOUVEAU is not available on
> ARM, since I'm pretty sure that the Nouveau driver is used on ARM on
> some Tegra platforms.

Looking at libdrm/Config.in the restriction on Intel hardware was
added in 2013, it seems no one cared until now ;)

$ git blame package/libdrm/Config.in | grep -A2 NOUVEAU
b35acfff (Spenser Gilliland 2013-09-05 23:25:15 -0500 37) config BR2_PACKAGE_LIBDRM_NOUVEAU
b35acfff (Spenser Gilliland 2013-09-05 23:25:15 -0500 38) 	bool "nouveau"
b35acfff (Spenser Gilliland 2013-09-05 23:25:15 -0500 39) 	depends on BR2_i386 || BR2_x86_64

> Right now, this causes a build failure:

Should be fixed by
http://patchwork.ozlabs.org/patch/559217/
http://patchwork.ozlabs.org/patch/559218/

Regards, Bernd
