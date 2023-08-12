Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DED2EC8738
	for <buildroot@archiver.kernel.org>; Thu,  7 Sep 2023 15:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 233E283BD5;
	Thu,  7 Sep 2023 15:22:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 233E283BD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u2Rid5fPomR1; Thu,  7 Sep 2023 15:22:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6717383BDB;
	Thu,  7 Sep 2023 15:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6717383BDB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6152A1BF313
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0356E41E51
 for <buildroot@lists.busybox.net>; Thu,  7 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0356E41E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_kJdzanbLqR for <buildroot@lists.busybox.net>;
 Thu,  7 Sep 2023 14:51:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C79241DC8
 for <buildroot@buildroot.org>; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C79241DC8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16FAA86A1E; Thu,  7 Sep 2023 14:51:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 15:31:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94eb10b937a1d7dd116319a7d352ad99e20b5ea0
X-Git-Newrev: d6dde8fc0cf44e631ce7d3df6f956cb35f8cf1e9
X-Patchwork-Hint: ignore
Message-Id: <20230907145129.16FAA86A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fft-eval: drop unused variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6dde8fc0cf44e631ce7d3df6f956cb35f8cf1e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 21d5d592a427 (package/fft_eval: new package) got last-minute
changes when comitted, changes which no longer made use of the
FFT_EVAL_TARGETS variable, but forgot to drop assignments to that
variable.

Drop them now.

Reported-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fft-eval/fft-eval.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/fft-eval/fft-eval.mk b/package/fft-eval/fft-eval.mk
index 3dd3cec0b4..5f913391e3 100644
--- a/package/fft-eval/fft-eval.mk
+++ b/package/fft-eval/fft-eval.mk
@@ -13,12 +13,10 @@ FFT_EVAL_LICENSE_FILES = \
 	LICENSES/OFL-1.1.txt
 
 FFT_EVAL_CONV_OPTS = CONFIG_fft_eval_json=y
-FFT_EVAL_TARGETS = fft_eval_json
 
 ifeq ($(BR2_PACKAGE_SDL2)$(BR2_PACKAGE_SDL2_TTF),yy)
 FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=y
 FFT_EVAL_DEPENDENCIES += sdl2 sdl2_ttf
-FFT_EVAL_TARGETS += fft_eval_sdl
 else
 FFT_EVAL_CONV_OPTS += CONFIG_fft_eval_sdl=n
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
