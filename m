From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Mon,  7 Oct 2013 21:36:01 +0200
Subject: [Buildroot] [PATCH] Revert "berkeleydb: bump to version 6.0.20"
Message-ID: <1381174561-22507-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BerkeleyDB has changed its license since version 6. New license (AGPL) may
be incompatible with some packages. So we prefer to stick to version 5

This reverts commit 4c478de2e76ffc1d0a6dc413475307fd44a0a595.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/berkeleydb/berkeleydb.mk |    5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 9b23623..d39bf80 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -4,7 +4,10 @@
 #
 ################################################################################
 
-BERKELEYDB_VERSION = 6.0.20
+# If you want to use lastest version of BerkeleyDB, just change VERSION below.
+# However, notice BerkeleyDB license changed and is now Affero GPL since
+# version 6
+BERKELEYDB_VERSION = 5.3.21
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
-- 
1.7.9.5
