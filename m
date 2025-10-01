Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3690CCA470
	for <buildroot@archiver.kernel.org>; Wed,  1 Oct 2025 14:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BE74100F;
	Wed,  1 Oct 2025 14:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WNefxh5z5v89; Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE1CF41066
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE1CF41066;
	Wed,  1 Oct 2025 14:58:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AFF0DFBD
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95EAF83D94
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbD8slECNLQg for <buildroot@buildroot.org>;
 Wed,  1 Oct 2025 14:58:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=kory.maincent@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A1DF88242D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DF88242D
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1DF88242D
 for <buildroot@buildroot.org>; Wed,  1 Oct 2025 14:58:46 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 743F64E40D17;
 Wed,  1 Oct 2025 14:58:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 38453606BF;
 Wed,  1 Oct 2025 14:58:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D4EEA102F1A41; 
 Wed,  1 Oct 2025 16:58:29 +0200 (CEST)
Date: Wed, 01 Oct 2025 14:58:22 +0000
Message-Id: <20251001-fix_license-v2-0-bf18911c835d@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI5B3WgC/x2MQQqAIBAAvyJ7TpAVs/pKRISutRAWChGIf086D
 sNMgUyJKcMkCiR6OPMVG2AnwB1b3Emybwyo0CiDVgZ+15MdxUwyDErbHrXxboRW3Ima/m/zUus
 HSPZOs10AAAA=
X-Change-ID: 20250527-fix_license-f80376235dc9
To: buildroot@buildroot.org
Cc: Etienne Carriere <etienne.carriere@foss.st.com>, 
 Alistair Francis <alistair@alistair23.me>, Dick Olsson <hi@senzilla.io>, 
 Sergey Matyukevich <geomatsi@gmail.com>, Simon Dawson <spdawson@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1759330723; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=RD+aoBVV3H+HlRl1Ro53kd1dcWF/1ZF3gISHrzMbsmA=;
 b=mhydneM83bqcEGTHz6/hjPLshMoRrZ/6XPutoXN67wk8O7pvpuZzYYk7WkMsrseQHsKF3Y
 9tObzNoJEVZwYiMAdxj4e9oXiXr7+bDXcx60E/tIEMcXLlkbvjRpnn3XnUvCoQLeXGTTGY
 6b9qqo778UUXdiso084Gyr4xAXD22nb9Y9WX248irF/AcxztiCgtdMkxqN+WVcfQDsX/QK
 fc6IK8VHAvjWOhhpWYZ3hOy27d9EA4icZ+KfT3xsQ+Djyh8VmX2msJ66VDLco3zlTOspdQ
 W7PVrA3FLWHC7/p2WsegzYs3e5r8gGCQweUYhLg+nrzAl4ksIObwhFoxJXgycA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=mhydneM8
Subject: [Buildroot] [PATCH v2 0/7] Add support for licence files for custom
 repo
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
From: Kory Maincent via buildroot <buildroot@buildroot.org>
Reply-To: Kory Maincent <kory.maincent@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Several packages were not providing any license file when a custom
repository or tarball is used.

Fix this by adding a Kconfig option to specify the license file,
with a default value set to the commonly used license paths.

Changes in v2:
- Do not show license option if it is not a custom repo. Assume LTS
  or custom version does have the same license files location.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
Kory Maincent (7):
      linux: Add support for custom license files
      uboot: Add support for custom license files
      optee-os: Add support for custom license files
      opensbi: Add support for custom license files
      barebox: Add support for custom license files
      arm-trusted-firmware: Add support for custom license files
      at91bootstrap3: Add support for custom license files

 boot/arm-trusted-firmware/Config.in               | 16 ++++++++++++++++
 boot/arm-trusted-firmware/arm-trusted-firmware.mk |  9 +++------
 boot/at91bootstrap3/Config.in                     | 19 +++++++++++++++++++
 boot/at91bootstrap3/at91bootstrap3.mk             |  3 ++-
 boot/barebox/Config.in                            | 16 ++++++++++++++++
 boot/barebox/barebox.mk                           |  4 +---
 boot/opensbi/Config.in                            | 16 ++++++++++++++++
 boot/opensbi/opensbi.mk                           |  4 +---
 boot/optee-os/Config.in                           | 16 ++++++++++++++++
 boot/optee-os/optee-os.mk                         |  4 +---
 boot/uboot/Config.in                              | 16 ++++++++++++++++
 boot/uboot/uboot.mk                               |  4 +---
 linux/Config.in                                   | 16 ++++++++++++++++
 linux/linux.mk                                    |  8 ++------
 14 files changed, 126 insertions(+), 25 deletions(-)
---
base-commit: 5e28e8d34d2ab2b6ba2c37ebcdce4428af8d9015
change-id: 20250527-fix_license-f80376235dc9

Best regards,
-- 
Kory Maincent <kory.maincent@bootlin.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
