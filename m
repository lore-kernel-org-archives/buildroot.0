From: Erico Nunes <erico.nunes@datacom.ind.br>
Date: Mon, 13 Apr 2015 18:49:03 -0300
Subject: [Buildroot] [PATCH 1/1] linux: Add uImage support for powerpc64
Message-ID: <1428961743-11610-1-git-send-email-erico.nunes@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linux has uImage generation support for powerpc64 as well as powerpc,
since 2.6.15.

Signed-off-by: Erico Nunes <erico.nunes@datacom.ind.br>
---
 linux/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 817139b..4bcfd19 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -177,8 +177,9 @@ choice
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
 	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
-		   BR2_powerpc || BR2_sh || BR2_sh64 || \
-		   BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+		   BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
+		   BR2_sh || BR2_sh64 || BR2_mips || BR2_mipsel || \
+		   BR2_mips64 || BR2_mips64el
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
-- 
1.9.1
