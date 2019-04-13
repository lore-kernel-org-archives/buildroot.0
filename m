From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 13 Apr 2019 16:05:37 +0200
Subject: [Buildroot] [git commit] package/pure-ftpd: bump to version 1.0.49
Message-ID: <20190413140221.230E48A4CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=26d5d1c0a20719876220b429a43f8b1bcc29138b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Update hash of license file (update in year)
- Remove patch (already in version)
- Remove --with-rfc2640 (option removed with
  https://github.com/jedisct1/pure-ftpd/commit/33eda763bfca8dfcf736275272b84602dcd18549)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pure-ftpd/0001-cross.patch | 25 -------------------------
 package/pure-ftpd/pure-ftpd.hash   |  4 ++--
 package/pure-ftpd/pure-ftpd.mk     |  5 ++---
 3 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/package/pure-ftpd/0001-cross.patch b/package/pure-ftpd/0001-cross.patch
deleted file mode 100644
index f8b1d81da8..0000000000
--- a/package/pure-ftpd/0001-cross.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-Do not include host paths when cross-compiling.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr pure-ftpd-1.0.36.org/configure pure-ftpd-1.0.36/configure
---- pure-ftpd-1.0.36.org/configure	2012-03-16 06:29:23.000000000 +0100
-+++ pure-ftpd-1.0.36/configure	2014-09-28 19:55:56.650529713 +0200
-@@ -6319,17 +6319,6 @@
- 
- 
- 
--if test -d /usr/local/include; then
--  CPPFLAGS="$CPPFLAGS -I/usr/local/include"
--fi
--
--if test -d /usr/kerberos/include; then
--  CPPFLAGS="$CPPFLAGS -I/usr/kerberos/include"
--fi
--
--if test -d /usr/local/lib; then
--  LDFLAGS="$LDFLAGS -L/usr/local/lib"
--fi
- 
- if uname | fgrep SunOS > /dev/null 2> /dev/null ; then
-   CPPFLAGS="$CPPFLAGS -D_XPG4_2=1"
diff --git a/package/pure-ftpd/pure-ftpd.hash b/package/pure-ftpd/pure-ftpd.hash
index f01da51a37..8fe73e4fb0 100644
--- a/package/pure-ftpd/pure-ftpd.hash
+++ b/package/pure-ftpd/pure-ftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256 cb1b695e779a06e42d62d7a1a428d2f605d621dfd5afe4e192b5f9fc4e343692  pure-ftpd-1.0.47.tar.bz2
-sha256 e724ba991d8efa4c963e84ec31314c532dab00ac455ef77020fe60e78177bf23  COPYING
+sha256 8a727dfef810f275fba3eb6099760d4f8a0bdeae2c1197d0d5bfeb8c1b2f61b6  pure-ftpd-1.0.49.tar.bz2
+sha256 3a9e94382a69d04aa434d69b20ff2c01dbbfcb7191f05f69a7109c0ee1559c19  COPYING
diff --git a/package/pure-ftpd/pure-ftpd.mk b/package/pure-ftpd/pure-ftpd.mk
index 7012268874..aed528b981 100644
--- a/package/pure-ftpd/pure-ftpd.mk
+++ b/package/pure-ftpd/pure-ftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PURE_FTPD_VERSION = 1.0.47
+PURE_FTPD_VERSION = 1.0.49
 PURE_FTPD_SITE = https://download.pureftpd.org/pub/pure-ftpd/releases
 PURE_FTPD_SOURCE = pure-ftpd-$(PURE_FTPD_VERSION).tar.bz2
 PURE_FTPD_LICENSE = ISC
@@ -13,8 +13,7 @@ PURE_FTPD_DEPENDENCIES = $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
 PURE_FTPD_CONF_OPTS = \
 	--with-altlog \
-	--with-puredb \
-	--with-rfc2640
+	--with-puredb
 
 ifeq ($(BR2_PACKAGE_ELFUTILS),y)
 PURE_FTPD_DEPENDENCIES += elfutils
