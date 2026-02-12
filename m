Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7E6EF99D2
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B16741F8E;
	Fri, 13 Feb 2026 19:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be39EEzuSVy1; Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6237D41E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011463;
	bh=vEf0q7Y9siyMD6b4H3VG27xfdbYVwjwib069uU9+W10=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MgVPPtU0+D44MsGq9paKoUBvSvOYHyaodR0EvxxQw29Eh2/abvaBTjcJJnRaN3+i+
	 GkwsZ2qt/92oYbIU0trEjf/85pBQ4+8XqnCrJJ9GE+ryp/5tRNDHtENd9N37Br0KCY
	 +isdWwJTipP5azcTnLAfSukFSbkncq2dneRxMlFpXXfRhx90HXOjjppIQTXh+etcgc
	 0w1qTkLmMQKIm1K2JhS8IMQNN/j8NqJLj4/G6QMcfx7+6eJHzixyhOSZjJqRsQnYEL
	 FPJv5TWoC3QkhkpzQQGH1p+E9kje7dVjOYQQQO8n2GRgMnXFCnUPSLCSo1he6fmzkE
	 wWSEchYDEM/OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6237D41E54;
	Fri, 13 Feb 2026 19:37:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B43FEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0472412EB
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id przgyCOrK1tg for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:37:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E9A412A7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98E9A412A7
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D77C84169; Fri, 13 Feb 2026 19:37:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 14:23:31 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 3824f14d6f40702f5d10d8a258f88cc069e1ab64
X-Git-Newrev: 308c7de0213eb3a5f640faf62daf7241b8301be4
X-Patchwork-Hint: ignore
Message-Id: <20260213193701.8D77C84169@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] docs/manual: replace
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/308c7de0213eb3a5f640faf62daf7241b8301be4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

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
