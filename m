From: Rahul Bedarkar <rahulbedarkar89@gmail.com>
Date: Thu, 30 Mar 2017 19:13:45 +0530
Subject: [Buildroot] [PATCH 16/21] package: use SPDX short identifier for
	AFLv2.1
In-Reply-To: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
References: <1490881430-10434-1-git-send-email-rahulbedarkar89@gmail.com>
Message-ID: <1490881430-10434-17-git-send-email-rahulbedarkar89@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We want to use SPDX identifier for license string as much as possible.
SPDX short identifier for AFLv2.1 is AFL-2.1.

This change is done using following command.
find . -name "*.mk" | xargs sed -ri '/LICENSE( )?[\+:]?=/s/AFLv2.1(\+)?/AFL-2.1\1/g'

Signed-off-by: Rahul Bedarkar <rahulbedarkar89@gmail.com>
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
 
-- 
2.6.2
