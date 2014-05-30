From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 May 2014 22:52:42 +0200
Subject: [Buildroot] [PATCH] package/elf2flt: hide when an MMU is used
Message-ID: <1401483162-17124-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

elf2flt is specifically for cases where an MMU is not available.
There is no point in building elf2flt when using an MMU.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/elf2flt/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/elf2flt/Config.in.host b/package/elf2flt/Config.in.host
index dad48d8..605ce20 100644
--- a/package/elf2flt/Config.in.host
+++ b/package/elf2flt/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_ELF2FLT
 	bool "Enable elf2flt support?"
 	depends on BR2_arm || BR2_bfin || BR2_sh || BR2_sparc
+	depends on !BR2_USE_MMU
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
 	  is a relatively simple and lightweight executable format
-- 
1.8.3.2
