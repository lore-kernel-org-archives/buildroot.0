Return-Path: <SRS0=o+05=PO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 161DAC433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B05CE61167
	for <buildroot@archiver.kernel.org>; Tue, 26 Oct 2021 12:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B05CE61167
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 902E760A39;
	Tue, 26 Oct 2021 12:16:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTxb960Y1aYD; Tue, 26 Oct 2021 12:16:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 019226090C;
	Tue, 26 Oct 2021 12:16:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34F0E1BF9B2
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 24A854026D
 for <buildroot@lists.busybox.net>; Tue, 26 Oct 2021 12:15:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q3xNS_Sb3qru for <buildroot@lists.busybox.net>;
 Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A11F4027E
 for <buildroot@buildroot.org>; Tue, 26 Oct 2021 12:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 4830588DA3; Tue, 26 Oct 2021 12:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 Oct 2021 14:14:43 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: cba51a71448ba24f944f4909a1bd257cf175903f
X-Git-Newrev: eada913c9713b4e98177c7477247813bf2de5589
X-Patchwork-Hint: ignore
Message-Id: <20211026121221.4830588DA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/freerdp: fix
 uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=eada913c9713b4e98177c7477247813bf2de5589
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix build failure with uclibc raised since bump to version 2.4.0 in
commit 196b29f3273035888d8743075be453649ad82e93

Fixes:
 - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 60e11d60b05b9fdb2a454454ed967e0acfa100f0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-include-winpr-file.h-fix-build-on-uclibc.patch | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
new file mode 100644
index 0000000000..d8dfe13d1b
--- /dev/null
+++ b/package/freerdp/0003-winpr-include-winpr-file.h-fix-build-on-uclibc.patch
@@ -0,0 +1,39 @@
+From 21036304f909eae9f7506f48703ba1c74724342b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 31 Jul 2021 09:49:27 +0200
+Subject: [PATCH] winpr/include/winpr/file.h: fix build on uclibc
+
+Include stdio.h to fix the following build failure with uclibc raised
+since version 2.4.0 and
+https://github.com/FreeRDP/FreeRDP/commit/eb6777ea69b022c9e43a1576a2192a1cb807b1e6:
+
+In file included from /tmp/instance-0/output-1/build/freerdp-2.4.0/winpr/libwinpr/utils/lodepng/lodepng.c:30:
+/tmp/instance-0/output-1/build/freerdp-2.4.0/winpr/include/winpr/file.h:524:11: error: unknown type name 'FILE'
+ WINPR_API FILE* winpr_fopen(const char* path, const char* mode);
+           ^~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/FreeRDP/FreeRDP/pull/7205]
+---
+ winpr/include/winpr/file.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/winpr/include/winpr/file.h b/winpr/include/winpr/file.h
+index 48a29f9f5..79c9b392c 100644
+--- a/winpr/include/winpr/file.h
++++ b/winpr/include/winpr/file.h
+@@ -30,6 +30,8 @@
+ 
+ #ifndef _WIN32
+ 
++#include <stdio.h>
++
+ #ifndef MAX_PATH
+ #define MAX_PATH 260
+ #endif
+-- 
+2.30.2
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
