From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Oct 2016 19:40:19 +0200
Subject: [Buildroot] [git commit] Revert "texinfo: new host package"
Message-ID: <20161014181012.B26738222F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e327d4c69720fb215c547de788e65cb211a9978
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit ea161cf6891c3a3a601dfce072f68ee4aed08d21.

The host-texinfo dependency is no longer used by any package, after using
another solution to the problem that required its introduction in the first
place.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/texinfo/texinfo.hash |  2 --
 package/texinfo/texinfo.mk   | 13 -------------
 2 files changed, 15 deletions(-)

diff --git a/package/texinfo/texinfo.hash b/package/texinfo/texinfo.hash
deleted file mode 100644
index 4bdf343..0000000
--- a/package/texinfo/texinfo.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256 ac68394ce21b2420ba7ed7cec65d84aacf308cc88e9bf4716fcfff88286883d2 texinfo-6.1.tar.xz
diff --git a/package/texinfo/texinfo.mk b/package/texinfo/texinfo.mk
deleted file mode 100644
index ebd0b48..0000000
--- a/package/texinfo/texinfo.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# texinfo
-#
-################################################################################
-
-TEXINFO_VERSION = 6.1
-TEXINFO_SITE = $(BR2_GNU_MIRROR)/texinfo
-TEXINFO_SOURCE = texinfo-$(TEXINFO_VERSION).tar.xz
-TEXINFO_LICENSE = GPLv3+
-TEXINFO_LICENSE_FILES = COPYING
-
-$(eval $(host-autotools-package))
