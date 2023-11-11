Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B062BC4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 11:44:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 117BA41E40;
	Sat, 11 Nov 2023 11:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 117BA41E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X1jsRorZ6i-D; Sat, 11 Nov 2023 11:44:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 628DA417E2;
	Sat, 11 Nov 2023 11:44:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 628DA417E2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB4E81BF400
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 924B083938
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 11:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 924B083938
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HdozApSlZNW0 for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 11:44:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B9B483883
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 11:44:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B9B483883
Received: from fli4l.lan.fli4l (p4fd6c5aa.dip0.t-ipconnect.de [79.214.197.170])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 60D70A4C104F
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 12:43:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:48788)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r1mP9-0005O2-0M
 for buildroot@buildroot.org; Sat, 11 Nov 2023 12:43:59 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 12:43:56 +0100
Message-Id: <20231111114358.2674610-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1699703039;
 bh=WSTkvzDEDvD6TgWTAjhFcGr7c+2dTcJt0BIe9u5AZzY=;
 h=From:To:Subject:Date:From;
 b=nmYAHARPlUwkdApNjMeFkSgZV+FjCX5/Kb8CYJKl75KbsLMJg5q43b9WUab01tV4d
 5AZncijK7BRezi6F1CBBDZ9h5Af/NR52Dat1w2PmdFiAAPQw6rQH4k1dxRqAD9R3Sy
 hhcgG8aKWIKv0JkCbZxwbO9jtLKsyFAPeusWkrR60roV1sc3J3X4FdpfqjkOqA/LHd
 eipsr6hh283QkgLoVdwVN6dm4g8ad2PKABK0erykuvipBrItLdt0nLmdHk5PlL3dsG
 OaxCjCKIRRgurtPTLJeHdq3z4vgm3EebqU0/NZXBae36V9C37P4qfhjnDGQxOHmpgT
 cvrqLFNDeIlfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=nmYAHARP
Subject: [Buildroot] [PATCH 1/3] package/kodi-pvr-hts: bump version to
 20.6.4-Nexus
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
index c9fe1cfe6a..4a0ccb2467 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8febdacb795eb724456f88af5c55a6e0a5393447f673b2be72d1ca9276479cdd  kodi-pvr-hts-20.6.3-Nexus.tar.gz
+sha256  bce8fe803665121ab7cb20d13e76515a96cf9ef342ef109611e2df2ab144d3b5  kodi-pvr-hts-20.6.4-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index 04de82dc64..d9bf682b38 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 20.6.3-Nexus
+KODI_PVR_HTS_VERSION = 20.6.4-Nexus
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
