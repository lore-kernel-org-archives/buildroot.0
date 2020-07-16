From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jul 2020 17:47:10 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/libcurl: bump
 version to 7.69.1
Message-ID: <20200716155439.721DD876A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36b4384b469ef056d96ab11be1b362ab1bbbaf1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Changelog: https://curl.haxx.se/changes.html

Removed polarssl configure options, upstream removed polarssl support:
https://curl.haxx.se/bug/?i=4825

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit de3de7e158e163b59472a3c5a5a51c140ac9d30d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcurl/libcurl.hash | 2 +-
 package/libcurl/libcurl.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/libcurl/libcurl.hash b/package/libcurl/libcurl.hash
index e60194254e..69cf7b5398 100644
--- a/package/libcurl/libcurl.hash
+++ b/package/libcurl/libcurl.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b724240722276a27f6e770b952121a3afd097129d8c9fe18e6272dc34192035a  curl-7.68.0.tar.xz
+sha256 03c7d5e6697f7b7e40ada1b2256e565a555657398e6c1fcfa4cb251ccd819d4f  curl-7.69.1.tar.xz
 sha256 db3c4a3b3695a0f317a0c5176acd2f656d18abc45b3ee78e50935a78eb1e132e  COPYING
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 16b11ca944..11b5f4a976 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.68.0
+LIBCURL_VERSION = 7.69.1
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.xz
 LIBCURL_SITE = https://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
@@ -22,7 +22,7 @@ LIBCURL_INSTALL_STAGING = YES
 # generate C code) isn't very useful
 LIBCURL_CONF_OPTS = --disable-manual --disable-ntlm-wb \
 	--enable-hidden-symbols --with-random=/dev/urandom --disable-curldebug \
-	--without-polarssl --disable-libcurl-option
+	--disable-libcurl-option
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 LIBCURL_CONF_OPTS += --enable-threaded-resolver
@@ -177,7 +177,6 @@ HOST_LIBCURL_CONF_OPTS = \
 	--with-ssl \
 	--without-gnutls \
 	--without-mbedtls \
-	--without-polarssl \
 	--without-nss
 
 HOST_LIBCURL_POST_PATCH_HOOKS += LIBCURL_FIX_DOT_PC
