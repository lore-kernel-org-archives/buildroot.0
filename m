From: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
Date: Tue, 16 Feb 2016 11:48:16 +0530
Subject: [Buildroot] [Buildroot PATCH Selinux v10 01/11] dbus: selinux file
	context support
Message-ID: <1455603506-26138-1-git-send-email-niranjan.reddy@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Matt Weber <matthew.weber@rockwellcollins.com>

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v8 -> v9:
  - No changes

Changes v7 -> v8:
  - No changes

Changes v6 -> v7:
  - No changes

Changes v5 -> v6:
  - No changes

Changes v4 -> v5
  - No changes

Changes v1 -> v4:
  - Did not exist
---
 package/dbus/S30dbus | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
index 4427b5c..6fbf915 100644
--- a/package/dbus/S30dbus
+++ b/package/dbus/S30dbus
@@ -17,6 +17,10 @@
 [ -d /var/run/dbus ] || mkdir -p /var/run/dbus
 [ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys
 [ -d /tmp/dbus ] || mkdir -p /tmp/dbus
+[ -d /var/lib/dbus ] || mkdir -p /var/lib/dbus
+if [ -e /sbin/restorecon ]; then
+   restorecon -R /var/run/dbus /var/lock/subsys /tmp/dbus /var/lib/dbus
+fi
 
 RETVAL=0
 
-- 
2.5.0
