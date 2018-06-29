From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Fri, 29 Jun 2018 10:13:00 +0200
Subject: [Buildroot] [PATCH] libostree: exclude 'lib' from libsoup configure
 option
Message-ID: <20180629081300.30216-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The option used by configure script is actually
--with-soup/--without-soup.

Fixes:
- http://autobuild.buildroot.net/results/cf8ab76b8ea1a555d42f0625df1d58543e88efb1/

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 package/libostree/libostree.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index bf5118413b..d9739b7901 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -40,7 +40,7 @@ endif
 
 #cURL support depends on libsoup
 ifeq ($(BR2_PACKAGE_LIBSOUP),y)
-LIBOSTREE_CONF_OPTS += --with-libsoup
+LIBOSTREE_CONF_OPTS += --with-soup
 LIBOSTREE_DEPENDENCIES += libsoup
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 LIBOSTREE_CONF_OPTS += --with-curl
@@ -49,7 +49,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-curl
 endif
 else
-LIBOSTREE_CONF_OPTS += --without-libsoup --without-curl
+LIBOSTREE_CONF_OPTS += --without-soup --without-curl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBARCHIVE),y)
-- 
2.18.0
