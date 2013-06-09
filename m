From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 9 Jun 2013 21:02:24 +0200
Subject: [Buildroot] [git commit] squid: bump to version 3.3.5
Message-ID: <20130609190600.34DA99AA3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dbf426da06e034d1109897f557445b192cb6a128
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../squid/squid-01-assume-get-certificate-ok.patch |   16 ++++++++++++++++
 package/squid/squid.mk                             |    3 ++-
 2 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/squid/squid-01-assume-get-certificate-ok.patch b/package/squid/squid-01-assume-get-certificate-ok.patch
new file mode 100644
index 0000000..e7d4515
--- /dev/null
+++ b/package/squid/squid-01-assume-get-certificate-ok.patch
@@ -0,0 +1,16 @@
+The openssl get_certificate working test isn't cross compile friendly.
+Just assume it works ok since we're using a modern OpenSSL version.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura squid-3.3.5.orig/configure.ac squid-3.3.5/configure.ac
+--- squid-3.3.5.orig/configure.ac	2013-06-03 09:37:44.016398185 -0300
++++ squid-3.3.5/configure.ac	2013-06-03 09:37:55.926784556 -0300
+@@ -1261,7 +1261,6 @@
+ AC_SUBST(SSLLIB)
+
+ if test "x$with_openssl" = "xyes"; then
+-SQUID_CHECK_OPENSSL_GETCERTIFICATE_WORKS
+ SQUID_CHECK_OPENSSL_TXTDB
+ fi
+
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index 934277e..4dd1404 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-SQUID_VERSION = 3.3.4
+SQUID_VERSION = 3.3.5
 SQUID_SITE = http://www.squid-cache.org/Versions/v3/3.3
 SQUID_LICENSE = GPLv2+
 SQUID_LICENSE_FILES = COPYING
+SQUID_AUTORECONF = YES
 SQUID_DEPENDENCIES = libcap host-libcap host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBNETFILTER_CONNTRACK),libnetfilter_conntrack)
 SQUID_CONF_ENV =	ac_cv_epoll_works=yes ac_cv_func_setresuid=yes \
