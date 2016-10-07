From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Fri,  7 Oct 2016 22:09:18 +0200
Subject: [Buildroot] [PATCH 3/3] Revert "texinfo: new host package"
In-Reply-To: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
References: <1475870958-14790-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <1475870958-14790-3-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

This reverts commit ea161cf6891c3a3a601dfce072f68ee4aed08d21.

The host-texinfo dependency is no longer used by any package, after using
another solution to the problem that required its introduction in the first
place.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/texinfo/texinfo.hash |  2 --
 package/texinfo/texinfo.mk   | 13 -------------
 2 files changed, 15 deletions(-)
 delete mode 100644 package/texinfo/texinfo.hash
 delete mode 100644 package/texinfo/texinfo.mk

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
-- 
2.7.3
