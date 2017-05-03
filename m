From: xlcwu <xlcwu.taiwan@gmail.com>
Date: Wed,  3 May 2017 03:43:55 +0000
Subject: [Buildroot] [PATCH 1/1] libcgi: bump to version 1.1 and cleanup the
	libcgi package,
	by using https://github.com/rafaelsteil/libcgi as an upstream.
Message-ID: <1493783035-17087-1-git-send-email-xlcwu.taiwan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: xlcwu <xlcwu.taiwan@gmail.com>
---
 package/libcgi/libcgi.hash |  2 +-
 package/libcgi/libcgi.mk   | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/libcgi/libcgi.hash b/package/libcgi/libcgi.hash
index 6bd7c0c..1ac1440 100644
--- a/package/libcgi/libcgi.hash
+++ b/package/libcgi/libcgi.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  861df39cc0195d43419c4c3de8dff4f42478db66c9ba0b0c1e994c99400e130c  libcgi-1.0.tar.gz
+sha256  128445f2f828e84905d51bd53d11e2e08c489df3a07225ff9f198c1318092fe6  libcgi-1.1.tar.gz
diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index de2a1e4..dce71e1 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-LIBCGI_VERSION = 1.0
+LIBCGI_VERSION = 1.1
 LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VERSION)
+LIBCGI_SITE = $(call github,rafaelsteil,libcgi,$(LIBCGI_VERSION))
+LIBCGI_SITE = https://github.com/rafaelsteil/libcgi/releases/download/v$(LIBCGI_VERSION)
+
 LIBCGI_INSTALL_STAGING = YES
-# use cross CC/AR rather than host
-LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)" \
-	$(if $(BR2_STATIC_LIBS),STATIC=1)
 LIBCGI_LICENSE = LGPL-2.1+
 
-$(eval $(autotools-package))
+LIBCGI_SUPPORTS_IN_SOURCE_BUILD = NO
+
+$(eval $(cmake-package))
-- 
1.9.1
