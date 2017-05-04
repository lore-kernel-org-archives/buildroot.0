From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 04 May 2017 09:24:53 +0200
Subject: [Buildroot] [v3 1/1] configs: add raspberrypi3 64bits defconfig
In-Reply-To: <20170418155959.27129-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Tue, 18 Apr 2017 11:59:59 -0400")
References: <20170418155959.27129-1-gael.portay@savoirfairelinux.com>
Message-ID: <87zietaxtm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > This configuration builds a 64bit image for RaspberryPi 3.
 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
 > ---
 > Changes since v2:
 > - Set Floating Point Unit to VFPv4 (Martin Bark)

 > Changes since v1:
 > - Symlink raspberrypi3-64 and update BR2_ROOTFS_POST_[BUILD|IMAGE]_SCRIPT
 > - Add BR2_cortex_a53 architecture
 > - Set BR2_TARGET_ROOTFS_EXT2_BLOCKS to 120000
 > - Update kernel repository version

 > diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
 > new file mode 100644
 > index 000000000..aa78c162b
 > --- /dev/null
 > +++ b/configs/raspberrypi3_64_defconfig
 > @@ -0,0 +1,39 @@
 > +BR2_aarch64=y
 > +BR2_cortex_a53=y
 > +BR2_ARM_FPU_VFPV4=y
 > +
 > +BR2_GCC_VERSION_6_X=y
 > +BR2_TOOLCHAIN_BUILDROOT_GLIBC=y

Any specific reason why you want to use gcc 6.x / glibc? We normally
don't do that in our defconfigs, and gcc 5 / uClibc works here with a
quick test - So I've removed it.

 > +# Filesystem / image
 > +BR2_TARGET_ROOTFS_EXT2=y
 > +BR2_TARGET_ROOTFS_EXT2_4=y
 > +BR2_TARGET_ROOTFS_EXT2_BLOCKS=120000

I was going to drop this EXT2_BLOCKS, but I did a test build and the
kernel config indeed enables so many modules that they don't fit in our
default size, so I've added a comment about that and committed, thanks.

-- 
Bye, Peter Korsgaard
