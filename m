Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D13C433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AA6883E9A;
	Tue, 11 Jan 2022 22:26:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KFVeIuxUeo6t; Tue, 11 Jan 2022 22:26:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15A898339C;
	Tue, 11 Jan 2022 22:26:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D5951BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4878D40286
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bPavY5lcuYwW for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:26:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 880F140132
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:26:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id k30so814483wrd.9
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjVftTGbT+vbkmRYIODG8vHHosl8T2MKhQuc5Vem10M=;
 b=IN1Q3PVAddSrHbpOsXxnv13smpvEYCgXUT7DqvC0g58JU+F9ZX5oWrqIqGStvPHlR/
 LP10yT2AHuQMTLsDM4hf6Usc1bdJ+USqn8kDh4knbUTtkdNCznu2HunyuBGtVFirqM/0
 crBOoOeEs4pqfs0YGHkJa9zW97pqR9N8VtwE88WVoHWyPDMevLvmUzrTCj9DNZWFzR9q
 BjENQFUe3Ij2WUcAw8hPzcXMt+CyZzploz6qdYr8eEkGQf/B51hG8yA8dG1uSOsYsd6R
 8lcoy2bcrlmLT3vspG9N0Xg2omyEEfUJ9vnlPEgzTf+Mom3Q0aZE58hOFo5Hbye7XuLu
 6Xdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zjVftTGbT+vbkmRYIODG8vHHosl8T2MKhQuc5Vem10M=;
 b=h1AInlMNxhZUkpi/8Z0qa7asTOURpUzJWkn15Mz761C0VCi7gG4Jn9XMzCFVpMbzEG
 3+EFL8o7us/fEJem3EPJhuDsfzK0viv6FEdZ19S1SUYDxcwGQApjL+/lBURkSVttVbn+
 c3UJETrrGXyCogOO3hNQCIO7xQgRfk67GMvhcmfN7xkTCL8qCHU4XV31z0i4i3c6ics8
 /uCSZDZTK9ccYLX7B9bqrjh0XrwYomLa8LR6+nqWYDmZwTQ+s+Xb6vM4pgiOhiHeXCn2
 Hx++aRMheJoonVh69C3b2CnIcQE1Akes5OYArFMK796ipPgf+xr1slUXmvSgpujMYxOE
 /CtA==
X-Gm-Message-State: AOAM530B5MyW/a729Dq6Px07Trc9HswUFdCywU7zxzcb7pcTC/hDt/VK
 QBX4BbGJocyKZ+hoWNbI8MCPgsZ/pmA=
X-Google-Smtp-Source: ABdhPJxCF4WcZkpIgc3ngYw/Ev7eYyrAF2NEJMP+SEXLCBCxVRVVCeGplX5ujaE/1t3XodZD74aIAg==
X-Received: by 2002:a5d:46c7:: with SMTP id g7mr467488wrs.671.1641939969534;
 Tue, 11 Jan 2022 14:26:09 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id bi24sm2951052wmb.9.2022.01.11.14.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 14:26:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 11 Jan 2022 23:24:28 +0100
Message-Id: <20220111222428.2711661-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: fix typo in comment
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix typo in comment added by commit
ea033cecf990ed3f86619647523a9ad2ccb09adb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/riscv-isa-sim/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/riscv-isa-sim/Config.in.host b/package/riscv-isa-sim/Config.in.host
index 35e404caf0..4ccf6e9546 100644
--- a/package/riscv-isa-sim/Config.in.host
+++ b/package/riscv-isa-sim/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_RISCV_ISA_SIM
 	bool "host riscv-isa-sim"
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++1
+	depends on BR2_HOST_GCC_AT_LEAST_4_9 # C++11
 	help
 	  Spike, the RISC-V ISA Simulator, implements a functional
 	  model of one or more RISC-V harts.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
