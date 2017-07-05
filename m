From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 18:17:42 +0200
Subject: [Buildroot] [PATCH v3] board: Add nanopi-m1 Support
In-Reply-To: <1499270655-2781-1-git-send-email-chakra@openedev.com>
References: <1499270655-2781-1-git-send-email-chakra@openedev.com>
Message-ID: <20170705181742.43923a6b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  5 Jul 2017 21:34:15 +0530, Chakra Divi wrote:
> Add initial support for nanopi-m1 board
> with below features
> - U-Boot 2017.07-rc1
> - Linux 4.11.5
> - Default packages from buildroot
> 
> Signed-off-by: Chakra Divi <chakra@openedev.com>

I've applied, but there were nonetheless a few things to fix, see below.

> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 3ae7e5d..bbc5bb8 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -127,6 +127,7 @@ mx53loco_defconfig: *defconfig
>  mx6cubox_defconfig: *defconfig
>  mx6sx_udoo_neo_defconfig: *defconfig
>  mx6udoo_defconfig: *defconfig
> +nanopi_m1_defconfig: *defconfig
>  nanopi_neo_defconfig: *defconfig
>  nexbox_a95x_defconfig: *defconfig
>  nitrogen6sx_defconfig: *defconfig
> @@ -205,28 +206,3 @@ zynq_microzed_defconfig: *defconfig
>  zynq_zc706_defconfig: *defconfig
>  zynq_zed_defconfig: *defconfig
>  zynq_zybo_defconfig: *defconfig
> -tests.core.test_post_scripts.TestPostScripts: *runtime_test
> -tests.core.test_rootfs_overlay.TestRootfsOverlay: *runtime_test
> -tests.core.test_timezone.TestGlibcAllTimezone: *runtime_test
> -tests.core.test_timezone.TestGlibcNonDefaultLimitedTimezone: *runtime_test
> -tests.core.test_timezone.TestNoTimezone: *runtime_test
> -tests.fs.test_ext.TestExt2: *runtime_test
> -tests.fs.test_ext.TestExt2r1: *runtime_test
> -tests.fs.test_ext.TestExt3: *runtime_test
> -tests.fs.test_ext.TestExt4: *runtime_test
> -tests.fs.test_iso9660.TestIso9660Grub2External: *runtime_test
> -tests.fs.test_iso9660.TestIso9660Grub2Internal: *runtime_test
> -tests.fs.test_iso9660.TestIso9660GrubExternal: *runtime_test
> -tests.fs.test_iso9660.TestIso9660GrubInternal: *runtime_test
> -tests.fs.test_iso9660.TestIso9660SyslinuxExternal: *runtime_test
> -tests.fs.test_iso9660.TestIso9660SyslinuxInternal: *runtime_test
> -tests.fs.test_jffs2.TestJffs2: *runtime_test
> -tests.fs.test_squashfs.TestSquashfs: *runtime_test
> -tests.fs.test_ubi.TestUbi: *runtime_test
> -tests.fs.test_yaffs2.TestYaffs2: *runtime_test
> -tests.package.test_dropbear.TestDropbear: *runtime_test
> -tests.package.test_python.TestPythonBase: *runtime_test
> -tests.toolchain.test_external.TestExternalToolchainLinaroArm: *runtime_test
> -tests.toolchain.test_external.TestExternalToolchainSourceryArmv4: *runtime_test
> -tests.toolchain.test_external.TestExternalToolchainSourceryArmv5: *runtime_test
> -tests.toolchain.test_external.TestExternalToolchainSourceryArmv7: *runtime_test

Can you investigate why on your system all those lines were removed? I
believe it's because you don't have python-nose2 and/or python-pexpect
installed. Can you run:

  ./support/testing/run-tests -l

and see what it gives ?

>  N:	Chakra Divi <chakra@openedev.com>
> +F:	board/friendlyarm/nanopi-m1
>  F:	board/olimex/a13_olinuxino
>  F:	board/orangepi/orangepi-plus
> +F:	configs/nanopi_m1_defconfig	

There was a trailing tab here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
