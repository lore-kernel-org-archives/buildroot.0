Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FB6C27C75
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B719F60B63;
	Tue, 11 Jun 2024 18:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lregcU1eFaag; Tue, 11 Jun 2024 18:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 826F160B5A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 826F160B5A;
	Tue, 11 Jun 2024 18:01:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 399701BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26DAF60A69
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0i7QvLsaWxTu for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47AAD60AE0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47AAD60AE0
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47AAD60AE0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:51 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-70413de08c7so1179121b3a.0
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128850; x=1718733650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6l7yKCJsnYa+0/dgPfSTOsodfKxbnSY3leOb0ROaMBA=;
 b=nQ8Z6S56gKxTKdqK29PDi/tqSGBc8MD3ogXT56dz3Qe9ZitZOSTC4+UvtD65rCsObt
 FLoXDuGOSEaeJVGWBrCAXlB4ek3qWgb3N50e3NA0P9Qtrug6pjSPQyto4Ly8URIqe1eD
 yB/ceP8hX3DV4VUc9sNxlvJNKbW8mCIesfZOCr3i/imE1ND/0IO9zSR5XPeG6WdWAtv+
 pEC+WRLWywaLHs/MsHkGkyTuzA96TPvizvdRtMSXU+d5hfzXVQ3Tt4fc1L/Y9SWdcDUP
 6fUnx0FA6BblJd+wOHnxgWFy6ZlN5VhRmBlSFcHoYxEH4wvDBT4c1ETapBgdfLDue/Jy
 iHJQ==
X-Gm-Message-State: AOJu0Yx8/fsQyv/ok6pAwxStPQbrqHcxoE6TqBLvRPbQcETKej3QyL0Z
 q9uHsE7MqQx0COQZyCwjmtpyNQvtzz74jq5wA1h2hIQxVaNjn2ahBx9gpXAA
X-Google-Smtp-Source: AGHT+IHtjQvuPhLDiXICsTT7Uzz0dgQSApwruTqlEoyeJFqLSuB73c26BYcNt8+Pc0eLllmdFYri1A==
X-Received: by 2002:a05:6a20:72a5:b0:1b8:9933:14db with SMTP id
 adf61e73a8af0-1b899331aaemr2279671637.43.1718128849936; 
 Tue, 11 Jun 2024 11:00:49 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:49 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:04 -0700
Message-ID: <20240611180007.2127244-10-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128850; x=1718733650; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6l7yKCJsnYa+0/dgPfSTOsodfKxbnSY3leOb0ROaMBA=;
 b=BYh3cOggQhQB4LxbbIMMzvMFi8rea4+X0h8SGnhpOUJBRyyCqBrP1Ni2d4QU95okUq
 u0jWiiC3+sFkttxEUVeOxMYywwPGFtjvSAe6jjXaeXqTQioCG2e4wOmwmxZ3In3o/WcT
 KuzV+VDOvXnPFofjLcL39TZwZJdazbHxFbuyJMMcUzVSboYKMWb5S1c06F6q5paEIYPd
 vTTv90C/jD4WTYps0bMyR+TTY5gyLiYhlhDRYZ+W1NB8/U5Fy6rZn5ZBRqB9zNYFgLdf
 rVbVOKZ6TXuRbbQOjVQnWEHC/PoJJyIuXsiExGztwXc9BXEm6oagYqiTn7w/0EAfMrM1
 p0aQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BYh3cOgg
Subject: [Buildroot] [PATCH 09/12]
 package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
 6.4.11.p.2.2
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- To match NXP 6.1.55-2.2.0 release.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash    | 2 +-
 .../kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
index 1411c8d3ef..1a1e89b95a 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  ce32d7f9e16daa0ac87a41bd6da2f96743cd5b28b7bc324ca642e985a29a4e48  kernel-module-imx-gpu-viv-1e65746bb15628ccbe88e3ee7a0a1d2becc48e79.tar.gz
+sha256  b174a79042266b5d36c03f7db12036c93acd546f996367dd33233581e64857bb  kernel-module-imx-gpu-viv-4d035200e7b15d2713d49979a1d05f201b92cf4c.tar.gz
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
index 13df35dcc0..d87f575064 100644
--- a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KERNEL_MODULE_IMX_GPU_VIV_VERSION = 1e65746bb15628ccbe88e3ee7a0a1d2becc48e79
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = 4d035200e7b15d2713d49979a1d05f201b92cf4c
 KERNEL_MODULE_IMX_GPU_VIV_SITE = \
 	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
 KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPL-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
