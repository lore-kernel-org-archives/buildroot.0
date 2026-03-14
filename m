Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFE410854A8
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 20:46:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07324821BE;
	Sat, 14 Mar 2026 20:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qj5kEgMHOGt4; Sat, 14 Mar 2026 20:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC3B682151
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773521174;
	bh=Z8LjgGAEiXJXUzD7TReT7+91cajyVMdwhuNq8qug9RQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X2I0vTdimceO3xf4iF/Atg05fvoQHiq28T3f79ELCpszuHs8bFiDkIglXlksW3p2O
	 CM6Q5T7aOaBWx61kiZBCPnD5jbTfNTNKs+VIlhIpjoDXDBerUsUhNsO0trn3luO5ir
	 jeYqJuhRXbTnVPS2tJhXKOCMrPt/R8LVnFu9LBpNF1z4J5jBIV5LRuHL/3clD0OB0V
	 wBzz+5uUOmmic6GNTisOBl/zn3SgKU8mNbY1SwLylMRG4VFUzhuT1DnRhBO+vFjh1u
	 mj1loG+jagjMk70lKgcEI4P0sT5InkObRbvsdnay/kz4ElelQ2ZJZREmvecNRxrsOz
	 fgcGfMTuYjrRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC3B682151;
	Sat, 14 Mar 2026 20:46:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id ECF6C118
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2B4D404A7
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nq_yPrjLAXC4 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CF7340498
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0CF7340498
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 42D9386267; Sat, 14 Mar 2026 20:46:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 21:38:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b839527e38a2ed71ab7d5432ad740d5e7b71962
X-Git-Newrev: 66b617af7bc53c9e4dfb3bc12a75902417847666
X-Patchwork-Hint: ignore
Message-Id: <20260314204612.42D9386267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iwd: bump version to 3.12
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66b617af7bc53c9e4dfb3bc12a75902417847666
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://git.kernel.org/pub/scm/network/wireless/iwd.git/tree/ChangeLog?h=3.12

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 7ad2fb382d..67064e35eb 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/network/wireless/sha256sums.asc
-sha256  640bff22540e1714f71772a83123aff6f810b7eb9d7d6df1e10fb2695beb5115  iwd-3.10.tar.xz
+sha256  d89a5e45c7180170e19be828f9e944a768c593758094fc57a358d0e7c4cb1a49  iwd-3.12.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index a150a3048b..caecb62d64 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 3.10
+IWD_VERSION = 3.12
 IWD_SOURCE = iwd-$(IWD_VERSION).tar.xz
 IWD_SITE = $(BR2_KERNEL_MIRROR)/linux/network/wireless
 IWD_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
