From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  8 Jul 2018 11:45:40 +0200
Subject: [Buildroot] [PATCH 15/50 v2] package/busybox: invert dependency
 with start-stop-daemon
In-Reply-To: <cover.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <4d1f777697d88cc2c5fbf176b8642d30f4f772c0.1531043163.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.14.1
