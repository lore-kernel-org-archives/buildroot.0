From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Mar 2017 22:31:39 +0100
Subject: [Buildroot] [git commit] cosmo: remove broken package
Message-ID: <20170302213143.A3E0E80292@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2c8438866394f2146ab60c483a820e3ca78ce560
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The cosmo package has been marked as broken for two and a half years
now, and nobody cared. Get rid of it.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in        |  1 -
 package/cosmo/Config.in  | 10 ----------
 package/cosmo/cosmo.hash |  2 --
 package/cosmo/cosmo.mk   | 10 ----------
 4 files changed, 23 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 17f2f75..69c772b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -527,7 +527,6 @@ menu "Lua libraries/modules"
 	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
-	source "package/cosmo/Config.in"
 	source "package/coxpcall/Config.in"
 	source "package/dado/Config.in"
 	source "package/easydbus/Config.in"
diff --git a/package/cosmo/Config.in b/package/cosmo/Config.in
deleted file mode 100644
index 869a107..0000000
--- a/package/cosmo/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_COSMO
-	bool "cosmo"
-	# run-time dependency
-	select BR2_PACKAGE_LPEG
-	# upstream site does not provide a valid archive
-	depends on BROKEN
-	help
-	  Cosmo is a "safe templates" engine for Lua.
-
-	  http://mascarenhas.github.io/cosmo/
diff --git a/package/cosmo/cosmo.hash b/package/cosmo/cosmo.hash
deleted file mode 100644
index ff88576..0000000
--- a/package/cosmo/cosmo.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# locally computed
-sha256  4e81c1bba7ab3b4633c8d6dadfc8332c59c818829436435b4d5a2ec76adfbb87  cosmo-14.03.04-1.src.rock
diff --git a/package/cosmo/cosmo.mk b/package/cosmo/cosmo.mk
deleted file mode 100644
index 0ab5324..0000000
--- a/package/cosmo/cosmo.mk
+++ /dev/null
@@ -1,10 +0,0 @@
-################################################################################
-#
-# cosmo
-#
-################################################################################
-
-COSMO_VERSION = 14.03.04-1
-COSMO_LICENSE = MIT
-
-$(eval $(luarocks-package))
