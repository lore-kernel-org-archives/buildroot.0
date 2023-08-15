Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF73C001B0
	for <buildroot@archiver.kernel.org>; Tue, 15 Aug 2023 18:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CAE481F73;
	Tue, 15 Aug 2023 18:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CAE481F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hzRTpYrgQkSh; Tue, 15 Aug 2023 18:40:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B86E081F77;
	Tue, 15 Aug 2023 18:40:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B86E081F77
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B32391BF422
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:40:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98935403D6
 for <buildroot@lists.busybox.net>; Tue, 15 Aug 2023 18:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98935403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QP_ZmcmChn3c for <buildroot@lists.busybox.net>;
 Tue, 15 Aug 2023 18:40:15 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CA0CE41174
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 18:40:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CA0CE41174
Received: from fli4l.lan.fli4l (p4fd6c625.dip0.t-ipconnect.de [79.214.198.37])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 09D78A4C028B
 for <buildroot@buildroot.org>; Tue, 15 Aug 2023 20:40:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53294)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qVyxg-0004Kh-2c
 for buildroot@buildroot.org; Tue, 15 Aug 2023 20:40:12 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 15 Aug 2023 20:40:11 +0200
Message-Id: <20230815184012.46168-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1692124813;
 bh=FhLy94CeUHaosd9N1XkCu1006toHBAb52t7ioSd2VVA=;
 h=From:To:Subject:Date:From;
 b=cuK6htECuiKPOUCwVpf17oSmE9RDNnSp9b1wpVMXA+/VGPCfNBrDr3SW9WMP4KYq2
 r6bavHdRew7TyACzjpfkz8Qe/MO7860igljnQL/bB9cJuOVl9Md5QFwQEf7x8fZUgK
 ahdt2ISywz3pDItXfEqCrZtVeIeKunxr9dmM5QACavMr6gN5Aho0iPFNq5tRtfRpCf
 IcpWBT/qjJQ9gzX0C0Fe86jhjpo2ogbdLP9S9WDFhKDPCVrWodif+fpEs6jZrjuDEv
 mrTV7/2GVde0V34GJAeTlHcBez0in70OhfBUca5/4AfSaFbV+Ka0cSzQYAHxjijl39
 VoN9s/3EqKQMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=cuK6htEC
Subject: [Buildroot] [PATCH 1/2] package/kodi-pvr-mythtv: bump version to
 20.4.0-Nexus
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
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash | 2 +-
 package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
index d0d6331364..ce8f68d3b5 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b1ad428bec882d3e852240cbef2378803635b530545a08421ff3baf0611a29e7  kodi-pvr-mythtv-20.3.2-Nexus.tar.gz
+sha256  344750ba617b261a4559ba8314107b7e90e9a37b6b1a6cccb9077e5b2f63694d  kodi-pvr-mythtv-20.4.0-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
index f67457480c..2038b9016e 100644
--- a/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
+++ b/package/kodi-pvr-mythtv/kodi-pvr-mythtv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_MYTHTV_VERSION = 20.3.2-Nexus
+KODI_PVR_MYTHTV_VERSION = 20.4.0-Nexus
 KODI_PVR_MYTHTV_SITE = $(call github,janbar,pvr.mythtv,$(KODI_PVR_MYTHTV_VERSION))
 KODI_PVR_MYTHTV_LICENSE = GPL-2.0+
 KODI_PVR_MYTHTV_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
