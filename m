Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECDAC10F1B
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 12:50:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6E3581EE5;
	Wed, 21 Dec 2022 12:50:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6E3581EE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ofulONg5lst3; Wed, 21 Dec 2022 12:50:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2851381EDE;
	Wed, 21 Dec 2022 12:50:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2851381EDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB67C1BF3F0
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 12:50:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 943EA60A7B
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 12:50:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 943EA60A7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c16XIMXWpDYo for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 12:50:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65976080A
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 12:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65976080A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B33F086B95; Wed, 21 Dec 2022 12:50:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 21 Dec 2022 13:47:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4cbef389f3e10d1cbdcd9961fb128dfd9b85debf
X-Git-Newrev: af1f90cc07e1b74cbda92402926bbcb88a722a93
X-Patchwork-Hint: ignore
Message-Id: <20221221125010.B33F086B95@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning; fix build
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=af1f90cc07e1b74cbda92402926bbcb88a722a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 2.2.0 in
commit af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:

jit_disasm.c: In function 'fprintf_styled':
jit_disasm.c:57:27: error: parameter name omitted
   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
      |                           ^~~~~~
jit_disasm.c:57:35: error: parameter name omitted
   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
      |                                   ^~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0001-lib-jit_disasm.c-fix-build.patch          | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
new file mode 100644
index 0000000000..9e79be91a0
--- /dev/null
+++ b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
@@ -0,0 +1,42 @@
+From 0d828c96c373c34b201ca7ea37b61c1e3b0485cd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 19 Dec 2022 23:55:31 +0100
+Subject: [PATCH] lib/jit_disasm.c: fix build
+
+Fix the following build failure raised since
+http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=837c7a1e8d08fb9294578dc84694077f4d6106f9:
+
+jit_disasm.c: In function 'fprintf_styled':
+jit_disasm.c:57:27: error: parameter name omitted
+   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
+      |                           ^~~~~~
+jit_disasm.c:57:35: error: parameter name omitted
+   57 | static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
+      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[yann.morin.1998@free.fr: make it a backport now it's applied upstream]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+---
+ lib/jit_disasm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
+index 58a269b..68c966d 100644
+--- a/lib/jit_disasm.c
++++ b/lib/jit_disasm.c
+@@ -54,7 +54,7 @@ static FILE			 *disasm_stream;
+ #endif
+ 
+ #if BINUTILS_2_38
+-static int fprintf_styled(void *, enum disassembler_style, const char* fmt, ...)
++static int fprintf_styled(void * stream, enum disassembler_style style, const char* fmt, ...)
+ {
+   va_list args;
+   int r;
+-- 
+2.25.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
