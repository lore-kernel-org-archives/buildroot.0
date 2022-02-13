Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31149C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 13:03:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8ED9A40119;
	Sun, 13 Feb 2022 13:03:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GNF-foo68V0k; Sun, 13 Feb 2022 13:03:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 351A0401F8;
	Sun, 13 Feb 2022 13:03:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A271D1BF398
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D751401F8
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 13:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id af_KU5b2qrIj for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 13:03:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0B9C40119
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:03:14 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout11.t-online.de (Postfix) with SMTP id 369E4E08E;
 Sun, 13 Feb 2022 14:03:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.189.21]) by fwd78.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nJEWx-1s5O6L0; Sun, 13 Feb 2022 14:03:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:37682)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nJEWw-0006gU-Gt;
 Sun, 13 Feb 2022 14:03:06 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 14:03:06 +0100
Message-Id: <20220213130306.3002130-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1644757387-0000AD4E-DBB8D035/0/0 CLEAN NORMAL
X-TOI-MSGID: b9968295-0102-49ed-8efe-a0f450710ea7
Subject: [Buildroot] [PATCH 1/1] package/e3: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
Build was successful:

[...]
                    bootlin-x86-64-glibc [24/45]: OK
                     bootlin-x86-64-musl [25/45]: OK
                   bootlin-x86-64-uclibc [26/45]: OK
[...]
                   br-i386-pentium4-full [31/45]: OK
                br-i386-pentium-mmx-musl [32/45]: OK
[...]

45 builds, 40 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/e3/0001-makefile.patch                | 42 +++++++++++++++
 .../e3/0002-Align-header-to-avoid-crash.patch | 26 +++++++++
 package/e3/0003-format-1.0.patch              | 54 +++++++++++++++++++
 package/e3/0004-e3-gnu-stack.patch            | 50 +++++++++++++++++
 package/e3/Config.in                          |  9 ++++
 package/e3/e3.hash                            |  3 ++
 package/e3/e3.mk                              | 24 +++++++++
 9 files changed, 210 insertions(+)
 create mode 100644 package/e3/0001-makefile.patch
 create mode 100644 package/e3/0002-Align-header-to-avoid-crash.patch
 create mode 100644 package/e3/0003-format-1.0.patch
 create mode 100644 package/e3/0004-e3-gnu-stack.patch
 create mode 100644 package/e3/Config.in
 create mode 100644 package/e3/e3.hash
 create mode 100644 package/e3/e3.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b5f4d992c..f8aab505ed 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -326,6 +326,7 @@ F:	package/dht/
 F:	package/dovecot/
 F:	package/dovecot-pigeonhole/
 F:	package/dtv-scan-tables/
+F:	package/e3/
 F:	package/eudev/
 F:	package/exim/
 F:	package/fetchmail/
diff --git a/package/Config.in b/package/Config.in
index c004228759..f47f003a00 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2612,6 +2612,7 @@ endmenu
 
 menu "Text editors and viewers"
 	source "package/bat/Config.in"
+	source "package/e3/Config.in"
 	source "package/ed/Config.in"
 	source "package/joe/Config.in"
 	source "package/less/Config.in"
diff --git a/package/e3/0001-makefile.patch b/package/e3/0001-makefile.patch
new file mode 100644
index 0000000000..62b2b3a94b
--- /dev/null
+++ b/package/e3/0001-makefile.patch
@@ -0,0 +1,42 @@
+Add build fixes from Gentoo
+
+Downloaded from
+https://gitweb.gentoo.org/repo/gentoo.git/tree/app-editors/e3/files/e3-2.8.2-makefile.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+--- e3-2.82-orig/Makefile
++++ e3-2.82/Makefile
+@@ -17,6 +17,8 @@
+ NASM_OR_YASM=nasm
+ #NASM_OR_YASM=yasm
+ 
++LD=ld
++
+ EXMODE=SED
+ 
+ #----------------------do not edit below line-------------------------------
+@@ -41,12 +43,12 @@
+ 
+ 32:	$(ASOURCES) Makefile
+ ifeq	($(OS),LINUX)
+-	nasm -O2 -f bin -l e3.lst -o e3 e3.asm -DCRIPLED_ELF=1 -D$(OS) -D$(EXMODE) 
++	nasm -O2 -f bin -l e3.lst -o e3 e3.asm -DCRIPLED_ELF=1 -D$(OS)
+ 	chmod +x e3
+ else
+ 	echo $(ASVER)
+-	nasm -O2 $(AFLAGS) -o e3.o e3.asm -l e3.lst -D$(OS) -D$(EXMODE)
+-	ld -s -o e3 e3.o
++	nasm -O2 $(AFLAGS) -o e3.o e3.asm -l e3.lst -D$(OS)
++	$(LD) -s -o e3 e3.o
+ 	strip --remove-section .comment e3
+ endif
+ 	ln -sf e3 e3ws
+@@ -60,7 +62,7 @@
+ 64:	$(ASOURCES) Makefile
+ 	cat e3.asm | sed -f e3_32to64.sed  >e3.tmp
+ 	$(ASSEMBLER64)
+-	ld -b elf64-x86-64 --oformat elf64-x86-64 -o e3 e3.o
++	$(LD) -o e3 e3.o
+ ifneq	($(DEBUG),true)
+ 	strip e3
+ endif
diff --git a/package/e3/0002-Align-header-to-avoid-crash.patch b/package/e3/0002-Align-header-to-avoid-crash.patch
new file mode 100644
index 0000000000..f24f180b0c
--- /dev/null
+++ b/package/e3/0002-Align-header-to-avoid-crash.patch
@@ -0,0 +1,26 @@
+From: =?utf-8?q?Bernhard_=C3=9Cbelacker?= <bernhardu@mailbox.org>
+Date: Tue, 6 Nov 2018 18:52:41 +0100
+Subject: [PATCH] Align header to avoid crash.
+
+https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=913014
+
+Downloaded from
+https://sources.debian.org/src/e3/1%3A2.82%2Bdfsg-2/debian/patches/0001-Align-header-to-avoid-crash.patch/
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ e3.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/e3.h b/e3.h
+index 96f8dc7..6508e9b 100644
+--- a/e3.h
++++ b/e3.h
+@@ -861,6 +861,7 @@ phdr2:					;another Elf32_Phdr starts here
+ %else
+ 	org 0x8048000
+ 	ELFheader
++	times 0xBF2 db 0
+ %endif
+ %else
+ 	;nothing
diff --git a/package/e3/0003-format-1.0.patch b/package/e3/0003-format-1.0.patch
new file mode 100644
index 0000000000..c7ace235c4
--- /dev/null
+++ b/package/e3/0003-format-1.0.patch
@@ -0,0 +1,54 @@
+From: Debian QA Group <packages@qa.debian.org>
+Date: Sun, 12 May 2019 04:36:49 +0000
+Subject: format-1.0
+
+Downloaded from
+https://sources.debian.org/src/e3/1%3A2.82%2Bdfsg-2/debian/patches/format-1.0.patch/
+
+and removed Makefile patch.
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+ e3.asm   | 26 ++++++++++++++++++++++++++
+ 2 files changed, 40 insertions(+), 12 deletions(-)
+---
+ e3.asm   | 26 ++++++++++++++++++++++++++
+ 2 files changed, 33 insertions(+), 11 deletions(-)
+
+diff --git a/e3.asm b/e3.asm
+index b0a17ca..7d99f17 100644
+--- a/e3.asm
++++ b/e3.asm
+@@ -3653,6 +3653,32 @@ NoPi:	cmp ecx,'e3vi'
+ 	mov byte [eax],VI
+ 	ret
+ NoVi:	cmp ecx,'e3ws'
++	jnz NoWs
++	mov byte [eax],WS
++	ret
++NoWs:	cmp ecx,'edit'
++	jnz NoNe2
++	mov byte [eax],NE
++	ret
++NoNe2:	cmp ecx,'macs'
++	jnz NoEm2
++	mov byte [eax],EM
++	ret
++NoEm2:	cmp ecx,'pico'
++	jnz NoPi2
++	mov byte [eax],PI
++	ret
++NoPi2:  push cx
++	mov cx,'__'
++	cmp ecx,'__vi'
++	pop cx
++	jnz NoVi2
++	mov byte [eax],VI
++	ret
++NoVi2:	push cx
++	mov cx,'__'
++	cmp ecx,'__ws'
++	pop cx
+ 	jnz modeOK
+ 	mov byte [eax],WS
+ modeOK:	ret
diff --git a/package/e3/0004-e3-gnu-stack.patch b/package/e3/0004-e3-gnu-stack.patch
new file mode 100644
index 0000000000..81eb6b14bb
--- /dev/null
+++ b/package/e3/0004-e3-gnu-stack.patch
@@ -0,0 +1,50 @@
+Fix GNU stack
+
+Quoted from https://src.fedoraproject.org/rpms/e3/blob/f30/f/e3.spec
+
+# mark the stack as non-executable and disable tiny/crippled elf on 32
+# bit linux so that stack can be marked as non-executable on it too
+
+Downloaded from
+https://src.fedoraproject.org/rpms/e3/blob/f30/f/e3-gnu-stack.patch
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+
+Common subdirectories: e3-2.8.orig/bin and e3-2.8/bin
+diff -u e3-2.8.orig/e3.asm e3-2.8/e3.asm
+--- e3-2.8.orig/e3.asm	2010-05-09 12:16:47.000000000 -0400
++++ e3-2.8/e3.asm	2013-02-22 14:24:46.884384131 -0500
+@@ -6553,3 +6553,13 @@
+ %ifdef CRIPLED_ELF
+  bsssize equ $-bssstart
+ %endif
++
++%ifidn __OUTPUT_FORMAT__,elf
++section .note.GNU-stack noalloc noexec nowrite progbits
++%endif
++%ifidn __OUTPUT_FORMAT__,elf32
++section .note.GNU-stack noalloc noexec nowrite progbits
++%endif
++%ifidn __OUTPUT_FORMAT__,elf64
++section .note.GNU-stack noalloc noexec nowrite progbits
++%endif
+Only in e3-2.8: e3.asm~
+diff -u e3-2.8.orig/Makefile e3-2.8/Makefile
+--- e3-2.8.orig/Makefile	2010-05-27 14:58:59.000000000 -0400
++++ e3-2.8/Makefile	2013-02-22 15:38:57.729605772 -0500
+@@ -42,15 +42,10 @@
+ #---------------- 32 bit LINUX (and perhaps BSD) --
+ 
+ 32:	$(ASOURCES) Makefile
+-ifeq	($(OS),LINUX)
+-	nasm -O2 -f bin -l e3.lst -o e3 e3.asm -DCRIPLED_ELF=1 -D$(OS)
+-	chmod +x e3
+-else
+ 	echo $(ASVER)
+ 	nasm -O2 $(AFLAGS) -o e3.o e3.asm -l e3.lst -D$(OS)
+ 	$(LD) -s -o e3 e3.o
+ 	strip --remove-section .comment e3
+-endif
+ 	ln -sf e3 e3ws
+ 	ln -sf e3 e3em
+ 	ln -sf e3 e3pi
diff --git a/package/e3/Config.in b/package/e3/Config.in
new file mode 100644
index 0000000000..2854ea8ed7
--- /dev/null
+++ b/package/e3/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_E3
+	bool "e3"
+	depends on BR2_i386 || BR2_x86_64
+	help
+	  e3 is a full-screen, user-friendly text editor with an
+	  interface similar to that of either WordStar, Emacs, Pico,
+	  Nedit, or vi written in NASM assembler.
+
+	  https://sites.google.com/site/e3editor
diff --git a/package/e3/e3.hash b/package/e3/e3.hash
new file mode 100644
index 0000000000..5fc794f206
--- /dev/null
+++ b/package/e3/e3.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  53c51d656801fd3ae0179a5b27f028e07eaba328e80c8c55050268359b9a2924  e3-2.82.tgz
+sha256  cc2a6651c315b233ebc110b49ea3c6452eff9a28f8bc051ffd2bb92a8dcfa3d2  COPYING.GPL
diff --git a/package/e3/e3.mk b/package/e3/e3.mk
new file mode 100644
index 0000000000..63c97078ff
--- /dev/null
+++ b/package/e3/e3.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# e3
+#
+################################################################################
+
+E3_VERSION = 2.82
+E3_SITE = https://gentoo.osuosl.org/distfiles
+E3_SOURCE = e3-$(E3_VERSION).tgz
+E3_LICENSE = GPL-2.0+
+E3_LICENSE_FILES = COPYING.GPL
+E3_DEPENDENCIES = host-nasm
+
+define E3_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		$(if $(BR2_ARCH_IS_64),64,32)
+endef
+
+define E3_INSTALL_TARGET_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		PREFIX="$(TARGET_DIR)/usr" install
+endef
+
+$(eval $(generic-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
