From: aduskett at gmail.com <aduskett@gmail.com>
Date: Tue, 11 Feb 2020 08:33:59 -0800
Subject: [Buildroot] [PATCH v17 0/5] gobject-introspection: new package
Message-ID: <20200211163404.87262-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Thanks to Giulio Benetti and his efforts to update udisks, I found several
issues with autotools based packages in regards to building and installing
.gir and .typelib files.

I bring to you V17:

Major Changes:
  - Update 0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch to
    include g_ir_scanner, g_ir_compiler, and g_ir_generate.

  - Fiddle with the gobject-introspection-1.0.pc file so that way some paths that
    had sysroot prepended no longer to so. This fixes installation issues.

  - Add several more comments in the gobject-introspection.mk file.

  - Fix gobject-introspection/Config.in


Adam Duskett (5):
  package/libiberty: new package
  package/gdb: depend on libiberty
  package/prelink-cross: new package
  package/pkgconf: prepend sysroot paths to common gobject-introspection
    utils
  package/gobject-introspection: new package

 DEVELOPERS                                    |   3 +
 package/Config.in                             |   1 +
 package/gdb/gdb.mk                            |   4 +-
 ...lete-upstream-attempt-at-cross-compi.patch |  33 ++++
 ...d-cross-compilation-support-to-meson.patch | 163 ++++++++++++++++++
 .../0003-disable-tests.patch                  |  29 ++++
 ...canner-add-use-binary-wrapper-option.patch |  52 ++++++
 ...scanner-add-a-use-ldd-wrapper-option.patch |  48 ++++++
 ...scanner-add-a-lib-dirs-envvar-option.patch |  73 ++++++++
 .../0007-Add-rpath-links-to-ccompiler.patch   |  29 ++++
 ...-error-return-codes-from-ldd-wrapper.patch |  28 +++
 package/gobject-introspection/Config.in       |  33 ++++
 .../gobject-introspection/g-ir-compiler.in    |   3 +
 .../g-ir-scanner-lddwrapper.in                |   3 +
 .../g-ir-scanner-qemuwrapper.in               |  17 ++
 package/gobject-introspection/g-ir-scanner.in |   8 +
 .../gobject-introspection.hash                |   4 +
 .../gobject-introspection.mk                  | 133 ++++++++++++++
 package/libiberty/libiberty.hash              |   2 +
 package/libiberty/libiberty.mk                |  27 +++
 ...th-the-sysroot-a-subset-of-variables.patch |  13 +-
 package/prelink-cross/prelink-cross.hash      |   3 +
 package/prelink-cross/prelink-cross.mk        |  16 ++
 23 files changed, 720 insertions(+), 5 deletions(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-add-cross-compilation-support-to-meson.patch
 create mode 100644 package/gobject-introspection/0003-disable-tests.patch
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
 create mode 100644 package/prelink-cross/prelink-cross.hash
 create mode 100644 package/prelink-cross/prelink-cross.mk

-- 
2.21.1 (Apple Git-122.3)
