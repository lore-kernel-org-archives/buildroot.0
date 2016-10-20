From: Viacheslav Volkov <sv99@inbox.ru>
Date: Thu, 20 Oct 2016 19:43:11 +0300
Subject: [Buildroot] [PATCH] package/zbar: fix zbar build
Message-ID: <1476981791-18423-1-git-send-email-sv99@inbox.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.net/results/913/913662f10330b79f7769d05493438676939d9c7e/

Signed-off-by: Viacheslav Volkov <sv99@inbox.ru>
---
 package/zbar/zbar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 54e11e3..aba78d1 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -12,6 +12,8 @@ ZBAR_LICENSE_FILES = LICENSE
 ZBAR_INSTALL_STAGING = YES
 ZBAR_AUTORECONF = YES
 ZBAR_DEPENDENCIES = libv4l jpeg
+# add host-gettext for AM_ICONV macro
+ZBAR_DEPENDENCIES += host-gettext
 ZBAR_CONF_OPTS = \
 	--without-imagemagick \
 	--without-qt \
-- 
1.9.1
