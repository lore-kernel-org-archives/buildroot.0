Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A65ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56F8440BA5;
	Fri, 16 Sep 2022 11:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56F8440BA5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9wYcwhnETDVM; Fri, 16 Sep 2022 11:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76DBC40BA2;
	Fri, 16 Sep 2022 11:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76DBC40BA2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B49271BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB0B541CA0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB0B541CA0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ke_tFlvi9S7C for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37A8B41CA4
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37A8B41CA4
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 27F6083CC3; Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 13:35:47 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 2133c921b2a4f05ea94de2c8b6d2e8b5452a78e0
X-Git-Newrev: aee882d3aff7588d09d59ff1e21d4a6365ed93a4
X-Patchwork-Hint: ignore
Message-Id: <20220916114646.27F6083CC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/libsepol: drop
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

commit: https://git.buildroot.net/buildroot/commit/?id=aee882d3aff7588d09d59ff1e21d4a6365ed93a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

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
