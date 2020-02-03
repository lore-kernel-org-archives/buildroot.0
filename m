From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Feb 2020 11:11:38 +0100
Subject: [Buildroot] [git commit] package/thermald: fix build with NLS
Message-ID: <20200203100056.55EE68867C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d25713f247eb746d4e7c7b1582a89f5e557b1c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/609e304d2874f39cbb6258ee185610332a1031f2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Tested-by: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
