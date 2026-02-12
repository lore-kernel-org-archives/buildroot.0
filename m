Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1C8EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4529840017;
	Fri, 13 Feb 2026 19:36:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FdIPZhz5MCS4; Fri, 13 Feb 2026 19:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A8164021B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011369;
	bh=PC1LkAuSQEt1Ic8n7SYBkYDcq1TeypYzxTqKeKTp5OM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dc4sBwRCS4lBBx24nVxURVlWUHxIBexDjfQMzRqmLwYNNVYqL38ZRqqEaCoQvmJNi
	 isDPuefjGZX1DXWYoNUjwZhuN/kZZ0wfwBHm3nl/ACYQ1DvGI9i8K4zUKLSCiB2UqV
	 jeq5xInYf2r5pSJr1xpZp7gzaAQTDafxTr46s69DNrVbwEngvgkfu9bmUyQuoi+SgE
	 4E/zJDtVdp9k5RLo2UrkmWVkJizqTwTR4rE27vK1DSfP5b15azVlJP+uBpc31mP1Dh
	 4HxhdI1NexaWxfPF3O9Uk+a5WzPkTmjtuE5rFWYTyER3y4MImWmS/9bJ2kxJVmg4VX
	 GtR8KaoF+4mvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A8164021B;
	Fri, 13 Feb 2026 19:36:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120DC31F
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 809B18451C
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7pZGBg7N5h7p for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7588844EA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7588844EA
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCAB983D57; Fri, 13 Feb 2026 19:35:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:23:28 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 7a19511a9086bf123a5057beedc5c94bbb0f5d42
X-Git-Newrev: 7de76477128d5f8a07f837bae677b2548ead3f64
X-Patchwork-Hint: ignore
Message-Id: <20260213193526.BCAB983D57@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] docs/manual: replace
 bulix paste with sr.ht
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7de76477128d5f8a07f837bae677b2548ead3f64
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

http://code.bulix.org/ is no longer responding.
Fix paste list formatting.

Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c740aaba8a0f772770e2056503b49390923bb919)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
