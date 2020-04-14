From: Matt Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 10:25:20 -0500
Subject: [Buildroot] [PATCH v3 0/8] Bump of SElinux related libs/tools to 3.0
Message-ID: <20200414152528.20758-1-matthew.weber@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 - Switches to using the date (i.e. 20191204) abased release tagging
   for better alignment with https://release-monitoring.org/project/01717/

 - Added selinux-python which was missed in the v2 of this bump by
   Adam (http://patchwork.ozlabs.org/project/buildroot/list/?series=156673)

 Tested with the following reduced configuration for legal info and
 build.

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_POLICYCOREUTILS=y
BR2_PACKAGE_RESTORECOND=y
BR2_PACKAGE_SELINUX_PYTHON=y
BR2_PACKAGE_SELINUX_PYTHON_AUDIT2ALLOW=y
BR2_PACKAGE_SETOOLS=y
BR2_TARGET_ROOTFS_EXT2=y
# BR2_TARGET_ROOTFS_TAR is not set



Adam Duskett (7):
  package/libselinux: bump version to 3.0
  package/libsemanage: bump version to 3.0
  package/libsepol: bump version to 3.0
  package/policycoreutils: bump version to 3.0
  package/restorecond: bump version to 3.0
  package/semodule-utils: bump version to 3.0
  package/checkpolicy: bump version to 3.0

Matt Weber (1):
  package/selinux-python: bump to version 3.0

 package/checkpolicy/checkpolicy.hash          |   9 +-
 package/checkpolicy/checkpolicy.mk            |   8 +-
 package/libselinux/0001-fix-musl-build.patch  |  22 +-
 ...-and-rely-on-the-installed-file-nam.patch} |  14 +-
 ...ng-against-musl-and-uclibc-libraries.patch |  32 +++
 ...ython-distutils-to-install-SELinux-p.patch | 207 ------------------
 ...-t-pass-bogus-I-and-L-to-python-setu.patch |  34 ---
 package/libselinux/libselinux.hash            |   9 +-
 package/libselinux/libselinux.mk              |  29 +--
 package/libsemanage/libsemanage.hash          |   5 +-
 package/libsemanage/libsemanage.mk            |  20 +-
 .../libsepol/0001-support-static-only.patch   |   6 +-
 package/libsepol/Config.in                    |   3 +-
 package/libsepol/libsepol.hash                |   9 +-
 package/libsepol/libsepol.mk                  |   8 +-
 ...-all-paths-that-use-an-absolute-path.patch |   6 +-
 .../0002-Add-PREFIX-to-host-paths.patch       |  12 +-
 package/policycoreutils/policycoreutils.hash  |   7 +-
 package/policycoreutils/policycoreutils.mk    |   8 +-
 package/restorecond/restorecond.hash          |   9 +-
 package/restorecond/restorecond.mk            |   8 +-
 package/selinux-python/selinux-python.hash    |   9 +-
 package/selinux-python/selinux-python.mk      |   8 +-
 package/semodule-utils/semodule-utils.hash    |   9 +-
 package/semodule-utils/semodule-utils.mk      |   8 +-
 25 files changed, 146 insertions(+), 353 deletions(-)
 rename package/libselinux/{0006-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch => 0002-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch} (89%)
 create mode 100644 package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
 delete mode 100644 package/libselinux/0003-libselinux-Use-Python-distutils-to-install-SELinux-p.patch
 delete mode 100644 package/libselinux/0004-src-Makefile-don-t-pass-bogus-I-and-L-to-python-setu.patch

-- 
2.17.1
