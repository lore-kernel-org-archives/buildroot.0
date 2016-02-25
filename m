From: Gabe Evans <gabe@hashrabbit.co>
Date: Thu, 25 Feb 2016 21:55:39 +0000
Subject: [Buildroot] [PATCH 30/32] package/systemd: use 'menuconfig'
In-Reply-To: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
References: <1456437341-19025-1-git-send-email-gabe@hashrabbit.co>
Message-ID: <1456437341-19025-31-git-send-email-gabe@hashrabbit.co>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

systemd has a bunch of options now, so use 'menuconfig' to the group the
options in a submenu.

Signed-off-by: Gabe Evans <gabe@hashrabbit.co>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index 21ea032..e43b298 100644
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
1.9.1
