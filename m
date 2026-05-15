Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD563CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 986A7846EA;
	Fri, 15 May 2026 17:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UpeUT3104o93; Fri, 15 May 2026 17:47:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5C6984692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867229;
	bh=X8Y61i0kJTwUtX7dxD+a8f92E3j4XC/8eW/hp1//ptk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mg6jPZWMxMsuwqiVtRB7yJWLrOSBAHJDXRnV/FMSP9q02iu50DdDwP6hOdgLysMX6
	 cXa2Vnz/iBrjwu3JJgB7lx4HAClFmeOlazCVXuOY8v5/TUM+NrQg2JglKLmktctvwF
	 Iyjlr4ByHlO/oQs2eBPmjpL7Y6vIyT3ly8tdIodqhuOoqAwcaoeOZ8GKYge643HzfI
	 dzUaRH1wn1HCvZUAiqpDSYkKMe2wdH8J2TLNszaLlh/BGuBiH1eOrEeXYBKGSPLlbL
	 KtlC6C6YbMFHco6TFPWtJ9258IShByQ9EPuS7ApTaZo7qa42K9DhIb0UfnFwUKx17Z
	 0dG1w87PW3AZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5C6984692;
	Fri, 15 May 2026 17:47:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C39423F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FA0E40FB4
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wc0NcdLa0-oA for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC70040FA7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC70040FA7
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16509863D7; Fri, 15 May 2026 17:46:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:21:58 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 056588171daf829cd4ce72ea234aa1da27f43f1d
X-Git-Newrev: 6ea66ebd69fa5fa2d06562d24b3ea06bfcb877b5
X-Patchwork-Hint: ignore
Message-Id: <20260515174640.16509863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] linux/Config.in: add
 kernel.org URL to help
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ea66ebd69fa5fa2d06562d24b3ea06bfcb877b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Arnout: add it to the main help text, where it belongs]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 2ab95cf0eea0349f91b82faf7308ad04ba9bcabb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 33dbfe2148..04da548c17 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,6 +8,8 @@ config BR2_LINUX_KERNEL
 	  Enable this option if you want to build a Linux kernel for
 	  your embedded device
 
+	  https://www.kernel.org/
+
 if BR2_LINUX_KERNEL
 
 # Packages that need to have a kernel with support for loadable modules,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
