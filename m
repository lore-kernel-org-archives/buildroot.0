Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D902CE8D61
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D19B1416BD;
	Thu, 19 Sep 2024 09:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DFBI2GCi3K5u; Thu, 19 Sep 2024 09:17:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B497341866
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B497341866;
	Thu, 19 Sep 2024 09:17:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B3E551BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6BD0841D5
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D2FcWxCsYLnQ for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 333BA84766
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 333BA84766
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 308E383C39; Thu, 19 Sep 2024 09:14:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:03:17 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: dbc9de026b3423832e721740bf39369f1d323195
X-Git-Newrev: 8d5f51706da7218888df80c67b210d37432f563c
X-Patchwork-Hint: ignore
Message-Id: <20240919091452.308E383C39@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/bcusdk: fix
 definition typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=8d5f51706da7218888df80c67b210d37432f563c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 2619c021891daed6a1dfce4bacecf825434108cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0002-eibd-fix-endless-recursion-when-using-USB-backends.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
index 3b90289c88..c31f0c0c8c 100644
--- a/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
+++ b/package/bcusdk/0002-eibd-fix-endless-recursion-when-using-USB-backends.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] eibd: drop local clock_gettime in USB backends
 clock_gettime is defined locally, and calls pth_int_time, which
 in turn calls clock_gettime.
 The USB backend shouldn't overrule clock_gettime in the first place.
-This patch fixes this endless recursion by removing the local defition.
+This patch fixes this endless recursion by removing the local definition.
 
 Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
