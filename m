From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Mon,  6 Jul 2015 16:15:52 +0000 (UTC)
Subject: [Buildroot] [Bug 8206] New: mplayer uses host xorg development files
Message-ID: <bug-8206-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8206

           Summary: mplayer uses host xorg development files
           Product: buildroot
           Version: 2015.05
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: glscantlen at gmail.com
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


I am using buildroot-2015.05
Installed on a fresh Ubuntu 14.04 host, with only basic build requirements ie
"apt-get install build-essential git ccache"

I have configured BuildRoot for basic Xorg with mplayer. (I'll attach
defconfig)
The "make" passes without error and everything works on target H/W except
mplayer.
Mplayer acts as-if there is no xorg.
I have discovered, if I "apt-get install xorg-dev" to the host and rebuild
mplayer it will then work.
Why is mplayer's configure using the host's xorg-development files? I would
expect it must use the BuildRoot tree's development files.

sorry I can not attach a simple text file... DAH!
So I'll just paste here:

BR2_arm=y
BR2_cortex_a7=y
BR2_ARM_EABIHF=y
BR2_DEFCONFIG="$(CONFIG_DIR)/defconfig"
BR2_CCACHE=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PATH="$(HOME)/xu3_mplayer/linaro-4.9"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_17=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_ROOTFS_POST_BUILD_SCRIPT="support/scripts/config_eth"
BR2_PACKAGE_ALSA_UTILS=y
BR2_PACKAGE_ALSA_UTILS_SPEAKER_TEST=y
BR2_PACKAGE_FFMPEG=y
BR2_PACKAGE_MPLAYER=y
BR2_PACKAGE_MESA3D_DEMOS=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_SWRAST=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_MESA3D_OPENGL_ES=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y
BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX=y
BR2_PACKAGE_XAPP_TWM=y
BR2_PACKAGE_XAPP_XCLOCK=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_EVDEV=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_KEYBOARD=y
BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_ARMSOC=y
BR2_PACKAGE_XDRIVER_XF86_VIDEO_FBDEV=y
BR2_PACKAGE_XTERM=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_BZIP2=y
BR2_PACKAGE_PYTHON_READLINE=y
BR2_PACKAGE_PYTHON_SSL=y
BR2_PACKAGE_PYTHON_PYEXPAT=y
BR2_PACKAGE_PYTHON_ZLIB=y
BR2_PACKAGE_LIBDRI2=y
BR2_PACKAGE_LIBDRM_EXYNOS=y
BR2_PACKAGE_LIBGLEW=y
BR2_PACKAGE_LIBGLU=y
BR2_PACKAGE_WAYLAND=y
BR2_PACKAGE_OPENSSH=y
BR2_PACKAGE_RSYNC=y

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
