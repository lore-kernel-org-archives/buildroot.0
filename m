Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24E1ED0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F055C82E1A;
	Wed,  7 Jan 2026 18:02:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muAonvmTQ5x1; Wed,  7 Jan 2026 18:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0608381351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808937;
	bh=inMZQR/rWB7y9vqEgT+Zv13kqgM2bAweyXAMV7k8c3M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P8d4E+kJOQTuBcGwH+g3wMrMlb0jFBsEbBdn1SZ8AKUrfaw3h3ezolbnnZlWbDtmE
	 0AjQDIOIbMCFItboQVcl9nmSj6i2busLCSu+X7KA39exWaoOT1Q5oT4kRpv1XmBtY6
	 5KyJbDd/HMm5zeDHg4TIf9stIgM220l+tyQApYJj86gxsZVvWWQrpHwOrErSo+CcLI
	 wpf06/16a7ps3QcoOUGwhCow9R79p8mRpni/I7LHIBnca1fDin2UlMBomumMONGGma
	 3Ll/EHGK97nh64fB/d1N/IBDhm2WHiGjxCzOWEeVlxB8V8D4NihPXKCyr/kWyWye82
	 2EK125J/mb9/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0608381351;
	Wed,  7 Jan 2026 18:02:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73C0425B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D25016083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S9e3XqSZgkHD for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A1486085E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A1486085E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59C74811C5; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:03:02 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 618b0c68222f0a3e93360cd20a791324f827a0dd
X-Git-Newrev: ed0fb7130fd72ead525d58bcf48826b61c555a19
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.59C74811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/sox: add CVE
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed0fb7130fd72ead525d58bcf48826b61c555a19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

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
