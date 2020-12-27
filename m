From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 27 Dec 2020 09:10:57 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/dhcpcd: add udev
 optional dependency
Message-ID: <20201227082347.F0E4780DB6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c91c3b9b96635ec11ff0bd750a26ed721dfaebf0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

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
index 3abd4cec68..8c0069775f 100644
--- a/package/dhcpcd/dhcpcd.mk
+++ b/package/dhcpcd/dhcpcd.mk
@@ -15,6 +15,13 @@ DHCPCD_CONFIG_OPTS = \
 	--libexecdir=/lib/dhcpcd \
 	--os=linux
 
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
