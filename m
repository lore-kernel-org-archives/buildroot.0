Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D893CCE8D5F
	for <buildroot@archiver.kernel.org>; Thu, 19 Sep 2024 09:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D0543336;
	Thu, 19 Sep 2024 09:18:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BY6EEX7SZCE9; Thu, 19 Sep 2024 09:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3925D43327
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3925D43327;
	Thu, 19 Sep 2024 09:18:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8C81BF4DA
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74261849D1
 for <buildroot@lists.busybox.net>; Thu, 19 Sep 2024 09:16:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M15mCRYhLw8m for <buildroot@lists.busybox.net>;
 Thu, 19 Sep 2024 09:16:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56C80849E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56C80849E9
 for <buildroot@buildroot.org>; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 543DA7FC62; Thu, 19 Sep 2024 09:16:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 19 Sep 2024 11:04:51 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 6bd9b7f145cc490471c5489e507b3887d286f448
X-Git-Newrev: c09e6dd0ff9988b5302053ab7df9d0960ece3dc0
X-Patchwork-Hint: ignore
Message-Id: <20240919091607.543DA7FC62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fbgrab: fix
 framebuffer typo in help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=c09e6dd0ff9988b5302053ab7df9d0960ece3dc0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ae471a7d3dc291ea07652b82c7239bc4b2a83284)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbgrab/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/fbgrab/Config.in b/package/fbgrab/Config.in
index b1d8755f32..39c7834d50 100644
--- a/package/fbgrab/Config.in
+++ b/package/fbgrab/Config.in
@@ -3,6 +3,6 @@ config BR2_PACKAGE_FBGRAB
 	select BR2_PACKAGE_LIBPNG
 	help
 	  FBGrab is a framebuffer screenshot program, capturing the
-	  linux frambuffer and converting it to a png-picture.
+	  linux framebuffer and converting it to a png-picture.
 
 	  https://github.com/GunnarMonell/fbgrab
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
