From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Feb 2012 20:44:02 +0100
Subject: [Buildroot] [PATCH 1/2] udev: bump to 181 and other fixes
In-Reply-To: <1328631380-12272-1-git-send-email-yegorslists@googlemail.com>
References: <1328631380-12272-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <201202072044.02929.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday 07 February 2012 17:16:19 yegorslists at googlemail.com wrote:
> From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>

 Sorry about that - I have --reset-author on by default on 
git commit --amend.  Yegor should remain as author, of course.

[snip]
>  config BR2_PACKAGE_UDEV_ALL_EXTRAS
>  	bool "enable all extras"
> -	depends on BR2_LARGEFILE # acl
> -	depends on BR2_USE_WCHAR # libglib2
>  	select BR2_PACKAGE_ACL
> -	select BR2_PACKAGE_LIBUSB
> -	select BR2_PACKAGE_LIBUSB_COMPAT
> -	select BR2_PACKAGE_USBUTILS
>  	select BR2_PACKAGE_HWDATA
>  	select BR2_PACKAGE_LIBGLIB2
>  	help
>  	  Enable all extras with external dependencies like
> -	  libacl, libusb, libusb-compat, usbutils, hwdata
> -
> -comment "udev extras requires a toolchain with LARGEFILE + WCHAR support"
> -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> +	  libacl, hwdata and libglib2
[snip]
>  ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
> -UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
> -UDEV_CONF_OPT +=							\
> -	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
> -	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
> +UDEV_DEPENDENCIES += acl usbutils hwdata libglib2

 There's an inconsistency between the config and the mk-file here:
mk-file depends on usbutils but Config.in doesn't select it. I realize 
I wrote this myself - to err is human :-)

 Regards,
 Arnout


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
