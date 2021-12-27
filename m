Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D2EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9F0A40991;
	Mon, 27 Dec 2021 09:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpXvVZymLXpN; Mon, 27 Dec 2021 09:50:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 032F14037C;
	Mon, 27 Dec 2021 09:50:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 153BA1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D841181448
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BrU37qjdmbv for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 09:50:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84ADE813CF
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 09:50:43 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id j21so59644259edt.9
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 01:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8hazOlEwCPW5VrdcUHj324HiwPMXngfPQFvWizXY0E=;
 b=MAVsomZivWawAIwPv4YN0WYj0hdNkK7emWTnTQ8OQilVQ/lCvhMjSoU7cpzaV3Gg52
 vc4Nyy9lvQISlLkrutnX3lNMsWQCuDSxFpQHLwbvz+7Q898VCRxHBIzIuRdY6+u/Ykly
 t7rfxR3jjXtyA8yGbWuznUtGSPL83FF4VhqFFLKr7Gj+rJuaRm9rFmW+8embYs4AtsMj
 BubRs0MZTbeLFoLXI/+UbvIFOWw2Vq0YnLdccuQFk9cR87p6iVWyz6IUSWdEnqKT50KA
 1VL4BxELPh1w8pJ8QeLvlB0Zp+xg2pEnCtLABG2rni7lIowwD2bZlR0CPEiXreLi9Nv9
 482A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+8hazOlEwCPW5VrdcUHj324HiwPMXngfPQFvWizXY0E=;
 b=EnKhaPefq5xArfSvh5yO/IudllrzxoODYM6FfZYgij2rN/p94qg6bTgLWRFLntkiHs
 EOlsnev3edvyuxI23VGL+BBYd5tw+zx6yKM+p3c07u9RtdLs2xlh99laXdZXhxkSPrNe
 xaHzhbsSy+zre/Ed7vSkHX9WfZATsqlMg8xmeNZbXhh8aCF9a4DqVQ3FejTio0PpNEAl
 JebEv2KTlO6Vvi/+6dLAWea/ylI4mGHBX9tshSsJ5qlcVx3tX0Vm/ejzLFWm/qJMpxen
 DAcXfo/c9/XkWdWau8aURDYXHowL1OBMad7axXpfYIxJHItZUuGZCs/UZXliFfba9wlR
 q/AA==
X-Gm-Message-State: AOAM530QnoLyDELiLE5fhK9ltAakLRNue+TuhR4WuMmxiJccDIRt/Sxc
 Sumyd/ZCcIVlXqguFmf/eX1UBSgopQk=
X-Google-Smtp-Source: ABdhPJwB+9EMzdCmhW7mB4UlZVScrUMAbG2l7qdtwtfi5o0SS6CTJ8E//Ypr0pa5BaFGPKDEu9WjFw==
X-Received: by 2002:a17:906:649c:: with SMTP id
 e28mr13308816ejm.60.1640598641701; 
 Mon, 27 Dec 2021 01:50:41 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id l16sm5915933edb.3.2021.12.27.01.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:50:41 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 10:50:35 +0100
Message-Id: <20211227095035.1051454-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pcre2: bump to version 10.39
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

diff LICENSE:
-University of Cambridge Computing Service,
+Retired from University of Cambridge Computing Service,

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/pcre2/pcre2.hash | 8 ++++----
 package/pcre2/pcre2.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
index 2e86d8a19..3e6299f80 100644
--- a/package/pcre2/pcre2.hash
+++ b/package/pcre2/pcre2.hash
@@ -1,5 +1,5 @@
-# Locally calculated after checking pgp signature and compared with the mirror on:
-# http://downloads.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.bz2.sig
-sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
+# Locally calculated after checking pgp signature:
+# https://github.com/PhilipHazel/pcre2/releases/download/pcre2-10.39/pcre2-10.39.tar.bz2.sig
+sha256  0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440  pcre2-10.39.tar.bz2
 # Locally computed
-sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
+sha256  15bc778a1f7e1f857d57abab4181749a06ad1d1f9420d5c9e3c23ef8c991b025  LICENCE
diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
index 398e7389f..adcfaf1ca 100644
--- a/package/pcre2/pcre2.mk
+++ b/package/pcre2/pcre2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PCRE2_VERSION = 10.37
+PCRE2_VERSION = 10.39
 PCRE2_SITE = https://github.com/PhilipHazel/pcre2/releases/download/pcre2-$(PCRE2_VERSION)
 PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
 PCRE2_LICENSE = BSD-3-Clause
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
