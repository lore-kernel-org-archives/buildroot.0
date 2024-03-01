Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E86FC5478C
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13E1382145;
	Fri,  1 Mar 2024 13:36:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LswnAmH0mnG2; Fri,  1 Mar 2024 13:36:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 050328218D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 050328218D;
	Fri,  1 Mar 2024 13:36:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5AC0E1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46E2140644
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Lu1QN-4phaaP for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 790E24016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 790E24016D
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 790E24016D
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:28 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so3443632a12.0
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300186; x=1709904986;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G6UxPbVvBOwoImhgswG6eCP9WfrrZdYN6MESVtmj/7w=;
 b=lpDgGJJfXimy7wYC37dDT2z6fnvdqY5ivvkvU7Z5tOMA9WLINEfSLw/XbQp8hf08ld
 90qIfyO+pOBevtSYZ005oKFWXJ/VfyCma4mEJxOJp7/hNR+yrHOnz25NQqzqNUPQB2YU
 ufbyiBIDp8e2HBla7+0BxgOlZakxOAKT86lQkPVn9eVT2ZNiU2AqRTAe6kb/i+pLYskI
 w9UkgkFQaS+cW7XG7QFU3upSjoKK3PfaKjpxaB7UGJXICVHBDjV+r47tX0hd8txvWu+3
 AtTI1nTy4n/upoZQcgcWWFifJ6qGYr1P7Co1NNly+o5+OOnjMybIar08PrEyBtK7rDnV
 Y8Ww==
X-Gm-Message-State: AOJu0YxvaVTQNpG0pqIKrzL7sqXfKMZBDRpg8LQeohO9sEWrbGsws34s
 UU1FcMFe0uuYQwdcAQo7cn2n1tI583Y59ZrmpZYJ62QqyWVFrVflisXX/turqPJebuljheNjZmT
 JPQM=
X-Google-Smtp-Source: AGHT+IFrBIBh/tWi0uW8jJ44VdRbwomJzOESIVI2g9am1G1MKBOGVZeqA8Zx8uFlJJTsY3rD5FAmJQ==
X-Received: by 2002:a05:6402:901:b0:565:9fa4:dd59 with SMTP id
 g1-20020a056402090100b005659fa4dd59mr1303189edz.5.1709300186017; 
 Fri, 01 Mar 2024 05:36:26 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:25 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:35:57 +0100
Message-ID: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300186; x=1709904986;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G6UxPbVvBOwoImhgswG6eCP9WfrrZdYN6MESVtmj/7w=;
 b=K19Y5E11NQldMYVKV2yDfZzKwjCoC+bE5yYN7DR/+P/DgtCioox+w5e3bPO3j5O5UY
 jjRynVabvRvub2xhOsJfIzE0Cg0CuttEnErS5qHnGiOYF7Bft5qnVX0tGtaPWM7ANVUR
 dVkokNcVxa9GimTNyukJcltQYSlbbuZOLtc7E=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=K19Y5E11
Subject: [Buildroot] [PATCH v8 00/23] Add support for AM62x-SK HS-FS devices
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
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

Furthermore, this version complete the series by updating the
ti_am64x_sk_defconfig too and remove ti-k3-image-gen, as requested by
Romain Naour:
https://patchwork.ozlabs.org/project/buildroot/patch/20240224205654.1546744-17-dario.binacchi@amarulasolutions.com/
I have successfully executed compilation tests for all possible combinations of platform and security type:
am62x -> GP, HS, HS-FS
am64x -> GP, HS, HS-FS

The AM62x HS-FS configuration has also been tested on the SK-AM62B-P1 board.

Dario Binacchi (22):
  configs/ti_am62x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am64x_sk_defconfig: fix BR2_TARGET_OPTEE_OS_PLATFORM
    setting
  configs/ti_am62x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  configs/ti_am64x_sk_defconfig: explicitly set the ti-k3-r5-loader
    version
  boot/ti-k3-r5-loader: bump to version 2024.01
  package/python-attrs: add host variant
  package/python-rpds-py: add host variant
  package/python-referencing: add host variant
  package/python-jsonschema-specifications: add host variant
  package/python-jsonschema: add host variant
  boot/ti-k3-r5-loader: set binman environment
  boot/uboot: add BR2_TARGET_UBOOT_USE_BINMAN option
  package/ti-k3: move TI_K3_{SECTYPE,SOC} out of the image-gen scope
  package/ti-k3: disable HS-FS for AM65 SOC
  boot/ti-k3/ti-k3-r5-loader: install tiboot3.bin
  configs/ti_am62x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am62x_sk_defconfig: bump Linux version to 6.6.18
  board/ti/am62x-sk: generalize post-build.sh
  board/ti/am62x-sk: move post-{build,image}.sh to board/ti/common/am6xx
  package/ti-k3: fix BR2_PACKAGE_TI_K3_SOC setting for am64x SOC
  configs/ti_am64x_sk_defconfig: bump U-Boot version to 2024.01
  configs/ti_am64x_sk_defconfig: bump Linux version to 6.6.18

Romain Naour (1):
  boot/ti-k3-image-gen: remove package

 Config.in.legacy                              |  7 ++
 DEVELOPERS                                    |  2 -
 board/ti/am62x-sk/genimage.cfg                |  7 +-
 board/ti/am64x-sk/genimage.cfg                |  7 +-
 board/ti/common/am6xx/post-build.sh           | 58 ++++++++++++++
 board/ti/common/am6xx/post-image.sh           | 11 +++
 boot/Config.in                                |  1 -
 boot/ti-k3-image-gen/Config.in                | 77 -------------------
 boot/ti-k3-image-gen/ti-k3-image-gen.hash     |  3 -
 boot/ti-k3-image-gen/ti-k3-image-gen.mk       | 54 -------------
 boot/ti-k3-r5-loader/Config.in                |  5 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.hash     |  2 +-
 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk       | 12 ++-
 boot/uboot/Config.in                          | 23 +++---
 boot/uboot/uboot.mk                           | 12 ++-
 configs/ti_am62x_sk_defconfig                 | 22 +++---
 configs/ti_am64x_sk_defconfig                 | 22 +++---
 package/Config.in                             |  1 +
 package/python-attrs/python-attrs.mk          |  6 ++
 .../python-jsonschema-specifications.mk       | 10 +++
 .../python-jsonschema/python-jsonschema.mk    | 14 ++++
 .../python-referencing/python-referencing.mk  | 11 +++
 package/python-rpds-py/python-rpds-py.mk      |  1 +
 package/ti-k3/Config.in                       | 61 +++++++++++++++
 package/ti-k3/ti-k3.mk                        |  7 ++
 25 files changed, 263 insertions(+), 173 deletions(-)
 create mode 100755 board/ti/common/am6xx/post-build.sh
 create mode 100755 board/ti/common/am6xx/post-image.sh
 delete mode 100644 boot/ti-k3-image-gen/Config.in
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.hash
 delete mode 100644 boot/ti-k3-image-gen/ti-k3-image-gen.mk
 create mode 100644 package/ti-k3/Config.in
 create mode 100644 package/ti-k3/ti-k3.mk

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
