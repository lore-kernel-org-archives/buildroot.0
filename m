From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Sep 2017 10:13:03 +0200
Subject: [Buildroot] [PATCH 1/5] support/testing: standardize defconfig
 fragments style
In-Reply-To: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
References: <20170929022713.2967-1-ricardo.martincoski@gmail.com>
Message-ID: <20170929081303.GB2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2017-09-28 23:27 -0300, Ricardo Martincoski spake thusly:
> Change almost all defconfig fragments to take advantage of
> "cf3cd4388a support/tests: allow properly indented config fragment".
> Only the defconfig fragment for the ccache test case cannot be changed
> without additional changes to the infra.
> 
> Make each defconfig fragment:
>  - start after a backslash;
>  - be declared as a string literal;
>  - be indented one level more than the variable that contains it.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
> Tested by hacking support/testing/infra/builder.py
>  @@ -30,2 +30,3 @@ class Builder(object):
>               raise SystemError("Cannot olddefconfig")
>  +        raise SystemError("Stop")
> and diffing the resulting *-build.log files against old ones: few empty
> lines are added/removed. Also tested diffing the resulting .config files
> against old ones: they are the same.
> 
> Warnings from flake8 change from 132 to 100.

What does this mean?

Regards,
Yann E. MORIN.

>  $ git show --stat -w
>  support/testing/infra/basetest.py                 | 0
>  support/testing/tests/core/test_post_scripts.py   | 0
>  support/testing/tests/core/test_rootfs_overlay.py | 5 +++--
>  support/testing/tests/core/test_timezone.py       | 6 ++++--
>  support/testing/tests/fs/test_ext.py              | 0
>  support/testing/tests/fs/test_iso9660.py          | 0
>  support/testing/tests/fs/test_jffs2.py            | 0
>  support/testing/tests/fs/test_squashfs.py         | 0
>  support/testing/tests/fs/test_ubi.py              | 0
>  support/testing/tests/fs/test_yaffs2.py           | 4 +++-
>  support/testing/tests/package/test_dropbear.py    | 0
>  support/testing/tests/package/test_ipython.py     | 0
>  support/testing/tests/package/test_python.py      | 0
>  support/testing/tests/toolchain/test_external.py  | 0
>  14 files changed, 10 insertions(+), 5 deletions(-)
> ---
>  support/testing/infra/basetest.py                 |  38 +++---
>  support/testing/tests/core/test_post_scripts.py   |  18 +--
>  support/testing/tests/core/test_rootfs_overlay.py |   7 +-
>  support/testing/tests/core/test_timezone.py       |  44 +++----
>  support/testing/tests/fs/test_ext.py              |  50 ++++----
>  support/testing/tests/fs/test_iso9660.py          | 102 ++++++++--------
>  support/testing/tests/fs/test_jffs2.py            |  18 +--
>  support/testing/tests/fs/test_squashfs.py         |  12 +-
>  support/testing/tests/fs/test_ubi.py              |  16 +--
>  support/testing/tests/fs/test_yaffs2.py           |   6 +-
>  support/testing/tests/package/test_dropbear.py    |  14 +--
>  support/testing/tests/package/test_ipython.py     |  16 +--
>  support/testing/tests/package/test_python.py      |  20 ++--
>  support/testing/tests/toolchain/test_external.py  | 136 +++++++++++-----------
>  14 files changed, 251 insertions(+), 246 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 493dea5125..d205119b2c 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -6,27 +6,27 @@ from infra.builder import Builder
>  from infra.emulator import Emulator
>  
>  BASIC_TOOLCHAIN_CONFIG = \
> -"""
> -BR2_arm=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-1190-g4a48479.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -"""
> +    """
> +    BR2_arm=y
> +    BR2_TOOLCHAIN_EXTERNAL=y
> +    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-1190-g4a48479.tar.bz2"
> +    BR2_TOOLCHAIN_EXTERNAL_GCC_4_7=y
> +    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> +    BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> +    BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +    """
>  
>  MINIMAL_CONFIG = \
> -"""
> -BR2_INIT_NONE=y
> -BR2_SYSTEM_BIN_SH_NONE=y
> -# BR2_PACKAGE_BUSYBOX is not set
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +    """
> +    BR2_INIT_NONE=y
> +    BR2_SYSTEM_BIN_SH_NONE=y
> +    # BR2_PACKAGE_BUSYBOX is not set
> +    # BR2_TARGET_ROOTFS_TAR is not set
> +    """
>  
>  class BRTest(unittest.TestCase):
>      config = None
> diff --git a/support/testing/tests/core/test_post_scripts.py b/support/testing/tests/core/test_post_scripts.py
> index d2a0be15bf..7ca9b9d836 100644
> --- a/support/testing/tests/core/test_post_scripts.py
> +++ b/support/testing/tests/core/test_post_scripts.py
> @@ -5,15 +5,15 @@ import infra.basetest
>  
>  class TestPostScripts(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_INIT_NONE=y
> -BR2_SYSTEM_BIN_SH_NONE=y
> -# BR2_PACKAGE_BUSYBOX is not set
> -BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> -BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
> -BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
> -""".format(infra.filepath("tests/core/post-build.sh"),
> -           infra.filepath("tests/core/post-image.sh"))
> +        """
> +        BR2_INIT_NONE=y
> +        BR2_SYSTEM_BIN_SH_NONE=y
> +        # BR2_PACKAGE_BUSYBOX is not set
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_POST_IMAGE_SCRIPT="{}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="foobar baz"
> +        """.format(infra.filepath("tests/core/post-build.sh"),
> +                   infra.filepath("tests/core/post-image.sh"))
>  
>      def check_post_log_file(self, path, what):
>          lines = {}
> diff --git a/support/testing/tests/core/test_rootfs_overlay.py b/support/testing/tests/core/test_rootfs_overlay.py
> index 42d890ba20..22ef9722d6 100644
> --- a/support/testing/tests/core/test_rootfs_overlay.py
> +++ b/support/testing/tests/core/test_rootfs_overlay.py
> @@ -9,11 +9,12 @@ def compare_file(file1, file2):
>  class TestRootfsOverlay(infra.basetest.BRTest):
>  
>      rootfs_overlay_path = infra.filepath("tests/core/rootfs-overlay")
> -    rootfs_overlay = "BR2_ROOTFS_OVERLAY=\"{0}1 {0}2\"".format(rootfs_overlay_path)
>  
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -            infra.basetest.MINIMAL_CONFIG + \
> -            rootfs_overlay
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_ROOTFS_OVERLAY="{0}1 {0}2"
> +        """.format(rootfs_overlay_path)
>  
>      def test_run(self):
>          target_file = os.path.join(self.builddir, "target", "test-file1")
> diff --git a/support/testing/tests/core/test_timezone.py b/support/testing/tests/core/test_timezone.py
> index 9776b4bcee..f4ba5039ca 100644
> --- a/support/testing/tests/core/test_timezone.py
> +++ b/support/testing/tests/core/test_timezone.py
> @@ -10,11 +10,11 @@ def boot_armv5_cpio(emulator, builddir):
>  
>  class TestNoTimezone(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -             """
> -# BR2_TARGET_TZ_INFO is not set
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        # BR2_TARGET_TZ_INFO is not set
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          boot_armv5_cpio(self.emulator, self.builddir)
> @@ -24,13 +24,14 @@ BR2_TARGET_ROOTFS_CPIO=y
>          self.assertEqual(tz[0].strip(), "UTC")
>  
>  class TestGlibcAllTimezone(infra.basetest.BRTest):
> -    config = """
> -BR2_arm=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TARGET_TZ_INFO=y
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_TZ_INFO=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          boot_armv5_cpio(self.emulator, self.builddir)
> @@ -44,15 +45,16 @@ BR2_TARGET_ROOTFS_CPIO=y
>          self.assertEqual(tz[0].strip(), "CET")
>  
>  class TestGlibcNonDefaultLimitedTimezone(infra.basetest.BRTest):
> -    config = """
> -BR2_arm=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TARGET_TZ_INFO=y
> -BR2_TARGET_TZ_ZONELIST="northamerica"
> -BR2_TARGET_LOCALTIME="America/New_York"
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TARGET_TZ_INFO=y
> +        BR2_TARGET_TZ_ZONELIST="northamerica"
> +        BR2_TARGET_LOCALTIME="America/New_York"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          boot_armv5_cpio(self.emulator, self.builddir)
> diff --git a/support/testing/tests/fs/test_ext.py b/support/testing/tests/fs/test_ext.py
> index 0832ba4ce2..49bce45dc8 100644
> --- a/support/testing/tests/fs/test_ext.py
> +++ b/support/testing/tests/fs/test_ext.py
> @@ -39,12 +39,12 @@ def boot_img_and_check_fs_type(emulator, builddir, fs_type):
>  
>  class TestExt2(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_2r0=y
> -BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_2r0=y
> +        BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          out = dumpe2fs_run(self.builddir, "rootfs.ext2")
> @@ -57,12 +57,12 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="foobaz"
>  
>  class TestExt2r1(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_2r1=y
> -BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_2r1=y
> +        BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          out = dumpe2fs_run(self.builddir, "rootfs.ext2")
> @@ -76,11 +76,11 @@ BR2_TARGET_ROOTFS_EXT2_LABEL="foobar"
>  
>  class TestExt3(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_3=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_3=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          out = dumpe2fs_run(self.builddir, "rootfs.ext3")
> @@ -94,14 +94,14 @@ BR2_TARGET_ROOTFS_EXT2_3=y
>  
>  class TestExt4(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_EXT2=y
> -BR2_TARGET_ROOTFS_EXT2_4=y
> -BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
> -BR2_TARGET_ROOTFS_EXT2_INODES=3000
> -BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_4=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="16384"
> +        BR2_TARGET_ROOTFS_EXT2_INODES=3000
> +        BR2_TARGET_ROOTFS_EXT2_RESBLKS=10
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          out = dumpe2fs_run(self.builddir, "rootfs.ext4")
> diff --git a/support/testing/tests/fs/test_iso9660.py b/support/testing/tests/fs/test_iso9660.py
> index e804808c96..60dcbdc139 100644
> --- a/support/testing/tests/fs/test_iso9660.py
> +++ b/support/testing/tests/fs/test_iso9660.py
> @@ -3,27 +3,27 @@ import os
>  import infra.basetest
>  
>  BASIC_CONFIG = \
> -"""
> -BR2_x86_pentium4=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> -BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> -BR2_LINUX_KERNEL=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> -BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
> -BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> -BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
> -# BR2_TARGET_ROOTFS_TAR is not set
> -""".format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
> +    """
> +    BR2_x86_pentium4=y
> +    BR2_TOOLCHAIN_EXTERNAL=y
> +    BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +    BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +    BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-i386-pentium4-full-2015.05-496-g85945aa.tar.bz2"
> +    BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> +    BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_2=y
> +    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +    # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> +    BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
> +    BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +    BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
> +    BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
> +    BR2_LINUX_KERNEL=y
> +    BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +    BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.0"
> +    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> +    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="{}"
> +    # BR2_TARGET_ROOTFS_TAR is not set
> +    """.format(infra.filepath("conf/minimal-x86-qemu-kernel.config"))
>  
>  def test_mount_internal_external(emulator, builddir, internal=True):
>      img = os.path.join(builddir, "images", "rootfs.iso9660")
> @@ -48,14 +48,14 @@ def test_touch_file(emulator):
>  
>  class TestIso9660Grub2External(infra.basetest.BRTest):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_ISO9660=y
> -# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> -BR2_TARGET_GRUB2=y
> -BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
> -BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
> -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -""".format(infra.filepath("conf/grub2.cfg"))
> +        """
> +        BR2_TARGET_ROOTFS_ISO9660=y
> +        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
> +        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
> +        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> +        """.format(infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> @@ -67,14 +67,14 @@ BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
>  
>  class TestIso9660Grub2Internal(infra.basetest.BRTest):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_ISO9660=y
> -BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> -BR2_TARGET_GRUB2=y
> -BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
> -BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
> -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -""".format(infra.filepath("conf/grub2.cfg"))
> +        """
> +        BR2_TARGET_ROOTFS_ISO9660=y
> +        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> +        BR2_TARGET_GRUB2=y
> +        BR2_TARGET_GRUB2_BOOT_PARTITION="cd"
> +        BR2_TARGET_GRUB2_BUILTIN_MODULES="boot linux ext2 fat part_msdos part_gpt normal biosdisk iso9660"
> +        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> +        """.format(infra.filepath("conf/grub2.cfg"))
>  
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> @@ -90,13 +90,13 @@ BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
>  
>  class TestIso9660SyslinuxExternal(infra.basetest.BRTest):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_ISO9660=y
> -# BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> -BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -BR2_TARGET_SYSLINUX=y
> -""".format(infra.filepath("conf/isolinux.cfg"))
> +        """
> +        BR2_TARGET_ROOTFS_ISO9660=y
> +        # BR2_TARGET_ROOTFS_ISO9660_INITRD is not set
> +        BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> +        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> +        BR2_TARGET_SYSLINUX=y
> +        """.format(infra.filepath("conf/isolinux.cfg"))
>  
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> @@ -108,13 +108,13 @@ BR2_TARGET_SYSLINUX=y
>  
>  class TestIso9660SyslinuxInternal(infra.basetest.BRTest):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_ISO9660=y
> -BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> -BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> -BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> -BR2_TARGET_SYSLINUX=y
> -""".format(infra.filepath("conf/isolinux.cfg"))
> +        """
> +        BR2_TARGET_ROOTFS_ISO9660=y
> +        BR2_TARGET_ROOTFS_ISO9660_INITRD=y
> +        BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
> +        BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="{}"
> +        BR2_TARGET_SYSLINUX=y
> +        """.format(infra.filepath("conf/isolinux.cfg"))
>  
>      def test_run(self):
>          exit_code = test_mount_internal_external(self.emulator,
> diff --git a/support/testing/tests/fs/test_jffs2.py b/support/testing/tests/fs/test_jffs2.py
> index 7185df7899..a84c858238 100644
> --- a/support/testing/tests/fs/test_jffs2.py
> +++ b/support/testing/tests/fs/test_jffs2.py
> @@ -12,15 +12,15 @@ def jffs2dump_find_file(files_list, fname):
>  
>  class TestJffs2(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_JFFS2=y
> -BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
> -BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
> -BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
> -BR2_TARGET_ROOTFS_JFFS2_PAD=y
> -BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_JFFS2=y
> +        BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
> +        BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x80000
> +        BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
> +        BR2_TARGET_ROOTFS_JFFS2_PAD=y
> +        BR2_TARGET_ROOTFS_JFFS2_PADSIZE=0x4000000
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      # TODO: there are some scary JFFS2 messages when one starts to
>      # write files in the rootfs: "jffs2: Newly-erased block contained
> diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
> index b205b6a55a..9fad28f834 100644
> --- a/support/testing/tests/fs/test_squashfs.py
> +++ b/support/testing/tests/fs/test_squashfs.py
> @@ -5,12 +5,12 @@ import infra.basetest
>  
>  class TestSquashfs(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_SQUASHFS=y
> -# BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
> -BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_SQUASHFS=y
> +        # BR2_TARGET_ROOTFS_SQUASHFS4_GZIP is not set
> +        BR2_TARGET_ROOTFS_SQUASHFS4_LZ4=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          unsquashfs_cmd = ["host/bin/unsquashfs", "-s", "images/rootfs.squashfs"]
> diff --git a/support/testing/tests/fs/test_ubi.py b/support/testing/tests/fs/test_ubi.py
> index ede4999aa1..360932a0bf 100644
> --- a/support/testing/tests/fs/test_ubi.py
> +++ b/support/testing/tests/fs/test_ubi.py
> @@ -5,14 +5,14 @@ import infra.basetest
>  
>  class TestUbi(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_UBIFS=y
> -BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
> -BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
> -BR2_TARGET_ROOTFS_UBI=y
> -BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
> -BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_UBIFS=y
> +        BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x7ff80
> +        BR2_TARGET_ROOTFS_UBIFS_MINIOSIZE=0x1
> +        BR2_TARGET_ROOTFS_UBI=y
> +        BR2_TARGET_ROOTFS_UBI_PEBSIZE=0x80000
> +        BR2_TARGET_ROOTFS_UBI_SUBSIZE=1
> +        """
>  
>      # TODO: if you boot Qemu twice on the same UBI image, it fails to
>      # attach the image the second time, with "ubi0 error:
> diff --git a/support/testing/tests/fs/test_yaffs2.py b/support/testing/tests/fs/test_yaffs2.py
> index 0ffb758083..a11c1a40a7 100644
> --- a/support/testing/tests/fs/test_yaffs2.py
> +++ b/support/testing/tests/fs/test_yaffs2.py
> @@ -4,8 +4,10 @@ import infra.basetest
>  
>  class TestYaffs2(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -            infra.basetest.MINIMAL_CONFIG + \
> -            "BR2_TARGET_ROOTFS_YAFFS2=y"
> +        infra.basetest.MINIMAL_CONFIG + \
> +        """
> +        BR2_TARGET_ROOTFS_YAFFS2=y
> +        """
>  
>      def test_run(self):
>          img = os.path.join(self.builddir, "images", "rootfs.yaffs2")
> diff --git a/support/testing/tests/package/test_dropbear.py b/support/testing/tests/package/test_dropbear.py
> index a64b782229..da569d9b1b 100644
> --- a/support/testing/tests/package/test_dropbear.py
> +++ b/support/testing/tests/package/test_dropbear.py
> @@ -4,13 +4,13 @@ import infra.basetest
>  
>  class TestDropbear(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
> -BR2_SYSTEM_DHCP="eth0"
> -BR2_PACKAGE_DROPBEAR=y
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_GENERIC_ROOT_PASSWD="testpwd"
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_PACKAGE_DROPBEAR=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>  
>      def test_run(self):
>          img = os.path.join(self.builddir, "images", "rootfs.cpio")
> diff --git a/support/testing/tests/package/test_ipython.py b/support/testing/tests/package/test_ipython.py
> index dd8bf500a3..a943101372 100644
> --- a/support/testing/tests/package/test_ipython.py
> +++ b/support/testing/tests/package/test_ipython.py
> @@ -11,10 +11,10 @@ from tests.package.test_python import TestPythonBase
>  #
>  class TestIPythonPy2(TestPythonBase):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON=y
> -BR2_PACKAGE_PYTHON_IPYTHON=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        BR2_PACKAGE_PYTHON_IPYTHON=y
> +        """
>      interpreter = "ipython"
>  
>      def test_run(self):
> @@ -24,10 +24,10 @@ BR2_PACKAGE_PYTHON_IPYTHON=y
>  
>  class TestIPythonPy3(TestPythonBase):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON3=y
> -BR2_PACKAGE_PYTHON_IPYTHON=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_IPYTHON=y
> +        """
>      interpreter = "ipython"
>  
>      def test_run(self):
> diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
> index bddf09ddbc..79773fff63 100644
> --- a/support/testing/tests/package/test_python.py
> +++ b/support/testing/tests/package/test_python.py
> @@ -4,10 +4,10 @@ import infra.basetest
>  
>  class TestPythonBase(infra.basetest.BRTest):
>      config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> -"""
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +        """
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
>      interpreter = "python"
>  
>      def login(self):
> @@ -42,9 +42,9 @@ BR2_TARGET_ROOTFS_CPIO=y
>  
>  class TestPython2(TestPythonBase):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON=y
> +        """
>      def test_run(self):
>          self.login()
>          self.version_test("Python 2")
> @@ -54,9 +54,9 @@ BR2_PACKAGE_PYTHON=y
>  
>  class TestPython3(TestPythonBase):
>      config = TestPythonBase.config + \
> -"""
> -BR2_PACKAGE_PYTHON3=y
> -"""
> +        """
> +        BR2_PACKAGE_PYTHON3=y
> +        """
>      def test_run(self):
>          self.login()
>          self.version_test("Python 3")
> diff --git a/support/testing/tests/toolchain/test_external.py b/support/testing/tests/toolchain/test_external.py
> index 394fa17345..1bb5e9497b 100644
> --- a/support/testing/tests/toolchain/test_external.py
> +++ b/support/testing/tests/toolchain/test_external.py
> @@ -2,10 +2,10 @@ import os
>  import infra
>  
>  BASIC_CONFIG = \
> -"""
> -BR2_TARGET_ROOTFS_CPIO=y
> -# BR2_TARGET_ROOTFS_TAR is not set
> -"""
> +    """
> +    BR2_TARGET_ROOTFS_CPIO=y
> +    # BR2_TARGET_ROOTFS_TAR is not set
> +    """
>  
>  def has_broken_links(path):
>      for root, dirs, files in os.walk(path):
> @@ -32,12 +32,12 @@ class TestExternalToolchain(infra.basetest.BRTest):
>  
>  class TestExternalToolchainSourceryArmv4(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_arm920t=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_arm920t=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> +        """
>      toolchain_prefix = "arm-none-linux-gnueabi"
>  
>      def test_run(self):
> @@ -63,11 +63,11 @@ BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
>  
>  class TestExternalToolchainSourceryArmv5(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> +        """
>      toolchain_prefix = "arm-none-linux-gnueabi"
>  
>      def test_run(self):
> @@ -88,14 +88,14 @@ BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
>  
>  class TestExternalToolchainSourceryArmv7(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_cortex_a8=y
> -BR2_ARM_EABI=y
> -BR2_ARM_INSTRUCTIONS_THUMB2=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a8=y
> +        BR2_ARM_EABI=y
> +        BR2_ARM_INSTRUCTIONS_THUMB2=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
> +        """
>      toolchain_prefix = "arm-none-linux-gnueabi"
>  
>      def test_run(self):
> @@ -126,12 +126,12 @@ BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM=y
>  
>  class TestExternalToolchainLinaroArm(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_cortex_a8=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a8=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
> +        """
>      toolchain_prefix = "arm-linux-gnueabihf"
>  
>      def test_run(self):
> @@ -157,19 +157,19 @@ BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y
>  
>  class TestExternalToolchainBuildrootMusl(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-444-g6c704ba.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2017.05-444-g6c704ba.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_6=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_11=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        """
>      toolchain_prefix = "arm-linux"
>  
>      def test_run(self):
> @@ -182,20 +182,20 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
>  
>  class TestExternalToolchainCtngMusl(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_cortex_a9=y
> -BR2_ARM_ENABLE_VFP=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.net/toolchains/tarballs/arm-ctng-linux-musleabihf.tar.xz"
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-ctng-linux-musleabihf"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        """
>      toolchain_prefix = "arm-ctng-linux-musleabihf"
>  
>      def test_run(self):
> @@ -208,18 +208,18 @@ BR2_TOOLCHAIN_EXTERNAL_CXX=y
>  
>  class TestExternalToolchainBuildrootuClibc(TestExternalToolchain):
>      config = BASIC_CONFIG + \
> -"""
> -BR2_arm=y
> -BR2_TOOLCHAIN_EXTERNAL=y
> -BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> -BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
> -BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> -BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> -BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> -# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> -BR2_TOOLCHAIN_EXTERNAL_CXX=y
> -"""
> +        """
> +        BR2_arm=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +        BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> +        BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2017.05-444-g6c704ba.tar.bz2"
> +        BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> +        BR2_TOOLCHAIN_EXTERNAL_HEADERS_3_10=y
> +        BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +        # BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
> +        BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +        """
>      toolchain_prefix = "arm-linux"
>  
>      def test_run(self):
> -- 
> 2.13.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
