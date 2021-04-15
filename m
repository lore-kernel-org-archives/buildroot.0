From: Jean-pierre Cartal <jpcartal@free.fr>
Date: Thu, 15 Apr 2021 16:42:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix dbus system socket
 location
Message-ID: <20210415144226.2354048-1-jpcartal@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix dbus system socket location moved from
/var/run/dbus/system_bus_socket to /run/dbus/system_bus_socket

Signed-off-by: Jean-pierre Cartal <jpcartal@free.fr>
---
 package/libglib2/0005-dbus-system-socket-path.patch | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 package/libglib2/0005-dbus-system-socket-path.patch

diff --git a/package/libglib2/0005-dbus-system-socket-path.patch b/package/libglib2/0005-dbus-system-socket-path.patch
new file mode 100644
index 0000000000..bb2ec33dc6
--- /dev/null
+++ b/package/libglib2/0005-dbus-system-socket-path.patch
@@ -0,0 +1,11 @@
+diff -Naur libglib2-2.66.8.orig/gio/gdbusaddress.c libglib2-2.66.8/gio/gdbusaddress.c
+--- libglib2-2.66.8.orig/gio/gdbusaddress.c     2021-03-18 14:47:48.256693000 +0100
++++ libglib2-2.66.8/gio/gdbusaddress.c  2021-04-15 16:14:28.519296584 +0200
+@@ -1331,7 +1331,7 @@
+
+       if (ret == NULL)
+         {
+-          ret = g_strdup ("unix:path=/var/run/dbus/system_bus_socket");
++          ret = g_strdup ("unix:path=/run/dbus/system_bus_socket");
+         }
+       break;
-- 
2.30.2
