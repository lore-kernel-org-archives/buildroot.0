Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63550CD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 17:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31222841A8;
	Sat, 31 Aug 2024 17:13:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r9DkoyQf4LMn; Sat, 31 Aug 2024 17:13:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F0FA4841AA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0FA4841AA;
	Sat, 31 Aug 2024 17:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBFCF1BF5E6
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8B3F41A33
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKZ10Lz7jM38 for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 17:13:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB91F41988
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB91F41988
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C9CE9867F3; Sat, 31 Aug 2024 17:13:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 19:00:00 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: e62c13c91ee988d2b057fda5f57b971b3a2daee9
X-Git-Newrev: f0a7810423a369f2b1a76d605c43aee752958061
X-Patchwork-Hint: ignore
Message-Id: <20240831171343.C9CE9867F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/speex: ARM5E
 needs ARM mode
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0a7810423a369f2b1a76d605c43aee752958061
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Add a dependency on ARM mode for ARM5E to fix the following build
failure on Cortex-M3 which only supports Thumb2 mode:

/tmp/ccJHSu7y.s:158: Error: selected processor does not support `smulbb r1,r6,lr' in Thumb mode

Fixes:
 - http://autobuild.buildroot.org/results/1575da3a8ea2bcde7fa9885df317a12d5c36918f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 28be64c1e0ad0ba014257cda116c2f07236d0d4b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/speex/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/speex/Config.in b/package/speex/Config.in
index c4e3df5dcd..134e6e4b35 100644
--- a/package/speex/Config.in
+++ b/package/speex/Config.in
@@ -18,6 +18,7 @@ config BR2_PACKAGE_SPEEX_ARM4
 config BR2_PACKAGE_SPEEX_ARM5E
 	bool
 	default y
-	depends on BR2_arm && !BR2_PACKAGE_SPEEX_ARM4
+	depends on BR2_arm && BR2_ARM_CPU_HAS_ARM && \
+		!BR2_PACKAGE_SPEEX_ARM4
 
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
