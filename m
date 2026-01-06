Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4D4D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33C5C40AE8;
	Wed,  7 Jan 2026 17:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKLKL-6h8MGk; Wed,  7 Jan 2026 17:47:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13CC140AE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808066;
	bh=4HANXLWJswYZBDynJ61gRrsfY9vXoP1ctH5bjCpQVgQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LgX7MGv82sT+Z2kdLGCJ8i6dt1vF+CVRgR9XYazEYc8OZe4T7E0L0rNBaXZifGkRA
	 Vr6yX0Z8Ns24rZ8SbU7LEZDKdGyCIhr4Gu0n6PaBiaYsMmTMB9/whetLHIBULYpXPK
	 a//1PGt674qOQt/rSXWHMIzXsiBOQIokFoupeQS9hOlE8IQNmsP3Kyuy7K2Y0YXeRH
	 gkdqnHVr/V0QaMLq/tAZNFbkmQv1WLRE5pS2FiYetGD2eYdQU6z4uFcqxKqlXeVpuE
	 1Ds9n6kGpYxif0oxGeuISUZQJdH7FP1T5oKihmy8bv+XB9rSvGaruv9Xcpjbx5YQCy
	 c7Yvi3ELDkMRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13CC140AE2;
	Wed,  7 Jan 2026 17:47:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0409525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 344314085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i34uEsdkaFSE for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4345140890
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4345140890
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 426C488367; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:19:20 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f27cf0d09a1f9564561ce4f9d997bf03e55b64b8
X-Git-Newrev: 2f7a2dcdd2377ebd7d37cfc1c907842e185c97a0
X-Patchwork-Hint: ignore
Message-Id: <20260107174644.426C488367@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/sox: add CVE
 trailer in patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=2f7a2dcdd2377ebd7d37cfc1c907842e185c97a0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patches header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9d0e4db4c458ebe202b32f52ca96ca2e3386a1b6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch   | 2 ++
 package/sox/0007-hcom-validate-dictsize.patch                         | 4 ++++
 package/sox/0008-phere-avoid-integer-underflow.patch                  | 1 +
 .../0009-formats-aiff-reject-implausibly-large-number-of-chan.patch   | 2 ++
 package/sox/0010-formats-reject-implausible-rate.patch                | 1 +
 .../0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch   | 1 +
 6 files changed, 11 insertions(+)

diff --git a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
index 94298b7ae5..2b516fa4c3 100644
--- a/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
+++ b/package/sox/0006-voc-word-width-should-never-be-0-to-avoid-division-b.patch
@@ -8,6 +8,8 @@ Bug-Debian: https://bugs.debian.org/1010374
 
 This patch fixes both CVE-2021-3643 and CVE-2021-23210.
 
+CVE: CVE-2021-3643
+CVE: CVE-2021-23210
 Upstream: https://sourceforge.net/p/sox/bugs/351/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0007-hcom-validate-dictsize.patch b/package/sox/0007-hcom-validate-dictsize.patch
index 722b64675b..c221f74c59 100644
--- a/package/sox/0007-hcom-validate-dictsize.patch
+++ b/package/sox/0007-hcom-validate-dictsize.patch
@@ -10,6 +10,10 @@ Bug-Debian: https://bugs.debian.org/1021134
 
 This patch fixes both CVE-2021-23159 and CVE-2021-23172.
 
+CVE: CVE-2021-23159
+CVE: CVE-2021-23172
+CVE: CVE-2023-34318
+CVE: CVE-2023-34432
 Upstream: https://sourceforge.net/p/sox/bugs/350/
 Upstream: https://sourceforge.net/p/sox/bugs/352/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
diff --git a/package/sox/0008-phere-avoid-integer-underflow.patch b/package/sox/0008-phere-avoid-integer-underflow.patch
index 7c59896660..cc3cc533e7 100644
--- a/package/sox/0008-phere-avoid-integer-underflow.patch
+++ b/package/sox/0008-phere-avoid-integer-underflow.patch
@@ -7,6 +7,7 @@ Link: https://talosintelligence.com/vulnerability_reports/TALOS-2021-1434
 Bug: https://sourceforge.net/p/sox/bugs/362/
 Bug-Debian: https://bugs.debian.org/1012138
 
+CVE: CVE-2021-40426
 Upstream: https://sourceforge.net/p/sox/bugs/362/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
index fd1d210da1..0489d82601 100644
--- a/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
+++ b/package/sox/0009-formats-aiff-reject-implausibly-large-number-of-chan.patch
@@ -6,6 +6,8 @@ Subject: [PATCH] formats+aiff: reject implausibly large number of channels
 Bug: https://sourceforge.net/p/sox/bugs/360/
 Bug-Debian: https://bugs.debian.org/1012516
 
+CVE: CVE-2022-31650
+CVE: CVE-2023-26590
 Upstream: https://sourceforge.net/p/sox/bugs/360/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0010-formats-reject-implausible-rate.patch b/package/sox/0010-formats-reject-implausible-rate.patch
index 5e60b62011..0805c2f958 100644
--- a/package/sox/0010-formats-reject-implausible-rate.patch
+++ b/package/sox/0010-formats-reject-implausible-rate.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] formats: reject implausible rate
 Bug: https://sourceforge.net/p/sox/bugs/360/
 Bug-Debian: https://bugs.debian.org/1012516
 
+CVE: CVE-2022-31651
 Upstream: https://sourceforge.net/p/sox/bugs/360/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
diff --git a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
index b67d23c12d..7abdf54feb 100644
--- a/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
+++ b/package/sox/0011-CVE-2023-32627-Filter-null-sampling-rate-in-VOC-code.patch
@@ -10,6 +10,7 @@ bug-redhat: https://bugzilla.redhat.com/show_bug.cgi?id=2212282
 bug-debian: https://bugs.debian.org/1041112
 bug-debian-security: https://security-tracker.debian.org/tracker/CVE-2023-32627
 
+CVE: CVE-2023-32627
 Upstream: https://sourceforge.net/p/sox/bugs/369/
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
