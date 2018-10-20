From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sat, 20 Oct 2018 16:34:47 +0200
Subject: [Buildroot] [PATCH v8 0/4] Enable OpenCL support in Mesa 3D
Message-ID: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series is the continuation of the series "llvm for mesa3d".

Changes v6 -> v7:

*libclc headers installed to /usr/share/clc
*Remove libclc dependencies on target llvm
*Add OpenCL support for RadeonSI

Changes v7 -> v8:
*Add preliminary patch to disable OpenCL as suggested by Thomas
*Update libclc to a more recent version
*Move Mesa's patch to PATCH 3/4

I've left my old signature as I started this series while working for Smile.

Valentin Korenblit (4):
  package/mesa3d: disable opencl
  package/libclc: new package
  package/mesa3d: enable OpenCL support
  package/clinfo: new package

 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  2 ++
 package/clinfo/Config.in                        |  9 ++++++
 package/clinfo/clinfo.hash                      |  3 ++
 package/clinfo/clinfo.mk                        | 23 ++++++++++++++
 package/libclc/Config.in                        | 10 ++++++
 package/libclc/libclc.hash                      |  3 ++
 package/libclc/libclc.mk                        | 42 +++++++++++++++++++++++++
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 26 +++++++++++++++
 package/mesa3d/Config.in                        |  9 ++++++
 package/mesa3d/mesa3d.mk                        | 12 +++++++
 11 files changed, 141 insertions(+)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk
 create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch

-- 
2.7.4
