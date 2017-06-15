From: Adam Duskett <aduskett@gmail.com>
Date: Thu, 15 Jun 2017 10:25:28 -0400
Subject: [Buildroot] [PATCH] libssl: new virtual package.
In-Reply-To: <20170615142531.31629-1-aduskett@codeblue.com>
References: <20170615142531.31629-1-aduskett@codeblue.com>
Message-ID: <20170615142531.31629-2-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

    libressl is API compatible with OpenSSL 1.0.1 and is almost API compatible
    with OpenSSL 1.0.2.  As such, a new virtual package is needed to handle
    having both libressl and openssl.

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/Config.in        | 1 +
 package/libssl/Config.in | 6 ++++++
 package/libssl/libssl.mk | 7 +++++++
 3 files changed, 14 insertions(+)
 create mode 100644 package/libssl/Config.in
 create mode 100644 package/libssl/libssl.mk

diff --git a/package/Config.in b/package/Config.in
index 1674444..a7af71e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -967,6 +967,7 @@ menu "Crypto"
 	source "package/libscrypt/Config.in"
 	source "package/libsecret/Config.in"
 	source "package/libsha1/Config.in"
+	source "package/libssl/Config.in"
 	source "package/libsodium/Config.in"
 	source "package/libssh/Config.in"
 	source "package/libssh2/Config.in"
diff --git a/package/libssl/Config.in b/package/libssl/Config.in
new file mode 100644
index 0000000..71347de
--- /dev/null
+++ b/package/libssl/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_LIBSSL
+	bool
+
+config BR2_PACKAGE_PROVIDES_LIBSSL
+	string
+	depends on BR2_PACKAGE_HAS_LIBSSL
diff --git a/package/libssl/libssl.mk b/package/libssl/libssl.mk
new file mode 100644
index 0000000..6e89bcc
--- /dev/null
+++ b/package/libssl/libssl.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# libssl
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
2.9.4
