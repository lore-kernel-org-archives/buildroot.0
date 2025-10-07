Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D3CCA476
	for <buildroot@archiver.kernel.org>; Tue,  7 Oct 2025 18:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BAA46071A;
	Tue,  7 Oct 2025 18:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5TnM1tEBnaQA; Tue,  7 Oct 2025 18:05:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A2AC6082A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6A2AC6082A;
	Tue,  7 Oct 2025 18:05:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6540B119
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:05:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4247580F5D
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYwyQCakvtV3 for <buildroot@buildroot.org>;
 Tue,  7 Oct 2025 18:05:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9378B80F5C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9378B80F5C
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9378B80F5C
 for <buildroot@buildroot.org>; Tue,  7 Oct 2025 18:05:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6C4PvNCJ4lGps6C4Pvq4Ri; Tue, 07 Oct 2025 20:05:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue,  7 Oct 2025 20:05:53 +0200
Message-ID: <20251007180553.2582202-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHGuiKbr9tYsE3jwl5IG/DT7W/YBCurB1GtZtpk9vh1OJ+AyyV4U6TgNcDhq3+37QwOpbByEiOemQiWn2MHS+B+ZQjpa6w8cHaNlJ9L7goIXUZ8uLKh6
 LQjPhQD+967nH92IKeQ3f8iEm7yzifCi1wXceJKpFTSo8pFm3QmjoJqRxmOy8kQXmAgAeRz37j/mpyuQ/K23IWNnTPJo80VweXpzj4+JYM/wwBpUDzES7zgh
 bvp+/s7Dhu+KqHImxwUx6rcN01Damc1IWRxsxUCy2j/fqnUaxoUEYlGON8yDqd3MRtaBYMsXpU/UUVtamBh4nA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1759860354; bh=tmSbQkGNpXmm6Oae3kXYgMdJ74mK3Qb6eDSlqwRjpW0=;
 h=From:To:Subject:Date:MIME-Version;
 b=C1xiJ+hwMSafW+9WMfkcQzSZSV0COTBy1orZW/5EdF6H/rFGeboy70X3NT9SHjCDr
 QdIysDyDW+9mnusZy5FVBoZuYdzRmRSijyE5AzeZW1i412hq4aE64WfW4v6VZr+bei
 0NFuxTJG2/gq4HV1ogSLBMMtyVu8xBf6n+3Yyl4osNhLK9S/vxrxff02AeZcaotCEE
 tq9r8mWfu451gPUNak8O37XIIoG3utV+v1t0gS/vb7ACHmel3wSe/E3H0ZndvJCKyZ
 41Kg7jWCnUKhboM8G10NY0zPHtpC7x3dPlv9l28o1SGbNfKHjV+XJ4GUT7vc3C72Xq
 ccUvf9ICwb3xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=C1xiJ+hw
Subject: [Buildroot] [PATCH] package/rtl8188eu: fix build failure with linux
 6.17
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

Bump to version 2025-10-07 on branch v5.2.2.4 to fix build failure with
Linux 6.17.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 1c14791802..a32f9344cc 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  39e9891433cb5d3a4b1b3ec3bdc8f4e1f11892da7ab69be356616625b1230400  rtl8188eu-c3104bd094970dd5944e2b28141b552630933bde.tar.gz
+sha256  5a19791716fecbbc353632c5fd1a84bf0565f7af1ae327f0afca7328227e06df  rtl8188eu-967dbaa7dc0641042b0f103e7679cd83f9bab131.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index cfe048b514..4f767a9a02 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = c3104bd094970dd5944e2b28141b552630933bde
+RTL8188EU_VERSION = 967dbaa7dc0641042b0f103e7679cd83f9bab131
 RTL8188EU_SITE = $(call github,benetti-engineering,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
