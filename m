From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 29 Jan 2014 08:53:39 +0100
Subject: [Buildroot] [PATCH] defconfig for Phytec Cosmic-AM335x Board
In-Reply-To: <87lhxzzrj3.fsf@dell.be.48ers.dk>
References: <1390908698-7256-1-git-send-email-praveen.v@phytec.in>
 <87lhxzzrj3.fsf@dell.be.48ers.dk>
Message-ID: <52E8B383.5050406@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 23:10, Peter Korsgaard wrote:
>>>>>> "Praveen" == Praveen kumar Vattipalli <praveen.v@phytec.in> writes:
[snip]
>   > +
>   > +Result of the build
>   > +-------------------
>   > +
>   > +After building, you should obtain this tree:
>   > +
>   > +	output/images/
>   > +		+-- rootfs.tar
>   > +		+-- barebox.bin
>   > +		+-- uImage
>   > +
>   > +To boot the board you need MLO (primary bootloader) so download from below link
>   > +ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/images/MLO
>
> Hmm, can't we build MLO ourselves?

  The patch that makes that possible in barebox was just rejected in 
patchwork...

[snip]
>   > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-cortexa8-linux-gnueabi"
>   > +BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>   > +BR2_TOOLCHAIN_EXTERNAL_CXX=y
>   > +BR2_TARGET_GENERIC_HOSTNAME="Cosmic-AM335x"
>   > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
>   > +BR2_TARGET_GENERIC_GETTY_PORT="ttyO0"
>   > +BR2_TARGET_GENERIC_GETTY_TERM=""
>   > +BR2_LINUX_KERNEL=y
>   > +BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>   > +BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="ftp://ftp.phytec.de/pub/Products/India/Cosmic-AM335x/Linux/PD13.0.0/src/linux/linux-3.2.tar.bz2"
>
> No mainline support?

  3.2 so still using board files...

[snip]

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
