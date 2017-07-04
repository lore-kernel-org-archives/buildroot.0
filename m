From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  4 Jul 2017 13:21:20 +0200
Subject: [Buildroot] [PATCH] package/systemd: needs timezone info
Message-ID: <20170704112120.26559-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd does not like being booted without any timezone info (especially
on a R/O filesystem), so we forcibly enable that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

---
Changes v2 -> v3:
  - fix typo in variable name  (Romain)
---
 package/systemd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 478cc104a9..a1b68b2809 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -13,6 +13,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on !BR2_STATIC_LIBS # kmod
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_USE_MMU # dbus
+	select BR2_TARGET_TZ_INFO
 	select BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_DBUS # runtime dependency only
 	select BR2_PACKAGE_LIBCAP
-- 
2.11.0
