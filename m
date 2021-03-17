From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 17 Mar 2021 23:00:08 +0000
Subject: [Buildroot] [Bug 13551] 2021.02.rc2: Unicode not work on qt 5.15.2
In-Reply-To: <bug-13551-163@https.bugs.busybox.net/>
References: <bug-13551-163@https.bugs.busybox.net/>
Message-ID: <bug-13551-163-thtVPsW48Q@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=13551

--- Comment #11 from Peter Seiderer <ps.report@gmx.net> ---
(In reply to Alfredo Pons Menargues from comment #10)

Example works for me (Desktop/RPi4) as expected, both times the
'Trigram For Heaven' (U+2620, see [1]) is shown...

Back to the hint from my first reply: 

- please describe exactly what (and how) did you test
- please describe exactly which result did you expect and which result did you
get?
- which target hardware, which buildroot version and provide your used
  defconfig


Test on RPi4 was done with the following defconfig:

BR2_aarch64=y
BR2_cortex_a72=y
BR2_ARM_FPU_VFPV4=y
BR2_ENABLE_DEBUG=y
BR2_OPTIMIZE_3=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
BR2_BINUTILS_VERSION_2_36_X=y
BR2_GCC_VERSION_10_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_SYSTEM_DHCP="eth0"
BR2_GENERATE_LOCALE="en_US"
BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call
github,raspberrypi,linux,967d45b29ca2902f031b867809d72e3b3d623e7a)/linux-967d45b29ca2902f031b867809d72e3b3d623e7a.tar.gz"
BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_STRACE=y
BR2_PACKAGE_DEJAVU=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_V3D=y
BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_OPENGL_LIB=y
BR2_PACKAGE_QT5BASE_EGLFS=y
BR2_PACKAGE_QT5BASE_DEFAULT_QPA="eglfs"
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_HARFBUZZ=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5QUICKCONTROLS=y
BR2_PACKAGE_QT5QUICKCONTROLS2=y
BR2_PACKAGE_RPI_FIRMWARE=y
BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
BR2_PACKAGE_OPENSSH=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
BR2_TARGET_ROOTFS_EXT2_SIZE="384M"
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MTOOLS=y

and 'dtoverlay=vc4-kms-v3d-pi4' enabled...

[1] https://codepoints.net/U+2630?lang=de

-- 
You are receiving this mail because:
You are on the CC list for the bug.
