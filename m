From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 12 Jul 2011 22:29:01 +0200
Subject: [Buildroot] [git commit] package: add gnutls
Message-ID: <20110712202944.5B6798A4D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9c6106f10494e539f00b1fc117801171348bd4bd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: move to crypto section]
Signed-off-by: Daniel Mack <zonque@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in        |    1 +
 package/gnutls/Config.in |    8 ++++++++
 package/gnutls/gnutls.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/gnutls/Config.in
 create mode 100644 package/gnutls/gnutls.mk

diff --git a/package/Config.in b/package/Config.in
index d87dcd8..aef701d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -248,6 +248,7 @@ endmenu
 
 menu "Crypto"
 source "package/beecrypt/Config.in"
+source "package/gnutls/Config.in"
 source "package/libgcrypt/Config.in"
 source "package/libgpg-error/Config.in"
 source "package/libnss/Config.in"
diff --git a/package/gnutls/Config.in b/package/gnutls/Config.in
new file mode 100644
index 0000000..cedf120
--- /dev/null
+++ b/package/gnutls/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_GNUTLS
+	bool "gnutls"
+	select BR2_PACKAGE_LIBGCRYPT
+	help
+	  GnuTLS is a secure communications library implementing the SSL
+	  and TLS protocols and technologies around them.
+
+	  http://www.gnu.org/software/gnutls/gnutls.html
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
new file mode 100644
index 0000000..5f31e1e
--- /dev/null
+++ b/package/gnutls/gnutls.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# gnutls
+#
+#############################################################
+
+GNUTLS_VERSION = 2.8.6
+GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
+GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
+GNUTLS_DEPENDENCIES = libgcrypt
+GNUTLS_CONF_OPT += --without-libgcrypt-prefix
+GNUTLS_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,gnutls))
-- 
1.7.3.4
