Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAE51C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 16:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82B1B80D5F;
	Wed, 31 Jul 2024 16:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTUs7oMLytC3; Wed, 31 Jul 2024 16:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B00780EB7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B00780EB7;
	Wed, 31 Jul 2024 16:54:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 214CD1BF3D8
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6F464405CA
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 16:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izIK2xuTRddN for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6177140E23
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6177140E23
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D5B383774; Wed, 31 Jul 2024 16:54:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 18:45:50 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 0eb1ea8cb52cd9ea080aa113646e3656ce66b97f
X-Git-Newrev: 629869f2dd4334acef6e0d3ad5ab69f718c442c6
X-Patchwork-Hint: ignore
Message-Id: <20240731165429.5D5B383774@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] .checkpackageignore:
 remove chromebook check-hash exceptions
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

commit: https://git.buildroot.net/buildroot/commit/?id=629869f2dd4334acef6e0d3ad5ab69f718c442c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Commits 3988f2d9238bc027b5d16219867e8d3c701c0c06 and
0d91281d7bdfa09be28237bab694e6ac22466541 added hashes for the chromebook
defconfigs, but forgot to remove the exception from .checkpackageignore.

Regenerate .checkpackageignore, which removes those exceptions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 5e36efd7ac994ed430bc2430ee0c03d44f0cbbff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore | 2 --
 1 file changed, 2 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 631e1d9da5..1faaba7431 100644
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
