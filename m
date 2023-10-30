Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0EEAC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:26:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D6A040374;
	Mon, 30 Oct 2023 17:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D6A040374
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BGX4PXxZIv9A; Mon, 30 Oct 2023 17:26:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F34740382;
	Mon, 30 Oct 2023 17:26:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F34740382
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5FB1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5445D4149F
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:25:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5445D4149F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRLPWjS8x-eq for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 249CC4095A
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249CC4095A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 145DA861D8; Mon, 30 Oct 2023 17:25:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:17:20 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 68d7581cb318c3ab30521334326707284a4743bc
X-Git-Newrev: 47a5fa5cf36b1efa3ec6154e655635bf2a033a21
X-Patchwork-Hint: ignore
Message-Id: <20231030172538.145DA861D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] Config.in: default to
 HTTPS for s.b.n backup site
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

commit: https://git.buildroot.net/buildroot/commit/?id=47a5fa5cf36b1efa3ec6154e655635bf2a033a21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Now that we have HTTPS support for sources.buildroot.net (through Lets
encrypt / Cloudflare), it makes sense to default to it for our backup site.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05296ced369bab8877efa624f3d9b4d201ba5b38)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index 670e199c0b..1fcf549e62 100644
--- a/Config.in
+++ b/Config.in
@@ -241,7 +241,7 @@ if !BR2_PRIMARY_SITE_ONLY
 
 config BR2_BACKUP_SITE
 	string "Backup download site"
-	default "http://sources.buildroot.net"
+	default "https://sources.buildroot.net"
 	help
 	  Backup site to download from. If this option is set then
 	  buildroot will fall back to download package sources from here
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
