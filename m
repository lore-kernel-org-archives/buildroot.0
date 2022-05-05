Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A67C433FE
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 10:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80CE340BE7;
	Thu,  5 May 2022 10:13:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xA91qLnClauR; Thu,  5 May 2022 10:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4AC4D40167;
	Thu,  5 May 2022 10:13:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C35381BF2B7
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 10:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1B3E418B9
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jX_S23ZiPCAl for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 10:13:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C59DB418AF
 for <buildroot@buildroot.org>; Thu,  5 May 2022 10:13:29 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id v11so3286384pff.6
 for <buildroot@buildroot.org>; Thu, 05 May 2022 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1ymCkaWzeftJmvYF+qEZoK2wBVKjct5mQv0vt3gsPvA=;
 b=Jd0M1Pf0hYkkbjjZriOaCcy0Njsok7AoV5UhJQRL64rIpRlROq+hzWx7PRIgdG/d3D
 fYu476rJ0mShKKkunWivTaC/pxWPTzAFxTCPBWojwl57lfpWarttJeRMGIRN+6iCOQwF
 i52JYOS3n56zn/ui+HNSgI1NJtjNBsBm4A3JOTh1oERYLrqNe4K8AW6vkeyMFFXw5dXs
 0Xk8i0qoE4qVAxom3ssHvwKZJONBEkb1riQjhy+IS32CPvuO50OGgAwX5yLM1jyE85aD
 xnWvccp3p/WxoakXCupySyDu3k0Ng+nBb07YBkKb7Vu6xZXKv1k9RbPDS5h2p6wCfJNe
 0bPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=1ymCkaWzeftJmvYF+qEZoK2wBVKjct5mQv0vt3gsPvA=;
 b=y4iIP/OaOahlB2Xq7KKrzpIoP+xuAK+SG7KaeJlb/mggEqGytFfQPi+kwaWEOleYnf
 B/qoUvmYr27rm9ACRKMXqtNx2CRzJMpPNkXFq0k6hogOKoSuL/j4AG7qOlysSimhzhPq
 xxT16QqZSdkjVGjnWW8dx7xEJQ4C39JVWP1UKc4kFAMOG/1w5PMxkrkoTyIHaRzh66TB
 GAgaIHYMpVLcRyV7dHLjBWFt54ibZAcLqubjRwSsIrXJ5rgTnBANjZz3dg/MLT/2B+8Q
 EgG9QOlujAbGiHIYZZjiJMH5sUho4Kmps0NzyOs4puh1eQvfx5lGFbJfad3ykhhtg7Jp
 lgHg==
X-Gm-Message-State: AOAM530zVZtkNS8HEhw3lSHDu3N3+xsLwhCMC4n9IVhZ2GXoyRdQCxsz
 juzyQjKReBVM4Z69nP3Q7IdDjChuN8Q=
X-Google-Smtp-Source: ABdhPJxUXGjEow25g6gGYnNXGmrd0/zqWuMjPgmWFMLbDm/w0d8+FduuR5iRsY6RmX7fNHaoSR/kcw==
X-Received: by 2002:a63:e116:0:b0:3ab:812a:d5b8 with SMTP id
 z22-20020a63e116000000b003ab812ad5b8mr21046490pgh.457.1651745608445; 
 Thu, 05 May 2022 03:13:28 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.14])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a056a00134700b0050dc76281b6sm1071625pfu.144.2022.05.05.03.13.26
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 03:13:27 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org
Date: Thu,  5 May 2022 19:43:19 +0930
Message-Id: <20220505101319.155879-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libgcrypt: Fix powerpc64 build w/o
 optimisation
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

The following build failure was reported by the autobuilder:

powerpc64   |        libgcrypt-1.10.1        | NOK |
http://autobuild.buildroot.net/results/eb60bb95411076b92f5c63f9b21c6e576998031c | ORPH

This config is building with BR2_OPTIMIZE_0=y.

The code relies on the compiler turning the series of preprocessor
macros in to a constant for the second argument to vec_sld:

 chacha20-ppc.c:60:10: error: argument 3 must be a 4-bit unsigned literal
    60 |   return vec_sld (v, v, (16 - (4 * idx)) & 15);

The argument is a constant, but it would require a significant rework to
make this build without optimisation. Instead disable the vectorised
powerpc code when building with optimisation disabled.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/libgcrypt/libgcrypt.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index f28552c6e7..8f4e5ec8c0 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -18,6 +18,7 @@ LIBGCRYPT_CPE_ID_VENDOR = gnupg
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_OPTS = \
 	--disable-tests \
+	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 
 # Libgcrypt doesn't support assembly for coldfire
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
