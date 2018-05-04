From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  4 May 2018 13:46:00 +0200
Subject: [Buildroot] [PATCH v7 0/3] Enable OpenCL support in Mesa 3D
Message-ID: <20180504114603.10135-1-valentin.korenblit@smile.fr>
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

Valentin Korenblit (3):
  package/libclc: new package
  package/mesa3d: enable OpenCL support
  package/clinfo: new package

 DEVELOPERS                                      |  2 ++
 package/Config.in                               |  2 ++
 package/clinfo/Config.in                        |  9 ++++++
 package/clinfo/clinfo.hash                      |  2 ++
 package/clinfo/clinfo.mk                        | 23 ++++++++++++++
 package/libclc/Config.in                        | 10 ++++++
 package/libclc/libclc.hash                      |  3 ++
 package/libclc/libclc.mk                        | 42 +++++++++++++++++++++++++
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 26 +++++++++++++++
 package/mesa3d/Config.in                        |  9 ++++++
 package/mesa3d/mesa3d.mk                        |  9 ++++++
 11 files changed, 137 insertions(+)
 create mode 100644 package/clinfo/Config.in
 create mode 100644 package/clinfo/clinfo.hash
 create mode 100644 package/clinfo/clinfo.mk
 create mode 100644 package/libclc/Config.in
 create mode 100644 package/libclc/libclc.hash
 create mode 100644 package/libclc/libclc.mk
 create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch

-- 
2.14.3
