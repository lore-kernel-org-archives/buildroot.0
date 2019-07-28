From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 12:22:10 +0200
Subject: [Buildroot] [git commit] package/netsurf: needs host-vim
Message-ID: <20190728102041.981E68135D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=56a33e2a95de15139ab93b033404e38ca520ff09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/ade/adead660148cec04910b7a616cc85adfdd63ae95/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
