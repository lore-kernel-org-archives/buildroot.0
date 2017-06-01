From: Christian Stewart <christian@paral.in>
Date: Wed, 31 May 2017 19:29:11 -0700
Subject: [Buildroot] systemd: build failure against pam on arm
Message-ID: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Compiling against 2017.05, with the following defconfig:

BR2_arm=y
BR2_cortex_a15=y
BR2_ARM_FPU_NEON_VFPV4=y
BR2_OPTIMIZE_2=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_INIT_SYSTEMD=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_LINUX_PAM=y

I get this error consistently during the systemd compilation when PAM
is enabled:

/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam.so: incompatible target
/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/6.3.1/../../../../arm-linux-gnueabihf/bin/ld.gold:
error: /lib/libpam_misc.so: incompatible target
collect2: error: ld returned 1 exit status

It looks like it's attempting to link against /lib/libpam.so from my system.

This is a pretty huge showstopper!

Thanks,
Christian Stewart
