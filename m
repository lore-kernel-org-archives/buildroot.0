Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40478D3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 21:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5831F4062F;
	Sun, 28 Dec 2025 21:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H5z3OdH65ZKc; Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A19E405F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766955628;
	bh=qw0nQI1TOBoLlM2Jl3NcZe8q71Gr9AjY/+br16CvRgY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dajtq2jE07Ly+Bkh85tKx6gJnYSbD0uS07De/EZvnD1MpuHiyNR4pSN8ksg8iQMOO
	 WJkLDzwNDHhJfbhWM561NbZIpfkvNVc2ogm9WJF0MoNVRSovoOIDdJ5Ku1gh77ltbv
	 TenYVlXMtuN5rU1bja+6imitDJgsJqosVXq0ENFuu/KPvhuHJ12gC3+7j+rGHMrp7e
	 WfTaPPvYxXH5K8RMxDt51z74jnN/SFnQD4Tzf3qTMOoQXdoKo2zXeb7UpMa+iguO5I
	 rJWOHO3lKiFnsB+Dg3LG6UA88TStXZWKf9hoWryw0ZpDb1KuikMOh6Zg0Izqzxx9ao
	 E6Wgm0JPx+3zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A19E405F1;
	Sun, 28 Dec 2025 21:00:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 32A5DB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30C828144F
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3eFreyScyAW for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D26C81448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D26C81448
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6804587971; Sun, 28 Dec 2025 21:00:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 22:00:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d464e5e856cd3cf5c8e1802dc6bbb662f2329eb3
X-Git-Newrev: 04d80d13ec7f84e8074ad4f886da06a8e0ca0e86
X-Patchwork-Hint: ignore
Message-Id: <20251228210024.6804587971@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/graphicsmagick: add CVE trailer in
 patch
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

commit: https://git.buildroot.net/buildroot/commit/?id=04d80d13ec7f84e8074ad4f886da06a8e0ca0e86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
