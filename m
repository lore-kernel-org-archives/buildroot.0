Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D009BC433FE
	for <buildroot@archiver.kernel.org>; Thu,  6 Oct 2022 17:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E6976106F;
	Thu,  6 Oct 2022 17:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E6976106F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9FhFBBPv5InQ; Thu,  6 Oct 2022 17:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8878660F49;
	Thu,  6 Oct 2022 17:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8878660F49
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0D111BF23C
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC68483FBC
 for <buildroot@lists.busybox.net>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC68483FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDpL-ddmHT5N for <buildroot@lists.busybox.net>;
 Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C83783F3E
 for <buildroot@buildroot.org>; Thu,  6 Oct 2022 17:59:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C83783F3E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED8CB86934; Thu,  6 Oct 2022 17:59:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Oct 2022 19:53:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 84b29a39416012e316da70dc0ad18b5887521422
X-Git-Newrev: 484b50507f31e90a3f955698ad10e7aad6f91b37
X-Patchwork-Hint: ignore
Message-Id: <20221006175948.ED8CB86934@busybox.osuosl.org>
Subject: [Buildroot] [git commit] toolchain/Config.in: correct
 BR2_TOOLCHAIN_HEADERS_AT_LEAST for 5.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=484b50507f31e90a3f955698ad10e7aad6f91b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Missed from commit 2b134f9549d ({toolchain, linux-headers}: add support for
5.17.x headers).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 toolchain/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index b48c69dc41..219578092b 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -580,6 +580,7 @@ config BR2_TOOLCHAIN_HEADERS_LATEST
 # stops affecting a value on the first matching default.
 config BR2_TOOLCHAIN_HEADERS_AT_LEAST
 	string
+	default "5.17" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
 	default "5.16" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
 	default "5.15" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 	default "5.14" if BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
