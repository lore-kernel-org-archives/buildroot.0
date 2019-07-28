From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 28 Jul 2019 11:23:54 +0200
Subject: [Buildroot] [PATCH 1/1] package/netsurf: needs host-vim
Message-ID: <20190728092354.20340-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/ade/adead660148cec04910b7a616cc85adfdd63ae95/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/netsurf/netsurf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index b510a69649..f82f3b5da8 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -9,8 +9,9 @@ NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
 NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
 NETSURF_LICENSE = GPL-2.0
 NETSURF_LICENSE_FILES = netsurf/COPYING
+# host-vim needed for the xxd utility
 NETSURF_DEPENDENCIES = expat jpeg libpng \
-	host-bison host-flex host-gperf host-pkgconf
+	host-bison host-flex host-gperf host-pkgconf host-vim
 
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
 NETSURF_DEPENDENCIES += libgtk2
-- 
2.20.1
