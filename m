Return-Path: <SRS0=zrjq=MX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D440C4338F
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:12:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52A0461040
	for <buildroot@archiver.kernel.org>; Sat, 31 Jul 2021 09:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52A0461040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 283A98380B;
	Sat, 31 Jul 2021 09:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bed2qVyY7CKm; Sat, 31 Jul 2021 09:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 800F383521;
	Sat, 31 Jul 2021 09:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B2F661BF2F3
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4078482BD6
 for <buildroot@lists.busybox.net>; Sat, 31 Jul 2021 09:11:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NixXW_YdHEhU for <buildroot@lists.busybox.net>;
 Sat, 31 Jul 2021 09:11:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9378190B
 for <buildroot@buildroot.org>; Sat, 31 Jul 2021 09:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 37F9E8A338; Sat, 31 Jul 2021 09:11:19 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 31 Jul 2021 11:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6b78d020851a3bf74a825db09d39e215bf54e5c3
X-Git-Newrev: 60e11d60b05b9fdb2a454454ed967e0acfa100f0
X-Patchwork-Hint: ignore
Message-Id: <20210731091119.37F9E8A338@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freerdp: fix uclibc build
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

commit: https://git.buildroot.net/buildroot/commit/?id=60e11d60b05b9fdb2a454454ed967e0acfa100f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix build failure with uclibc raised since bump to version 2.4.0 in
commit 196b29f3273035888d8743075be453649ad82e93

Fixes:
 - http://autobuild.buildroot.org/results/31e770a330158035e24b7b952bec0030138482b7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
