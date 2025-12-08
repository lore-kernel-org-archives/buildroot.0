Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593D5D3B7EA
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 22:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C2D680F0B;
	Mon,  8 Dec 2025 22:44:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hiFR7CG_m8Md; Mon,  8 Dec 2025 22:44:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C11980E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765233886;
	bh=FIT3Yz/bIchotVEJQZJQdqHjE4nLsC4Yung8c0u7qVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iQqeMK9j0LQbBUKOBDTfUoPMCot5l7+TdA+Szbq2k8riQ+pvCP/TtCya/dtYNnSVu
	 uPiNj290OpdQeaWv2v7eR9GyDbSJvLeEgQcNaoG0HMLokUzNpmDVxw13rqOWtLmG8s
	 u8Itlxzx71GPtKWU/Sbx2+BY9chPbCzCP3bC2tW0pY2HJETKoUqvXLzATiq6iqDMPY
	 l4JESFqKxdRkUv33GLcyrboX0EAan0/hZGkF5BxjhIMe9QK5PFop8V86SWCxlZsUN/
	 XrfNfawiEYzZXQSdDEBAhzQXvBubTNwL4TkBuacrax1pg5Y9U2WJ4cF3IPvREhU29Q
	 +pbym17A8ROcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C11980E91;
	Mon,  8 Dec 2025 22:44:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1B66E7
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:44:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7E7940760
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:44:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdY2sNrSVz7k for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 22:44:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA5CE40758
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA5CE40758
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 22:44:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 983FD86896; Mon,  8 Dec 2025 22:44:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Dec 2025 23:35:46 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d7f2a7b85b17a9e933805d01c03bdfff16c5a0e8
X-Git-Newrev: 478408964e7b478aa396fdcbbd1e1e5196ae20a8
X-Patchwork-Hint: ignore
Message-Id: <20251208224443.983FD86896@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/snagboot: bump to
 version 2.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=478408964e7b478aa396fdcbbd1e1e5196ae20a8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes between 2.4 and 2.5:

- snagrecover:
    add support for bcm2711/12 platforms
    add support for several AMLogic platforms
    add support for AM654x platforms
    confirm Allwinner A133 support

- snagfactory:
    allow changing target device mid-pipeline
    tone down UI colors, increase button sizes

No changes affect the packaging or dependencies.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/snagboot/snagboot.hash | 2 +-
 package/snagboot/snagboot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/snagboot/snagboot.hash b/package/snagboot/snagboot.hash
index e5978617aa..6fff4c94c1 100644
--- a/package/snagboot/snagboot.hash
+++ b/package/snagboot/snagboot.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a3ace4245472141c0cdcd8e095530652ce95d804f7515a29613ddb07d2c32033  snagboot-2.4.tar.gz
+sha256  03b3793feb9d926f5cb4f1c89f7a22075247fe91942c7be13065b6b62029376e  snagboot-2.5.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/snagboot/snagboot.mk b/package/snagboot/snagboot.mk
index 12f77c0b14..64b8b6fcc9 100644
--- a/package/snagboot/snagboot.mk
+++ b/package/snagboot/snagboot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNAGBOOT_VERSION = 2.4
+SNAGBOOT_VERSION = 2.5
 SNAGBOOT_SITE = $(call github,bootlin,snagboot,v$(SNAGBOOT_VERSION))
 SNAGBOOT_LICENSE = GPL-2.0
 SNAGBOOT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
