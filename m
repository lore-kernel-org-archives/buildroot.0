From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 11 Apr 2016 21:49:52 +0200
Subject: [Buildroot] [PATCH] vnstat: needs host-pkgconf
Message-ID: <1460404192-28861-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

vnstat uses the PKG_CHECK_MODULES macro and therefor requires pkg-config.

Note that for adding the dependency gd to VNSTAT_DEPENDENCIES the assignment
was changed from '=' to '+='.

Fixes:
http://autobuild.buildroot.net/results/4dd/4ddb0d7d7fe2509ff9c4753d918e0bebd7725c13/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/vnstat/vnstat.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/vnstat/vnstat.mk b/package/vnstat/vnstat.mk
index ba2610a..576f240 100644
--- a/package/vnstat/vnstat.mk
+++ b/package/vnstat/vnstat.mk
@@ -8,11 +8,12 @@ VNSTAT_VERSION = 1.15
 VNSTAT_SITE = http://humdi.net/vnstat
 VNSTAT_LICENSE = GPLv2
 VNSTAT_LICENSE_FILES = COPYING
+VNSTAT_DEPENDENCIES = host-pkgconf
 # We're patching configure.ac, so we need to autoreconf
 VNSTAT_AUTORECONF = YES
 
 ifeq ($(BR2_PACKAGE_GD)$(BR2_PACKAGE_LIBPNG),yy)
-VNSTAT_DEPENDENCIES = gd
+VNSTAT_DEPENDENCIES += gd
 VNSTAT_CONF_OPTS = --enable-image-output
 else
 VNSTAT_CONF_OPTS = --disable-image-output
-- 
2.8.0
