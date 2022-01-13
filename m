Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2895C433F5
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 18:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838B74168F;
	Thu, 13 Jan 2022 18:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q02tAcmJr2g4; Thu, 13 Jan 2022 18:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE0294165C;
	Thu, 13 Jan 2022 18:09:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD221BF4D8
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:09:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76A5440140
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 18:09:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pJ8M26SGYVM6 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 18:09:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 908D7400E4
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 18:09:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k18so11599280wrg.11
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OYvT7JJ0b1O1470coHRLgapSk0gPIe/i/21HtqxY8Kg=;
 b=O++Zjy79JCFeDCAvbRzLDFw1jvYT2ypcFRvOQnyibKnhVJwgz69F8cKITmBYYOCqZc
 V2uEEdWqT003pK3p3A7aHdvTpnqjl4rvVUKZhtBM0g+Ztl+d3ZzNO853+pYdwM0fXX7T
 Eze9O7YRyKVckvJzd0wecqbCcKKMrpsY7ci0X/7rpsHbJLRM88qaVH1be8jy6FPlEoM6
 7FGCYJiVj2FgrktJusegrbheo3dU9vhcqdSOqb9RhfkvYyzRMwllKBPD/PfVATi0dmE4
 UXR0XvtMkcy+s33LaaHECjblaTEMKVSZLJhqb8awx91cvfrD97xAEpsFyY5r/wr8XkRA
 XGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OYvT7JJ0b1O1470coHRLgapSk0gPIe/i/21HtqxY8Kg=;
 b=wLPfn8d40yVzBEwTnCqNEjQP1yPE/dlXiA8n5/4LIr4l+RY7C5yj4ozcYKcwP7i7FF
 pJ138/2cxLRh5ASFmkKHERH8NoQupOpcxN2mUWLNc2WKVlcQVrxlhAGPnPf3yWuAJOPX
 OQRqqTktTr3d011sIjMVM3ukZY388rTh4wVGt8IxpeLqIP+5ZbV/p/o1o3RQerQNM4gU
 GNcYsJjlw2AxD85CkPk9qqhCSQ7p2u+ttYfridjg5MsBIIB4dpo1UfNK/jAhA7gpGSHr
 y8fq0/xiZZlhZAIlEaVI6EL1iuLnj1PjZ6U1N1QQa2yHGaYxeMuwZ++ecJspaPAcValQ
 45rg==
X-Gm-Message-State: AOAM530zDkVm6H7Lnl6UrefmXsqwDSwYMoT6XFMylJnTvf96Ju634Y3Z
 YnHRDMUYJgs0g/0kptEWEBSqyMhu2as=
X-Google-Smtp-Source: ABdhPJy4/h7ajdiDmYmMM5AFfv9tTT0Fbapnsf6jkgNW1k6BOAwq4cXlsCf1gY9pi4ZaCGMwNjxMng==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr5174880wrw.105.1642097339699; 
 Thu, 13 Jan 2022 10:08:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id w17sm3771004wmc.14.2022.01.13.10.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 10:08:59 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 19:07:37 +0100
Message-Id: <20220113180738.232377-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/boost: enable regex on host
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

regex is needed on host for host-riscv-isa-sim

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 6e026f4781..6d1046e9a2 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -17,7 +17,7 @@ HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
 	--without-libraries=$(subst $(space),$(comma),atomic chrono context \
 	contract container coroutine date_time exception fiber filesystem graph \
 	graph_parallel iostreams json locale log math mpi nowide program_options \
-	python random regex serialization stacktrace system test thread timer \
+	python random serialization stacktrace system test thread timer \
 	type_erasure wave)
 
 BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
