From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  2 Jan 2015 22:19:28 +0100
Subject: [Buildroot] [PATCH 3/3] package/openocd: fix libftdi mis-detection
In-Reply-To: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
References: <1420233568-10133-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1420233568-10133-3-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By-pass failing ac_search_libs check when libftdi is enabled.

Fixes:
  http://autobuild.buildroot.org/results/e90/e90b4d5ad79d99487f21c9d18581e8eba7034501/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/openocd/openocd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index ad1f95b..34a2bbd 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -8,7 +8,8 @@ OPENOCD_VERSION = 0.8.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)
 
-OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
+OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99" \
+	$(if $(BR2_PACKAGE_LIBFTDI),ac_cv_search_ftdi_new=yes)
 
 OPENOCD_CONF_OPTS = \
 	--oldincludedir=$(STAGING_DIR)/usr/include \
-- 
2.2.1
