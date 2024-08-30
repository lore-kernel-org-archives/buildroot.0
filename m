Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45D5CCA0EFD
	for <buildroot@archiver.kernel.org>; Fri, 30 Aug 2024 16:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0ED5C400D6;
	Fri, 30 Aug 2024 16:59:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lhcGowX1yf8z; Fri, 30 Aug 2024 16:59:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D49904013C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D49904013C;
	Fri, 30 Aug 2024 16:59:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B78A1BF20F
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8940361468
 for <buildroot@lists.busybox.net>; Fri, 30 Aug 2024 16:59:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GjeoE6AM6fZt for <buildroot@lists.busybox.net>;
 Fri, 30 Aug 2024 16:59:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC89861466
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC89861466
 for <buildroot@buildroot.org>; Fri, 30 Aug 2024 16:59:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F90886752; Fri, 30 Aug 2024 16:59:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 30 Aug 2024 18:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 180216631a64d5319ab0420cf7b37acb4fa0799c
X-Git-Newrev: 6677d9c4e18107cbf3dc691dea3beb801e03df98
X-Patchwork-Hint: ignore
Message-Id: <20240830165906.6F90886752@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: fix description of how to
 reply to <message-id>
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

commit: https://git.buildroot.net/buildroot/commit/?id=6677d9c4e18107cbf3dc691dea3beb801e03df98
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch v1 not set to 'superseded' when replying to <message-id> with v2.

I'm using git version 2.46.0. The manual says the following is the
correct way to use the '--in-reply-to' option:

git send-email --in-reply-to=<message-id>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 docs/manual/contribute.adoc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index fe3ae963a5..ffaff6f857 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -517,7 +517,7 @@ address you register in
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
