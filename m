From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 30 Dec 2017 18:31:48 +0100
Subject: [Buildroot] [git commit] libiio: fix libavahi-client dependency
Message-ID: <20171230173221.0A618832CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=18e00edb7796790b1ac1a0f6982ab8e25e27c691
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avahi needs avahi-daemon and D-Bus to build avahi-client.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libiio/libiio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 0b13064..3fbd391 100644
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
 
