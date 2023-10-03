Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC58E7542D
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 07:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3832660A5F;
	Tue,  3 Oct 2023 07:17:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3832660A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIZRQRAeLIEJ; Tue,  3 Oct 2023 07:17:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32BE660769;
	Tue,  3 Oct 2023 07:17:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32BE660769
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B5991BF86C
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:17:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 349EE60769
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 07:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 349EE60769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id loruOR0rSZBn for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 07:17:45 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14A26605B5
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 07:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14A26605B5
Received: from fli4l.lan.fli4l (p4fd6c587.dip0.t-ipconnect.de [79.214.197.135])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7B69A4C031A
 for <buildroot@buildroot.org>; Tue,  3 Oct 2023 09:17:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qnZf4-0007Gh-20
 for buildroot@buildroot.org; Tue, 03 Oct 2023 09:17:42 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  3 Oct 2023 09:17:41 +0200
Message-Id: <20231003071742.300900-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1696317462;
 bh=RHvtWl95FesooJ1ckn3czVTl7o9SllhIRXzklHWuAeY=;
 h=From:To:Subject:Date:From;
 b=Ik+jm4nB3J51yKP5WvECAN9XE79h6IoYQCuERE27pMDn015AqwjUd6uwaqHucajF5
 LxC6g7r+iMeEe00exMt5/QFuqss/mAaW70U0TeCWhmTr5/2L9wMtu8ZsjBwPKa70/V
 OdD6Cl572hlsel0eBtnuM4NRtpMFPVFgOdmSx5OptN2yZ4YyIsWK9sRVo4vqSqg1dY
 UoI94AbJVWHw8HhZnrGMr60yJzB6Ni7/sdTPMj5Hd7EuhOUqIvp73OCqUjnM5UttDf
 iPyVqDceQnsFxXYrjPVKe2TiF7rh5/WT7GqV9jbE2mPwVmmmuTMW9cKTJnjuFb9Wag
 CUX8noCCpc/sA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=Ik+jm4nB
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-hts: bump version to
 20.6.3-Nexus
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 7b55eb88fd..c9fe1cfe6a 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e77bd87f1f4d1abc06e32d0347a0bb635bc129bec43a07864cb8a9e6b0e4d374  kodi-pvr-hts-20.6.2-Nexus.tar.gz
+sha256  8febdacb795eb724456f88af5c55a6e0a5393447f673b2be72d1ca9276479cdd  kodi-pvr-hts-20.6.3-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index d32ce87388..04de82dc64 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 20.6.2-Nexus
+KODI_PVR_HTS_VERSION = 20.6.3-Nexus
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
