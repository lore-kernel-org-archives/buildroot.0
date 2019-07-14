From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Jul 2019 12:30:34 +0200
Subject: [Buildroot] [git commit] package/libcdio: bump version to 2.1.0
Message-ID: <20190714102956.34E737FE16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cc2a566f71c409886aa8cad4115061821045825c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream does not provide the .gz tarball anymore, switch to bz2.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdio/libcdio.hash | 2 +-
 package/libcdio/libcdio.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcdio/libcdio.hash b/package/libcdio/libcdio.hash
index 2b6f832cbe..07bd85ff16 100644
--- a/package/libcdio/libcdio.hash
+++ b/package/libcdio/libcdio.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-sha256 1b481b5da009bea31db875805665974e2fc568e2b2afa516f4036733657cf958  libcdio-2.0.0.tar.gz
+sha256 8550e9589dbd594bfac93b81ecf129b1dc9d0d51e90f9696f1b2f9b2af32712b  libcdio-2.1.0.tar.bz2
 
 # Hash for license file:
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libcdio/libcdio.mk b/package/libcdio/libcdio.mk
index f4a5591722..4bf55d3344 100644
--- a/package/libcdio/libcdio.mk
+++ b/package/libcdio/libcdio.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LIBCDIO_VERSION = 2.0.0
+LIBCDIO_VERSION = 2.1.0
+LIBCDIO_SOURCE = libcdio-$(LIBCDIO_VERSION).tar.bz2
 LIBCDIO_SITE = $(BR2_GNU_MIRROR)/libcdio
 LIBCDIO_INSTALL_STAGING = YES
 LIBCDIO_LICENSE = GPL-3.0+
