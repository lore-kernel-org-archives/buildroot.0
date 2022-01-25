Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A79BC433EF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 22:36:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0309060A99;
	Tue, 25 Jan 2022 22:36:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lks5W7W0lvDK; Tue, 25 Jan 2022 22:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F110608A6;
	Tue, 25 Jan 2022 22:36:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 116BE1BF2C6
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 22:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0015A608A6
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 22:36:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3sxtQVG3qe9r for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 22:36:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABD3A60806
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 22:36:47 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r25so5818855wrc.12
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 14:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiiOwzCxyh4H/dsvVjvIdqVA0+Ee8KR7LH6McnGAMWI=;
 b=UscnogrzaME3DX6vQr2zFljvrBePn1d3rNjOY0duTZ6/Do2lz/906mxDfdrM7cPOtt
 ednQIBSqHYfkqW8uPKvwrlEtCY1wpFFvq1dYQgjIT5byrcxrp52zSBF0oQYs0r4Q3u9/
 MK4j5dLDmeFcdOSORWu0mXS0mKDs86vv7a+3Grv4TxOw1iH7Vvuza4CG9b88TjELFj+N
 Bb+ll3P/R0hhDI6Ox+oLpnlV3Q/+LEoIW+LfgV7/YDM9mmsRQ3MYdbsFrDWFRUnpbXp4
 2a5acIdnvP4pk7Gx48Bo/AaPy8Z3wKoZVh/aB90iz0fapYGZg75YwohmHi0+6dTX8eRc
 ne1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZiiOwzCxyh4H/dsvVjvIdqVA0+Ee8KR7LH6McnGAMWI=;
 b=PU7WpuLGy86ENWWTrs4y95ilAa25oh2OpdaP8k1Zwc9jxoGKxwy4/zGlOzMO+ct55U
 b+Jx4Ismq7DcYnGK2yQ4WcKzoRWjZBa3RROtl6ODdUKtEu9A40g4YD/03NdC13DnoEZj
 yzhIBk2X+eKRGLWMlOTNNjBrtkHm8ovROivwTczdw1wLsiIOBOOtjfeOWR+1oBFDYYJK
 PW/mPA/LMyhx+dxgyE138r+l06BWWTvM+B7pfSEQL4/TYn/NepL29BPBbmWK62WtQDk8
 Xk6w07RzKMknCNuXidhOCWjiFs4em/Ylo5hIUOCWYWU9ankqKues32NiJUrzMt8v73Ji
 qXAw==
X-Gm-Message-State: AOAM530GU2vObYIVYAZd2P2yB0/wFKqxauR5SAoCnGfzwmkmvM7zZ4rP
 rw91hIIctFlqfw9Vi7MpXIjfJlazns0=
X-Google-Smtp-Source: ABdhPJwmWL+91kk+pC0olcAG8V60LospSkeK1C624nO4k00v4rZ+FG6iV/CzhIbSoVKAyqxN47eNQw==
X-Received: by 2002:a5d:5745:: with SMTP id q5mr18885996wrw.160.1643150205843; 
 Tue, 25 Jan 2022 14:36:45 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id w22sm4700359wra.59.2022.01.25.14.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 14:36:44 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 23:34:54 +0100
Message-Id: <20220125223454.444515-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/tesseract-ocr: override neon check
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Override neon check to avoid the following build failure with uclibc-ng
raised since bump to version 5.0.1 in commit
df3f0c226fccd8d6143b09a1e05a0f5f23587136:

src/arch/simddetect.cpp:61:14: fatal error: sys/auxv.h: No such file or directory
   61 | #    include <sys/auxv.h>
      |              ^~~~~~~~~~~~

It should be noted that a patch to properly fix this build failure was
rejected by upstream as "ARM support without NEON would result in a very
slow Tesseract": https://github.com/tesseract-ocr/tesseract/pull/3717

So, a follow-up patch adding a dependency on !BR2_TOOLCHAIN_USES_UCLIBC
for all CPU architectures or only for ARM without NEON could be
approriate.

Fixes:
 - http://autobuild.buildroot.org/results/0bac6491188b6681df2ca13eb230706e83cbb130

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tesseract-ocr/tesseract-ocr.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 7e23e64136..a7498931fb 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -24,6 +24,12 @@ TESSERACT_OCR_CONF_ENV = \
 TESSERACT_OCR_CONF_OPTS = \
 	--disable-opencl
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),y)
+TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=yes
+else
+TESSERACT_OCR_CONF_ENV += ax_cv_check_cxxflags__mfpu_neon=no
+endif
+
 # Language data files download
 ifeq ($(BR2_PACKAGE_TESSERACT_OCR_LANG_ENG),y)
 TESSERACT_OCR_DATA_FILES += eng.traineddata
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
