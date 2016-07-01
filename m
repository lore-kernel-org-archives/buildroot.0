From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Fri,  1 Jul 2016 23:51:16 +0200
Subject: [Buildroot] [PATCH 16/31] package/systemd: use 'menuconfig'
In-Reply-To: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467409891-9458-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467409891-9458-16-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gabe Evans <gabe@hashrabbit.co>

systemd has a bunch of options now, so use 'menuconfig' to the group the
options in a submenu.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 3fcb74d..c6e0dcc 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_SYSTEMD_ARCH_SUPPORTS
 		BR2_sh4a || BR2_sh4aeb || BR2_sparc || BR2_x86_64 || \
 		BR2_aarch64 || BR2_m68k
 
-config BR2_PACKAGE_SYSTEMD
+menuconfig BR2_PACKAGE_SYSTEMD
 	bool "systemd"
 	depends on BR2_INIT_SYSTEMD
 	depends on BR2_USE_WCHAR # util-linux
-- 
2.8.1
