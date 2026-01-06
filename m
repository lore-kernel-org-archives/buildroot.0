Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA6FD0D153
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55E9D40B21;
	Wed,  7 Jan 2026 17:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3xdoNiVjagjL; Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23BC140AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808074;
	bh=wexXLYADb88FgGWCNKN/Omw90NYATz8D4ZS6jV2ZnXg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VfHAfjwDbDkUpMX08TmjAJne2RLfgloOaYvSOCdPUxhhDQfvCw8TYCGTk7JDGtqKQ
	 PGvLvKC9cT/mRSVc1+C8ZyTsfptc6R8xI/AMp5sWQzgrsUPgH1ZheNEuB7fbSdwaHz
	 7KqqBOAJGbv1Y3oGd+L1wY2rJvZsmo4UTTrNx2omCyPg3QBenjpFyu+AcB3mQaGc8H
	 KvsqJKLvk3r+epsmquARzU9jAaNDymVTP89DvIkK8zYrDWnJkL7McnTwa4IHSxxoP2
	 D3H1xr6yZHbwH5aR88zqP+Rl+/R58eQK8mE1LRXcyQjSV5+0YzpNLF00OReFE0+t8m
	 5HooaY6ci1/yA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23BC140AFD;
	Wed,  7 Jan 2026 17:47:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D3A19ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF10980C92
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eyw6AdhH2kju for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AB4580BAE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8AB4580BAE
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8973786D3D; Wed,  7 Jan 2026 17:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:13 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8ca029e27a02bbfb5b81946f5fef00fe61356231
X-Git-Newrev: b97e9adb890b52d7b1a5d430e6fb976535bfcc80
X-Patchwork-Hint: ignore
Message-Id: <20260107174642.8973786D3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/graphicsmagick:
 add CVE trailer in patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=b97e9adb890b52d7b1a5d430e6fb976535bfcc80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 04d80d13ec7f84e8074ad4f886da06a8e0ca0e86)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch        | 1 +
 .../0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch        | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
index 275738a71a..56122e466e 100644
--- a/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
+++ b/package/graphicsmagick/0001-ReadJXLImage-Apply-image-dimension-resource-limits.patch
@@ -6,6 +6,7 @@
 # Parent  db3ff8d00c28c38895e1600a28706ce251dac570
 ReadJXLImage(): Apply image dimension resource limits. Addresses oss-fuzz Issue 69728
 
+CVE: CVE-2025-27795
 Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/9bbae7314e3c3b19b830591010ed90bb136b9c42
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [Peter: drop ChangeLog/version changes]
diff --git a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
index d1cc795b4c..004594523c 100644
--- a/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
+++ b/package/graphicsmagick/0002-ReadJXLImage-pixel_format-num_channels-needs-to-be.patch
@@ -6,6 +6,7 @@
 # Parent  036a1376a2a6dc9504c5148249cbd8feaef72de6
 ReadJXLImage(): pixel_format.num_channels needs to be 2 for grayscale matte.
 
+CVE: CVE-2025-32460
 Upstream: https://foss.heptapod.net/graphicsmagick/graphicsmagick/-/commit/8e56520435df50f618a03f2721a39a70a515f1cb
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 [Peter: drop ChangeLog/version changes]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
