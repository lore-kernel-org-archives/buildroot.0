From: Peter Seiderer <ps.report@gmx.net>
Date: Sat, 13 Feb 2021 18:40:08 +0100
Subject: [Buildroot] [RFC v1 1/6] package/libb2: new package
In-Reply-To: <20210213174013.32584-1-ps.report@gmx.net>
References: <20210213174013.32584-1-ps.report@gmx.net>
Message-ID: <20210213174013.32584-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in        |  1 +
 package/libb2/Config.in  |  6 ++++++
 package/libb2/libb2.hash |  3 +++
 package/libb2/libb2.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/libb2/Config.in
 create mode 100644 package/libb2/libb2.hash
 create mode 100644 package/libb2/libb2.mk

diff --git a/package/Config.in b/package/Config.in
index 5304ab141c..fab4dcab89 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1353,6 +1353,7 @@ menu "Crypto"
 	source "package/gnutls/Config.in"
 	source "package/libargon2/Config.in"
 	source "package/libassuan/Config.in"
+	source "package/libb2/Config.in"
 	source "package/libgcrypt/Config.in"
 	source "package/libgpg-error/Config.in"
 	source "package/libgpgme/Config.in"
diff --git a/package/libb2/Config.in b/package/libb2/Config.in
new file mode 100644
index 0000000000..5cb462eb19
--- /dev/null
+++ b/package/libb2/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBB2
+	bool "libb2"
+	help
+	  C library providing BLAKE2b, BLAKE2s, BLAKE2bp, BLAKE2sp.
+
+	  https://github.com/BLAKE2/libb2
diff --git a/package/libb2/libb2.hash b/package/libb2/libb2.hash
new file mode 100644
index 0000000000..6ef24a98ca
--- /dev/null
+++ b/package/libb2/libb2.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256  10053dbc2fa342516b780a6bbf6e7b2a2360b8d49c5ac426936bf3df82526732  libb2-0.98.1.tar.gz
+sha256  6a1ee543e5282cd9061881edf462e6fdab181f328da71fc2c9a6950a80e94d01  COPYING
diff --git a/package/libb2/libb2.mk b/package/libb2/libb2.mk
new file mode 100644
index 0000000000..11d7ef3f55
--- /dev/null
+++ b/package/libb2/libb2.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# libb2
+#
+################################################################################
+
+LIBB2_VERSION = 0.98.1
+LIBB2_SITE = $(call github,BLAKE2,libb2,v$(LIBB2_VERSION))
+LIBB2_LICENSE =  CC0-1.0
+LIBB2_LICENSE_FILES = COPYING
+LIBB2_INSTALL_STAGING = YES
+# From git
+LIBB2_AUTORECONF = YES
+LIBB2_DEPENDENCIES = host-pkgconf
+
+$(eval $(autotools-package))
-- 
2.30.0
