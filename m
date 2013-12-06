From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 06 Dec 2013 22:28:51 +0100
Subject: [Buildroot] [PATCH v2] pandaboard: fix defconf build with
	recent kernels
In-Reply-To: <1386362806-16798-1-git-send-email-thomas@cozybit.com> (Thomas
 Pedersen's message of "Fri, 6 Dec 2013 12:46:46 -0800")
References: <1386362806-16798-1-git-send-email-thomas@cozybit.com>
Message-ID: <8738m5d5yk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Pedersen <thomas@cozybit.com> writes:

 > The patch "pandaboard: Fix defconfig build" locked the
 > default pandaboard kernel to 3.8.11. This is inconvenient,
 > since the boot process has changed since kernel > 3.8.

 > Update the default kernel to 3.12.2 and fix the boot image
 > configuration, but remain compatible with legacy U-Boot
 > versions by using appended flattened device tree uImage.

 > This change *should* keep future kernels compatible with a
 > fixed U-Boot version.

 > Note the default device tree is now for the pandaboard-ES,
 > so users of other board revisions will need to set the
 > correct DTS_NAME.

 > Signed-off-by: Thomas Pedersen <thomas@cozybit.com>

 > ---
 >  configs/pandaboard_defconfig | 15 ++++++++++++---
 >  1 file changed, 12 insertions(+), 3 deletions(-)

 > diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
 > index 95cfdd6..47d01a2 100644
 > --- a/configs/pandaboard_defconfig
 > +++ b/configs/pandaboard_defconfig
 > @@ -11,14 +11,20 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 >  BR2_TARGET_ROOTFS_EXT2=y
 >  # BR2_TARGET_ROOTFS_TAR is not set
 
 > -# Lock to 3.8 headers to avoid breaking with newer kernels
 > -BR2_KERNEL_HEADERS_3_8=y
 > +# Lock to 3.12 headers to avoid breaking with newer kernels
 > +BR2_KERNEL_HEADERS_3_12=y

It's better to use the custom kernel header version so it doesn't break
once we remove the 3_12 option.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
