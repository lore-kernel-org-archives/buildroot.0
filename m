From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:16 +0200
Subject: [Buildroot] [PATCH 09/20 v3] package/systemd: is a provider for
	libudev
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <1a1e9bc123772ea3d3ceee575e0a2e3dc2316624.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 7ff36cc..97de4dc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,6 +26,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on !BR2_PREFER_STATIC_LIB # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
@@ -39,6 +40,9 @@ if BR2_PACKAGE_SYSTEMD
 
 menu "systemd"
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index e781b30..9d4c3de 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -17,7 +17,7 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	host-gperf
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
-- 
1.9.1
