Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5108C02181
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 07:31:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C48660748;
	Sat, 14 Sep 2024 07:31:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ijKxOCKDuiW; Sat, 14 Sep 2024 07:31:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 725CD60751
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 725CD60751;
	Sat, 14 Sep 2024 07:31:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43D321BF2EC
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:31:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3331280C1D
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 07:31:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0gH9xKpsjr2j for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A8B480B63
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A8B480B63
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53E8F86F45; Sat, 14 Sep 2024 07:31:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 09:21:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cc558477c33280a5e421793646f2c52ae2154223
X-Git-Newrev: de42743f1b7f05517fc4f8eba73ddaee2e4c9ae8
X-Patchwork-Hint: ignore
Message-Id: <20240914073123.53E8F86F45@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rp-pppoe: fixup download URL
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

commit: https://git.buildroot.net/buildroot/commit/?id=de42743f1b7f05517fc4f8eba73ddaee2e4c9ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in [1], the download of rp-pppoe-3.15.tar.gz is no longer
guaranteed from the download section of the project.

Fortunately, Jacon Kroon is hosting the RP-PPPoE source code for versions
3.15 and 4.0 in a location that permits automated downloads.

Fixes:
- http://autobuild.buildroot.org/results/8676456feec9dd401152887101ad1a9ce96cb769

[1] https://dianne.skoll.ca/pipermail/rp-pppoe/2024q3/000652.html

Cc: Jaco Kroon <jaco@uls.co.za>
Cc: Dianne Skoll <dianne@skoll.ca>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rp-pppoe/rp-pppoe.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rp-pppoe/rp-pppoe.mk b/package/rp-pppoe/rp-pppoe.mk
index f50f1e5a1f..75f2290442 100644
--- a/package/rp-pppoe/rp-pppoe.mk
+++ b/package/rp-pppoe/rp-pppoe.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RP_PPPOE_VERSION = 3.15
-RP_PPPOE_SITE = https://dianne.skoll.ca/projects/rp-pppoe/download
+RP_PPPOE_SITE = https://downloads.uls.co.za/rp-pppoe
 RP_PPPOE_LICENSE = GPL-2.0
 RP_PPPOE_LICENSE_FILES = doc/LICENSE
 RP_PPPOE_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
