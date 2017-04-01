From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Apr 2017 15:34:43 +0200
Subject: [Buildroot] [git commit] package: use SPDX short identifier for
	AFLv2.1
Message-ID: <20170401134426.4717B82621@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=faa386bda169b3d08a7afbaa9ca7eb2892f2172a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for AFLv2.1 is AFL-2.1.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/AFLv2.1(\+)?/AFL-2.1\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dbus-glib/dbus-glib.mk | 2 +-
 package/dbus/dbus.mk           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index e14a095..22dcdb1 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -7,7 +7,7 @@
 DBUS_GLIB_VERSION = 0.108
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
-DBUS_GLIB_LICENSE = AFLv2.1 or GPL-2.0+
+DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
 DBUS_GLIB_LICENSE_FILES = COPYING
 
 DBUS_GLIB_CONF_ENV = \
diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
index ee8ffe1..52c1912 100644
--- a/package/dbus/dbus.mk
+++ b/package/dbus/dbus.mk
@@ -6,7 +6,7 @@
 
 DBUS_VERSION = 1.10.16
 DBUS_SITE = http://dbus.freedesktop.org/releases/dbus
-DBUS_LICENSE = AFLv2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
+DBUS_LICENSE = AFL-2.1 or GPL-2.0+ (library, tools), GPL-2.0+ (tools)
 DBUS_LICENSE_FILES = COPYING
 DBUS_INSTALL_STAGING = YES
 
