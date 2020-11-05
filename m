From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  5 Nov 2020 19:42:18 +0100
Subject: [Buildroot] [PATCH 1/1] package/sqlite: bump version to 3.33.0
Message-ID: <20201105184218.254690-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed sha1 hash, not provided by upstream anymore.
Sha3 hashes are currently not support by buildroot, for details see
http://lists.busybox.net/pipermail/buildroot/2020-November/295957.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/sqlite/sqlite.hash | 9 ++-------
 package/sqlite/sqlite.mk   | 2 +-
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/sqlite/sqlite.hash b/package/sqlite/sqlite.hash
index 162b52d607..4f0e747c3d 100644
--- a/package/sqlite/sqlite.hash
+++ b/package/sqlite/sqlite.hash
@@ -1,8 +1,3 @@
-# From https://www.sqlite.org/download.html
-sha1  ea14ef2dc4cc7fcbc5ebbb018d3a03faa3a41cb4  sqlite-autoconf-3320300.tar.gz
-
-# Calculated based on the hash above
-sha256  a31507123c1c2e3a210afec19525fd7b5bb1e19a6a34ae5b998fbd7302568b66  sqlite-autoconf-3320300.tar.gz
-
-# Locally calculated
+# Locally computed
+sha256  106a2c48c7f75a298a7557bcc0d5f4f454e5b43811cc738b7ca294d6956bbb15  sqlite-autoconf-3330000.tar.gz
 sha256  66e056b6e8687f32af30d5187611b98b12a8f46f07aaf62f43585f276e8f0ac9  tea/license.terms
diff --git a/package/sqlite/sqlite.mk b/package/sqlite/sqlite.mk
index c8b9ba3150..3e8754901a 100644
--- a/package/sqlite/sqlite.mk
+++ b/package/sqlite/sqlite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SQLITE_VERSION = 3320300
+SQLITE_VERSION = 3330000
 SQLITE_SOURCE = sqlite-autoconf-$(SQLITE_VERSION).tar.gz
 SQLITE_SITE = https://www.sqlite.org/2020
 SQLITE_LICENSE = Public domain
-- 
2.27.0
