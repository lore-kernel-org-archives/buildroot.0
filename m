From: Lennart Ramberg <ramberg.lennart@gmail.com>
Date: Thu, 10 Sep 2015 09:15:42 +0200
Subject: [Buildroot] Xorg Segmentation fault now. Please help
Message-ID: <CAEzGmjDwBwLt8kynQpjj-2sKtOX6Un7TLXX1i7sH6vBODda+9A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

After having been away from Buildroot since last year, I'm at it again.
But I had a setback;

With 2014.11 the xorg-server runs allright.
Jumping to 2015.08.1 the xorg-server won't run.
Why might this be? Please help.

Below is a part of my /var/log/Xorg.0.log after I executed 'X',
as well as my defconfig (and there is nothing suspicious in the overlays).
And I did a 'make clean all' first.

Thanks and regards
Lennart

/var/log/Xorg.0.log:
...
[3060362.875]   compiled for 1.17.2, module version = 1.8.1
[3060362.875]   Module class: X.Org XInput Driver
[3060362.875]   ABI class: X.Org XInput driver, version 21.0
[3060362.875] (II) intel: Driver for Intel(R) Integrated Graphics Chipsets:
        i810, i810-dc100, i810e, i815, i830M, 845G, 854, 852GM/855GM, 865G,
        915G, E7221 (i915), 915GM, 945G, 945GM, 945GME, Pineview GM,
        Pineview G, 965G, G35, 965Q, 946GZ, 965GM, 965GME/GLE, G33, Q35,
Q33,
        GM45, 4 Series, G45/G43, Q45/Q43, G41, B43
[3060362.875] (II) intel: Driver for Intel(R) HD Graphics: 2000-6000
[3060362.875] (II) intel: Driver for Intel(R) Iris(TM) Graphics: 5100, 6100
[3060362.875] (II) intel: Driver for Intel(R) Iris(TM) Pro Graphics: 5200,
6200
, P6300
[3060362.875] (--) using VT number 2

[3060362.891] (II) intel(0): Using Kernel Mode Setting driver: i915,
version 1.
6.0 20150327
[3060362.901] (--) intel(0): Integrated Graphics Chipset: Intel(R)
852GM/855GM
[3060362.901] (--) intel(0): CPU: x86, sse2
[3060362.901] (II) intel(0): Creating default Display subsection in Screen
section
        "Builtin Default intel Screen 0" for depth/fbbpp 24/32
[3060362.901] (==) intel(0): Depth 24, (--) framebuffer bpp 32
[3060362.901] (==) intel(0): RGB weight 888
[3060362.901] (==) intel(0): Default visual is TrueColor
[3060362.902] (EE)
[3060362.903] (EE) Backtrace:
[3060362.904] (EE) 0: X (xorg_backtrace+0x49) [0x816d97a]
[3060362.905] (EE) 1: X (0x8048000+0x128c18) [0x8170c18]
[3060362.905] (EE) 2: linux-gate.so.1 (__kernel_rt_sigreturn+0x0)
[0xb76f4b58]
[3060362.906] (EE)
[3060362.907] (EE) Segmentation fault at address 0x0
[3060362.907] (EE)
Fatal server error:
[3060362.908] (EE) Caught signal 11 (Segmentation fault). Server aborting
...

2015.08.1 defconfig:
BR2_x86_i686=y
BR2_CCACHE=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
# BR2_TARGET_GENERIC_GETTY is not set
BR2_ROOTFS_OVERLAY="board/eta/board1/rootfs-overlay/"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_DEFCONFIG="i386"
BR2_LINUX_KERNEL_INSTALL_TARGET=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XAPP_XINIT=y
BR2_PACKAGE_XAPP_XWD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_INTEL=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_SQLITE=y
BR2_PACKAGE_LIBGTK2=y
BR2_PACKAGE_LIBCURL=y
BR2_PACKAGE_NTP=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_SUPERVISOR=y
BR2_PACKAGE_NANO=y
# BR2_PACKAGE_NANO_TINY is not set
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_BLOCKS=1000000
BR2_TARGET_GRUB2=y

---
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150910/b43d7c65/attachment.html>
