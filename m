From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 15 May 2021 09:01:41 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libbluray: add optional
 support for libudfread
Message-ID: <20210515070141.396977-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased, removed patch which is included in current upstream release

 package/libbluray/libbluray.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index 5c5f603dd8..233797f38d 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -19,6 +19,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
 
+ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
+LIBBLURAY_DEPENDENCIES += libudfread
+endif
+
 ifeq ($(BR2_PACKAGE_FREETYPE),y)
 LIBBLURAY_DEPENDENCIES += freetype
 LIBBLURAY_CONF_OPTS += --with-freetype
-- 
2.29.2
