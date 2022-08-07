Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A705DC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:58:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E1E60AF0;
	Sun,  7 Aug 2022 12:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E1E60AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N_oHoTdBjnGg; Sun,  7 Aug 2022 12:57:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B7AF60ADF;
	Sun,  7 Aug 2022 12:57:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B7AF60ADF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E30A61BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC64760ADF
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC64760ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vFLoGWYI0-OK for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:57:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B15E60AC1
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:57:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B15E60AC1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C9A0486F40; Sun,  7 Aug 2022 12:43:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:56:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b69207971326bc8c23387b941f7e8f3200e924dc
X-Git-Newrev: 563f0de8c23611ce76541d95c5381247abaee20b
X-Patchwork-Hint: ignore
Message-Id: <20220807124344.C9A0486F40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: update gcc bug 101915
 comment
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=563f0de8c23611ce76541d95c5381247abaee20b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 9612bdf8b2..fbc2f28553 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -200,7 +200,7 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_101737
 
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=101915
 # ICE: in extract_insn, at recog.c:2294 on microblaze.
-# This bug still exists in gcc = 11.1.0
+# This bug still exists in gcc = 12.1.0
 config BR2_TOOLCHAIN_HAS_GCC_BUG_101915
 	bool
 	default y if BR2_microblaze
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
