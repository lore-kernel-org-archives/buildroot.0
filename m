From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  7 Feb 2015 14:53:20 +0100
Subject: [Buildroot] [PATCH 04/11 v7] package/systemd: is a provider for
	libudev
In-Reply-To: <cover.1423317174.git.yann.morin.1998@free.fr>
References: <cover.1423317174.git.yann.morin.1998@free.fr>
Message-ID: <77be53be44bce32faa7024183b8bd3b905bc07e8.1423317174.git.yann.morin.1998@free.fr>
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
index ed59c8d..fd5d41b 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
@@ -61,6 +62,9 @@ config BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 92f99c2..ca68f2c 100644
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
