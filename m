From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 18 Jun 2017 09:27:37 +0200
Subject: [Buildroot] [PATCH 1/1] package/libbluray: fix build when host has
	no java support
Message-ID: <20170618072737.13591-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/630/630cfe62798d0f35fdfaed8547038ba7673cc149/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libbluray/libbluray.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
index d3eee5d0c..4928f8acb 100644
--- a/package/libbluray/libbluray.mk
+++ b/package/libbluray/libbluray.mk
@@ -12,6 +12,8 @@ LIBBLURAY_LICENSE = LGPL-2.1+
 LIBBLURAY_LICENSE_FILES = COPYING
 LIBBLURAY_DEPENDENCIES = host-pkgconf
 
+LIBBLURAY_CONF_OPTS = --disable-bdjava-jar
+
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 LIBBLURAY_DEPENDENCIES += libiconv
 endif
-- 
2.11.0
