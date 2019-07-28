From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:54:38 +0200
Subject: [Buildroot] [git commit] package/libglu: bump version to 9.0.1
Message-ID: <20190728075525.B0FEE88245@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6c2b1cd78f18ddfe4f677b02f4ffa8bed547615b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added all hashes provided by upstream, switched tarball to .xz and
updated _SITE according to release notes.

Tarball contains an autoconf'ed configure script now so we can remove
LIBGLU_AUTORECONF = YES

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libglu/libglu.hash | 6 +++++-
 package/libglu/libglu.mk   | 8 +++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libglu/libglu.hash b/package/libglu/libglu.hash
index 468787864e..b0202a1334 100644
--- a/package/libglu/libglu.hash
+++ b/package/libglu/libglu.hash
@@ -1,3 +1,7 @@
+# From https://lists.freedesktop.org/archives/mesa-announce/2019-July/000530.html
+md5 151aef599b8259efe9acd599c96ea2a3  glu-9.0.1.tar.xz
+sha1 b6ffef562ba55d3f80146d4238589cb9b1de66f5  glu-9.0.1.tar.xz
+sha256 fb5a4c2dd6ba6d1c21ab7c05129b0769544e1d68e1e3b0ffecb18e73c93055bc  glu-9.0.1.tar.xz
+sha512 8a6dae5b4bd63efb96d15f23ccda4ad9c2ffaa964897e5fa63d1e58360d8d4e6732c5efd2109dba04155d5fc457ab1718a65cf9b544ce0d452679ba988d04018  glu-9.0.1.tar.xz
 # locally computed
-sha256  3d19cca9b26ec4048dd22e3d294acd43e080a3205a29ff47765bd514571ea8f9  glu-9.0.0.tar.gz
 sha256  84187ce0fd0153769675cb7f3301583eb27393f66b57c5604999a1d805a9184c  include/GL/glu.h
diff --git a/package/libglu/libglu.mk b/package/libglu/libglu.mk
index 604045c225..e18c7f1494 100644
--- a/package/libglu/libglu.mk
+++ b/package/libglu/libglu.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-LIBGLU_VERSION = 9.0.0
-LIBGLU_SITE = http://cgit.freedesktop.org/mesa/glu/snapshot
-LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.gz
+LIBGLU_VERSION = 9.0.1
+LIBGLU_SITE = https://mesa.freedesktop.org/archive/glu
+LIBGLU_SOURCE = glu-$(LIBGLU_VERSION).tar.xz
 LIBGLU_LICENSE = SGI-B-2.0
 LIBGLU_LICENSE_FILES = include/GL/glu.h
 LIBGLU_INSTALL_STAGING = YES
-# upstream does not distribute a autoconf'ed configure script
-LIBGLU_AUTORECONF = YES
 LIBGLU_DEPENDENCIES = libgl host-pkgconf
 
 $(eval $(autotools-package))
