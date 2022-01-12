Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF452C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 17:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3886441FBE;
	Wed, 12 Jan 2022 17:22:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B_Rq0o4T1fUK; Wed, 12 Jan 2022 17:22:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8217A40A58;
	Wed, 12 Jan 2022 17:22:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47AEC1BF357
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 17:22:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37B954291C
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 17:22:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jHxw-QibPetD for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 17:22:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C70742915
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 17:22:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id q8so5457769wra.12
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 09:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQaDEd4ubO+QSlnFVdpc2ar9Oavey4A2G/BvhkCvirU=;
 b=SvNZb8aL1AAqsApGK/3E5Ezt5eqPJoIKSSzVyABpEuu9qZ83BbpE09x8jvh1UxmiM/
 QZvpnx6xXVBOK4IuT7HY2+Phovtpc3uZsVDYZ9m6PNbYvHxlc7ZwBK2DVtkDKd87ajmc
 FBAydGIHjcqQ0W7K+AapeuhlZapcB6MLBFUDXjZkZZlsvjdQ3Ik2ScVhrkefwvJ30TM7
 42Ilj2Fg7LJPIEfPvUwAC4wvous8Gq7aR8xKbN3pPUtxgLMvGYTFcufKIHyRFghQAVe+
 Y2rk9h0qLglxhiNB48czBgqyqBStx+ipwUUlVlKhaDeWyN1b3h/JEfoCLIX2tvZXn/dk
 KYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hQaDEd4ubO+QSlnFVdpc2ar9Oavey4A2G/BvhkCvirU=;
 b=XGJpvfODlmnnqROIYXGK0fSDL1wPdwxhaECzHPx1QH1OMwwivwf5HTZr7Kooph6GLI
 aWfYvAmDTUWP+9pAP7cQW8xnDMm2NKfBU5xpQhZGuYROTECt/+C16dGfTybjJqYjNvKK
 cE11a14gtO7V9s7jM+Y5VNdF90vRf/6CuQE2SeKUPc/tSMwiDQc9Nz90Zvnf4gOv0tRo
 KBi7a4Cq7NLyqUJYGgXQkyDPrZxAkSHUgolBLQcFv5HjzbTbhUc2oZ1bI6HZNFgyvH9n
 L6PI4Ey/2kAFbQRYZouJvcb7cyN0RfVXP7o8Sd9O8M85ra6MbktnPat2OObHi8Uvw8pN
 mJ9w==
X-Gm-Message-State: AOAM533KGHAiRca8j2MJ7BjVhzFaDrylFq43h3oD0grb6gSIBy1ocHDW
 3f7vophyZyNEsKEGcymW9XyiWCBOyE8=
X-Google-Smtp-Source: ABdhPJwaW5uZA+uKIZfgVBFejz7QEaSWF4ObErk1QQMuRqgrcvVFz5e04qTGt3+P585mw/iLz3stRQ==
X-Received: by 2002:a5d:5982:: with SMTP id n2mr650707wri.582.1642008144420;
 Wed, 12 Jan 2022 09:22:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id h205sm2395961wmh.19.2022.01.12.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 09:22:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 18:21:00 +0100
Message-Id: <20220112172100.2991140-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/riscv-isa-sim: needs host-dtc
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
in commit ccfc90e1010e42e6529afae3a5ea8bf7226dabc1:

configure: error: device-tree-compiler not found

Fixes:
 - http://autobuild.buildroot.org/results/d35ff4a0ca0a8463121d717a9727e0d863ca83e8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/riscv-isa-sim/riscv-isa-sim.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/riscv-isa-sim/riscv-isa-sim.mk b/package/riscv-isa-sim/riscv-isa-sim.mk
index e10dd4c662..59f70fc432 100644
--- a/package/riscv-isa-sim/riscv-isa-sim.mk
+++ b/package/riscv-isa-sim/riscv-isa-sim.mk
@@ -8,5 +8,6 @@ RISCV_ISA_SIM_VERSION = 1.1.0
 RISCV_ISA_SIM_SITE = $(call github,riscv-software-src,riscv-isa-sim,v$(RISCV_ISA_SIM_VERSION))
 RISCV_ISA_SIM_LICENSE = BSD-3-Clause
 RISCV_ISA_SIM_LICENSE_FILES = LICENSE
+HOST_RISCV_ISA_SIM_DEPENDENCIES = host-dtc
 
 $(eval $(host-autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
