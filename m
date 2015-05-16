From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 16 May 2015 17:24:05 +0200
Subject: [Buildroot] [git commit] libmatroska: add host-pkgconf dependency
Message-ID: <20150516152710.1B16D81762@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c69bafe0aef71b9846866270da9462c3492d9508
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libmatroska configure.ac uses PKG_CHECK_MODULES(), so this package
needs to depend on host-pkgconf.

Fixes:

  http://autobuild.buildroot.org/results/80a/80a9f0f5594ab833600ea8514dc184e50d2bf08c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmatroska/libmatroska.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libmatroska/libmatroska.mk b/package/libmatroska/libmatroska.mk
index 1086e87..5e2d9b1 100644
--- a/package/libmatroska/libmatroska.mk
+++ b/package/libmatroska/libmatroska.mk
@@ -10,6 +10,6 @@ LIBMATROSKA_SITE = http://dl.matroska.org/downloads/libmatroska
 LIBMATROSKA_INSTALL_STAGING = YES
 LIBMATROSKA_LICENSE = LGPLv2.1+
 LIBMATROSKA_LICENSE_FILES = LICENSE.LGPL
-LIBMATROSKA_DEPENDENCIES = libebml
+LIBMATROSKA_DEPENDENCIES = libebml host-pkgconf
 
 $(eval $(autotools-package))
