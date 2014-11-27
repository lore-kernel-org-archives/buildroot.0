From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 16:21:28 +0100
Subject: [Buildroot] [PATCH] Add a defconfig for MIPS Creator CI20
In-Reply-To: <1417100707-23700-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 27 Nov 2014 15:05:07 +0000")
References: <1417100707-23700-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87y4qwoeiv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > MIPS Creator CI20 is a Linux and Android development system from
 > MIPS/Imagination Technologies. It incorporates an Ingenic JZ4780 SoC
 > which includes a 1.2GHz dual core MIPS32 processor and Imagination
 > PowerVR SGX540 GPU.

 > More information can be found at:
 >   http://elinux.org/MIPS_Creator_CI20

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  configs/ci20_defconfig |   10 ++++++++++
 >  1 files changed, 10 insertions(+), 0 deletions(-)
 >  create mode 100644 configs/ci20_defconfig

 > diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
 > new file mode 100644
 > index 0000000..88930fa
 > --- /dev/null
 > +++ b/configs/ci20_defconfig
 > @@ -0,0 +1,10 @@
 > +BR2_mipsel=y
 > +BR2_mips_32r2=y
 > +# BR2_MIPS_SOFT_FLOAT is not set
 > +BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 > +BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
 > +BR2_LINUX_KERNEL=y
 > +BR2_LINUX_KERNEL_CUSTOM_GIT=y
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/MIPS/CI20_linux.git"
 > +BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="ci20-v3.0.8"

Thanks, but this is a branch, not a tag - Right?

To have a reproducable build, we should select a tag or a specific sha1.

What about u-boot and perhaps a readme about how to use it?

-- 
Peter Korsgaard 
