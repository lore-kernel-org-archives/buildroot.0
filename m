Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8407CC27C65
	for <buildroot@archiver.kernel.org>; Tue, 11 Jun 2024 18:01:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31CE60A80;
	Tue, 11 Jun 2024 18:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOlMRDDNm7Tq; Tue, 11 Jun 2024 18:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DFF60B3F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DFF60B3F;
	Tue, 11 Jun 2024 18:01:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12E411BF312
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9715A60A69
 for <buildroot@lists.busybox.net>; Tue, 11 Jun 2024 18:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Mn58Vv0zwvl for <buildroot@lists.busybox.net>;
 Tue, 11 Jun 2024 18:00:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=cdimich2188@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DB2FD60875
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB2FD60875
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DB2FD60875
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 18:00:48 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-6f8ec7e054dso1072315b3a.2
 for <buildroot@buildroot.org>; Tue, 11 Jun 2024 11:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718128848; x=1718733648;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SThsXFVAYG5mWeYv7YOQRtJ4L6QVKoTxOIePz8Wjac8=;
 b=kNrZ11eyjPmlRl7BZUIJji6gzBT0youCho4k3H1FVAnJUycEtkqfAOS9JbrBgz7VbD
 fXSJjrNT2+AWw9hqWSDVUy38dmlkaYv0QWMjaSFZM65cgoP9x4hujQ9yy/gvnUElfaMx
 +B0r6zWYR2zhrxg6sJdYQOxHVaubLLmp5C3W6fvydDNUzGU42a9RrIFqoZn/N55JXCW4
 OrShyaH1bOON4+SSbJUs+tWJuOSygDRi2aO5dI9HGEWGImXO0xAJQzK63/3NbH8RPGy7
 tcQbPBvwbXHgIDUuoirZhu5ufxEOEo1hp9N8XFiP2ZaW2Md4u6HrMMO9mPjNxaK8+w/s
 ia6g==
X-Gm-Message-State: AOJu0YwLO0y/w4DiJzh6V2puh+HaJiwoFw5s09mUv35zp6uTomJIvkmo
 +n7+jJcZrH55aMi8FWnNOwawycI1ciwlQh6P/sfZ+k3CsZ9uRznROz/JGlWB
X-Google-Smtp-Source: AGHT+IEffkN9iwhUrgJlCzAFG7n9HhCVUFaEcjjJjyZrJh94Y3vh3lBsslUKjxZpxxuKwKyph8T7IA==
X-Received: by 2002:a05:6a20:6f0e:b0:1b7:f59d:fd12 with SMTP id
 adf61e73a8af0-1b7f5ad423dmr5674212637.55.1718128847771; 
 Tue, 11 Jun 2024 11:00:47 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.56.126])
 by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-7041cff68d0sm6670410b3a.185.2024.06.11.11.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 11:00:47 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jun 2024 11:00:02 -0700
Message-ID: <20240611180007.2127244-8-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611180007.2127244-1-cdimich2188@gmail.com>
References: <20240611180007.2127244-1-cdimich2188@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718128848; x=1718733648; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SThsXFVAYG5mWeYv7YOQRtJ4L6QVKoTxOIePz8Wjac8=;
 b=DpfveY7m4maygD6Q20EF6Rb0II6KYpicnC5fz5o7gjHGU8oR6cxX96ddjMIncTMkFe
 1oXLl2rngP79MNs2n8YWOmxm6pybEahHR9WkfoDKeHy6v7gr2ks+w03A62xDwuGjdOv2
 NMmSi63I9+YWypNw+dA+IVoVVXI0jWnaG2Vodjt8ULPctoCWLeRgn8ceq3zcaGHsJEQW
 2TdasixzJLZR4ctSv7Zp3evEKkvk7sp5ffUtelP2a6UBA2HjB7QSJtWIiP5X7DGruNdo
 JJGD9CmtsEMEryGmoPsh6PBBVfpT3h227tyjH6G+zO8RBRI322qA0mnTiq2tKpXKLd52
 dC/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DpfveY7m
Subject: [Buildroot] [PATCH 07/12]
 package/freescale-imx/imx-vpu-hantro-daemon: bump to version 1.1.9
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
- EULA/COPYING: update to LA_OPT_NXP_Software_License v49.

Signed-off-by: Chris Dimich <cdimich2188@gmail.com>
---
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash            | 2 +-
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
index 2992baead8..0fd64cdf9d 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  111cb6d5970f76aa3619cfd1a59a251d590fc474f84aad2d4d4083c2a4264fc8  imx-vpu-hantro-daemon-1.1.7.tar.gz
+sha256  80d6620063fd5e5506b05c907677b579d471a9b6daa8b26ffb963110cc680bf9  imx-vpu-hantro-daemon-1.1.9.tar.gz
 sha256  bb645f02b260955f333348100e40af76253e2cd8b116bac047230439dd53ec5a  LICENSE.txt
diff --git a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
index ab4746beb4..12ec055f92 100644
--- a/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
+++ b/package/freescale-imx/imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.7
+IMX_VPU_HANTRO_DAEMON_VERSION = 1.1.9
 IMX_VPU_HANTRO_DAEMON_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_DAEMON_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_DAEMON_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
