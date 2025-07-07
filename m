Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68948C83F07
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 14:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D03261220;
	Mon,  7 Jul 2025 14:11:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tlBqv4vZaCTQ; Mon,  7 Jul 2025 14:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74AC86126D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74AC86126D;
	Mon,  7 Jul 2025 14:11:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DE37E1BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFD978207E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CyAioR6xPvOi for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 14:11:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 70A4C82073
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A4C82073
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70A4C82073
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 14:11:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.121.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N63VY-1ujbKe0cQK-00vtrL; Mon, 07
 Jul 2025 16:11:00 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
Date: Mon,  7 Jul 2025 16:10:50 +0200
Message-ID: <20250707141052.280200-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:fsK0Z6Scw5/htvpiTL9ai0MF+zKXWaaIXQjaPwfPG6dec36CoYJ
 1Ak5iW81fZNdG+gO5GyOVRiX3E5Jxl2e03rslgH6YRFJxdfTFeXigbyF15M4SGp02yfHozY
 s3mY+w/em2/pzQiU8kSGdXJhxYzwR/TEbxLCNlHti65sdPR2EL0ZqLN9j2w5NvTYXvq6Btt
 tuzA1yZItD1Fvn0Q9g5Bg==
UI-OutboundReport: notjunk:1;M01:P0:g97Sf1iRAM4=;U3eBkO/3UllEfuOEASF+d0xJ3CZ
 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
 hOLz1l1rOcxxoQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1751897460; x=1752502260; i=fiona.klute@gmx.de;
 bh=BGeHEtQUv69aHo2vorN0UzuUz3sWF6zVbDhXQS6JMuw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ZMkIGXlqOTWcR6ZmRBVEi4JEIr+4Eaf0+KHPx1NuCouMHnUaYWQ7fsf1JOXMM+hc
 NMX6fCGi3XRnyxvhwpXqMDib0jAU6vvSXXHOYOj8fEzyrztJYQ6lvEE4y55PTzHm0
 Q22l2Uzh6EIVE8N1f7RO1TR8BvWmF1cZ+Y6yZ05/rTv/dGVE4tOd7YFRSGZUDnhWw
 a/5NojH14XlShx7+rsqFG7qR7476rk9pTE2rCHj980lO2kApCglQhHDNUxiVvlSMT
 tSp3ag6exASdiG+VmG/5TKu/EbYYCWLcJw0NXlbULGidc4ckwDR7EKxlbKYMfyy8r
 ET38ZhnzZP8eLKxWcA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=ZMkIGXlq
Subject: [Buildroot] [PATCH 1/3] package/tpm2-abrmd: bump version to 3.0.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

With 3.0.0 users must be in the tss group to access tpm2-abrmd.

Upstream changelogs since 2.3.3:
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.0
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/2.4.1
https://github.com/tpm2-software/tpm2-abrmd/releases/tag/3.0.0

Tested with package/tpm2-pkcs11.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/tpm2-abrmd/tpm2-abrmd.hash | 2 +-
 package/tpm2-abrmd/tpm2-abrmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tpm2-abrmd/tpm2-abrmd.hash b/package/tpm2-abrmd/tpm2-abrmd.hash
index 1c6e739056..cb5d9314f0 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.hash
+++ b/package/tpm2-abrmd/tpm2-abrmd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1e587808c6739079d59f124d9c1a0058f8d34dd84f1f656c946667fa0a181c48  tpm2-abrmd-2.3.3.tar.gz
+sha256  d59aff34164aa705b05155b86607f6b66918a433104f754a3fcf76216dd9f465  tpm2-abrmd-3.0.0.tar.gz
 sha256  18c1bf4b1ba1fb2c4ffa7398c234d83c0d55475298e470ae1e5e3a8a8bd2e448  LICENSE
diff --git a/package/tpm2-abrmd/tpm2-abrmd.mk b/package/tpm2-abrmd/tpm2-abrmd.mk
index 0e62cb176a..2bb0ebbbb5 100644
--- a/package/tpm2-abrmd/tpm2-abrmd.mk
+++ b/package/tpm2-abrmd/tpm2-abrmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TPM2_ABRMD_VERSION = 2.3.3
+TPM2_ABRMD_VERSION = 3.0.0
 TPM2_ABRMD_SITE = https://github.com/tpm2-software/tpm2-abrmd/releases/download/$(TPM2_ABRMD_VERSION)
 TPM2_ABRMD_LICENSE = BSD-2-Clause
 TPM2_ABRMD_LICENSE_FILES = LICENSE
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
