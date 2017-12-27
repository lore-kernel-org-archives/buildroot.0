From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 27 Dec 2017 13:35:55 +0100
Subject: [Buildroot] [PATCH v2] libiio: fix libavahi-client dependency
Message-ID: <20171227123555.15388-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Avahi needs avahi-daemon and D-Bus to build avahi-client.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
v2:
- Do not check for AVAHI as it is implicity checked by
  AVAHI_DAEMON

 package/libiio/libiio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 0b13064085..3fbd39188a 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -54,8 +54,8 @@ else
 LIBIIO_CONF_OPTS += -DWITH_IIOD_USBD=OFF
 endif
 
-# Avahi support in libiio requires avahi-client, which needs avahi-daemon
-ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON),yy)
+# Avahi support in libiio requires avahi-client, which needs avahi-daemon and dbus
+ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
 LIBIIO_DEPENDENCIES += avahi
 endif
 
-- 
2.15.1
