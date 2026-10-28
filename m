Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6EC1606A31A
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CC38kASs
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D2E540A8D;
	Wed, 28 Oct 2026 21:40:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fzGyFmABnwhM; Wed, 28 Oct 2026 21:40:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3C5B0409F4
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793223619;
	b=lkZBnCIYZ7Xj47l1q8wLkwRnWLP3tMAoAcRWqthJHvR6bNZFwON75XXydhf9t2RDN29u
	 ZaSS6XiVgJ+Vd0n0B+Xxj05OO2Pzx6Wf8oJz91m174/ZnB91mCStIrBrz1hZesUpO/T6h
	 hgEjumx+0cDo93OZdUdhbX1Kf17rGGVTkuFKo637QJgj9EVwkvICshWAynkEDWB82zBmf
	 Z8W9y7K8K/6JVp2vcfawm7MKvdUTPmUzdSBLYPNVR4z5wOW+p8WW6HKD7881zu/+e10in
	 +4a3LWZ5mJwVAxwWSi53MCy2aU95EseuyKqcPndyTsqyB9mwEvYKPuMxrxNG/LwLqqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793223619;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bwhTHAUR84ucEdJjAY/6vh/4xnEhCvrJXINeN22RTsw=;
	b=Mvt7JbZpgYfaIxU/DqM3CSX/lZP1ibCHCw6RMS4y4gTA604oQXBqlAvyMUtH2AmdTMur
	 QqDydjax3FLl64/Q4MU7y8b2elSWwIKGPSTW9fKjWeQf7+PTaoRj6XWCu8YyBSANTC7ei
	 J7e7jGk6tuAgDdxU+FSKLB7wTU/fouQu8s/JNjAnO6VTCfYfgk8rC4PjTR9BYZ7HnYCo6
	 oAxdlaMowNgMd0WC4BTqRWd4MtVNSi06oI26sdbItxgEvG/2ok/T7RklYy7cmXyByl99M
	 oRtM7IHpyHwjKetqA2im6uzdsyIMo7aLduPxLCD+nceJPYo1REFDbZNZSFRNUgASKbQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793223619;
	bh=bwhTHAUR84ucEdJjAY/6vh/4xnEhCvrJXINeN22RTsw=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=CC38kASsv6tT3GfaUMjyvvwXwCzb3Z+msWiWbsZsf0M9N4EZir9pRXnUyJCfpFqid
	 CufQAc0sX42HTLfg7PUnt9BwxdosXmBj9zjwePT+Mgsoehk0z+XuMIaoY6CIq1Z9dj
	 oWx9AyCzv3BWVtd/zH8x9jsNwRQoLbU+NOqVi3OiYEz0ddvwvx0kxbGyRSEGx9CEgj
	 V7RagZwdBm2DG3ld/Fd1m3jcJinrf4WHV4WKy/N5bV2AJm4Pjp4l5jdLBca3AoCsfe
	 XpgSh+iRqk/zCkME/SZV3cZKa7sQmCO8tllAClABEUzMbbiteUECxTu0BhuX4NXlCW
	 6YJ4pllMWvQRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5B0409F4;
	Wed, 28 Oct 2026 21:40:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CE7792E5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B443060748
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id awzoW3B_1i51 for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 21:40:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05D4660725
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793223617;
 b=CXWIbDqIPhdz2oypOEm6E1ifrsfJR6lvTywk/3l88aJjsPTVp72+Ub8TO6RL41wnAqHX
 OzX3r6aD52IPtUid+dLxJ/zo0It/oRHKMMMZwE/9cg9LlYQOdK+6d9SIqklERBPtxD5fl
 bG8A/l+mPN1U8QDtuRkEmY9o8dlZ9t6ZdcBEbm5CQ1wJayXiYBaTICtUmpzibfud4nzwY
 kBrJHo6kmIK9cEac/DNOzAQCyNXlgJoqJ0ntyhlsuIbCOWd3qGns4D0r4u7TTMixzBhwQ
 RxPYkCTjAcR6OYM9PL8wzlpBOtkSw1tAIhTSHlCYOTCWdlnD4Hr7bI8qoSsYxFw2ZXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793223617;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=diV9EuRy3Yq4E+rFvt2mKE2QklFVYN1NKiFhTf8E2mQ=;
 b=grQtefD8yzXokdnKnVFbT2Gx2yPLClsH5+FAuo5ShspUOXbvn8AB/p0akErFcglA1m56
 qZMjN4biCxBwnaDSAVFa5QzBK0tH5Ys2y8ixrqp+DDuP+JR9LGtVTgAhjtW+BVW8BbiIB
 LPVIJ1SWO1G/i7M7c2smMocGJAoprBgHvH0PN3elY2JCNuCUbnNhKBY9EpxA9+BbA6Tbc
 ELuExgt+gRVvor/qJto8LXOs1I3ZuI2lQCCvAcd/6E11+si0/fzGhcxaBqnbcXzDUcmOz
 +2Nd4HA3r9gqd39tNSckgu6NhxkAjd2oUNAprGBeX+3V3DDw3LOZHTY8kApPf1dG67g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=NCIhcVgI; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1064"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1064; helo=mail-pj1-x1064.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1064.google.com (mail-pj1-x1064.google.com
 [IPv6:2607:f8b0:4864:20::1064])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05D4660725
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 21:40:16 +0000 (UTC)
Received: by mail-pj1-x1064.google.com with SMTP id
 98e67ed59e1d1-3ab60ff4273so1296771a91.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793223616; x=1793828416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=diV9EuRy3Yq4E+rFvt2mKE2QklFVYN1NKiFhTf8E2mQ=;
 b=LmlS9fIOg6zcqzkZ0BuYQoFmcHewGeIPGGw8pdIR1wKLTAXVi5LQCy6uB6k0xVs/fu
 4fJk/xLb5qbgO541GyfOn1zurcfzOgfTdFje37VEm96u0qKiPZpuggJCzrFqTjeNkGR7
 EGFtvDdm3EY3GFzJoneBK8KJiRWcD5iRjNMHKuczGIqj0Lqxk1d3iIdTUFm6DRMoiflG
 5EVJ2HfUTAMyPW7Z6GWbF5X1cgxfIzu9z5QAD1TqNS+E0C/3oGuvV7zhJMHejxWsPpIA
 noE3hsumJpK8jPSCImtJMMX26u4V0FKI/5z1Bmdyn02UJxP5lvprGPnNSsLThBZ+v/9C
 yXug==
X-Gm-Message-State: AFq9FYIt+vBFOiikfebJr97ojvAIY8rl3OB6bfRpIpMZ7ksOfS2PiDlz
 85xl9Ew5xsEpnFtAx9JyjpxeTLuYHWhWKIMl+Gm0iH7ovV7hGNr1Ds9q4eKdvPQ2ys9nB+B6Tbf
 2wEgAQJgppY3lmpKFnB2ov8I9B3ls8HXbcaMdx7AHmv3sBtNR7+eDCuBEB7fQiqVy5T9oVDeHJW
 M1mGDKov1MyTjjjrTPQ4NwadEIrCbkqAg3Cy8ZPRG/BelUBppuwV7R+kojx8onGxC5I2uELZAUp
 8VQqcwihpw6IBPrMw==
X-Gm-Gg: AYBFou2T8eW/sMtgNYIuxJtaeByPWxFd3oyL0Dse4jQnJeN9s6PgTdf6GiuzVOtPzuk
 D9uEjRHl8puh3jT7hKHKfCIGkvxkDlGxCmdYfZM3/vT+SOYl9LJTIBswSnHNLiVDOuDvQv9Eicn
 omxRq7pZjT17XytKp3fYNUuWKB++iskG5mr8VawwyNUmbpfAJb25eHzmBU+2zF++TX1MN7YZwzv
 bmstLlYiy8W5ZAbDPLCqy3HxkAxIO4kyuuToIvbL7R0zm1FfBfRdju+XgHH3uj1MdsXQX0G/ecu
 8rYSaG7wC81FrnX+HiHjRM0/BdMz4mH1YxpPknJLYCIvaUj0MUghKTJJpw4DYD4Q/kob0G9MyIm
 pEfkivUU8uxNL6zNCEV6UwOxtHfREFRwwWYuX6fJE1UYIQm2SjAXxla654cVpOhRCL1KMvxfE9R
 iqCTrDgETVNIMbYN9t5SsWqmqFnfCZqszh3heyacLD
X-Received: by 2002:a17:90b:3844:b0:3ae:533e:7e40 with SMTP id
 98e67ed59e1d1-3ae581aaf78mr2631983a91.23.1793223615836; 
 Wed, 28 Oct 2026 14:40:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3ae6e80415bsm548062a91.3.2026.10.28.14.40.15
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Oct 2026 14:40:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5376f1849bbso33345071cf.0
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 14:40:15 -0700 (PDT)
X-Received: by 2002:ac8:5fce:0:b0:535:856c:1241 with SMTP id
 d75a77b69052e-53fcc9c0580mr62418801cf.56.1793223614609; 
 Wed, 28 Oct 2026 14:40:14 -0700 (PDT)
X-Received: by 2002:ac8:5fce:0:b0:535:856c:1241 with SMTP id
 d75a77b69052e-53fcc9c0580mr62418241cf.56.1793223613962; 
 Wed, 28 Oct 2026 14:40:13 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91c47c16569sm140994586d6.18.2026.10.28.14.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2026 14:40:13 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 14:37:37 -0700
Message-Id: <20261028213744.511429-17-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028213744.511429-1-florian.fainelli@broadcom.com>
References: <20261028213744.511429-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH v2 16/23] package/{ffmpeg,
 libvpx}: use $(@D) instead of $(pkg_SRCDIR) when possible
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

$(@D) points to the package build directory, i.e
$(O)/build/<name>-<version>/. $(pkg_SRCDIR) is identical, except when
$(pkg_SUBDIR) is used, in which case $(pkg_SRCDIR) is
$(O)/build/<name>-<version>/$(pkg_SUBDIR).

When possible use $(@D), like we're doing in all packages. This will
facilitate future changes in the package infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit b1791fe7c10bc312328926b45108553dbc674254)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/ffmpeg/ffmpeg.mk | 2 +-
 package/libvpx/libvpx.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 4ce129132d9e..a6815c15b6d1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -604,7 +604,7 @@ FFMPEG_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_FFMPEG_EXTRACONF))
 
 # Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
 define FFMPEG_CONFIGURE_CMDS
-	(cd $(FFMPEG_SRCDIR) && rm -rf config.cache && \
+	(cd $(@D) && rm -rf config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
 	$(FFMPEG_CONF_ENV) \
diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
index d6b84ffec37f..2523e7ca9931 100644
--- a/package/libvpx/libvpx.mk
+++ b/package/libvpx/libvpx.mk
@@ -30,7 +30,7 @@ endif
 
 # This is not a true autotools package.  It is based on the ffmpeg build system
 define LIBVPX_CONFIGURE_CMDS
-	(cd $(LIBVPX_SRCDIR) && rm -rf config.cache && \
+	(cd $(@D) && rm -rf config.cache && \
 	$(TARGET_CONFIGURE_OPTS) \
 	$(TARGET_CONFIGURE_ARGS) \
 	$(LIBVPX_CONF_ENV) \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
