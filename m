Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D6CC3DA4D
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 14:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C460419A8;
	Fri, 12 Jul 2024 14:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kNNO6PLijKdG; Fri, 12 Jul 2024 14:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0951E41994
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0951E41994;
	Fri, 12 Jul 2024 14:13:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2655E1BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 148B2845FD
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 14:13:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5bdopPIvdGy for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41F25845F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 41F25845F5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D3B880E2B; Fri, 12 Jul 2024 14:13:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 16:08:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c90b87156dec69c9acabb8bd80d2447a5dbfb1e8
X-Git-Newrev: 5e36efd7ac994ed430bc2430ee0c03d44f0cbbff
X-Patchwork-Hint: ignore
Message-Id: <20240712141303.2D3B880E2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: remove chromebook
 check-hash exceptions
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5e36efd7ac994ed430bc2430ee0c03d44f0cbbff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commits 3988f2d9238bc027b5d16219867e8d3c701c0c06 and
0d91281d7bdfa09be28237bab694e6ac22466541 added hashes for the chromebook
defconfigs, but forgot to remove the exception from .checkpackageignore.

Regenerate .checkpackageignore, which removes those exceptions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dfd5b2578e..f36e99fcf4 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -148,8 +148,6 @@ configs/beaglev_defconfig lib_defconfig.ForceCheckHash
 configs/beelink_gs1_defconfig lib_defconfig.ForceCheckHash
 configs/broadcom_northstar_defconfig lib_defconfig.ForceCheckHash
 configs/canaan_kd233_defconfig lib_defconfig.ForceCheckHash
-configs/chromebook_elm_defconfig lib_defconfig.ForceCheckHash
-configs/chromebook_snow_defconfig lib_defconfig.ForceCheckHash
 configs/ci20_defconfig lib_defconfig.ForceCheckHash
 configs/cubieboard2_defconfig lib_defconfig.ForceCheckHash
 configs/engicam_imx6qdl_icore_defconfig lib_defconfig.ForceCheckHash
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
