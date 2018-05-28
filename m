From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:10:48 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] cups-filters: fix avahi
 dependency
Message-ID: <20180528142834.4A0B2805EE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d431200be3b3ea7446e4b48a6fd809fe54918e82
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

avahi support requires avahi-client, which needs avahi-daemon and dbus

Fixes:
 - http://autobuild.buildroot.net/results/5c326bb56199000eb0e53a4d0f3c6c13be71cda0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit dad6f570af5b7d2ef800c6dc55316933bd4b1803)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups-filters/cups-filters.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 6d05aa7e31..bb1213526d 100644
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
