From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Sep 2015 15:58:22 +0300
Subject: [Buildroot] [PATCH 1/2] libbluray: add optional fontconfig
	dependency
Message-ID: <c0676cbc3b883de88e98c9ba28d8023f17cb5e88.1443531503.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/dbf/dbfbf09f48e7ec09be34a3a40d3c859b74379eaf/
http://autobuild.buildroot.net/results/3fb/3fb9c077d4fe772774f53c7611b4dcbaad361312/
http://autobuild.buildroot.net/results/f9c/f9c1f3cf8bfa9eeacb7719459c22bdf7dea26ddb/

and more.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libbluray/libbluray.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e10f7dbc8c73..f6a501a1083f 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -24,6 +24,12 @@ else
 LIBBLURAY_CONF_OPTS += --without-freetype
 endif
 
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+LIBBLURAY_DEPENDENCIES += fontconfig
+else
+LIBBLURAY_CONF_OPTS += --without-fontconfig
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBBLURAY_DEPENDENCIES += libxml2
 else
-- 
2.5.3
