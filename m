Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E503ACD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 19:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B61B040BDD;
	Tue,  5 May 2026 19:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWLsjfghFeqF; Tue,  5 May 2026 19:54:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EACD340BBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778010846;
	bh=+0nNKXlt567gHF3rwKnP3FcRsz+IXREiYMKvNMosd3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W5Mt6PgVo2DrgBEsjNZgVrYjveY5+bk+oG71uD6BOImdBzhWOFJa8adPTAvB/bPUS
	 7e9C0f2/hzLrl1iSVu+dR8qwndeEDeQ8dm1XXIUZ092vUIgYEi12RJ+9nbqUSvJH+R
	 QaYDnGtFwObSBbrUFJ8EjuogeEgYlV/41ZcXnlu5oRAT7ENJRXpX01huh5CeV9+1ew
	 0JP62wnqs17vcF/RWEy2Wu5kH/sORGam7jp1t4APCUjL/jFv4V7xUmSmo3Upg6sfwb
	 QKfM01oe0eMjHQ5fxad/x8bmpn9dn4ku4lLFthhUje5ubU5SPyfVhkvY5WNPhpsQq7
	 HsH9fHeLeuIAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACD340BBF;
	Tue,  5 May 2026 19:54:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 18EDC2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD44E405AC
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QC1By3VQxOmK for <buildroot@buildroot.org>;
 Tue,  5 May 2026 19:53:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C10E840BAC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C10E840BAC
 for <buildroot@buildroot.org>; Tue,  5 May 2026 19:53:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D8E4B84649; Tue,  5 May 2026 19:53:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 21:53:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7961bd10b968cce52b118aedfeda09af1bd296ba
X-Git-Newrev: 2ab95cf0eea0349f91b82faf7308ad04ba9bcabb
X-Patchwork-Hint: ignore
Message-Id: <20260505195355.D8E4B84649@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux/Config.in: add kernel.org URL to help
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2ab95cf0eea0349f91b82faf7308ad04ba9bcabb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
[Arnout: add it to the main help text, where it belongs]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 linux/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index cc2228d5aa..46532bf625 100644
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
