Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EDD6D0D156
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EDC1415AB;
	Wed,  7 Jan 2026 18:03:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qTHhNYiEOk0B; Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48800415AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808990;
	bh=C+n3CWwDl069TNDPJSYkxdTD20Iaz37zITjMa75C/r8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fCAJUG4/kByfQoEOYTH/g8kWczO2NCaOLVPKcGieuLMwqWJ9MjhEuKnmwkPFi3RlB
	 /V4LXy+75q/I4FL2OvT3cm49/S8EuepznrdzsvRdyR/17r7a+YmjprDDSWKW9SCbjD
	 OOMW5KulFFgJOyeAymyeMOu5sDC0scmlf9R7k4KMWDHUw+2sbd7AOc7RWDYSWm1DWA
	 q6yjyVJBkm6Dj1rvz5EB0OXIpX33gCMdqod59u7on2t93CzZGd9a/1OU2xlNbc4kcS
	 l8mRH6lp19HE+IkMdCY1MKAGzs7bV3rxm7JmzZvRTSVMRxLAgR7x7fNEsONYacNyWT
	 mfyKBgC7b63Dg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48800415AD;
	Wed,  7 Jan 2026 18:03:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0330A25B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E25378116F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tyqIsugaiv_j for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C050781091
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C050781091
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE75980333; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:57:09 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 6a50b980295fefadfb8bf8144e8ab8149c39e28a
X-Git-Newrev: 7db91bf950cf2e6134df8ce39882282561cfc70c
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.BE75980333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/graphicsmagick:
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

commit: https://git.buildroot.net/buildroot/commit/?id=7db91bf950cf2e6134df8ce39882282561cfc70c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
