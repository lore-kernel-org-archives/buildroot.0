From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Wed, 15 Jul 2020 15:07:31 +0200
Subject: [Buildroot] [PATCH 0/9] selinux: bump to 20200710
Message-ID: <20200715130740.775804-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

The SELinux libraries and tools[1] has a new release, 20200710. This
series bumps the packages coming from the project to this version and
handles required changes (patches refreshing or removal, new
dependencies, etc).

The series also includes the bump of setools to 4.3.0 as the version
supported in Buildroot was quite old and incompatible with the latest
version of the libraries provided by the SELinux project[1].

Thanks,
Antoine

[1] https://github.com/SELinuxProject/selinux

Antoine Tenart (9):
  package/libsepol: bump to 20200710
  package/libsemanage: bump to 20200710
  package/libselinux: bump to 20200710
  package/policycoreutils: bump to 20200710
  package/checkpolicy: bump to 20200710
  package/restorecond: bump to 20200710
  package/semodule-utils: bump to 20200710
  package/selinux-python: bump to 20200710
  package/setools: bump to 4.3.0

 ...ckpolicy-remove-unused-te_assertions.patch |  45 --
 package/checkpolicy/checkpolicy.hash          |   2 +-
 package/checkpolicy/checkpolicy.mk            |   4 +-
 ...T-and-rely-on-the-installed-file-nam.patch |  17 +-
 ...ng-against-musl-and-uclibc-libraries.patch |  32 --
 package/libselinux/libselinux.hash            |   2 +-
 package/libselinux/libselinux.mk              |   4 +-
 package/libsemanage/libsemanage.hash          |   2 +-
 package/libsemanage/libsemanage.mk            |   4 +-
 ...IL_KEY_-build-errors-with-fno-common.patch | 528 ------------------
 ...e-leftovers-of-cil_mem_error_handler.patch |  63 ---
 package/libsepol/libsepol.hash                |   2 +-
 package/libsepol/libsepol.mk                  |   4 +-
 package/policycoreutils/policycoreutils.hash  |   2 +-
 package/policycoreutils/policycoreutils.mk    |   4 +-
 package/restorecond/restorecond.hash          |   2 +-
 package/restorecond/restorecond.mk            |   4 +-
 package/selinux-python/selinux-python.hash    |   2 +-
 package/selinux-python/selinux-python.mk      |   4 +-
 package/semodule-utils/semodule-utils.hash    |   2 +-
 package/semodule-utils/semodule-utils.mk      |   4 +-
 .../0001-remove-werror-flag-from-setup.patch  |  16 +-
 ...e-setools.InfoFlowAnalysis-and-setoo.patch |  74 +--
 ...py-drop-path-prefix-from-man-install.patch |  42 --
 package/setools/setools.hash                  |   4 +-
 package/setools/setools.mk                    |  12 +-
 26 files changed, 87 insertions(+), 794 deletions(-)
 delete mode 100644 package/checkpolicy/0001-checkpolicy-remove-unused-te_assertions.patch
 delete mode 100644 package/libselinux/0003-fix-building-against-musl-and-uclibc-libraries.patch
 delete mode 100644 package/libsepol/0002-libsepol-fix-CIL_KEY_-build-errors-with-fno-common.patch
 delete mode 100644 package/libsepol/0003-libsepol-remove-leftovers-of-cil_mem_error_handler.patch
 delete mode 100644 package/setools/0003-setup.py-drop-path-prefix-from-man-install.patch

-- 
2.26.2
