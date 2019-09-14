From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 14 Sep 2019 16:52:42 +0200
Subject: [Buildroot] [PATCH 1/1] package/kompexsqlite: use github macro
Message-ID: <20190914145242.8633-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use github macro and drop SOURCE variable to keep the default SOURCE
value which gives a much more sensible tarball name

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kompexsqlite/kompexsqlite.hash | 2 +-
 package/kompexsqlite/kompexsqlite.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/kompexsqlite/kompexsqlite.hash b/package/kompexsqlite/kompexsqlite.hash
index 6ee77e1f38..8869e9b7d9 100644
--- a/package/kompexsqlite/kompexsqlite.hash
+++ b/package/kompexsqlite/kompexsqlite.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	v1.10.12-1.tar.gz
+sha256	73bec94fe5dd3a24bd8668b3a131a84dbe39a992579eebab1236aa0e73b2c9cc	kompexsqlite-1.10.12-1.tar.gz
 sha256	da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768	LICENSE.txt
diff --git a/package/kompexsqlite/kompexsqlite.mk b/package/kompexsqlite/kompexsqlite.mk
index 92a4ddc22a..a40088fa2d 100644
--- a/package/kompexsqlite/kompexsqlite.mk
+++ b/package/kompexsqlite/kompexsqlite.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 KOMPEXSQLITE_VERSION = 1.10.12-1
-KOMPEXSQLITE_SOURCE = v$(KOMPEXSQLITE_VERSION).tar.gz
-KOMPEXSQLITE_SITE = https://github.com/Aethelflaed/kompex-sqlite-wrapper/archive
+KOMPEXSQLITE_SITE = \
+	$(call github,Aethelflaed,kompex-sqlite-wrapper,v$(KOMPEXSQLITE_VERSION))
 KOMPEXSQLITE_INSTALL_STAGING = YES
 KOMPEXSQLITE_LICENSE = LGPL-3.0+ (wrapper), Public Domain (bundled sqlite)
 KOMPEXSQLITE_LICENSE_FILES = LICENSE.txt
-- 
2.23.0.rc1
