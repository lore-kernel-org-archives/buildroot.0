Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6744DCA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 07:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23DD2608CB;
	Tue, 19 Aug 2025 07:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7VlnztSziWc; Tue, 19 Aug 2025 07:48:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B675608C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B675608C6;
	Tue, 19 Aug 2025 07:48:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C091EE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A71D0608AE
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IiBGQkiAvQCu for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 07:48:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C00E9608C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C00E9608C4
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C00E9608C4
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 07:48:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 08A88C6B390;
 Tue, 19 Aug 2025 07:47:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8819760697;
 Tue, 19 Aug 2025 07:47:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A1A531C22DA84; 
 Tue, 19 Aug 2025 09:47:45 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 19 Aug 2025 09:47:36 +0200
Message-ID: <20250819074737.3285946-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755589678; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=efMgpDSVpj+zBx3/GmIGKyv5fnBQ3IeGfuoiCez8iQA=;
 b=bPYhcjzmrTmYt3UD/wdh0igDWLSkUXju4Z53bV0VJSRlkiX+/oT0OGvJuUWRGSHX5FHx3G
 d/Ez7lQRW3HJLaMbvy96VIsWYbJrAP5K8BH3WBti4HQjEGoKlwH6Xa7AvqaOUwN6NqZds5
 rtteitQgWON6Tz9hp4s8S8QQ5uL3ArtvxI9ck5ILFpOoayZm6HRgWUFzbWvnNvuTX9Kx6J
 bYN01T8rkG3AJ7/vifYKdW86jx7ksO3/dZrj7g5q454+z44TOb62EaRiGa7bTMDG5ZOVcD
 xXl6oCC187I8etHAcFplxGM8+qZ306ddXh8jhM6lKlnH0mE6930WCkstI3QaOw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=bPYhcjzm
Subject: [Buildroot] [PATCH] configs/ci20: U-Boot needs host-openssl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Very likely since the bump of U-Boot from 2020.07 to 2024.01 in commit
dedb7dc6d6543d5ce16ac73f927e0a33806075e1, U-Boot needs host-openssl,
so let's add the necessary dependency.

With this change ci20_defconfig builds again:

  https://gitlab.com/tpetazzoni/buildroot/-/jobs/11054480107

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/11012273114

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/ci20_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 4a66e1ac33..bb4863cb1d 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -18,6 +18,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_PACKAGE_HOST_GENIMAGE=y
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
