From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 03 Oct 2013 10:13:32 +0800
Subject: [Buildroot] [PATCH] nano: needs mmu
Message-ID: <1380766412.29754.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix below build error if !BR2_USE_MMU:

text.o: In function `execute_command':
text.c:(.text+0x7f8): undefined reference to `fork'
text.o: In function `do_int_speller':
text.c:(.text+0x3480): undefined reference to `fork'
text.c:(.text+0x34f4): undefined reference to `fork'
text.c:(.text+0x3568): undefined reference to `fork'
text.o: In function `do_alt_speller':
text.c:(.text+0x3914): undefined reference to `fork'
collect2: ld returned 1 exit status
make[3]: *** [nano] Error 1

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/nano/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nano/Config.in b/package/nano/Config.in
index ef7f69d..036313f 100644
--- a/package/nano/Config.in
+++ b/package/nano/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NANO
 	bool "nano"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NCURSES
 	help
 	  A nice ncurses-based editor. Started out as a clone of pico.
-- 
1.8.1.2
