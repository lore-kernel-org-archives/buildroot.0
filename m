From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 10 May 2018 11:35:00 +0200
Subject: [Buildroot] [PATCH 1/1] cups-filters: fix avahi dependency
Message-ID: <20180510093500.15672-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

avahi support requires avahi-client, which needs avahi-daemon and dbus

Fixes:
 - http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cups-filters/cups-filters.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 82ea46dd94..131e58246e 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -40,7 +40,8 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-dbus
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+# avahi support requires avahi-client, which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 CUPS_FILTERS_DEPENDENCIES += avahi
 CUPS_FILTERS_CONF_OPTS += --enable-avahi
 else
-- 
2.14.1
