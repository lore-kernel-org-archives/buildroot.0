Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EDA4C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:08:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E135C61056
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 21:08:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E135C61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC72983B4E;
	Thu,  7 Oct 2021 21:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1E14MduzL3AS; Thu,  7 Oct 2021 21:08:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18BB083B23;
	Thu,  7 Oct 2021 21:08:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02EB11BF866
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:08:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6B2360654
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 21:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BI4Faoc4bucz for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 21:08:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 792E66066B
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 21:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633640925;
 bh=1aqfind8+fBgRdPU/vTijlDGjRMtDng2BNfmBZ5hzpA=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=IfvIuiajC4xIHsqJAuLDEOCKJfcansd3/m2Fad+xgPbQAeAMcnF7zjY49P5QsBpc4
 twrgxGGCeKC5KpGvyDoqlcQmOFJgkx76vE+4TrK/oYHUrRdlQ8Hcp7byOIQYmWiDQb
 rA3rE81eA24EIdTcFMtO+jXeraSfT+qDC0WrMPXw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.41]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYvcG-1mLIwX1Rw0-00Unxt; Thu, 07
 Oct 2021 23:08:45 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 23:08:44 +0200
Message-Id: <20211007210844.4901-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:oMpdFbPiS6zuuL5ar4xDZYoWjJJH9mFjroYy2Y8MaZwuVv3qLIO
 Fx9H5AnZZoBmVRY7gU+bl2LiRItFK3o3SbfTgspSGcq1fSoX+rdoIz5GjOYHEb4Q/Bqvzn/
 D/BPNhssCq0DLxeuoBTpSZjnyTQvy+yFhjcjYq1uJI5I8qVGMlZ1Fwy0tDOcZslF8M3QjRV
 ntdxS5Mlb7s2pw0pyXZ6Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s+f+lkCpqN8=:tUPJuoI8jQx/QaZ4Njw59m
 4oONGov2MlvBjhm4G+C5UH8I/ZDZD1qDoP6XcnTGweYMIf6AXNfoaGexgpzYEZTPlX3vqlOU3
 fX+mYLV4XK9MZNoJr6SAl8fZwFHg56WWQ1m12BxE9i7HscHtkfZKDpxaLddjmGVD+jZl2kFop
 lvn3CgyYdqFG7tcQ0zlIbId6CmdfNpUEqQX6gr+AxSiayfCF7vgzGR3x61fhorQKhs3YXhAq+
 dGXRSx00XsvracUFEIiNm3y0OE4tHfyQA7a+lBe0KDDjAgde08gjvuHVA/1/gXnjV/Yrkk0cu
 b2P/pcWOkXkfBx78/3NTsnBizYO7+KR0o0e9Lve5XJ9UXZJ2qs6kVnLZ7/wQBchN6U9JRNIPN
 xkjvVLkh2WWAqGdxcVlhIR/4VuBydQGjSzFcEO0fKESHiTPJwD/m1V3M0lB9T/JRgSuSXHXk0
 DveeFSd3MFFi7ilwJ4upLbaKQ1NIV7bfP3cGKRhVMibtvFxxDmN5uoJVeNBIrcAsxDjCNzltK
 I3djmA5bsw62t+8NqXUVAzHXLmJU4T4hyVMRt4JzHRdtcjzl5UySZs0ZG62WninkJyHUAtjZn
 TqHIJQP0zlDnR/oRznOR+9xK4SzBA8vNIydYLDVFF1c95aQncxIdGrgmYkZ00bTB0n63Mhxqj
 uYkCfkzzsLnDSDO4WiuDGtyON+EtabHw7PSGP8nyuWPRQFsPywKgX4lA6vI/hXkzTf7Emlco5
 XcAdnlE43OahXJKjtpYe2HzyJSdAzQCiPMSMrnHvdJelO+aQldmrofLdjBaw6mwHLZBbwiD6e
 DMUmyGXU7aDdXj/6k+bKk8pTU003BhglG0OIysRBID5Vh7v6uRC1EYqlNMZMg10HUZxPqKofS
 +u3W1wnXh377iyDooV9Xj52E0ZorsFRNtwUoVM8NhGEXKhOKKCod89KG5uNrxTUvwf0g/AaoG
 QHSj9BbLhb016xgk9COkn660JET9Rw/o3ArDt466aQUtKxtzXf9ahBOitUdqVI+QTRVUNeo2Q
 f13kvDfZnCPGWtgVprQKU+TN5HyghooFGMW0zkNdGyHiKSj/zNeIXgY7lJHxPXrcmGbEDwSMw
 pwLCjghtjYt7u8=
Subject: [Buildroot] [PATCH v1] package/wireless-regdb: bump version to
 2021.08.28
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dimitrios Siganos <dimitris@siganos.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog (since 2021.04.21):

  47007d0 wireless-regdb: update regulatory database based on preceding changes
  e983a25 Update regulatory rules for Ecuador (EC)
  a0bcb88 wireless-regdb: Update regulatory rules for Norway (NO) on 6 and 60 GHz
  cdf854d wireless-regdb: Update regulatory rules for Germany (DE) on 6GHz
  a4468e8 wireless-regdb: update regulatory database based on preceding changes
  86cba52 wireless-regdb: reduce bandwidth for 5730-5850 and 5850-5895 MHz in US
  6fa2384 wireless-regdb: remove PTMP-ONLY from 5850-5895 MHz for US
  9839e1e wireless-regdb: recent FCC report and order allows 5850-5895 immediately
  42dfaf4 wireless-regdb: update 5725-5850 MHz rule for GB

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/wireless-regdb/wireless-regdb.hash | 2 +-
 package/wireless-regdb/wireless-regdb.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wireless-regdb/wireless-regdb.hash b/package/wireless-regdb/wireless-regdb.hash
index d941fc3b1a..abe8f6b000 100644
--- a/package/wireless-regdb/wireless-regdb.hash
+++ b/package/wireless-regdb/wireless-regdb.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/software/network/wireless-regdb/sha256sums.asc
-sha256  9e4c02b2a9710df4dbdb327c39612e8cbbae6495987afeddaebab28c1ea3d8fa  wireless-regdb-2021.04.21.tar.xz
+sha256  cff370c410d1e6d316ae0a7fa8ac6278fdf1efca5d3d664aca7cfd2aafa54446  wireless-regdb-2021.08.28.tar.xz
 # Locally computed
 sha256  678b0df753c86198fc496d1f1033429bbd57f101472132ee7eaaf9f5e0a7fae1  LICENSE
diff --git a/package/wireless-regdb/wireless-regdb.mk b/package/wireless-regdb/wireless-regdb.mk
index 49a3824ce8..0db8c6f345 100644
--- a/package/wireless-regdb/wireless-regdb.mk
+++ b/package/wireless-regdb/wireless-regdb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIRELESS_REGDB_VERSION = 2021.04.21
+WIRELESS_REGDB_VERSION = 2021.08.28
 WIRELESS_REGDB_SOURCE = wireless-regdb-$(WIRELESS_REGDB_VERSION).tar.xz
 WIRELESS_REGDB_SITE = $(BR2_KERNEL_MIRROR)/software/network/wireless-regdb
 WIRELESS_REGDB_LICENSE = ISC
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
