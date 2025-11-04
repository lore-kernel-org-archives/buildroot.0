Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EB8CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 17:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5647B80D8D;
	Tue,  4 Nov 2025 17:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lUzJbgRUbCVM; Tue,  4 Nov 2025 17:53:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7630B81EAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7630B81EAD;
	Tue,  4 Nov 2025 17:53:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A79AE222
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 17:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 912AB81EAD
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 17:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjP3uddU_zLP for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 17:53:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5041580D8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5041580D8D
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5041580D8D
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 17:53:22 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id GLDbvIL1NlGpsGLDbvWyK1; Tue, 04 Nov 2025 18:53:20 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue,  4 Nov 2025 18:48:35 +0100
Message-ID: <20251104174835.1697415-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLCOpjrxmPQMICJPdXDtRsJKtl6eFLO9VeYH6n97KptAMDmT1qqyrAXWev35PvfZkETb7z4wm4klL12udRx13rx4HGcfAv2hEId3WsXkvsYdzbLBoZma
 DO/8Ofsq9nR2oWIAz/tw58E6GRMja/h+2eeLB6XFREvDIaqcKYzLM/WsOXt40/DUcwKo5L3NAqDmvIjKhDKYDKgfpJ1J53cROCE2Q0rW9x6hQZDPYQS+DNnQ
 X1VwWm1tWvR42b7BK8Xcg7q+Y9KkaCccCvmnub53mGI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1762278800; bh=5i/l/PqDWjkIIlTARSBat1xov6fRzZlEJHfo8t96tj4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Skf5c8i5B5GVhlyZbsDX1Hq5SjxVmouqUwKlvLOV5x6Z7Gk0o7DaMSheO9kDKs1tw
 UgOkVRK8dOkk7yL3TasNKCww2DWakYV/HaXBVw4LoRHuzIP/TTRO2jeTFyDQgPPT7t
 ijvXvB/Rpbff2FloWBDibfvUfsW9Nlj83tvY6nFxYYbNTVgdY9ooobCJG/+TbfRr2R
 DWGqVigsnSjO21YcB2NDnEGFbO1Z6Jf78QQ2ceZAjrz+nSRDGk/V01N0RwdmngVsCW
 g82vTAe+rzAcOsWG7THm1sRGqojeM3GCI1nR2gtuGLMKFMksvoG7MhfvMRD205MzjO
 so6EWb4V74Mdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=Skf5c8i5
Subject: [Buildroot] [PATCH] package/libnvme: bump to version 1.16
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For release note, see:
https://github.com/linux-nvme/libnvme/releases/tag/v1.16

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnvme/libnvme.hash | 2 +-
 package/libnvme/libnvme.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
index a57a5b3958..66dedbbe8f 100644
--- a/package/libnvme/libnvme.hash
+++ b/package/libnvme/libnvme.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  c21cd9379390bdc52c9d9569a241274f8115fc247b76a5d922d639f48c8174a2  libnvme-1.15.tar.gz
+sha256  5bb24139a113f350708fe54073e799f454d509218758060c398144b91811d176  libnvme-1.16.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
index b576feb1ab..238b7041da 100644
--- a/package/libnvme/libnvme.mk
+++ b/package/libnvme/libnvme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNVME_VERSION = 1.15
+LIBNVME_VERSION = 1.16
 LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
 LIBNVME_LICENSE = LGPL-2.1
 LIBNVME_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
