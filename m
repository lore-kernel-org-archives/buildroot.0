From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
Date: Sat,  7 Apr 2018 13:57:52 +0200
Subject: [Buildroot] [PATCH] wine: Add optional dependency on libkrb5
Message-ID: <1523102272-30239-1-git-send-email-nerv@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
---
 package/wine/wine.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 02c4c0f..b6b3aae 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -23,7 +23,6 @@ WINE_CONF_OPTS = \
 	--without-gphoto \
 	--without-gsm \
 	--without-hal \
-	--without-krb5 \
 	--without-opencl \
 	--without-oss
 
@@ -121,6 +120,13 @@ else
 WINE_CONF_OPTS += --without-glu
 endif
 
+ifeq ($(BR2_PACKAGE_LIBKRB5),y)
+WINE_CONF_OPTS += --with-krb5
+WINE_DEPENDENCIES += libkrb5
+else
+WINE_CONF_OPTS += --without-krb5
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPCAP),y)
 WINE_CONF_OPTS += --with-pcap
 WINE_DEPENDENCIES += libpcap
-- 
2.7.4
