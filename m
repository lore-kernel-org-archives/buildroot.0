Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC6DC83F03
	for <buildroot@archiver.kernel.org>; Sun,  6 Jul 2025 15:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373A660DC7;
	Sun,  6 Jul 2025 15:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9qEjCuy2eKI; Sun,  6 Jul 2025 15:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54DE660DD2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54DE660DD2;
	Sun,  6 Jul 2025 15:30:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 020D215F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F373E400E0
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PBA4wzb-1zQi for <buildroot@buildroot.org>;
 Sun,  6 Jul 2025 15:30:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A134005F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16A134005F
 for <buildroot@buildroot.org>; Sun,  6 Jul 2025 15:30:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E438386015; Sun,  6 Jul 2025 15:30:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Jul 2025 17:25:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c41f953ab9ba262324484a2efe1151d8f543eebd
X-Git-Newrev: 669f28ac0b4520d088f69f365b0e5bffa5bf7c02
X-Patchwork-Hint: ignore
Message-Id: <20250706153024.E438386015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pocketpy: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=669f28ac0b4520d088f69f365b0e5bffa5bf7c02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is a portable Python 3.x interpreter, written in C11. It has no
dependencies other than the C standard library, which can be easily
integrated into your C/C++ project

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 DEVELOPERS                          |  1 +
 package/Config.in                   |  1 +
 package/pocketpy/0001-fix-371.patch | 73 +++++++++++++++++++++++++++++++++++++
 package/pocketpy/Config.in          |  9 +++++
 package/pocketpy/pocketpy.hash      |  3 ++
 package/pocketpy/pocketpy.mk        | 25 +++++++++++++
 6 files changed, 112 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 99c403686a..899a3003ca 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -810,6 +810,7 @@ F:	package/armadillo/
 F:	package/babeld/
 F:	package/iana-assignments/
 F:	package/inih/
+F:	package/pocketpy/
 F:	package/sscep/
 F:	package/tinyinit/
 F:	package/ufs-utils/
diff --git a/package/Config.in b/package/Config.in
index 39d9d6cf3d..9a841082c6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -969,6 +969,7 @@ if BR2_STATIC_LIBS
 comment "External PHP extensions need a toolchain w/ dynamic library"
 endif
 endif
+	source "package/pocketpy/Config.in"
 	source "package/python3/Config.in"
 if BR2_PACKAGE_PYTHON3
 menu "External python modules"
diff --git a/package/pocketpy/0001-fix-371.patch b/package/pocketpy/0001-fix-371.patch
new file mode 100644
index 0000000000..6d9e324ba7
--- /dev/null
+++ b/package/pocketpy/0001-fix-371.patch
@@ -0,0 +1,73 @@
+From e2e3bdca6e79ce7be5607397c5f0152c28c7500b Mon Sep 17 00:00:00 2001
+From: blueloveTH <blueloveth@foxmail.com>
+Date: Sat, 7 Jun 2025 02:19:55 +0800
+Subject: [PATCH] fix #371
+
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: backport from https://github.com/pocketpy/pocketpy/commit/70e824a6b695e963621664589d1d00aeb182c018
+---
+ include/pocketpy/pocketpy.h | 2 +-
+ src/interpreter/vm.c        | 6 ++++--
+ src/public/modules.c        | 2 +-
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/include/pocketpy/pocketpy.h b/include/pocketpy/pocketpy.h
+index a44faa41a922..a6cb4f658f73 100644
+--- a/include/pocketpy/pocketpy.h
++++ b/include/pocketpy/pocketpy.h
+@@ -69,7 +69,7 @@ typedef struct py_Callbacks {
+     /// Used by `print` to output a string.
+     void (*print)(const char*);
+     /// Used by `input` to get a character.
+-    int (*getchar)();
++    int (*getchr)();
+ } py_Callbacks;
+ 
+ /// Native function signature.
+diff --git a/src/interpreter/vm.c b/src/interpreter/vm.c
+index 2bae82740ac7..2da28fa80730 100644
+--- a/src/interpreter/vm.c
++++ b/src/interpreter/vm.c
+@@ -29,6 +29,8 @@ static char* pk_default_importfile(const char* path) {
+ 
+ static void pk_default_print(const char* data) { printf("%s", data); }
+ 
++static int pk_default_getchr() { return getchar(); }
++
+ static void py_TypeInfo__ctor(py_TypeInfo* self,
+                               py_Name name,
+                               py_Type index,
+@@ -67,7 +69,7 @@ void VM__ctor(VM* self) {
+ 
+     self->callbacks.importfile = pk_default_importfile;
+     self->callbacks.print = pk_default_print;
+-    self->callbacks.getchar = getchar;
++    self->callbacks.getchr = pk_default_getchr;
+ 
+     self->last_retval = *py_NIL();
+     self->curr_exception = *py_NIL();
+@@ -810,7 +812,7 @@ int py_replinput(char* buf, int max_size) {
+     printf(">>> ");
+ 
+     while(true) {
+-        int c = pk_current_vm->callbacks.getchar();
++        int c = pk_current_vm->callbacks.getchr();
+         if(c == EOF) return -1;
+ 
+         if(c == '\n') {
+diff --git a/src/public/modules.c b/src/public/modules.c
+index 3efb362701e2..cdfd5549461a 100644
+--- a/src/public/modules.c
++++ b/src/public/modules.c
+@@ -205,7 +205,7 @@ static bool builtins_input(int argc, py_Ref argv) {
+     c11_sbuf buf;
+     c11_sbuf__ctor(&buf);
+     while(true) {
+-        int c = pk_current_vm->callbacks.getchar();
++        int c = pk_current_vm->callbacks.getchr();
+         if(c == '\n' || c == '\r') break;
+         if(c == EOF) break;
+         c11_sbuf__write_char(&buf, c);
+-- 
+2.43.0
+
diff --git a/package/pocketpy/Config.in b/package/pocketpy/Config.in
new file mode 100644
index 0000000000..b0bd0cafe0
--- /dev/null
+++ b/package/pocketpy/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_POCKETPY
+	bool "pocketpy"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_STATIC_LIBS # dlfcn.h
+	help
+	  pocketpy is a portable Python 3.x interpreter,
+	  written in C11.
+
+	  https://github.com/pocketpy/pocketpy
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
new file mode 100644
index 0000000000..aabd5f077a
--- /dev/null
+++ b/package/pocketpy/pocketpy.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
+sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
new file mode 100644
index 0000000000..20a8e9ad1e
--- /dev/null
+++ b/package/pocketpy/pocketpy.mk
@@ -0,0 +1,25 @@
+################################################################################
+#
+# pocketpy
+#
+################################################################################
+
+POCKETPY_VERSION = 2.0.8
+POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
+POCKETPY_LICENSE = MIT
+POCKETPY_LICENSE_FILES = LICENSE
+POCKETPY_INSTALL_STAGING = YES
+
+POCKETPY_CONF_OPTS = -DPK_BUILD_SHARED_LIB=ON
+
+define POCKETPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(TARGET_DIR)/usr/lib
+endef
+
+define POCKETPY_INSTALL_STAGING_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/libpocketpy.so* $(STAGING_DIR)/usr/lib
+	$(INSTALL) -m 755 -d $(STAGING_DIR)/usr/include/pocketpy
+	cp -r $(@D)/include/* $(STAGING_DIR)/usr/include/pocketpy
+endef
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
