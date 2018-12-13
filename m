From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 13 Dec 2018 23:55:20 +0100
Subject: [Buildroot] [PATCH v1 1/2] ell: bump version to 0.16
Message-ID: <20181213225521.26400-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- drop 0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
  (upstream applied [1])

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=01254efa6f69078000da7e87e43c9f245df0cfc0

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...missing-l_genl_family_set_unicast_ha.patch | 30 -------------------
 package/ell/ell.hash                          |  2 +-
 package/ell/ell.mk                            |  2 +-
 3 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch

diff --git a/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch b/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
deleted file mode 100644
index e521a93f7a..0000000000
--- a/package/ell/0001-ell-ell.sym-add-missing-l_genl_family_set_unicast_ha.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From e68d797ffdfe768c1e4a356add5bb12c43f40a72 Mon Sep 17 00:00:00 2001
-From: Peter Seiderer <ps.report@gmx.net>
-Date: Fri, 9 Nov 2018 23:28:39 +0100
-Subject: [PATCH] ell/ell.sym: add missing l_genl_family_set_unicast_handler
-
-Fixes iwd compile failure:
-
-  src/netdev.o: In function `netdev_set_nl80211':
-  netdev.c:(.text+0x6f04): undefined reference to `l_genl_family_set_unicast_handler'
-
-Signed-off-by: Peter Seiderer <ps.report@gmx.net>
----
- ell/ell.sym | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/ell/ell.sym b/ell/ell.sym
-index 614bc93..cdd2c21 100644
---- a/ell/ell.sym
-+++ b/ell/ell.sym
-@@ -257,6 +257,7 @@ global:
- 	l_genl_family_new;
- 	l_genl_family_ref;
- 	l_genl_family_unref;
-+	l_genl_family_set_unicast_handler;
- 	l_genl_family_set_watches;
- 	l_genl_family_get_version;
- 	l_genl_family_get_genl;
--- 
-2.19.1
-
diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 84827437ec..dd6e90f3fc 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 1791d2e18f0089af0d58a3d2f76a2846c2d9fa59eb2848124a713ce380561b0e ell-0.14.tar.gz
+sha256 bb7038340bfa4eed57700a42da235ba2efce19fe7ab6b976af3e69ee9597a4dd ell-0.16.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 56d53be868..9f610e7d23 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.14
+ELL_VERSION = 0.16
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.19.2
