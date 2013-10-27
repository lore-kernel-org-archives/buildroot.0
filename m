From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Oct 2013 10:34:21 +0100
Subject: [Buildroot] [git commit] Revert "berkeleydb: bump to version 6.0.20"
Message-ID: <20131027094052.61B559BB82@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e12fab456540b5f378bd4a7ecbf0825df147c43e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BerkeleyDB has changed its license since version 6. New license (AGPL) may
be incompatible with some packages. So we prefer to stick to version 5

This reverts commit 4c478de2e76ffc1d0a6dc413475307fd44a0a595.

[Peter: adjust comment as suggested by Yann]
Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/berkeleydb/berkeleydb.mk |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/berkeleydb/berkeleydb.mk b/package/berkeleydb/berkeleydb.mk
index 9b23623..0e3e830 100644
--- a/package/berkeleydb/berkeleydb.mk
+++ b/package/berkeleydb/berkeleydb.mk
@@ -4,7 +4,12 @@
 #
 ################################################################################
 
-BERKELEYDB_VERSION = 6.0.20
+# Since BerkeleyDB version 6 and above are licensed under the Affero
+# GPL (AGPL), we want to keep this 'bdb' package at version 5.x to
+# avoid licensing issues.
+# BerkeleyDB version 6 or above should be provided by a dedicated
+# package instead.
+BERKELEYDB_VERSION = 5.3.21
 BERKELEYDB_SITE = http://download.oracle.com/berkeley-db
 BERKELEYDB_SOURCE = db-$(BERKELEYDB_VERSION).NC.tar.gz
 BERKELEYDB_SUBDIR = build_unix
