Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F054BC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 17:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9F8B440176;
	Mon, 30 Oct 2023 17:25:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9F8B440176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Di3ly-iaVwes; Mon, 30 Oct 2023 17:25:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B78C403CA;
	Mon, 30 Oct 2023 17:25:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B78C403CA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4335E1BF3A0
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29CC46080B
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 17:24:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29CC46080B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OccrY9gR3EJ for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD5260BAB
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 17:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CD5260BAB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17FD4861C7; Mon, 30 Oct 2023 17:24:27 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 18:17:14 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 33a967ed85c4a38a85e257a88fef5ef9b00e55cb
X-Git-Newrev: 9614e6ee786c9a6c4a7feeb947e667f85d708785
X-Patchwork-Hint: ignore
Message-Id: <20231030172428.17FD4861C7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] Config.in: default to
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

commit: https://git.buildroot.net/buildroot/commit/?id=9614e6ee786c9a6c4a7feeb947e667f85d708785
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
