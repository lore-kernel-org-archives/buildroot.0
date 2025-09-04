Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B590ECA1002
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86B8C6066B;
	Thu,  4 Sep 2025 16:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jtf-VFjKERGc; Thu,  4 Sep 2025 16:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B95C460600
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B95C460600;
	Thu,  4 Sep 2025 16:15:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FFE7AE8
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12FBD80792
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DtAlepdK7x26 for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFC738079C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AFC738079C
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE19587F44; Thu,  4 Sep 2025 16:13:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 13:57:24 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 13de70b4b4bca6529d3fc617d22cf15a8fcd1797
X-Git-Newrev: 0f0fe331ff9ba6891e07e1c4da3751eeb7c20b8a
X-Patchwork-Hint: ignore
Message-Id: <20250904161349.AE19587F44@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: fix grub2
 compilation
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0f0fe331ff9ba6891e07e1c4da3751eeb7c20b8a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes:
 https://autobuild.buildroot.org/results/7a4/7a4d0f0571cd0cef1c87f3ef207618de72c1c78c/build-end.log

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 08a1e10fbe7538d8775196ae680df002c0271854)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...001-remove-uClibc-specific-gettext_printf.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
new file mode 100644
index 0000000000..96736da562
--- /dev/null
+++ b/package/uclibc/0001-remove-uClibc-specific-gettext_printf.patch
@@ -0,0 +1,34 @@
+From 9ffed9adb130d45b9f31ca7a305153e86586c877 Mon Sep 17 00:00:00 2001
+From: Waldemar Brodkorb <wbx@openadk.org>
+Date: Fri, 15 Aug 2025 20:29:52 +0200
+Subject: [PATCH] remove uClibc specific gettext_printf
+
+Other C libraries like musl/glibc does not define it.
+Including stdio.h here breaks Grub2 compilation with
+gcc 14 and above.
+Thanks to Thomas Petazzoni for analyzing the Grub2 build error.
+
+Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?id=9ffed9adb130d45b9f31ca7a305153e86586c877
+---
+ include/libintl.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/libintl.h b/include/libintl.h
+index b7123a963..6d8b9f342 100644
+--- a/include/libintl.h
++++ b/include/libintl.h
+@@ -50,9 +50,6 @@ char *bindtextdomain(const char *domainname, const char *dirname);
+ 
+ #endif
+ 
+-#include <stdio.h>
+-#define gettext_printf(args...) printf(args)
+-
+ /* to supply LC_MESSAGES and other stuff GNU expects to be exported when
+    including libintl.h */
+ #include <locale.h>
+-- 
+2.47.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
