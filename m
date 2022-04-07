Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C1D0C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 00:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4F116119B;
	Thu,  7 Apr 2022 00:57:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rq1dUmQQ_PlK; Thu,  7 Apr 2022 00:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D911C6119D;
	Thu,  7 Apr 2022 00:57:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DA2691C1135
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D704A41970
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JwmjV0DIcScv for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36B874196F
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 00:56:34 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 j20-20020a17090ae61400b001ca9553d073so4596813pjy.5
 for <buildroot@buildroot.org>; Wed, 06 Apr 2022 17:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WFmmZT7jqGqP8Tfb3eBTSZfetRcZro3zlhV/SyQVVYM=;
 b=bPYHtVCGKsHdK4BMuTyf7QZsywuD0NSXm+/Sm5otl8x2U4IiOzid0lBzwXpuutW7zm
 O8lmp712zD5h8323jiiuqLCChAT8Q5pX13211bKKSUBlnmZDe9pFqbgMV5Z6I55RUKRk
 m4jlBFY5yjFEf2yHyyOvnesEMP5hUAYakVnMjlK5IUTrQQFfABRsEyEoGBcmh/7Du7Td
 WJhSdAUdwy9y8EP48yvxZ55oHG+O8XNASU823Lr+tNRWw4S/Wny3wuW+sAKWhUhWB2zS
 /z1PNIhuMg2R7qrH6wYPRWHCBXjDAWO5rAtgJuRA+C+1gcA1/46IrhrlIOlJvXqOk67w
 bsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=WFmmZT7jqGqP8Tfb3eBTSZfetRcZro3zlhV/SyQVVYM=;
 b=gfpLLh56/KRUshL4KbHWDHtnHWkUUOaODMUiTsuYo/XwAxm5cu0lY1qy6V5Qn5XBaJ
 UeZSe2LN5HBTG3CwXJSOsII80IggFEsiGGmKZ+MkM+JJrhhPvPadlNdHqb6+LhccnE2m
 l0dB4N7sNEUkwaOB6KEkBqey+VWigs+q/0iQtRuaPWzF5pGLT5cOg0A+hzJAx6IJEGBO
 mW1lJt6hHQseujr+LXbYe0eat0oBiLAp++aUfb+bPICHOlDW9JmR24I6jKjeODtTKQNV
 ZZ0vlB21vKglY9ebnyNeGjaOCORc8gJncQuKSGucQRbeDjQoNC3ivXvIMtLQHrtrHim+
 2k5w==
X-Gm-Message-State: AOAM530N6GlhGT2I0/LZ8ki40aW9fFZd+M/lbMdnIYUdy2wTv2B8IAez
 CK/hMcUK1UhM3vUGi5H/KCM4boz1yok=
X-Google-Smtp-Source: ABdhPJwCFnGC45ih/UFzU2fn2AySqilLp4vwP+BfwoSNShHjbvN6TFSprgCAhv2q/Bit0R2vrlYlLQ==
X-Received: by 2002:a17:903:2488:b0:156:1e8d:a82 with SMTP id
 p8-20020a170903248800b001561e8d0a82mr11250090plw.51.1649292993195; 
 Wed, 06 Apr 2022 17:56:33 -0700 (PDT)
Received: from voyager.ibm.com (cpe-172-197-129-163.sa.foxtel.net.au.
 [172.197.129.163]) by smtp.gmail.com with ESMTPSA id
 x12-20020aa7956c000000b004fdf7a4d49dsm13067804pfq.158.2022.04.06.17.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 17:56:32 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: buildroot@buildroot.org,
	fontaine.fabrice@gmail.com
Date: Thu,  7 Apr 2022 10:26:08 +0930
Message-Id: <20220407005608.203359-4-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407005608.203359-1-joel@jms.id.au>
References: <20220407005608.203359-1-joel@jms.id.au>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/flac: Configure powerpc vector
 extensions
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Cyril Bur <cyrilbur@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove the hard coded disabling of altivec and vsx, and instead use the
BR2_POWERPC_CPU_HAS_VSX and BR2_POWERPC_CPU_HAS_ALTIVEC variables to
control the flags.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/flac/flac.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 3a18d81591e6..d1cc42f352f2 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -19,9 +19,15 @@ FLAC_AUTORECONF = YES
 FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
-	--disable-altivec \
-	--disable-stack-smash-protection \
-	--disable-vsx
+	--disable-stack-smash-protection
+
+ifeq ($(BR2_POWERPC_CPU_HAS_VSX),)
+FLAC_CONF_OPTS += --disable-vsx
+endif
+
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
+FLAC_CONF_OPTS += --disable-altivec
+endif
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
