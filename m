From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 31 Mar 2016 07:23:40 +0300
Subject: [Buildroot] [PATCH] elf2flt: enable for xtensa
Message-ID: <1459398220-19244-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
This patch depends on https://patchwork.ozlabs.org/patch/599708/ or
equivalent update of the elf2flt upstream and can be folded into such
patch.

 package/elf2flt/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index eb86b11..b93795b 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_sh || BR2_sparc || BR2_xtensa
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-- 
2.1.4
