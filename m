Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D314C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53A3F41885;
	Tue, 29 Mar 2022 18:46:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJV73sblJ2CW; Tue, 29 Mar 2022 18:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32A8141872;
	Tue, 29 Mar 2022 18:46:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B8D581BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7126842D4
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g-mN1umg6uyu for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:46:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9309842D0
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:46:53 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id q20so10899572wmq.1
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiWoSlyLy03WL0pmIkFoDo4Z52lIGjlaHxjHAWVHEIs=;
 b=M+468eIKlP4kJIyi62apwgfRBCgXyYnmDS84IF55jpOYNuhS1Cx9SG4WPkQ23BABRi
 COuo8T4EfSE6/b2uhDcALHgfmaDC/On2jyLhtKlrmKf4PQzjVSQMcnC4R5ysjm306V1n
 l04b7ZpADq4Loh1r3giYmQOY4Fh72c2Z+KZ5buqqL+IUFRLVjDHaDjWrRiLi46ZZPtYd
 FaRRaYru6gsDQCypI4VMDPQ5K85cRri32ekgLwOMI0Ow2cJUWtR87nHeMoFIdy1h/fjT
 V43gYnB1Olf5u8K/qSLz1oCaCaKyHK/q9KIKqJ6XC2/JIeX1+E0nAD64HOAJMzVFuukE
 VfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hiWoSlyLy03WL0pmIkFoDo4Z52lIGjlaHxjHAWVHEIs=;
 b=rGizZk0ObGVW7uxEua5hq1mO0FVsQRIHsGjdCuZa2qBi6+UIltXrzFag5RpXKLTkDk
 DArbBIrU1qEg7X+xnWssCWHLVWYh2bKbGQg3Y09c2HEnh5ZORoEcwAQDjbyDKW2uUYZe
 BpBeCmjUGxkmaLn9+7Tf7I8HXpph9u+GQMfHfBo8VYxSAUr2bnN37mNYt1oyPaw0jXBy
 a1vg4qNhT/YvFK7+Fyuv3MLLrb5TJun+S7lHmlPEBoOM+8wLJeB8WlBLTrHlSI8tZmO/
 6VapGp1SVdaZJJS94VKn8GEv8aT4NbB7/Nbgu6+8kWErd0ihrg3H5ze8jRfyi16ey3Be
 6woA==
X-Gm-Message-State: AOAM5311UYJJdRweL6x4fqBPN8EB8NfLvxG5va5CX0eWHMApzLHFe7Dt
 GkDkr4lSkdgPWlCOiR+UIiVSMcCGdbU=
X-Google-Smtp-Source: ABdhPJz1sPApDRq8uXcyhzxYOZ+Dpo7Vz0ZWjBbYHd+698DEnwTpCl8TKNPBaSIEYxHUQscoMsRv+g==
X-Received: by 2002:a05:600c:1f17:b0:38b:b2b3:9faa with SMTP id
 bd23-20020a05600c1f1700b0038bb2b39faamr861756wmb.190.1648579611687; 
 Tue, 29 Mar 2022 11:46:51 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4051000000b00205a8bb9c18sm11440184wrp.67.2022.03.29.11.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:46:51 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 20:44:58 +0200
Message-Id: <20220329184458.289902-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/nbd: needs host-bison
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-bison is mandatory to avoid the following build failure since bump
to version 3.24 in commit bf2e459bb9fc9fe57147313cda35f7022172e6e8 and
https://github.com/NetworkBlockDevice/nbd/commit/cd099ee7d0602104506bdd5063c0a3db2ec9b550:

configure: error: bison is required

Fixes:
 - http://autobuild.buildroot.org/results/05872813c9e9b9f39f960fa9a33ad82dc124c808

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nbd/nbd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nbd/nbd.mk b/package/nbd/nbd.mk
index f0fb23910e..50f698dd24 100644
--- a/package/nbd/nbd.mk
+++ b/package/nbd/nbd.mk
@@ -8,7 +8,7 @@ NBD_VERSION = 3.24
 NBD_SOURCE = nbd-$(NBD_VERSION).tar.xz
 NBD_SITE = http://downloads.sourceforge.net/project/nbd/nbd/$(NBD_VERSION)
 NBD_CONF_OPTS = --enable-lfs
-NBD_DEPENDENCIES = host-pkgconf libglib2
+NBD_DEPENDENCIES = host-bison host-pkgconf libglib2
 NBD_LICENSE = GPL-2.0
 NBD_LICENSE_FILES = COPYING
 NBD_CPE_ID_VENDOR = network_block_device_project
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
