From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 19 Jan 2020 11:19:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/thermald: fix build with NLS
Message-ID: <20200119101931.2008921-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/609e304d2874f39cbb6258ee185610332a1031f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/thermald/thermald.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/thermald/thermald.mk b/package/thermald/thermald.mk
index ace4eed8e3..98e9c361e5 100644
--- a/package/thermald/thermald.mk
+++ b/package/thermald/thermald.mk
@@ -8,10 +8,11 @@ THERMALD_VERSION = 1.9.1
 THERMALD_SITE = $(call github,intel,thermal_daemon,v$(THERMALD_VERSION))
 # fetched from Github, with no configure script
 THERMALD_AUTORECONF = YES
-THERMALD_DEPENDENCIES = dbus dbus-glib libxml2
+THERMALD_DEPENDENCIES = dbus dbus-glib libxml2 $(TARGET_NLS_DEPENDENCIES)
 # tools are GPL-3.0+ but are not added to the target
 THERMALD_LICENSE = GPL-2.0+
 THERMALD_LICENSE_FILES = COPYING
+THERMALD_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 THERMALD_DEPENDENCIES += systemd
-- 
2.24.1
