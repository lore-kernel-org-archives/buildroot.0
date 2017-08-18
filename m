From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Aug 2017 18:49:02 +0200
Subject: [Buildroot] [PATCH] gcc: bump 7.x series to 7.2.0
References: <20170816203025.22554-1-thomas.petazzoni@free-electrons.com>
 <20170817194425.62504831@windsurf>
Message-ID: <ucij6ex70a.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Thu, 17 Aug 2017 19:44:25 +0200 schrieb Thomas Petazzoni:

> However, I don't really mind, so I'll let others give their opinion on
> this.

Hi Thomas,

building this Kodi defconfig with your patch works:

BR2_x86_64=y
BR2_x86_core_avx2=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_KODI=y
BR2_PACKAGE_KODI_ALSA_LIB=y
BR2_PACKAGE_KODI_BLUEZ=y
BR2_PACKAGE_KODI_LIBBLURAY=y
BR2_PACKAGE_KODI_LIBCEC=y
BR2_PACKAGE_KODI_LIBVA=y
BR2_PACKAGE_MESA3D=y
BR2_PACKAGE_MESA3D_DRI_DRIVER_I965=y
BR2_PACKAGE_MESA3D_OPENGL_EGL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_PYTHON=y
BR2_PACKAGE_PYTHON_PY_ONLY=y

Imho you can commit your patch to the master branch.

Regards, Bernd
