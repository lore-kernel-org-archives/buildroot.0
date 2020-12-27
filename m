From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:10:28 +0100
Subject: [Buildroot] [git commit branch/2020.08.x] package/dhcpcd: add udev
 optional dependency
Message-ID: <20201227082413.77BDA815BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6d02ca15508afe0f2ec749049a851727ed5c8328
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

udev is an optional dependency (enabled by default) since version 6.1.0:
https://github.com/rsmarples/dhcpcd/commit/12bbc8cb5c7507be15a7e0af4140c3d81125c46c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 580eac946886d04afa0d14e8cc90bd24bb10e191)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcpcd/dhcpcd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/dhcpcd/dhcpcd.mk b/package/dhcpcd/dhcpcd.mk
index 7b69602605..4900e0581f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -16,6 +16,13 @@ DHCPCD_CONFIG_OPTS = \
 	--os=linux \
 	--privsepuser=dhcpcd
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+DHCPCD_CONFIG_OPTS += --with-udev
+DHCPCD_DEPENDENCIES += udev
+else
+DHCPCD_CONFIG_OPTS += --without-udev
+endif
+
 ifeq ($(BR2_STATIC_LIBS),y)
 DHCPCD_CONFIG_OPTS += --enable-static
 endif
