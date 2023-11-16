Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B306AC47071
	for <buildroot@archiver.kernel.org>; Thu, 16 Nov 2023 06:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 130F68175D;
	Thu, 16 Nov 2023 06:12:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 130F68175D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5NokTN4Lut4d; Thu, 16 Nov 2023 06:12:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 575188174F;
	Thu, 16 Nov 2023 06:12:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 575188174F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42AE31BF308
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 06:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C85A8174F
 for <buildroot@lists.busybox.net>; Thu, 16 Nov 2023 06:12:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C85A8174F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbA88LE6W0cG for <buildroot@lists.busybox.net>;
 Thu, 16 Nov 2023 06:12:33 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03B8381551
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 06:12:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03B8381551
Received: from fli4l.lan.fli4l (p54a1b359.dip0.t-ipconnect.de [84.161.179.89])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E893BA4C0339
 for <buildroot@buildroot.org>; Thu, 16 Nov 2023 07:12:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39984)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1r3Vc5-0004fV-0B
 for buildroot@buildroot.org; Thu, 16 Nov 2023 07:12:29 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Nov 2023 07:12:29 +0100
Message-Id: <20231116061229.13306-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1700115149;
 bh=SGz8Y7Zk8yLh3ZHynkLkQfzVR7CwWnIIpjE+9kwFEss=;
 h=From:To:Subject:Date:From;
 b=a/PZIXOflmG3S5wANvVX+B7igxygWKUH236sdsDfnFA1F87RLlMNMU1Qm5CExWnbD
 Bta4sYF/UBEjstX0tBdp7rAFp3B6a5H+NexiCcDHDaZi7H1sp/6Kts63/cADEHpeOK
 Byg7UvkX8bOcI6s0etgvv//qgfP+jjfRpWSmflvW+36xlKEFixid53sofuf0q7s2LO
 0TtzBFbU5r21plv/SijaJOgy6FrPJ0X+T9F1QxMmo8NahBmhbAPUiPUb6fIaj046B7
 34S4QxlUm5B+haY57r4Biv3rTTVjaQoFHwgFNsSDJe5v8k8W3P5Nt1Nirx4DrxOdWW
 1x/pGvtttn5ng==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=a/PZIXOf
Subject: [Buildroot] [PATCH 1/1] package/kodi-pvr-hts: bump version to
 20.6.5-Nexus
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

Changelog of this bugfix release:
https://github.com/kodi-pvr/pvr.hts/blob/Nexus/pvr.hts/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-hts/kodi-pvr-hts.hash | 2 +-
 package/kodi-pvr-hts/kodi-pvr-hts.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.hash b/package/kodi-pvr-hts/kodi-pvr-hts.hash
index 4a0ccb2467..046d234d71 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.hash
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  bce8fe803665121ab7cb20d13e76515a96cf9ef342ef109611e2df2ab144d3b5  kodi-pvr-hts-20.6.4-Nexus.tar.gz
+sha256  bd58fc85543447f918ee567192c87a3beb3f6e2c3fc116abe1f584514d202ada  kodi-pvr-hts-20.6.5-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-hts/kodi-pvr-hts.mk b/package/kodi-pvr-hts/kodi-pvr-hts.mk
index d9bf682b38..7e667ae1aa 100644
--- a/package/kodi-pvr-hts/kodi-pvr-hts.mk
+++ b/package/kodi-pvr-hts/kodi-pvr-hts.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_HTS_VERSION = 20.6.4-Nexus
+KODI_PVR_HTS_VERSION = 20.6.5-Nexus
 KODI_PVR_HTS_SITE = $(call github,kodi-pvr,pvr.hts,$(KODI_PVR_HTS_VERSION))
 KODI_PVR_HTS_LICENSE = GPL-2.0+
 KODI_PVR_HTS_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
