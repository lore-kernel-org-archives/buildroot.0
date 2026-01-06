Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 066E2D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE87A4150E;
	Wed,  7 Jan 2026 18:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QlfuYIyKM4s; Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1AE7414F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808968;
	bh=qTkxuVVMZiMNuO4AAsctxxoMmCmyQhM0TCae9x/CKO4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=DnmhpcQMr2y89olqjAOgd3L5gxdkJIETze7LoxfpJOfLgdGGCZcDshOIVFLISCdae
	 L+V/RTuVROt5DsLxGyCn9MSY8D7nBHB1GmvTOEesr241Kvfkbkv6WfcQVUVAa7gQAp
	 HrWUs+ra0Yxssqc1vrLjb5MQZU7IBD7zHt8kISsb4QWobSr2Nkp8uEL5cqpSaYPJc6
	 8J2SfpstKlkYxhaWscTzLQ/fqSCqMOfKFxHNSWrC9799M0hic72rwhnEXLuyEsXPFJ
	 B+XGfJBK+Q/ekIgHWrWNi+ZRY0Y7EZ5/jvkybjeQMbehFog9ihRj0EwX11I0Fl+LlK
	 nZznJuH0TBPrg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1AE7414F8;
	Wed,  7 Jan 2026 18:02:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BA59ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46F1140D5C
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wf_NwZBVVeS1 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B36640A47
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B36640A47
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 09BF28039B; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:40 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 19f5ea0f924012b3608f3c11a8a1f83f30994ebd
X-Git-Newrev: ac7842ab6bcaf0346a9e2dfead5bdcf91bc9e1f9
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.09BF28039B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/openvmtools: add
 CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac7842ab6bcaf0346a9e2dfead5bdcf91bc9e1f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch fixes the information to the patch header to have a single
vulnerability per line.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96ba06347b33231a79541db516a3e45408a8ed68)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libsoup/0014-CVE-2025-32911.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libsoup/0014-CVE-2025-32911.patch b/package/libsoup/0014-CVE-2025-32911.patch
index 102acb4af3..2421e85201 100644
--- a/package/libsoup/0014-CVE-2025-32911.patch
+++ b/package/libsoup/0014-CVE-2025-32911.patch
@@ -3,7 +3,8 @@ From: Changqing Li <changqing.li@windriver.com>
 Date: Wed, 30 Apr 2025 14:59:55 +0800
 Subject: [PATCH] CVE-2025-32911
 
-CVE: CVE-2025-32911 CVE-2025-32913
+CVE: CVE-2025-32911
+CVE: CVE-2025-32913
 Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/422/commits]
 
 Upstream: https://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/libsoup/libsoup-2.4/0001-CVE-2025-32911.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
