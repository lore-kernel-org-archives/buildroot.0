From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 10 May 2020 22:34:24 +0200
Subject: [Buildroot] [git commit] package/irrlicht: disable bundled
 libpng NEON support
In-Reply-To: <20200509200913.A7A4491226@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Sat, 9 May 2020 22:23:18 +0200")
References: <20200509200913.A7A4491226@busybox.osuosl.org>
Message-ID: <87eerrr0kv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=bf5f4f417a9e6e7eed5ea6a99c26583958890515
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Irrlicht fail to detect properly the NEON support on aarch64 or ARM with NEON FPU support.
 > While linking an application with libIrrlicht.so, we get an undefined reference to
 > png_init_filter_functions_neon.
 > Some files are missing in the libpng bundled in Irrlicht, in particular arm/arm_init.c [1],
 > so disable NEON support completely.

 > This can be reproduced by building minetest using this defconfig for aarch64:
 > BR2_aarch64=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_MINETEST=y
 > BR2_PACKAGE_MINETEST_CLIENT=y
 > BR2_PACKAGE_MINETEST_SERVER=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 > BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 > BR2_PACKAGE_XORG7=y

 > Or for ARM with NEON FPU support:
 > BR2_arm=y
 > BR2_cortex_a15=y
 > BR2_ARM_FPU_NEON=y
 > BR2_TOOLCHAIN_EXTERNAL=y
 > BR2_PACKAGE_MINETEST=y
 > BR2_PACKAGE_MINETEST_CLIENT=y
 > BR2_PACKAGE_MINETEST_SERVER=y
 > BR2_PACKAGE_MESA3D=y
 > BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST=y
 > BR2_PACKAGE_MESA3D_OPENGL_GLX=y
 > BR2_PACKAGE_XORG7=y

 > [1] https://github.com/glennrp/libpng/tree/v1.6.37/arm

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
