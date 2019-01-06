From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  6 Jan 2019 19:57:36 +0200
Subject: [Buildroot] [PATCH] package/ed: bump to version 1.15
Message-ID: <fbc76c727c1fe7defcf8dd28728b700d4b4122ed.1546797456.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop ED_CONF_OPTS; unused since commit 2a37b625e2 ("ed: Convert to
generic package infrastructure").

Add license file hash.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/ed/ed.hash | 6 ++++--
 package/ed/ed.mk   | 5 +----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/ed/ed.hash b/package/ed/ed.hash
index 1aa00c0486d9..96c814d3c201 100644
--- a/package/ed/ed.hash
+++ b/package/ed/ed.hash
@@ -1,2 +1,4 @@
-# From http://lists.gnu.org/archive/html/bug-ed/2017-02/msg00005.html
-sha256	f57962ba930d70d02fc71d6be5c5f2346b16992a455ab9c43be7061dec9810db	ed-1.14.2.tar.lz
+# From http://lists.gnu.org/archive/html/bug-ed/2019-01/msg00010.html
+sha256	ad4489c0ad7a108c514262da28e6c2a426946fb408a3977ef1ed34308bdfd174	ed-1.15.tar.lz
+# Locally calculated
+sha256	f03a12bef9dfb7281864a0dd965166d4f4ec7a66633df2bc72fa4363e57de02c	COPYING
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index ada0316a2707..6ef8f951cfc9 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,12 +4,9 @@
 #
 ################################################################################
 
-ED_VERSION = 1.14.2
+ED_VERSION = 1.15
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_SOURCE = ed-$(ED_VERSION).tar.lz
-ED_CONF_OPTS = \
-	CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-	LDFLAGS="$(TARGET_LDFLAGS)"
 ED_LICENSE = GPL-3.0+
 ED_LICENSE_FILES = COPYING
 
-- 
2.20.1
