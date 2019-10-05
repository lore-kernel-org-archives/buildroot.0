From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Sat, 05 Oct 2019 18:11:10 +0000
Subject: [Buildroot] [Bug 12131] qt5webengine builderror in the latest
 stable Buildroot 2019.05.01 version
In-Reply-To: <bug-12131-163@https.bugs.busybox.net/>
References: <bug-12131-163@https.bugs.busybox.net/>
Message-ID: <bug-12131-163-WvRrAHkkSR@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=12131

--- Comment #14 from Bernd Kuhls <bernd.kuhls@t-online.de> ---
I could reproduce the error:

[9/11078] CXX obj/skia/skia/SkPaintFilterCanvas.o
FAILED: obj/skia/skia/SkPaintFilterCanvas.o 
[...]
/home/buildroot/br5/output/host/i586-buildroot-linux-gnu/include/c++/9.2.0/cstdlib:75:15:
fatal error: stdlib.h: No such file or directory
   75 | #include_next <stdlib.h>

using this defconfig:

BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_BINUTILS_VERSION_2_32_X=y
BR2_GCC_VERSION_9_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_GLX=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5WEBENGINE=y
BR2_PACKAGE_XORG7=y

-- 
You are receiving this mail because:
You are on the CC list for the bug.
