From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 09 Jul 2012 22:18:49 +0200
Subject: [Buildroot] [PATCH] package/usbutils: bump to version 006
In-Reply-To: <1341863434-577-1-git-send-email-zonque@gmail.com>
References: <1341863434-577-1-git-send-email-zonque@gmail.com>
Message-ID: <4FFB3CA9.8000303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/09/12 21:50, Daniel Mack wrote:
> Also, as the kernel.org archives are back up, use them as official site
> again.
>
> Signed-off-by: Daniel Mack<zonque@gmail.com>
> ---
>   package/usbutils/usbutils.mk |    6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
> index a242f93..0554682 100644
> --- a/package/usbutils/usbutils.mk
> +++ b/package/usbutils/usbutils.mk
> @@ -4,9 +4,9 @@
>   #
>   #############################################################
>
> -USBUTILS_VERSION = 005
> -USBUTILS_SITE = http://snapshot.debian.org/archive/debian/20111211T214105Z/pool/main/u/usbutils/
> -USBUTILS_SOURCE = usbutils_$(USBUTILS_VERSION).orig.tar.gz
> +USBUTILS_VERSION = 006
> +USBUTILS_SITE = http://www.kernel.org/pub/linux/utils/usb/usbutils/

  This should be
USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils


  Regards,
  Arnout


> +USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.gz
>   USBUTILS_DEPENDENCIES = host-pkg-config libusb
>   USBUTILS_INSTALL_STAGING = YES
>   # no configure in tarball

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
