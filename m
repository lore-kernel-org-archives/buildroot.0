From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jun 2021 21:36:24 +0200
Subject: [Buildroot] [git commit] package/weston: enable libseat launcher if
 seatd is enabled
Message-ID: <20210616190531.69C90811B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=54d0a7cc1828c05719e14170e88811b21cffd82e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable building Weston's libseat launcher, now that the seatd package
is available.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/weston/weston.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 6dd5439291..69ee11d23c 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -26,6 +26,13 @@ else
 WESTON_CONF_OPTS += -Dsimple-clients=
 endif
 
+ifeq ($(BR2_PACKAGE_SEATD),y)
+WESTON_CONF_OPTS += -Dlauncher-libseat=true
+WESTON_DEPENDENCIES += seatd
+else
+WESTON_CONF_OPTS += -Dlauncher-libseat=false
+endif
+
 ifeq ($(BR2_PACKAGE_DBUS)$(BR2_PACKAGE_SYSTEMD),yy)
 WESTON_CONF_OPTS += -Dlauncher-logind=true
 WESTON_DEPENDENCIES += dbus systemd
