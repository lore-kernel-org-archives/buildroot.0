From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 May 2018 21:54:57 +0200
Subject: [Buildroot] [git commit] cups-filters: fix avahi dependency
Message-ID: <20180513195422.A7BB78B8F6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dad6f570af5b7d2ef800c6dc55316933bd4b1803
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

avahi support requires avahi-client, which needs avahi-daemon and dbus

Fixes:
 - http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
