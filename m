Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEF1C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 21:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD9E18202A;
	Sat, 25 Mar 2023 21:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD9E18202A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWRz-WXuM_Ug; Sat, 25 Mar 2023 21:10:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3867282032;
	Sat, 25 Mar 2023 21:10:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3867282032
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E18691BF86D
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6CDF60ABB
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 21:07:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6CDF60ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LN-XALOupgmx for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B79B60AB1
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B79B60AB1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 99BCE82AB9; Sat, 25 Mar 2023 21:07:39 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 25 Mar 2023 21:47:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33c85dc3ec02028847fd0b5fa6570fb4e892358a
X-Git-Newrev: 98de5e4aad1c2cae97cbcaa8fd2771a4a69f8d4c
X-Patchwork-Hint: ignore
Message-Id: <20230325210739.99BCE82AB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/popt: remove POPT_GETTEXTIZE
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

commit: https://git.buildroot.net/buildroot/commit/?id=98de5e4aad1c2cae97cbcaa8fd2771a4a69f8d4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 895bfba dropped POPT_AUTORECONF but did not drop POPT_GETTEXTIZE,
which requires POPT_AUTORECONF = YES.

Fixes: 895bfba ("package/popt: bump to version 1.19")

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/popt/popt.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/popt/popt.mk b/package/popt/popt.mk
index 842cf0d035..5cee8e9673 100644
--- a/package/popt/popt.mk
+++ b/package/popt/popt.mk
@@ -11,7 +11,6 @@ POPT_LICENSE = MIT
 POPT_LICENSE_FILES = COPYING
 POPT_CPE_ID_VENDOR = popt_project
 
-POPT_GETTEXTIZE = YES
 POPT_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 POPT_CONF_ENV = ac_cv_va_copy=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
