From: Adam Duskett <aduskett@gmail.com>
Date: Sun, 18 Mar 2018 15:01:26 -0400
Subject: [Buildroot] [PATCH v5 0/5] gobject-introspection: new series
Message-ID: <20180318190131.21404-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For official submission to mainline Buildroot:

This new series has the following upgrades:
  - It now works on all architectures supported by qemu-host.
  - Gstreamer1 can now compile gir files properly. (for real this time).
  - General makefile cleanups.
  - New patches that make cross-compiling a bit nicer (thanks, yocto!)
  - Removed a patch that was yocto specific and not needed with buildroot.
  - Added a PKG_GIR_EXTRA_LIBS variable in pkg-autotools.mk

What I could use help with:

- Package updates: I will get around to updating python-gobject as it's needed
  for GStreamer-python (the entire reason I started this venture)
- Comments on the patches themselves would also be appreciated!.
- More testing!

Thanks!

Adam Duskett

Adam Duskett (5):
  qemu-host: remove support for some powerpc processors.
  qemu: add qemu_user_opts
  gstreamer1 packages: explicitly disable introspection
  gobject-introspection: new package
  gstreamer1 packages: add support for introspection

 DEVELOPERS                                         |   1 +
 Makefile                                           |   2 +
 package/Config.in                                  |   1 +
 ...ncomplete-upstream-attempt-at-cross-compi.patch |  50 +++
 ...c-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch | 203 ++++++++++++
 ...3-giscanner-add-use-binary-wrapper-option.patch |  52 +++
 ...04-giscanner-add-a-use-ldd-wrapper-option.patch |  48 +++
 .../0005-add-PYTHON_INCLUDES-override.patch        |  39 +++
 ...06-giscanner-add-a-lib-dirs-envvar-option.patch |  73 +++++
 .../0007-Add-rpath-links-to-ccompiler.patch        |  29 ++
 .../gobject-introspection/0008-add-Float128.patch  |  28 ++
 package/gobject-introspection/Config.in            |  30 ++
 package/gobject-introspection/cross-ldd            | 362 +++++++++++++++++++++
 package/gobject-introspection/g-ir-compiler.in     |   2 +
 .../g-ir-scanner-lddwrapper.in                     |   2 +
 .../g-ir-scanner-qemuwrapper.in                    |  10 +
 package/gobject-introspection/g-ir-scanner.in      |   3 +
 .../gobject-introspection.hash                     |   4 +
 .../gobject-introspection/gobject-introspection.mk |  90 +++++
 .../gst1-plugins-bad/gst1-plugins-bad.mk           |   8 +-
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  28 ++
 .../gst1-plugins-base/gst1-plugins-base.mk         |   8 +-
 package/gstreamer1/gstreamer1/gstreamer1.mk        |   7 +
 package/pkg-autotools.mk                           |   3 +
 package/qemu/Config.in.host                        |   1 +
 package/qemu/qemu.mk                               |  33 +-
 26 files changed, 1114 insertions(+), 3 deletions(-)
 create mode 100644 package/gobject-introspection/0001-Revert-an-incomplete-upstream-attempt-at-cross-compi.patch
 create mode 100644 package/gobject-introspection/0002-configure.ac-add-host-gi-gi-cross-wrapper-gi-ldd-wra.patch
 create mode 100644 package/gobject-introspection/0003-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0004-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 package/gobject-introspection/0005-add-PYTHON_INCLUDES-override.patch
 create mode 100644 package/gobject-introspection/0006-giscanner-add-a-lib-dirs-envvar-option.patch
 create mode 100644 package/gobject-introspection/0007-Add-rpath-links-to-ccompiler.patch
 create mode 100644 package/gobject-introspection/0008-add-Float128.patch
 create mode 100644 package/gobject-introspection/Config.in
 create mode 100644 package/gobject-introspection/cross-ldd
 create mode 100644 package/gobject-introspection/g-ir-compiler.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-lddwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner-qemuwrapper.in
 create mode 100644 package/gobject-introspection/g-ir-scanner.in
 create mode 100644 package/gobject-introspection/gobject-introspection.hash
 create mode 100644 package/gobject-introspection/gobject-introspection.mk
 create mode 100644 package/gstreamer1/gst1-plugins-base/0001-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch

-- 
2.14.3
