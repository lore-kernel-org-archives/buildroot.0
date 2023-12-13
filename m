Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE840C4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 16:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DDC360F30;
	Wed, 13 Dec 2023 16:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DDC360F30
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uT-VxPAPB9GG; Wed, 13 Dec 2023 16:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2393A60F23;
	Wed, 13 Dec 2023 16:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2393A60F23
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 257381BF97D
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDA48400AB
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 16:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EDA48400AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q8thWIFYG9m6 for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 16:43:17 +0000 (UTC)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7126440648
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 16:43:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7126440648
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a22fb5f71d9so162977066b.0
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 08:43:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702485795; x=1703090595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GEoS2Hpzeg2yutB4fvfblOlvap1mBGAsifOCojno0U8=;
 b=HYH6GxmbtlDxw/Qe2CgKrS6Cre41KoqMvPBMsph33X1vRYtijdLPtDslgxhoSu25b3
 ZJlPAK02hZlcfDBvT+vj4IK8uFeEqmg08wl/G2ePsttlm+/0oQD+MALD02edxDUil8Qb
 ypxDRLUxUVJ2PjZtxyyDlBGkLaBzzwmF6wLhXisIbwToelGGtha7t1fFvmH97unXg8i7
 onSh6nE67+7SSszWB4A8vVYycEqGgaxVyDg/u3o59zguc0k+LneiY8uE0euEH2tYfK3M
 bPa8pwODghdst60RiEe7Hc8/vTcZpg1H93Q4bl2RjUM21v6RgRN+/SiKDngksQmf7mWL
 6GMw==
X-Gm-Message-State: AOJu0YxqDTqD4dTlp9PiNNtoIUvcjE7QlKO1WZ+0wFwK9yLUCooTwS9I
 hvN1ExOrmm/SpzQNIWOb2eb9246vFmbuTG8nrfecAw==
X-Google-Smtp-Source: AGHT+IHrJJtV4unjsOVjZ19Av3KIOs5hgVzF3kjKHs2sqCRTlw/2eUeaPMOkPL1iinNFDkf2Cb2rrw==
X-Received: by 2002:a17:906:5a6b:b0:a18:a5b1:31a9 with SMTP id
 my43-20020a1709065a6b00b00a18a5b131a9mr9045138ejc.12.1702485795035; 
 Wed, 13 Dec 2023 08:43:15 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-80-182-13-188.pool80182.interbusiness.it. [80.182.13.188])
 by smtp.gmail.com with ESMTPSA id
 rl19-20020a1709076c1300b00a1f8bae93d3sm6017326ejc.215.2023.12.13.08.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Dec 2023 08:43:14 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 13 Dec 2023 17:43:00 +0100
Message-ID: <20231213164311.4180059-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702485795; x=1703090595;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GEoS2Hpzeg2yutB4fvfblOlvap1mBGAsifOCojno0U8=;
 b=Ro/5XfCO7nL6h1hPkAgNociL1EZjcaIIdR45L41dHl3/Aj80E3J2WxY/H8vwJH8Dac
 gTdVTi1kwgYBbJ34xxwJKJfs/uzad3HRK9eEd3zkhgIgqTe93QvywwMEMAXPjLdQvgXh
 Vn2qFiXc45bX3IOU5s3alFA3V+Itttw5vUpgw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Ro/5XfCO
Subject: [Buildroot] [PATCH v2 00/11] Add support for AM62x-SK HS-FS devices
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SK-AM62B-P1 is the newest version of SK-AM62 which includes
high-security field-securable (HS-FS) silicon to optionally customize keys
and encryption for security applications.
This requires enabling the BR2_TARGET_TI_K3_IMAGE_GEN_SECTYPE_HS_FS option,
which, however, was buggy. This series fixes the errors and bumps the Linux
kernel and U-Boot required for such a new device.

Dario Binacchi (11):
  boot/ti-k3-core-secdev: new package
  boot/ti-k3-image-gen: manage HS hardware
  package/python-jsonschema: add host variant
  package/python-attrs: add host variant
  package/python-referencing: add host variant
  package/python-rpds-py: add host variant
  package/python-jsonschema-specifications: add host variant
  boot/ti-k3-r5-loader: set binman environment
  boot/uboot: set BINMAN_INDIRS for TI K3 DM
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2023.10
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.1

 DEVELOPERS                                    |  1 +
 board/ti/am62x-sk/genimage.cfg                |  7 ++-
 board/ti/am62x-sk/post-build.sh               | 49 +++++++++++++++++++
 board/ti/am62x-sk/post-image.sh               |  5 ++
 boot/Config.in                                |  1 +
 boot/ti-k3-core-secdev/Config.in              |  9 ++++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash |  3 ++
 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk   | 19 +++++++
 boot/ti-k3-image-gen/Config.in                |  1 +
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 16 +++++-
 boot/ti-k3-r5-loader/Config.in                | 13 +++++
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       |  1 +
 boot/uboot/uboot.mk                           |  3 +-
 configs/ti_am62x_sk_defconfig                 | 14 ++++--
 package/Config.in.host                        |  5 ++
 package/python-attrs/Config.in.host           |  8 +++
 package/python-attrs/python-attrs.mk          |  6 +++
 .../Config.in.host                            |  7 +++
 .../python-jsonschema-specifications.mk       |  5 ++
 package/python-jsonschema/Config.in.host      |  6 +++
 .../python-jsonschema/python-jsonschema.mk    |  6 +++
 package/python-referencing/Config.in.host     |  6 +++
 .../python-referencing/python-referencing.mk  |  7 +++
 package/python-rpds-py/Config.in.host         |  8 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 25 files changed, 199 insertions(+), 8 deletions(-)
 create mode 100755 board/ti/am62x-sk/post-build.sh
 create mode 100755 board/ti/am62x-sk/post-image.sh
 create mode 100644 boot/ti-k3-core-secdev/Config.in
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.hash
 create mode 100644 boot/ti-k3-core-secdev/ti-k3-core-secdev.mk
 create mode 100644 package/python-attrs/Config.in.host
 create mode 100644 package/python-jsonschema-specifications/Config.in.host
 create mode 100644 package/python-jsonschema/Config.in.host
 create mode 100644 package/python-referencing/Config.in.host
 create mode 100644 package/python-rpds-py/Config.in.host

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
