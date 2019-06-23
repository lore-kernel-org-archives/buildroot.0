From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sun, 23 Jun 2019 17:23:36 -0400
Subject: [Buildroot] [PATCH v12 0/6] gobject-introspection: new package
Message-ID: <20190623212342.41809-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

GOI: the return of the revenge!

Introduced in goi 1.60.x, autotools is no longer supported.

A thousand foot view of this patch series includes:
- Adding the new libiberty package and making gdb depend on it.
- Bumping GOI to 1.60.2 and converting to meson 
- Introducing several patches that are meson specific.
- Removing several patches that were autotools specific
- Lots of frustration.


Enjoy!

Adam

Adam Duskett (6):
  package/libiberty: new package
  package/prelink-cross: new package
  package/gdb: depend on libiberty
  package/meson: prevent python include path manipulation
  package/qemu: drop host kernel version check
  package/gobject-introspection: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/gdb/gdb.mk                            |   4 +-
 ...lete-upstream-attempt-at-cross-compi.patch |  33 ++++
 ...d-cross-compilation-support-to-meson.patch | 163 ++++++++++++++++++
 ...d-disable-tests-when-cross-compiling.patch |  27 +++
 ...canner-add-use-binary-wrapper-option.patch |  52 ++++++
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ++++++
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 ++++++++
 .../0007-Add-rpath-links-to-ccompiler.patch   |  29 ++++
 ...-error-return-codes-from-ldd-wrapper.patch |  28 +++
 package/gobject-introspection/Config.in       |  26 +++
 .../gobject-introspection/g-ir-compiler.in    |   2 +
 .../g-ir-scanner-lddwrapper.in                |   2 +
 .../g-ir-scanner-qemuwrapper.in               |  17 ++
 package/gobject-introspection/g-ir-scanner.in |   7 +
 .../gobject-introspection.hash                |   4 +
 .../gobject-introspection.mk                  | 103 +++++++++++
 package/libiberty/libiberty.hash              |   2 +
 package/libiberty/libiberty.mk                |  27 +++
 ...-environment-when-calling-pkg-config.patch |  48 ++++++
 package/prelink-cross/prelink-cross.hash      |   3 +
 package/prelink-cross/prelink-cross.mk        |  15 ++
 package/qemu/qemu.mk                          |  22 ---
 24 files changed, 716 insertions(+), 23 deletions(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
 create mode 100644 package/gobject-introspection/0003-meson.build-disable-tests-when-cross-compiling.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
 create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
 create mode 100644 package/gobject-introspection/0008-ignore-error-return-codes-from-ldd-wrapper.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100644 package/gobject-introspection/g-ir-compiler.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk
 create mode 100644 package/libiberty/libiberty.hash
 create mode 100644 package/libiberty/libiberty.mk
 create mode 100644 package/meson/0002-python-module-do-not-manipulate-the-environment-when-calling-pkg-config.patch
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

-- 
2.21.0
