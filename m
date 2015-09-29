From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:36:38 +0200
Subject: [Buildroot] [git commit] libbluray: add optional fontconfig
	dependency
Message-ID: <20150929173951.C0B5C81D5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6397f7aa2bc52b395e5a1eb35ba780a5ecbd73a6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/dbf/dbfbf09f48e7ec09be34a3a40d3c859b74379eaf/
http://autobuild.buildroot.net/results/3fb/3fb9c077d4fe772774f53c7611b4dcbaad361312/
http://autobuild.buildroot.net/results/f9c/f9c1f3cf8bfa9eeacb7719459c22bdf7dea26ddb/

and more.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libbluray/libbluray.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index e10f7db..f6a501a 100644
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
