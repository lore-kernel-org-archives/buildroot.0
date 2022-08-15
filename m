Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A13C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:22:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D1E3415FA;
	Mon, 15 Aug 2022 09:22:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D1E3415FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqs6SH2Jusdj; Mon, 15 Aug 2022 09:22:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12A3A415F0;
	Mon, 15 Aug 2022 09:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12A3A415F0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 093EE1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B978540AA2
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B978540AA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id visP6rX2APYs for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA70840AE7
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA70840AE7
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 00714875A7; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:04:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa77b1b9f270d09f20ce5f9924dae27d91c7f883
X-Git-Newrev: 6c44b8a37957b543568e523546ad571eb157bd90
X-Patchwork-Hint: ignore
Message-Id: <20220815090239.00714875A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsepol: drop bogus
 BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
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

commit: https://git.buildroot.net/buildroot/commit/?id=6c44b8a37957b543568e523546ad571eb157bd90
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The inexistent symbol is reference since this commit from 2020:
'55784bcbfa package/libsepol: set default policy version'

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libsepol/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libsepol/Config.in b/package/libsepol/Config.in
index 7516076cd5..5dfd1a41d3 100644
--- a/package/libsepol/Config.in
+++ b/package/libsepol/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_LIBSEPOL_POLICY_VERSION
 	default 30 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
 	default 29 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_14
 	default 28 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	default 26 if BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
 	default 25
 	help
 	  The maximum SELinux policy version your kernel supports.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
