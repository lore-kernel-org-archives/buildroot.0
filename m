Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9817CC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 21:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4509B403C5;
	Mon,  8 Jul 2024 21:11:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p-sQ192h66r1; Mon,  8 Jul 2024 21:11:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0977140288
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0977140288;
	Mon,  8 Jul 2024 21:11:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 683111BF3BD
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54E3B40288
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qmjp2JWRpT7d for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 21:11:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 620DC40266
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 620DC40266
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 21:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BEC9841A3; Mon,  8 Jul 2024 21:11:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 23:10:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9995ca7caaf75f34e72918218829bc15702432d5
X-Git-Newrev: cb25b54c2dd12c9d298a04b78668592b9593cd97
X-Patchwork-Hint: ignore
Message-Id: <20240708211142.4BEC9841A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: allow sponsor mention in
 author name
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cb25b54c2dd12c9d298a04b78668592b9593cd97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately not all mail providers deliver mails with subaddressing,
mention people can acknowledge a sponsor in the author name instead.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/contribute.adoc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index c88035597e..078725ef56 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -264,6 +264,10 @@ separated from it by a plus `+` sign. E.g.:
 +
 `Your-Name Your-Surname <your-name.your-surname+their-name.their-surname@mail.com>`
 
+Alternatively, especially if your email server does not support
+subaddressing, you can include the sponsor in your author name in
+parentheses, e.g. "Your Name (Sponsor Name)".
+
 When adding new packages, you should submit every package in a
 separate patch. This patch should have the update to
 +package/Config.in+, the package +Config.in+ file, the +.mk+ file, the
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
