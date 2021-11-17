Return-Path: <SRS0=Sygv=QE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03F25C433F5
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C610361B5F
	for <buildroot@archiver.kernel.org>; Wed, 17 Nov 2021 22:41:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C610361B5F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BE154018F;
	Wed, 17 Nov 2021 22:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FwI3FvLzo3u5; Wed, 17 Nov 2021 22:41:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E90C2401C4;
	Wed, 17 Nov 2021 22:41:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5D6071BF2FA
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDD85605BC
 for <buildroot@lists.busybox.net>; Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id icCDPo75b1vi for <buildroot@lists.busybox.net>;
 Wed, 17 Nov 2021 22:37:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3E6060625
 for <buildroot@buildroot.org>; Wed, 17 Nov 2021 22:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D4E2C8D6B1; Wed, 17 Nov 2021 22:33:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 17 Nov 2021 23:30:35 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 5f55b60726726d318c4110a322374a3b43855d32
X-Git-Newrev: 2a824ae39d563822d736a377dcd397c03d031426
X-Patchwork-Hint: ignore
Message-Id: <20211117223324.D4E2C8D6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/mksh: fix project
 URL in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a824ae39d563822d736a377dcd397c03d031426
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

It's http://www.mirbsd.org/mksh.htm

Signed-off-by: Carlos Santos <unixmania@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 399ad854cc210db728e06933b8a4ad9089176ec1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mksh/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mksh/Config.in b/package/mksh/Config.in
index e6ccc90646..94f0d78ad5 100644
--- a/package/mksh/Config.in
+++ b/package/mksh/Config.in
@@ -22,4 +22,4 @@ config BR2_PACKAGE_MKSH
 	  operating environments
 	  (thus including patches from pdksh on e.g. Debian).
 
-	  http://mirbsd.de/mksh
+	  http://www.mirbsd.org/mksh.htm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
