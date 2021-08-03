Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A638BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:58:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5BCC26104F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 19:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5BCC26104F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2949140001;
	Tue,  3 Aug 2021 19:58:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xOgH1W1V0NrC; Tue,  3 Aug 2021 19:58:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25195400C7;
	Tue,  3 Aug 2021 19:58:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0FF131BF2E4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFE3183300
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 19:57:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Z15fjsPM0mt for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32F6283566
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 19:57:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 9813A8B354; Tue,  3 Aug 2021 19:57:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 21:51:47 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 216902567f4340c3a29d9bfa2d4bbe41aae97a8f
X-Git-Newrev: 76a1d3b6e8c1b0aeb1f43022acbcb5eba2cb8ad3
X-Patchwork-Hint: ignore
Message-Id: <20210803195719.9813A8B354@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/putty: fix build
 on uclibc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=76a1d3b6e8c1b0aeb1f43022acbcb5eba2cb8ad3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix build failure on uclibc raised since bump to version 0.75 in commit
d562009f7b9701cb20bc4b1d389d19f9a647cc3b

Fixes:
 - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit aea9376acce527f3d897339290935e75b2ab5bcc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-unix-uxutils.h-fix-build-on-uclibc.patch  | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..78cef8b908
--- /dev/null
+++ b/package/putty/0001-unix-uxutils.h-fix-build-on-uclibc.patch
@@ -0,0 +1,41 @@
+From 3f30f3a7e3f07f5ca3cef0f405b02e22a018c6e4 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 9 May 2021 15:22:29 +0200
+Subject: [PATCH] unix/uxutils.h: fix build on uclibc
+
+Build on uclibc is broken since version 0.75 and commit
+65383082bf0c49cec63f4b36001a40bd9b13edf6 because AT_HWCAP2 is used
+even if <sys/auxv.h> is not available:
+
+unix/uxutils.c: In function 'platform_aes_hw_available':
+unix/uxutils.c:13:22: error: 'AT_HWCAP2' undeclared (first use in this function)
+   13 |     return getauxval(AT_HWCAP2) & HWCAP2_AES;
+      |                      ^~~~~~~~~
+
+To fix this build failure, include <elf.h>
+
+Fixes:
+ - http://autobuild.buildroot.org/results/726f7c5ce13e78ed91e827b872e9d7ccfa13f298
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to Simon Tatham <anakin@pobox.com>]
+---
+ unix/uxutils.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/unix/uxutils.h b/unix/uxutils.h
+index c9acff53..b80bf972 100644
+--- a/unix/uxutils.h
++++ b/unix/uxutils.h
+@@ -18,6 +18,8 @@
+ 
+ #if defined __arm__ || defined __aarch64__
+ 
++#include <elf.h>
++
+ #ifdef HAVE_SYS_TYPES_H
+ #include <sys/types.h>
+ #endif
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
