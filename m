From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 17:30:05 +0100
Subject: [Buildroot] [PATCH 1/1] new package - generate iso with
 isolinux bootloader
In-Reply-To: <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
References: <y> <1376644934-4302-1-git-send-email-jean.sorgemoel@laposte.net>
Message-ID: <20140128173005.3beb329f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear jean,

On Fri, 16 Aug 2013 11:22:14 +0200, jean wrote:

> diff --git a/fs/isolinux/Config.in b/fs/isolinux/Config.in
> new file mode 100644
> index 0000000..8abe409
> --- /dev/null
> +++ b/fs/isolinux/Config.in
> @@ -0,0 +1,182 @@
> +## Menu ISO image with syslinux
> +menu "iso image (isolinux bootloader - with initramfs)"
> +config BR2_TARGET_ROOTFS_ISO_ISOLINUX

I don't agree with the idea that this is introduced as a new filesystem
type. I'm sorry, but "isolinux" is not a filesystem type, it's a
bootloader.

Instead, if you want to support ISO9660 images that use isolinux as the
bootloader instead of Grub (as is currently supported in fs/iso9660),
then you should expand fs/iso9660/ to support either Grub or isolinux
as the bootloader. Probably with a Config.in "choice" in
fs/iso9660/Config.in.

This way, all your improvements such as offering options for Joliet,
Rock Ridge support and so on will also benefit to the existing iso9660
support.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
