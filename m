From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 27 Oct 2017 21:24:23 +0200
Subject: [Buildroot] [PATCH v1 1/2] libopenssl: do not leak the compiler
	path (reproducible builds)
Message-ID: <20171027192424.19760-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 ...roducible-build-do-not-leak-compiler-path.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch

diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
new file mode 100644
index 0000000000..eff72c548a
--- /dev/null
+++ b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
@@ -0,0 +1,26 @@
+From 875fcad2ad84877763cba86c1265b57679b878b0 Mon Sep 17 00:00:00 2001
+From: Peter Seiderer <ps.report@gmx.net>
+Date: Tue, 24 Oct 2017 16:58:32 +0200
+Subject: [PATCH] Reproducible build: do not leak compiler path
+
+Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+---
+ crypto/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/Makefile b/crypto/Makefile
+index 7869996..7e63291 100644
+--- a/crypto/Makefile
++++ b/crypto/Makefile
+@@ -55,7 +55,7 @@ top:
+ all: shared
+ 
+ buildinf.h: ../Makefile
+-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
++	$(PERL) $(TOP)/util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
+ 
+ x86cpuid.s:	x86cpuid.pl perlasm/x86asm.pl
+ 	$(PERL) x86cpuid.pl $(PERLASM_SCHEME) $(CFLAGS) $(PROCESSOR) > $@
+-- 
+2.11.0
+
-- 
2.14.2
