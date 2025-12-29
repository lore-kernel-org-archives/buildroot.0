Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446E2E92724
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 14:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF32280854;
	Mon, 29 Dec 2025 14:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HwdA49wp8f7; Mon, 29 Dec 2025 14:05:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0093780A72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767017152;
	bh=8shYf1EZtArASzayOW58Vxy2lvDJZFlKsmBKtZJI4uw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jiRelk5bJ1rn2/ACx3k2Dr/Ubj777tInHndwnw726vnJNO0bZtgvdMK7E2V3QbN6g
	 DG1jtBMHZQft3lpmpyf9XH1TzW8ukM/YsWiaj0rJg6soozI5jdw7elIQIJrUY8t6vY
	 dF4hBJT26eTl4H4HgOTppjzbGlcNqT6uVl0ZFMVJ4cEYLk3PRfgqWDNCNPxcQsp/Cp
	 8EwyoNb/rjvSJ4hl93zC/SPkAcGzY6PFkwwJotEDE2W2wNwEHEEHyw7NN24qMcj2Ij
	 AJdVTiqpo9J7CWuk9n6JiCVc1buzVjVjJjk0Pf20jF0/sy0ugpQDhbyo10xAMRdOtm
	 hZVTNFRBsr7HA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0093780A72;
	Mon, 29 Dec 2025 14:05:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 32C3DB9
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 196DC60AED
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:05:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id taVz1_zQrlid for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 14:05:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D04360AF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D04360AF5
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 14:05:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 579D287A78; Mon, 29 Dec 2025 14:05:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 14:58:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 121a740ea7e7e19135b41f24ac539d37cb37b0cc
X-Git-Newrev: f223fe1057f344a903feeafab666bc7dc6121a86
X-Patchwork-Hint: ignore
Message-Id: <20251229140550.579D287A78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 15.2.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=f223fe1057f344a903feeafab666bc7dc6121a86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.hash | 2 +-
 package/armadillo/armadillo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index adb21b66c7..b830037783 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  8ee01cd4da55bc07b7bc7d3cba702ac6e8137d384d7e7185f3f4ae1f0c79704f  armadillo-15.2.2.tar.xz
+sha256  0182d67d6949e4347a0bc62fc8c2793be7eb203c71f19edff93f8c45fd4a8190  armadillo-15.2.3.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index cb83ee9e17..2df7f10375 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 15.2.2
+ARMADILLO_VERSION = 15.2.3
 ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
 ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
