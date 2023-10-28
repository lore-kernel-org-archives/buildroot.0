Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F297C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:34:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C06940189;
	Sat, 28 Oct 2023 19:34:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C06940189
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rO7m7Z6jvZeI; Sat, 28 Oct 2023 19:34:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58C3A42115;
	Sat, 28 Oct 2023 19:34:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58C3A42115
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C14A61BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4F174216B
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:34:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4F174216B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8wp_3zP6JIhG for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D336B420A8
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D336B420A8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD3EA85EFA; Sat, 28 Oct 2023 19:34:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Oct 2023 21:30:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cf2dcaa1ecede670a0bc54841652a0e3bea5c744
X-Git-Newrev: 05296ced369bab8877efa624f3d9b4d201ba5b38
X-Patchwork-Hint: ignore
Message-Id: <20231028193446.BD3EA85EFA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Config.in: default to HTTPS for s.b.n
 backup site
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

commit: https://git.buildroot.net/buildroot/commit/?id=05296ced369bab8877efa624f3d9b4d201ba5b38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that we have HTTPS support for sources.buildroot.net (through Lets
encrypt / Cloudflare), it makes sense to default to it for our backup site.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Config.in b/Config.in
index dbcca4c55a..556b6c2575 100644
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
