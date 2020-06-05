From: Norbert Lange <nolange79@gmail.com>
Date: Sat,  6 Jun 2020 00:52:45 +0200
Subject: [Buildroot] [PATCH 1/2] package/dbus: fix group and mode for the
 launcher
Message-ID: <20200605225247.13350-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

see bus/Makefile.am

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/dbus/dbus.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index a4043864d1..bb9f17a5e0 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -11,7 +11,7 @@ DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
 define DBUS_PERMISSIONS
-	/usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
+	/usr/libexec/dbus-daemon-launch-helper f 4750 0 dbus - - - - -
 endef
 
 define DBUS_USERS
-- 
2.26.2
