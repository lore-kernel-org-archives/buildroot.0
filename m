From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 21:25:08 +0200
Subject: [Buildroot] [PATCH 4/4] package/libbluray: add support for libbdplus
In-Reply-To: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467487508-30061-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index b81d759..d6ea5cc 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -19,6 +19,11 @@ ifeq ($(BR2_PACKAGE_LIBAACS),y)
 LIBBLURAY_DEPENDENCIES += libaacs
 endif
 
+# libbdplus is a run-time dependency loaded by dlopen
+ifeq ($(BR2_PACKAGE_LIBBDPLUS),y)
+LIBBLURAY_DEPENDENCIES += libbdplus
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
-- 
2.8.1
