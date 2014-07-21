From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 21 Jul 2014 15:10:56 +0200
Subject: [Buildroot] [PATCH 1/1 v2] package/eudev: Bump version to 1.9
In-Reply-To: <1405633246-17081-1-git-send-email-bernd.kuhls@t-online.de>
References: <1405633246-17081-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <53CD1160.3080501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/07/14 23:40, Bernd Kuhls wrote:
> - Switch EUDEV_SITE to official upstream:
>   http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/sys-fs/eudev/eudev-1.9-r1.ebuild?view=markup
>   Github does not carry this current eudev version.
> 
> - Remove EUDEV_AUTORECONF = yes, tarball contains ./configure
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> ---
> v2: Removed EUDEV_AUTORECONF (Thomas)
> 
>  package/eudev/eudev.mk |    6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 5f1525c..c6d020f 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -EUDEV_VERSION = v1.7
> -EUDEV_SITE = $(call github,gentoo,eudev,$(EUDEV_VERSION))
> +EUDEV_VERSION = 1.9
> +EUDEV_SOURCE = eudev-$(EUDEV_VERSION).tar.gz
> +EUDEV_SITE = http://dev.gentoo.org/~blueness/eudev

 Hi Bernd,

 The help text in Config.in still points to github. Care to fix? Or is that site
still correct?


 Regards,
 Arnout

>  EUDEV_LICENSE = GPLv2+ (programs), LGPLv2.1+ (libraries)
>  EUDEV_LICENSE_FILES = COPYING
>  EUDEV_INSTALL_STAGING = YES
> -EUDEV_AUTORECONF = YES
>  
>  # mq_getattr is in librt
>  EUDEV_CONF_ENV += LIBS=-lrt
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
