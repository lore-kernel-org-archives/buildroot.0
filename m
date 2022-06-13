Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19638C43334
	for <buildroot@archiver.kernel.org>; Mon, 13 Jun 2022 19:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DB1D415DF;
	Mon, 13 Jun 2022 19:56:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WE5jbCt6POzR; Mon, 13 Jun 2022 19:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34841415C1;
	Mon, 13 Jun 2022 19:56:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05E171BF2BF
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8B8760E48
 for <buildroot@lists.busybox.net>; Mon, 13 Jun 2022 19:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg36Pf1GeEdz for <buildroot@lists.busybox.net>;
 Mon, 13 Jun 2022 19:56:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DFA6360E39
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 19:56:13 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id c21so8450320wrb.1
 for <buildroot@buildroot.org>; Mon, 13 Jun 2022 12:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JEc52Qq+w7XdtPxcvcrOGvu0iu3TQvrcOT2jdj/zeg=;
 b=MJ7cTLvrYHA3RwBAdpsu2anXVLQP5rEqL/VKM2kXiooY9iGNmXtL56xIvLj2Mw24Hq
 qDiFK8oDYOmoWgEISjzx68UQ/QHMCokSgitMxPhzP8YZozMmMm7hQODTUaBhkbKhLlGu
 cQXQeoKSrhjl/d9CmkUCXGfvqQmIquQZUQhLFPO2F7kQsG2VycbgE/DaN46qwmVBEObd
 QDRVLaLcv8pGbmPMgRYhktpOnujC+wpLsDYfobGoxEx+pKmTXC1W6k4pkdooG44V/HO9
 LAdDITUYjpJSpPQQxCo4nm7fngfnnk7Y2Ci3AfgI0pD9j1LMMbn4toPlabULRA0zVI4f
 pXXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3JEc52Qq+w7XdtPxcvcrOGvu0iu3TQvrcOT2jdj/zeg=;
 b=dRuHgHXOitDDmXLprcPHrI6Ansxs/VXGU3I/ne6RaGSOpVfDFctCbdmqaOH8DdzoyK
 1L31GEBCtMZr7gA9WE7Ro8QUcOkumD0qIsugKfoK5XPJwd7EvUf3JIBZ8b2MGyM+nBNv
 HasoA/M+/fI4Rh/3Ynm8xCAqGjYPpGVB/BCs24k+YvSjyRVrDK4v6mzQZ+Z3N0sXZV0l
 1iGzw1AKDmd6/o9JozTS38S+zg91fscFeQNZhZbVOZODqiNbX5tQkfh+F2i23NYfp9G0
 tKboQYgDi5mNQcPa9Pu23bmUfbbqvy2HU75c24I6/reAxQ678cHzLS+hrdQG9jYWB+bA
 wutQ==
X-Gm-Message-State: AJIora8rjSyzfa+IVASo4FaS3TBBhxTqq0L5DpgbdzW980X/iZpTo7pe
 3luF0FglM6HKmKpxQlrtW7rNa76XoTU=
X-Google-Smtp-Source: AGRyM1sHahSep3DDhpzI40XxlE0uc3vEQYgqyK4YnC3sQPn9aRDUmphbKQLyk+OL9bfN+8eTWFaPMw==
X-Received: by 2002:adf:eccc:0:b0:212:f1ef:943c with SMTP id
 s12-20020adfeccc000000b00212f1ef943cmr1313508wro.179.1655150171719; 
 Mon, 13 Jun 2022 12:56:11 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a5d4e8a000000b00210320d9fbfsm11159586wru.18.2022.06.13.12.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 12:56:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 21:53:23 +0200
Message-Id: <20220613195325.290672-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] package/sofia-sip: add
 SOFIA_SIP_CPE_ID_VENDOR
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
Cc: Gregory Dymarek <gregd72002@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:signalwire:sofia-sip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Asignalwire%3Asofia-sip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sofia-sip/sofia-sip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index 2bac480542..c7698c9a11 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -10,6 +10,7 @@ SOFIA_SIP_INSTALL_STAGING = YES
 SOFIA_SIP_DEPENDENCIES = host-pkgconf
 SOFIA_SIP_LICENSE = LGPL-2.1+
 SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
+SOFIA_SIP_CPE_ID_VENDOR = signalwire
 SOFIA_SIP_CONF_OPTS = --with-doxygen=no
 
 ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
