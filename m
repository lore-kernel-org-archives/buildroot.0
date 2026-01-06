Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0342D0D155
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8489741439;
	Wed,  7 Jan 2026 18:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rx128kgqEvEJ; Wed,  7 Jan 2026 18:02:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68B9A41496
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808959;
	bh=8OlzyuoNGp03HxprQW5UnnbQARGNfutYZjpMf+lH8q8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K788KI4ORWv4+q55ETu7bL8Fcl/rU+15lwF2Nw+CdM3PiyYM7w/WwS3xixtRjeZnh
	 KOUgsThEmp1ixjYyFMnsZmJyQKgiOfXNBeEhmkrzBA/MTTbauxhsb93wERkOQi8Pml
	 blpfXRmU/4S4m1XSycEDJFPjy3jitSEcSQivFdJ3J40Bg4nYMBlJ8A9vdqlka7ydT5
	 WQ7TxFpw3SI+ONt0TQc6QK16LQwCmNwCAuCeomryJqwmcuqhrTFYWnCVrlBMaO5Hd+
	 /SxQcJh/8QTOWOEUMXG9UI3kYGdJlgFMJYH/q+gxIBJ/GSwgweRK/k1HeG6WRPp6Jm
	 VXtrAyUZ7LEXQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68B9A41496;
	Wed,  7 Jan 2026 18:02:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01DF825B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9C38113E
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d-trKDRqvfpq for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A545B8110B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A545B8110B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A38A180333; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:56:53 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 4618db63e0862d59b232b216174908dc502b9a89
X-Git-Newrev: 160e25159f5cca8dd63be44fed436891393ce530
X-Patchwork-Hint: ignore
Message-Id: <20260107180113.A38A180333@busybox.osuosl.org>
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

commit: https://git.buildroot.net/buildroot/commit/?id=160e25159f5cca8dd63be44fed436891393ce530
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patch header.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0669124d77f5b4980398a792914065736df676eb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0013-Properly-check-authorization-on-incoming-guestOps-re.patch      | 1 +
 package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
index 91e379b9a6..c257e77504 100644
--- a/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
+++ b/package/openvmtools/0013-Properly-check-authorization-on-incoming-guestOps-re.patch
@@ -7,6 +7,7 @@ Subject: [PATCH] Properly check authorization on incoming guestOps requests
 Fix public pipe request checks.  Only a SessionRequest type should
 be accepted on the public pipe.
 
+CVE: CVE-2022-31676
 Upstream: https://github.com/vmware/open-vm-tools/blob/CVE-2022-31676.patch/1205-Properly-check-authorization-on-incoming-guestOps-re.patch
 Signed-off-by: Stefan Agner <stefan@agner.ch>
 ---
diff --git a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
index f47fabb71b..48962857ba 100644
--- a/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
+++ b/package/openvmtools/0014-CVE-2025-22247-1100-1225-VGAuth-updates.patch
@@ -19,6 +19,7 @@ The 2025 Broadcom copyright information update is not part of this
 patch set to allow the patch to be easily applied to previous
 open-vm-tools source releases.
 
+CVE: CVE-2025-22247
 Upstream: https://github.com/vmware/blob/CVE-2025-22247.patch/CVE-2025-22247-1100-1225-VGAuth-updates.patch
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
