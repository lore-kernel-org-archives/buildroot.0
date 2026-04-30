Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9D2CD3439
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D94A61522;
	Mon,  4 May 2026 14:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kW8Wumen8qSh; Mon,  4 May 2026 14:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F4BA61551
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906118;
	bh=evlBY42sZDs3ua/wITG2dJB3/3lm1Vq51tiRE1uxwMw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GjPm2mtUNNmKMzduVSclv1Iexkd2BjVDKKFdx5CbOYIQ7027SOaFJGGhLk2p5+VVl
	 XyxS4aUA+h2cice7yh7JR3uCK5ybcuFlsigerlsZcCelrp1mSFr3cXp9RBvifCEt9f
	 R58do/CftgLjrZ6bdQeBfzf49ewzN90LspiZBz9gC3zfmnFClTH9+BXUahnm0/eQDX
	 rN7UZiYCeoD9OhAxKFgRXqYmSIC4H+brkmN2/HxnEp5B1cCqdPanVRfWXDYhpm3rx1
	 p7q1OnBWBrSxk//KacOwAMRZwvlq7D74zHQAA+/zJKiGogYNEK/angsGf42RFAQAPO
	 u7omJ/3FNbxNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F4BA61551;
	Mon,  4 May 2026 14:48:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80DB4190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D82A6155B
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JoWsgMiP_PeO for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC1E615AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC1E615AC
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:48:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D3F3F8423F; Mon,  4 May 2026 14:48:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:47:36 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 1c6afcd9f15b4cacf08f2b05f3f324d3434c4eb2
X-Git-Newrev: e396852da5f8d133616abe00f3449d6bd898371c
X-Patchwork-Hint: ignore
Message-Id: <20260504144833.D3F3F8423F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/libpjsip:
 security bump version to 2.16
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e396852da5f8d133616abe00f3449d6bd898371c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://github.com/pjsip/pjproject/releases/tag/2.16

Fixes CVE-2025-65102:
https://github.com/pjsip/pjproject/security/advisories/GHSA-w5vr-39x7-h8g5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a266be923f5a8077d40b5c65c4e23138ddce3a63)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpjsip/libpjsip.hash | 2 +-
 package/libpjsip/libpjsip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpjsip/libpjsip.hash b/package/libpjsip/libpjsip.hash
index e85d1f47b4..65f52bf3b1 100644
--- a/package/libpjsip/libpjsip.hash
+++ b/package/libpjsip/libpjsip.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8f3bd99caf003f96ed8038b8a36031eb9d8cd9eaea1eaff7e01c2eef6bd55706  pjproject-2.15.1.tar.gz
+sha256  3af2e481d51aaa095897820fa2ee26c30e530590c6ca56d23e4133bbdad369eb  pjproject-2.16.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 69b3c1cffc..8cea8e3abc 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPJSIP_VERSION = 2.15.1
+LIBPJSIP_VERSION = 2.16
 LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.gz
 LIBPJSIP_SITE = $(call github,pjsip,pjproject,$(LIBPJSIP_VERSION))
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
