From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 19:44:19 -0300
Subject: [Buildroot] [PATCH 4/4] elf2flt: disable for blackfin
In-Reply-To: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
References: <1426632259-1972-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1426632259-1972-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that we don't support the internal blackfin toolchain any more it
makes no sense to have this enabled.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/elf2flt/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index 605ce20..eb86b11 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
+	depends on BR2_arm || BR2_sh || BR2_sparc
 	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
-- 
2.0.5
