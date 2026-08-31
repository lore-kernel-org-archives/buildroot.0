Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2BEC61DE8
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 06:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1389240561;
	Mon, 31 Aug 2026 06:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBzQviGIL7jU; Mon, 31 Aug 2026 06:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788156027;
	bh=/Fk6kXra3FGIjcWgi6ybTuctsyEBLjZTeUZzQjLlFEA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hkzH8+bLb8xxDhljqJFhiSxuaUPOrbMswZFXpHuJo72A4W8wvIew/8MpwelvgU15+
	 Ev4XIDdv2CRbyBaAyjKLI1LBKj9Wm81LSerzuUS1Hw3a9q57AbFzeEfRLA+BYnrI78
	 MlfgXNpJUV/9Y8CkdCG7BYw0aEyMtfHRMNH1eMac6SlRNbNgHkOErM+SBZsvJ6c1kM
	 /67UU+0OGqbTu3qe6smMp4Am3HfpewXh35wem72Yk3Vswgzwdny/gJ6Sm7SxuUlm4M
	 BSHHXo2AjXyzKXwDyvIgcXJJAXTZxHiukd2PJ4Begl3kAgVenGVV10UsYmNYB/cBLM
	 3NeG7Ai6mapdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5714840510;
	Mon, 31 Aug 2026 06:00:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D61A355
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F39740510
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pA0beN-n00pI for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 06:00:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0CA40503
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 06:00:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D19EE92B6D; Mon, 31 Aug 2026 05:59:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 31 Aug 2026 07:59:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2d7d9d8200232bce215d87cadda443ba74308f01
X-Git-Newrev: 2eefcb245fa5da3c9f469bc7478a524b7bc1e6db
X-Patchwork-Hint: ignore
Message-Id: <20260831055926.D19EE92B6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] docs/website: patchwork is now at
 patchwork.buildroot.org
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2eefcb245fa5da3c9f469bc7478a524b7bc1e6db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
but we are now running our own instance, so let's adjust the links in
the website accordingly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 docs/website/contribute.html | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/website/contribute.html b/docs/website/contribute.html
index c05bdda62d..8da371cf01 100644
--- a/docs/website/contribute.html
+++ b/docs/website/contribute.html
@@ -18,7 +18,7 @@
 	    autobuild failures</a></li>
 	<li>Reviewing and testing patches sent by other developers. See the
 	  <a href="https://lists.buildroot.org/mailman/listinfo/buildroot">mailing list
-	  </a> or <a href="https://patchwork.ozlabs.org/project/buildroot/list/">
+	  </a> or <a href="https://patchwork.buildroot.org/project/buildroot/list/">
 	    patchwork</a>.</li>
 	<li>Working on items from the
 	  <a href="https://www.elinux.org/Buildroot#Todo_list">TODO list</a></li>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
