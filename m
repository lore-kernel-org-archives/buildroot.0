Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32619D4337C
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72B6582A2D;
	Fri, 12 Dec 2025 07:56:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o1lz_UpV-5Kp; Fri, 12 Dec 2025 07:56:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E534F82AEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526160;
	bh=RyDICKSvRMoeZL6x8tsSO73ILU1KjTDL+IhYgbzKfE8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=K5QS5up0ca4isYqYDoUGfJfAAYGPbjvvnzpnbhhPkYKC3ujs14mFUpbYT3SHNAe0J
	 KiI9WYLqSkavsTzPD78GmHTCU4fcm6Pe4uj1bLe8fZxYfG+Gk6lpX8KN8bZvDGLWKL
	 4oR8NqWfg/pH9kL+uE6u8FeXw6fKuazuT8lHhrD0CoNfbngCn6vlBXnhH+tmpD2xWl
	 SNKF2RyKsoXqdTwBMIS4eVXn96lHw4rghCmv0fkiAP+WUhl6IcDVWMxQjrKHz16rUZ
	 7xDZEc5NrcQhPpi4UNxZp5rFHrWnM2qs8Epn4k8NGzfxBOJjoS5ZgNIzXKj/dAt+n2
	 fqQwhSvq15v4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E534F82AEF;
	Fri, 12 Dec 2025 07:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01923E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1BBEF813DC
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y8kiAXxatx3Z for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CC2780C71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7CC2780C71
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C21586C9E; Fri, 12 Dec 2025 07:55:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Dec 2025 21:20:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0c0ca5de7e96a8f7ab4b9f1759e7d34e2e12cf6
X-Git-Newrev: b9b8d6d1ca5535c1136de28d09259f7158bafd6a
X-Patchwork-Hint: ignore
Message-Id: <20251212075536.7C21586C9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/qoriq-ddr-phy-binary: bump version
 to lf-6.12.34-2.1.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b9b8d6d1ca5535c1136de28d09259f7158bafd6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

No change.

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 439d8e3a8f..6ae08a3152 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  0837d5752a89ae7b9779cceac4aa758aad89688154a6a110a53fe16cbe6adca4  qoriq-ddr-phy-binary-lf-6.12.20-2.0.0.tar.gz
+sha256  d5a5a9b7f25295e9e41c8e7c18a1986d1b59ebe519113ed6b45ede51639da92f  qoriq-ddr-phy-binary-lf-6.12.34-2.1.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 665b653d20..04cedbbe00 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.20-2.0.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.34-2.1.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
