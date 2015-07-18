From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jul 2015 15:54:10 +0200
Subject: [Buildroot] [git commit] dbus: selinux file context support
Message-ID: <20150718135945.5E26081D26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=53bf4f72ebab7df29f53d8fd684ff3b61a6c93f4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: remove S30dbus changes.]

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus/dbus.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/dbus/S30dbus b/package/dbus/S30dbus
old mode 100755
new mode 100644
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index 7deae11..e9c9aaf 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -44,6 +44,20 @@ ifeq ($(BR2_microblaze),y)
 DBUS_CONF_OPTS += --disable-inotify
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
+DBUS_CONF_OPTS += --enable-selinux
+DBUS_DEPENDENCIES += libselinux
+else
+DBUS_CONF_OPTS += --disable-selinux
+endif
+
+ifeq ($(BR2_PACKAGE_AUDIT),y)
+DBUS_CONF_OPTS += --enable-libaudit
+DBUS_DEPENDENCIES += audit libcap-ng
+else
+DBUS_CONF_OPTS += --disable-libaudit
+endif
+
 ifeq ($(BR2_PACKAGE_XLIB_LIBX11),y)
 DBUS_CONF_OPTS += --with-x
 DBUS_DEPENDENCIES += xlib_libX11
