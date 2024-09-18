Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71050CDD555
	for <buildroot@archiver.kernel.org>; Wed, 18 Sep 2024 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797EB401F6;
	Wed, 18 Sep 2024 20:35:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zIFPiYSNBpbT; Wed, 18 Sep 2024 20:35:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAA25411FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAA25411FE;
	Wed, 18 Sep 2024 20:35:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3DAD21BF30C
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AC0541263
 for <buildroot@lists.busybox.net>; Wed, 18 Sep 2024 20:34:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tniOGQ7FwDQ for <buildroot@lists.busybox.net>;
 Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13294400F5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13294400F5
 for <buildroot@buildroot.org>; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B23183BDE; Wed, 18 Sep 2024 20:34:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 18 Sep 2024 22:14:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 0643531972fbd8a889820e42000abd148f3b3f30
X-Git-Newrev: 3789f1b9ab0d31504b5228a682556f98ed31bc79
X-Patchwork-Hint: ignore
Message-Id: <20240918203458.0B23183BDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] docs/manual: fix
 description of how to reply to <message-id>
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

commit: https://git.buildroot.net/buildroot/commit/?id=3789f1b9ab0d31504b5228a682556f98ed31bc79
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Patch v1 not set to 'superseded' when replying to <message-id> with v2.

I'm using git version 2.46.0. The manual says the following is the
correct way to use the '--in-reply-to' option:

git send-email --in-reply-to=<message-id>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6677d9c4e18107cbf3dc691dea3beb801e03df98)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index 1801a53d2f..b88e955646 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -513,7 +513,7 @@ address you register in
 https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
 match the one you use for sending patches to the mailing list.
 
-You can also add the +--in-reply-to <message-id>+ option when
+You can also add the +--in-reply-to=<message-id>+ option when
 submitting a patch to the mailing list. The id of the mail to reply to
 can be found under the "Message Id" tag on
 https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
