Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8D7ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FA85842BC;
	Fri, 16 Sep 2022 11:57:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FA85842BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BxyyUs3ZZdar; Fri, 16 Sep 2022 11:57:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8E1B83F96;
	Fri, 16 Sep 2022 11:57:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8E1B83F96
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56D8E1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3612D61223
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3612D61223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ti4HpFDH0VP1 for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10F3D6122A
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10F3D6122A
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 019B983CC2; Fri, 16 Sep 2022 11:47:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 13:35:39 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 7974339bfa9c2b1a58dab7a6d8a72eca8ac1123d
X-Git-Newrev: a265609f07feef33df744d3f3c14ffbc0cdc06d6
X-Patchwork-Hint: ignore
Message-Id: <20220916114715.019B983CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/libsepol: drop
 bogus BR2_TOOLCHAIN_HEADERS_AT_LEAST_2_6
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

commit: https://git.buildroot.net/buildroot/commit/?id=a265609f07feef33df744d3f3c14ffbc0cdc06d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

The inexistent symbol is reference since this commit from 2020:
'55784bcbfa package/libsepol: set default policy version'

Cc: Clayton Shotwell <clayton.shotwell@collins.com>
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Matt Weber <matthew.weber@collins.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c44b8a37957b543568e523546ad571eb157bd90)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
