Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1293BCA1012
	for <buildroot@archiver.kernel.org>; Wed,  3 Sep 2025 21:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17F81849F4;
	Wed,  3 Sep 2025 21:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9pZF0mgdyqp; Wed,  3 Sep 2025 21:53:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50F2D849F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50F2D849F1;
	Wed,  3 Sep 2025 21:53:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id EBCD4930
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA56D4171C
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xeX4JFg8mMEY for <buildroot@buildroot.org>;
 Wed,  3 Sep 2025 21:53:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0ADA74167B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0ADA74167B
 for <buildroot@buildroot.org>; Wed,  3 Sep 2025 21:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA40487ED9; Wed,  3 Sep 2025 21:53:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Sep 2025 23:51:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: ee10eff874a1ba2fb54ac9a9f40c59b34e81840e
X-Git-Newrev: 7489133fe11c986600760949e24b3b6824158ac4
X-Patchwork-Hint: ignore
Message-Id: <20250903215306.EA40487ED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/pocketpy: bump to
 version 2.1.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7489133fe11c986600760949e24b3b6824158ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The LICENSE sha256 changed because of a date update (2023 -> 2024),
not due to any substantive license modification.

Release notes:
https://github.com/pocketpy/pocketpy/releases/tag/v2.1.1

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pocketpy/0001-fix-371.patch | 73 -------------------------------------
 package/pocketpy/pocketpy.hash      |  4 +-
 package/pocketpy/pocketpy.mk        |  2 +-
 3 files changed, 3 insertions(+), 76 deletions(-)

diff --git a/package/pocketpy/0001-fix-371.patch b/package/pocketpy/0001-fix-371.patch
deleted file mode 100644
index 6d9e324ba7..0000000000
--- a/package/pocketpy/0001-fix-371.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From e2e3bdca6e79ce7be5607397c5f0152c28c7500b Mon Sep 17 00:00:00 2001
-From: blueloveTH <blueloveth@foxmail.com>
-Date: Sat, 7 Jun 2025 02:19:55 +0800
-Subject: [PATCH] fix #371
-
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-Upstream: backport from https://github.com/pocketpy/pocketpy/commit/70e824a6b695e963621664589d1d00aeb182c018
----
- include/pocketpy/pocketpy.h | 2 +-
- src/interpreter/vm.c        | 6 ++++--
- src/public/modules.c        | 2 +-
- 3 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/include/pocketpy/pocketpy.h b/include/pocketpy/pocketpy.h
-index a44faa41a922..a6cb4f658f73 100644
---- a/include/pocketpy/pocketpy.h
-+++ b/include/pocketpy/pocketpy.h
-@@ -69,7 +69,7 @@ typedef struct py_Callbacks {
-     /// Used by `print` to output a string.
-     void (*print)(const char*);
-     /// Used by `input` to get a character.
--    int (*getchar)();
-+    int (*getchr)();
- } py_Callbacks;
- 
- /// Native function signature.
-diff --git a/src/interpreter/vm.c b/src/interpreter/vm.c
-index 2bae82740ac7..2da28fa80730 100644
---- a/src/interpreter/vm.c
-+++ b/src/interpreter/vm.c
-@@ -29,6 +29,8 @@ static char* pk_default_importfile(const char* path) {
- 
- static void pk_default_print(const char* data) { printf("%s", data); }
- 
-+static int pk_default_getchr() { return getchar(); }
-+
- static void py_TypeInfo__ctor(py_TypeInfo* self,
-                               py_Name name,
-                               py_Type index,
-@@ -67,7 +69,7 @@ void VM__ctor(VM* self) {
- 
-     self->callbacks.importfile = pk_default_importfile;
-     self->callbacks.print = pk_default_print;
--    self->callbacks.getchar = getchar;
-+    self->callbacks.getchr = pk_default_getchr;
- 
-     self->last_retval = *py_NIL();
-     self->curr_exception = *py_NIL();
-@@ -810,7 +812,7 @@ int py_replinput(char* buf, int max_size) {
-     printf(">>> ");
- 
-     while(true) {
--        int c = pk_current_vm->callbacks.getchar();
-+        int c = pk_current_vm->callbacks.getchr();
-         if(c == EOF) return -1;
- 
-         if(c == '\n') {
-diff --git a/src/public/modules.c b/src/public/modules.c
-index 3efb362701e2..cdfd5549461a 100644
---- a/src/public/modules.c
-+++ b/src/public/modules.c
-@@ -205,7 +205,7 @@ static bool builtins_input(int argc, py_Ref argv) {
-     c11_sbuf buf;
-     c11_sbuf__ctor(&buf);
-     while(true) {
--        int c = pk_current_vm->callbacks.getchar();
-+        int c = pk_current_vm->callbacks.getchr();
-         if(c == '\n' || c == '\r') break;
-         if(c == EOF) break;
-         c11_sbuf__write_char(&buf, c);
--- 
-2.43.0
-
diff --git a/package/pocketpy/pocketpy.hash b/package/pocketpy/pocketpy.hash
index aabd5f077a..4032fda442 100644
--- a/package/pocketpy/pocketpy.hash
+++ b/package/pocketpy/pocketpy.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  5e07994d66311a6b5ac032cc5243aaabe3ab318946971e7fa1cd0614934efc81  pocketpy-2.0.8.tar.gz
-sha256  d3a2bf8ca609a75941e980e62c13cf5a21aeaa4a2502822934d282fe7de5d319  LICENSE
+sha256  34976a5eb099869b134d93bd4c801cb330bb17466f2b1f4543a5217034a867cd  pocketpy-2.1.1.tar.gz
+sha256  9dab6fe9086f93847540387be578edc94b6b280004db5ed7c850ccf8f086fd66  LICENSE
diff --git a/package/pocketpy/pocketpy.mk b/package/pocketpy/pocketpy.mk
index 20a8e9ad1e..74e6b4910d 100644
--- a/package/pocketpy/pocketpy.mk
+++ b/package/pocketpy/pocketpy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCKETPY_VERSION = 2.0.8
+POCKETPY_VERSION = 2.1.1
 POCKETPY_SITE = $(call github,pocketpy,pocketpy,v$(POCKETPY_VERSION))
 POCKETPY_LICENSE = MIT
 POCKETPY_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
