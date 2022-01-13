Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9555CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 18:09:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 411A084BE9;
	Thu, 13 Jan 2022 18:09:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6qbmPnCuQYGb; Thu, 13 Jan 2022 18:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E1DA84CB5;
	Thu, 13 Jan 2022 18:09:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A86931BF4D8
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9760783F51
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wj27ZDFXN9AU for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 18:09:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD18583F41
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:09:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t20so4168517wrb.4
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzzI4DGCR2xOan7qsOe3pWwo1AqtaFniz8/7cMd3GAQ=;
 b=OWlx0ArJtWDe8vjJ8tCuoJVQuHl6bD6mfHafy8JsmN76KUYbO5t31tjTLf3q18Jd8B
 GWpHze3DuGxSzAmZHJ2uSSYK0FPKb/8DbYkxlHlRsNpnqs8S1qJ5lAyFYcW5cGAEX/EJ
 QJk1KPGPfabQYswXQmu7OSw9Ao8c9zdYaGelMcysf6zfZu4jb+pS+aGWfDMVI1fZd42S
 EySD8J1IXqfWElOVSAdb4Xg8g/mGdrfwWW4rOPHbCddlbt6/gteO+9wxuhzhBxGXGHkf
 u5WpEmG5ijPFyl7K4e/Dm8hgigBZ7DDTf0uO4410wA4wgNfsYfF1cTrdDSp+bHGTKndS
 DiJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzzI4DGCR2xOan7qsOe3pWwo1AqtaFniz8/7cMd3GAQ=;
 b=RP54r7eScgzqFgEZjSmBqm8p4eRRMSKoDylgLgSYNdvjzu7cFvhrjgiAYUaf0h+mLL
 GUM738AYqb/5wK6iojzmgsAqR+D83SeW3YMbv6c8ujlu8iwRh3RK1NiDzGrcmrAg0nCu
 xvzjiIdy2G3nlx7e+kahdzEfvH663qJjaGWroxWMVoyCYDaDuqGsXyHsc1XxoWFS4VNC
 tUSumvESWEtfCfiU2JnKqaY+XZugCeTcNPAs8elwC8QhrAu+zGwV5yPtjRxuy4tXEtoJ
 V0coHoEWVsdsY87b68tLXqaGVgCszpCTQAIAJtNqCR9mc9YbkZPg+zrQehXXQADdceVq
 pU7g==
X-Gm-Message-State: AOAM530mUsJUa/gXTqeM6eN2SUqyGW3ZrTIgT0vpE50T9cKeOGkWjsce
 1qGMmn4Eyoe5z/wuIS0RFVowV+6wmF4=
X-Google-Smtp-Source: ABdhPJxITU62icAaIAKxCMvspIwc5PW2mTkNeFEljyTJ66wqKGYnfCFVXxVWyKyr5GpPRPv/sx3Kag==
X-Received: by 2002:a5d:4dc8:: with SMTP id f8mr4891113wru.146.1642097341954; 
 Thu, 13 Jan 2022 10:09:01 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id w17sm3771004wmc.14.2022.01.13.10.09.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 10:09:01 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 19:07:38 +0100
Message-Id: <20220113180738.232377-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113180738.232377-1-fontaine.fabrice@gmail.com>
References: <20220113180738.232377-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/riscv-isa-sim: needs host-boost
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

Fix the following build failure raised since the addition of the package
in commit ea033cecf990ed3f86619647523a9ad2ccb09adb:

configure: error: Could not link against boost_system !

Fixes:
 - http://autobuild.buildroot.org/results/d1ec407d3a9106be1271e4897d6f578d501439fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index 59f70fc432..ee9067d304 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -8,6 +8,6 @@ RISCV_ISA_SIM_VERSION = 1.1.0
 RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
-HOST_RISCV_ISA_SIM_DEPENDENCIES = host-dtc
+HOST_RISCV_ISA_SIM_DEPENDENCIES = host-boost host-dtc
 
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
