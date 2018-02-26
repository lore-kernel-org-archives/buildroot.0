From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon, 26 Feb 2018 13:59:52 +0000
Subject: [Buildroot] [Bug 10811] New: kodi-17.6-Krypton does not compile for
 freescale_* devices
Message-ID: <bug-10811-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=10811

            Bug ID: 10811
           Summary: kodi-17.6-Krypton does not compile for freescale_*
                    devices
           Product: buildroot
           Version: 2018.02
          Hardware: Other
                OS: Linux
            Status: NEW
          Severity: blocker
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: ossisyri at gmail.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Created attachment 7491
  --> https://bugs.busybox.net/attachment.cgi?id=7491&action=edit
Kodi compile error log

Kodi-17.6-Krypton does not compile for freescale_* devices:


/home/os/imx6sl/buildroot/output/build/kodi-17.6-Krypton/xbmc/windowing/egl/EGLWrapper.cpp:217:41:
error: ?XBNativeDisplayType? was not declared in this scope
   if (!m_nativeTypes->GetNativeDisplay((XBNativeDisplayType**)&nativeDisplay))


Complete error log and buildroot defconfig attached. Do they help us to find
reason and fix for failure?

I am currently testing it for freshly added freescale solo lite, but i have
tested same for already earlier supported freescale_imx6qsabresd_defconfig.
(imx6s has not been earlier supported by Buildroot imx firmware package, these
2018-02 RC's have been the very first releases).



BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_NEON=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_FPU_VFPV3=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y
BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_GIT=y
BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
BR2_LINUX_KERNEL_DTS_SUPPORT=y
BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_AVAHI=y
BR2_PACKAGE_KODI_DBUS=y
BR2_PACKAGE_KODI_LIBMICROHTTPD=y
BR2_PACKAGE_KODI_NONFREE=y
BR2_PACKAGE_KODI_UPNP=y
BR2_PACKAGE_KODI_AUDIOENCODER_LAME=y
BR2_PACKAGE_FREESCALE_IMX=y
BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S=y
BR2_PACKAGE_IMX_GPU_VIV=y
BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_PYC=y
BR2_PACKAGE_LIBIMXVPUAPI=y
BR2_PACKAGE_DROPBEAR=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_UBOOT=y
BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
BR2_TARGET_UBOOT_FORMAT_IMX=y
BR2_PACKAGE_HOST_DOSFSTOOLS=y
BR2_PACKAGE_HOST_GENIMAGE=y
BR2_PACKAGE_HOST_MKPASSWD=y
BR2_PACKAGE_HOST_MTOOLS=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
