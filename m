Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFF1C4332F
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 14:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E3D40600;
	Sat, 15 Oct 2022 14:35:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20E3D40600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CReOwuTHOMmb; Sat, 15 Oct 2022 14:35:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50946405EF;
	Sat, 15 Oct 2022 14:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50946405EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD1951BF307
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A40B9605E0
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 14:34:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A40B9605E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tw2j38_VtsQS for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6BF360B2A
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6BF360B2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B659486BE3; Sat, 15 Oct 2022 14:34:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 16:33:56 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 886f8df73158eaf71e55c9a10be7dec1f912419d
X-Git-Newrev: 5c6d67cfe144e7ee4f2f3fb3a311d67e0b6b7935
X-Patchwork-Hint: ignore
Message-Id: <20221015143434.B659486BE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] toolchain/Config.in:
 correct BR2_TOOLCHAIN_HEADERS_AT_LEAST for 5.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=5c6d67cfe144e7ee4f2f3fb3a311d67e0b6b7935
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Missed from commit 2b134f9549d ({toolchain, linux-headers}: add support for
5.17.x headers).

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 484b50507f31e90a3f955698ad10e7aad6f91b37)
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
