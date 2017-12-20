From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Dec 2017 20:14:58 -0800
Subject: [Buildroot] systemd: blkid support requested but libraries not found
Message-ID: <874lom2fy5.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi all,

I came across this error while debugging something else.

Defconfig:

BR2_arm=y
BR2_cortex_a7=y
BR2_CCACHE=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_27_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_INIT_SYSTEMD=y
BR2_SYSTEM_BIN_SH_BASH=y

Error:

checking for blkid... no
configure: error: *** blkid support requested but libraries not found
make: *** [package/pkg-generic.mk:227: /home/paralin/Documents/buildroot/output/build/systemd-234/.stamp_configured] Error 1

Perhaps there is a missing dependency on blkid somewhere? Or is this
indicative of a bigger problem?

Thanks,
Christian Stewart
