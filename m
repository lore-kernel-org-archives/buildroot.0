From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  6 Apr 2021 22:28:05 +0200
Subject: [Buildroot] [PATCH 1/1] package/openldap: bump to version 2.4.58
Message-ID: <20210406202805.1329072-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop fifth patch (already in version)

https://git.openldap.org/openldap/openldap/-/blob/OPENLDAP_REL_ENG_2_4_58/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...TS-9454-fix-issuerAndThisUpdateCheck.patch | 26 -------------------
 package/openldap/openldap.hash                | 10 +++----
 package/openldap/openldap.mk                  |  5 +---
 3 files changed, 6 insertions(+), 35 deletions(-)
 delete mode 100644 package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch

diff --git a/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch b/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
deleted file mode 100644
index a611b9ff59..0000000000
--- a/package/openldap/0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9badb73425a67768c09bcaed1a9c26c684af6c30 Mon Sep 17 00:00:00 2001
-From: Howard Chu <hyc@openldap.org>
-Date: Sat, 6 Feb 2021 20:52:06 +0000
-Subject: [PATCH] ITS#9454 fix issuerAndThisUpdateCheck
-
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- servers/slapd/schema_init.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/servers/slapd/schema_init.c b/servers/slapd/schema_init.c
-index 31be1154e..8b1e25539 100644
---- a/servers/slapd/schema_init.c
-+++ b/servers/slapd/schema_init.c
-@@ -3900,6 +3900,8 @@ issuerAndThisUpdateCheck(
- 					break;
- 				}
- 			}
-+			if ( tu->bv_len < STRLENOF("YYYYmmddHHmmssZ") ) return LDAP_INVALID_SYNTAX;
-+
- 			x.bv_val += tu->bv_len + 1;
- 			x.bv_len -= tu->bv_len + 1;
- 
--- 
-2.20.1
-
diff --git a/package/openldap/openldap.hash b/package/openldap/openldap.hash
index f2ffdf53bc..8ce50d6133 100644
--- a/package/openldap/openldap.hash
+++ b/package/openldap/openldap.hash
@@ -1,7 +1,7 @@
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.md5
-md5  e3349456c3a66e5e6155be7ddc3f042c  openldap-2.4.57.tgz
-# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.57.sha1
-sha1  1cffa70a3ea8545948041fd113f8f53bc24d6d87  openldap-2.4.57.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.md5
+md5  c203d735ba69976e5b28dc39006f29b5  openldap-2.4.58.tgz
+# From https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.4.58.sha1
+sha1  875416827be3ad63f20004510a354db0aaceb2ed  openldap-2.4.58.tgz
 # Locally computed
-sha256  c7ba47e1e6ecb5b436f3d43281df57abeffa99262141aec822628bc220f6b45a  openldap-2.4.57.tgz
+sha256  57b59254be15d0bf6a9ab3d514c1c05777b02123291533134a87c94468f8f47b  openldap-2.4.58.tgz
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index ec11e4fa7d..3b35b4daa3 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLDAP_VERSION = 2.4.57
+OPENLDAP_VERSION = 2.4.58
 OPENLDAP_SOURCE = openldap-$(OPENLDAP_VERSION).tgz
 OPENLDAP_SITE = https://www.openldap.org/software/download/OpenLDAP/openldap-release
 OPENLDAP_LICENSE = OpenLDAP Public License
@@ -13,9 +13,6 @@ OPENLDAP_CPE_ID_VENDOR = openldap
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
 
-# 0005-ITS-9454-fix-issuerAndThisUpdateCheck.patch
-OPENLDAP_IGNORE_CVES += CVE-2021-27212
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
 OPENLDAP_DEPENDENCIES += openssl
-- 
2.30.2
