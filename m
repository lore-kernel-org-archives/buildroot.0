From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 May 2014 06:36:44 -0300
Subject: [Buildroot] [PATCHv2] btrfs-progs: disable for avr32
Message-ID: <1399973804-11934-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Toolchain issues prevent it from being built, also there's no AVR32 with
proper storage ports for such a filesystem. Fixes:
http://autobuild.buildroot.net/results/06501fd32c30549810c12f0ad50f510c4b74ee63/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/btrfs-progs/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/btrfs-progs/Config.in b/package/btrfs-progs/Config.in
index dcd2ec5..b6f1116 100644
--- a/package/btrfs-progs/Config.in
+++ b/package/btrfs-progs/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_BTRFS_PROGS
 	depends on BR2_USE_WCHAR # util-linux
 	depends on BR2_USE_MMU # util-linux
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_avr32 # toolchain issues
 	select BR2_PACKAGE_ACL
 	select BR2_PACKAGE_ATTR
 	select BR2_PACKAGE_E2FSPROGS
@@ -19,5 +20,6 @@ config BR2_PACKAGE_BTRFS_PROGS
 
 comment "btrfs-progs needs a toolchain w/ largefile, wchar, threads"
 	depends on BR2_USE_MMU
+	depends on !BR2_avr32
 	depends on !BR2_LARGEFILE || !BR2_USE_WCHAR || \
 		!BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.5.5
