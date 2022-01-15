Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC38BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 16:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65B984035D;
	Sat, 15 Jan 2022 16:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZO9LGeK4NPIJ; Sat, 15 Jan 2022 16:06:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC65F4033D;
	Sat, 15 Jan 2022 16:06:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F8431BF424
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:06:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C2674033D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 16:06:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XT_GDcfwPLWz for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 16:06:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8FF0940338
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 16:06:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id v123so11812533wme.2
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 08:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2oel4HDktxQujyfHMeRicsVnjSDH8OmCC7z8tJqRgM=;
 b=mkebYhE6yKaYnRIdw5EeGTfFc7yE795UkcMlDPJvqpXT38/7EK6AhMJQ4VuAMTN5/X
 NfoW+tRgIQgH1oU9BWQnidvM6howe22kHYbWk+7UFwfHPVfHsN+nPWqzfftSDMKfC0Dn
 kXKqNzYe4JQc1L7B1Vh2IOeD6RFw+R8rqoRxVcMxwc4BreEjaXl8i8wBQ/Flraw6SQTJ
 umUjTNoJGb/LqalmbvZ7WcG6fsjBrjBsaE2w6qq6GZ/ay3ij4JFIeEvNHx+yYbmxqybF
 zX4L8Su7EfvzUlQ0MTY+386o5RhpjxFr4Dcu3q7uu0lpxDq9BkH5SmQiTg89M7/XKKy9
 PLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o2oel4HDktxQujyfHMeRicsVnjSDH8OmCC7z8tJqRgM=;
 b=1D+36AEZORbMqXaFF/tQuqR/0kKdTqjGWdcgt7MLACr7oUDWchU9/xxafGh/E/9AhK
 2IywutT5p+qnLOHm3zxmkFRFxli0aqhptgS54EHPrA8NiY04lrAuVIB1CQgXDwnJRqzR
 4mvRx7H963x7bNGp2ntjJKOMlpuZYw49LY8jnoG3/nPMbUtNgnxQnpaON7Mn5SopdvB/
 T6jvVO3IMCtz55sQbVXn2+JugaWCiRi68TXNyycSpZJXGqvCnNAuUbwze2HIsQw/PN9X
 OXQuHj1oFpCegjIEPLOjthJJdQck0jEogxjfdbZ1feUKBry5MyKlUWYXnsy0H13hQahu
 11oA==
X-Gm-Message-State: AOAM531VA/922VHxKZF2UW8MV/PbcFWtmcPLeqFwXEUdCXHjzMf7nJgC
 RqMXuyK4Adbg85r32vv/FXHP8Z1wBkw=
X-Google-Smtp-Source: ABdhPJytW+TRu6Hw7EAP7Bhbm29pVd0m4BdL7yk+z/h6eKdpSv0xLPEM0d1ouyUBLUcS976GZxDQSw==
X-Received: by 2002:a5d:6c63:: with SMTP id r3mr12776211wrz.678.1642262789747; 
 Sat, 15 Jan 2022 08:06:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id l14sm9201799wrr.53.2022.01.15.08.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 08:06:29 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 17:04:49 +0100
Message-Id: <20220115160449.2292472-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: set --with-boost
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

Set --with-boost to avoid the following build failure when a non working
boost version is installed on host. This failure is raised since the
addition of the package in commit
ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure:5559: error: Could not find a version of the Boost::Asio library!

Fixes:
 - http://autobuild.buildroot.org/results/855b66b86d979cc922b947da932b0e2388481263

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index ee9067d304..90eed93c36 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -9,5 +9,6 @@ RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
 HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
+HOST_RISCV_ISA_SIM_CONF_OPTS = --with-boost=$(HOST_DIR)
 
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
