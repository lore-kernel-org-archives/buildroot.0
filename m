From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 May 2014 08:36:55 +0200
Subject: [Buildroot] [git commit] ARC: allow uImage creation for ARC
Message-ID: <20140512063725.98E4E9CBA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a9e06ab73348f5446d458f98203b76db0fe84cb2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Starting from U-Boot v2014.04 ARC architecture is supported,
so now it's possible to create uImage for ARC as well.

Signed-off-by: Mischa Jonker <mjonker@synopsys.com>

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 77c28f3..cc1127a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -167,7 +167,8 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	depends on BR2_arc || BR2_arm || BR2_armeb || BR2_bfin || \
+		   BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 	select BR2_LINUX_KERNEL_UBOOT_IMAGE
 
 config BR2_LINUX_KERNEL_APPENDED_UIMAGE
