From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 15:18:54 -0300
Subject: [Buildroot] [PATCH 1/8] dbus: drop user/group from skeleton
Message-ID: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It belongs to the package.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dbus/dbus.mk       | 4 ++++
 system/skeleton/etc/group  | 1 -
 system/skeleton/etc/passwd | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 28d3dd8..0fa1a0f 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -14,6 +14,10 @@ define DBUS_PERMISSIONS
 /usr/libexec/dbus-daemon-launch-helper f 4755 0 0 - - - - -
 endef
 
+define DBUS_USERS
+dbus -1 dbus -1 * - - - D-Bus
+endef
+
 DBUS_DEPENDENCIES = host-pkgconf expat
 
 DBUS_CONF_ENV = ac_cv_have_abstract_sockets=yes
diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
index 98f712b..fa74ae2 100644
--- a/system/skeleton/etc/group
+++ b/system/skeleton/etc/group
@@ -20,7 +20,6 @@ utmp:x:43:
 plugdev:x:46:
 staff:x:50:
 lock:x:54:
-dbus:x:81:
 netdev:x:82:
 ftp:x:83
 nogroup:x:99:
diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index d2e426b..761d92e 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -8,7 +8,6 @@ proxy:x:13:13:proxy:/bin:/bin/sh
 www-data:x:33:33:www-data:/var/www:/bin/sh
 backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
-dbus:x:81:81:dbus:/var/run/dbus:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
 sshd:x:103:99:Operator:/var:/bin/sh
-- 
2.0.4
