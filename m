From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:22:14 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 start-stop-daemon
Message-ID: <20180708110810.4A7E1863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e617aa1845c74fac79215cfb82a08f9ec92652f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk                     | 1 +
 package/start-stop-daemon/start-stop-daemon.mk | 3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index bbf3834e0d..00e17c4be6 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_START_STOP_DAEMON),start-stop-daemon) \
 	$(if $(BR2_PACKAGE_SYSKLOGD),sysklogd) \
 	$(if $(BR2_PACKAGE_SYSLOG_NG),syslog-ng) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd) \
diff --git a/package/start-stop-daemon/start-stop-daemon.mk b/package/start-stop-daemon/start-stop-daemon.mk
index 7071f5617e..01a6719762 100644
--- a/package/start-stop-daemon/start-stop-daemon.mk
+++ b/package/start-stop-daemon/start-stop-daemon.mk
@@ -19,8 +19,7 @@ START_STOP_DAEMON_CONF_ENV = \
 	dpkg_cv_va_copy=yes \
 	dpkg_cv_c99_snprintf=yes \
 	DPKG_DEVEL_MODE=1
-START_STOP_DAEMON_DEPENDENCIES = host-pkgconf \
-	$(if $(BR2_PACKAGE_BUSYBOX),busybox)
+START_STOP_DAEMON_DEPENDENCIES = host-pkgconf
 # Patching m4/dpkg-arch.m4
 START_STOP_DAEMON_AUTORECONF = YES
 START_STOP_DAEMON_LICENSE = GPL-2.0+
