Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADADACD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 15:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12F2741E1F;
	Fri, 29 May 2026 15:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dZjSK2WmNoXz; Fri, 29 May 2026 15:31:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4830A419CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780068710;
	bh=6otFZEcjkSgLnF2juS+y7hj+d9A5TgHCMtV+dldZJVc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Tiddr1xpJUPGtcd4+DzkgOadBVEk/8hrnQXz7FuezNY0JNFjSRynoOQ0zf+SMGhEZ
	 re+yQQ/XmkkIY/qotybsSoBGoBz32cwT9CTubp/Pi2Cq/SBEx9b/10Wwdl/lk2ZYpP
	 M1qoFicNufu2Uu1YqBxUkeP455df/5y/4ZqQHVfV8nWp1+AwoKAnW2MZNmRf230nns
	 kCJR89RLrGu+9UfvAkb19079fvDxv14krqdnKCD2zeBE7KHBn5Z7wFXtRj9pZpXdTX
	 jMd8swVtPTZ31+JC30SA+hU3V8ADGKonkbVE2/Wm5aQ9Rd519GFOzbX3CVvxzom7Kc
	 kLgrODl7Ifnlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4830A419CD;
	Fri, 29 May 2026 15:31:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05389288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7937419CD
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RRZZExrW0ZaD for <buildroot@buildroot.org>;
 Fri, 29 May 2026 15:31:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 453AF4123D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 453AF4123D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 15:31:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1925873C6; Fri, 29 May 2026 15:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:31:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e46783d3a0f56c93c2ad28236162ff4b05c134df
X-Git-Newrev: 646356162b321df8bf20f622c98e0b8495ed86fe
X-Patchwork-Hint: ignore
Message-Id: <20260529153135.B1925873C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/scripts/cve-check: add indication
 how to run
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/646356162b321df8bf20f622c98e0b8495ed86fe
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Always run this script from the output of 'generate-cyclonedx'. Do not re-run
this script over an already analysed SBOM.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/cve-check | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/support/scripts/cve-check b/support/scripts/cve-check
index 5047523ade..0d0ad833a2 100755
--- a/support/scripts/cve-check
+++ b/support/scripts/cve-check
@@ -29,6 +29,9 @@ database.
 
 The NVD database is cloned using a mirror of it and the content is compared
 locally.
+
+Always run this script from the output of 'generate-cyclonedx'. Do not re-run
+this script over an already analysed SBOM.
 """
 
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
