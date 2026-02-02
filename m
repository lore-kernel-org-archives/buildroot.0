Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCC1E7DF0A
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 16:53:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 266D140BD6;
	Mon,  2 Feb 2026 16:53:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrIGqZzr9wAV; Mon,  2 Feb 2026 16:53:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 552BB407FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770051226;
	bh=S0QdU/OA9wfUOPtagt5f31ot8miTwrnozKeFi6jXT/I=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b3r5swLYopuBMOma0vvwWq/56Y6YYgwxqIIZOdj8u2Dm55t7R+/DnvMY4rC1MDrdh
	 U2RCYjYj1TmXU/JhePfLyYR9AgetAloAepzDD2IfN7B+NV61ZQcWObg95JkZjANvTx
	 VP26E6yaMjuqKN9OhvwsI4vYx1Dmk41wJahUqC7FgEqlpVR4J0UDLMABhxU+PXwgU6
	 A1NnP73B0fi4D2ek8/L3cm58yDU6Z0taOvehK4K7e6WLmNEFrNtbEcsg2NJ9wG59y7
	 ka+9Rxe8HD0lsV9F/U4L9iy5qWinzhrl5R4w3Hp7xUaME33VA2y58kH1bri3KJ0uR/
	 CBSrLSN7SmFNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 552BB407FC;
	Mon,  2 Feb 2026 16:53:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9502F149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 770A140332
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EdO3xsRfA5u2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 16:53:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897794032E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 897794032E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 16:53:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A09B863DE; Mon,  2 Feb 2026 16:53:44 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 2 Feb 2026 17:51:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb8ee9f7fdd0bddda62e72fa0c5c47f4e1f4b39c
X-Git-Newrev: c740aaba8a0f772770e2056503b49390923bb919
X-Patchwork-Hint: ignore
Message-Id: <20260202165344.6A09B863DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/manual: replace bulix paste with sr.ht
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=c740aaba8a0f772770e2056503b49390923bb919
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http://code.bulix.org/ is no longer responding.
Fix paste list formatting.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/manual/contribute.adoc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
index c17f1619b4..f22164991f 100644
--- a/docs/manual/contribute.adoc
+++ b/docs/manual/contribute.adoc
@@ -559,8 +559,9 @@ If some of these details are too large, do not hesitate to use a
 pastebin service. Note that not all available pastebin services will
 preserve Unix-style line terminators when downloading raw pastes.
 Following pastebin services are known to work correctly:
+
 - https://gist.github.com/
-- http://code.bulix.org/
+- https://paste.sr.ht/
 
 === Using the runtime tests framework
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
