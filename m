From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jul 2016 00:16:32 +0200
Subject: [Buildroot] [PATCH 09/12 v8] package/systemd: provides libudev
In-Reply-To: <cover.1468274498.git.yann.morin.1998@free.fr>
References: <cover.1468274498.git.yann.morin.1998@free.fr>
Message-ID: <bee42855747d1ee54c5fb87a35b6dafcf10e6e41.1468274498.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/systemd/Config.in  | 4 ++++
 package/systemd/systemd.mk | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index ddaf3e2..ff685f8 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -14,6 +14,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_PACKAGE_HAS_LIBUDEV
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
@@ -66,6 +67,9 @@ menuconfig BR2_PACKAGE_SYSTEMD
 
 if BR2_PACKAGE_SYSTEMD
 
+config BR2_PACKAGE_PROVIDES_LIBUDEV
+	default "systemd"
+
 config BR2_PACKAGE_PROVIDES_UDEV
 	default "systemd"
 
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 689b40d..9073299 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -16,7 +16,7 @@ SYSTEMD_DEPENDENCIES = \
 	kmod \
 	host-gperf
 
-SYSTEMD_PROVIDES = udev
+SYSTEMD_PROVIDES = libudev udev
 SYSTEMD_AUTORECONF = YES
 
 # Make sure that systemd will always be built after busybox so that we have
-- 
2.7.4
