Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F679C78820
	for <buildroot@archiver.kernel.org>; Fri, 20 Sep 2024 10:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 650E042BF4;
	Fri, 20 Sep 2024 10:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmcczgmRU0CW; Fri, 20 Sep 2024 10:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3923B42D58
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3923B42D58;
	Fri, 20 Sep 2024 10:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76D041BF599
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB75584C80
 for <buildroot@lists.busybox.net>; Fri, 20 Sep 2024 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W4DwbfT6Cp5G for <buildroot@lists.busybox.net>;
 Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F5B184C8D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F5B184C8D
 for <buildroot@buildroot.org>; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2C02A84117; Fri, 20 Sep 2024 10:36:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 20 Sep 2024 12:33:45 +0200
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 80c395b83cd93e8a2687d6e1fe45c48dd6680073
X-Git-Newrev: d65a720a00576707457de448d2834b5b3116604d
X-Patchwork-Hint: ignore
Message-Id: <20240920103607.2C02A84117@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/nginx: fix
 symmetric typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=d65a720a00576707457de448d2834b5b3116604d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit acbff448619596895267e972ebc2bdad2b0fb12b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index d3b042c59b..7a5455def7 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -93,7 +93,7 @@ endif
 # - pcre-jit          (want to rebuild pcre)
 
 # Notes:
-# * Feature/module option are *not* symetric.
+# * Feature/module option are *not* symmetric.
 #   If a feature is on by default, only its --without-xxx option exists;
 #   if a feature is off by default, only its --with-xxx option exists.
 # * The configure script fails if unknown options are passed on the command
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
