From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 22 Nov 2018 18:49:13 +0100
Subject: [Buildroot] [PATCH 1/2] dante: disable pam
Message-ID: <20181122174914.20300-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/5222592f2052e18c184fae42214c112e7f39be6e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dante/dante.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index 687567e100..a147aa36dc 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -12,7 +12,7 @@ DANTE_LICENSE_FILES = LICENSE
 # Dante uses a *VERY* old configure.ac
 DANTE_LIBTOOL_PATCH = NO
 
-DANTE_CONF_OPTS += --disable-client --disable-preload
+DANTE_CONF_OPTS += --disable-client --disable-preload --without-pam
 
 define DANTE_INSTALL_CONFIG_FILE
 	$(INSTALL) -D -m 644 $(@D)/example/sockd.conf \
-- 
2.14.1
