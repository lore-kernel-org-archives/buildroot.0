From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  2 Jul 2016 21:25:06 +0200
Subject: [Buildroot] [PATCH 2/4] package/libbluray: add support for libaacs
In-Reply-To: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467487508-30061-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467487508-30061-2-git-send-email-bernd.kuhls@t-online.de>
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
index dfe58f4..b81d759 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -14,6 +14,11 @@ LIBBLURAY_DEPENDENCIES = host-pkgconf
 
 LIBBLURAY_CONF_OPTS = --enable-udf --disable-bdjava
 
+# libaacs is a run-time dependency loaded by dlopen
+ifeq ($(BR2_PACKAGE_LIBAACS),y)
+LIBBLURAY_DEPENDENCIES += libaacs
+endif
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
-- 
2.8.1
