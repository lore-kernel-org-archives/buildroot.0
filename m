Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E95F7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 10:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87DCF60803;
	Sun,  3 Apr 2022 10:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ad4WKCyX_Olr; Sun,  3 Apr 2022 10:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 981BE606A9;
	Sun,  3 Apr 2022 10:33:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1CBA71BF29F
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 10:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 185AB40472
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 10:33:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m6AC6P8Fs_lH for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 10:33:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DE46403F7
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 10:33:29 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 f6-20020a1c3806000000b0038e4a0fc5easo3953763wma.3
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 03:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ollafw1iufqRr53k7KKpnon166wtf5vr8GF1idjEje4=;
 b=bxioKabn4I8Ct+UABxoPg+EALjavsBpHrbWy4gZ4bcNLC8fkS+wmn9iBJXTNZ/2KSF
 MQQpDEC3Jt2lEbm++MFMoQBClZeTf0/0Rsg3BKDNFYbpQPpj4/l/ctKyxpXIKwRSvs3Z
 sR7n2bDJFoC8cZ+YCv5jnK1YbNm+7zky0ddj9IzYb8L2oUlb07pWGyYQ0MiDLJ6haYRe
 qUbHtwABUKJ/MDVA7FTDtN4DHD/gJkXoZq9ABQcQp8YjUXFutMHL6xunEKFQNyLbmr7C
 L8faktyyNMmB8VdoKAKBMP5uL1iVx5XEAwq7NgytCzNb0u8eDAbBcY9yYtkWix48XK/r
 BjVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ollafw1iufqRr53k7KKpnon166wtf5vr8GF1idjEje4=;
 b=0VtsNUrfcvyFY9ktHHRl7LCzkjnkCn1WbGWDMG7Hb3nKPCxvINAD3ENES4OldSReat
 rSa7CQ3kfvqo94yvwlSjC7abE8QoKstXJ7tMU936WmzttCcrhGv1sPpUUX9ZotHGbI4i
 RUVBgg4fVpnOKEY0iiugZEDz9UQSrj5LlVuA/DgfXP8R3V8N1WByLnVxLEDKH6+nFJiX
 4gHcSE4HWal0a7ybWf79tX680kG+qxd8XFJB1aJYtyRHrmRSl2ZHE7Qvmug81TR36oxo
 CwvH0kZpnzCjN2gXgrErDMzzZbWaJBCV3FrQElUX9LCPgJYhqme4XRC/HtdUdJqQZns3
 Y4Lg==
X-Gm-Message-State: AOAM531xLDRSq8as3yNOsVbxTpWphrRT0a+JGVwr0AH5FaMpsOHgJ0Fm
 Yf57bAHgQIcPX+Hn9S89SMAMhooa8vU=
X-Google-Smtp-Source: ABdhPJxNFalfAbLhAuw6wQKhkZhhuPr7iHfYE7F0qZhZacmjnkrYMvTxFzaXvE3BY6htiWQAv1zFng==
X-Received: by 2002:a05:600c:154b:b0:38c:ca19:357d with SMTP id
 f11-20020a05600c154b00b0038cca19357dmr15852731wmg.51.1648982006937; 
 Sun, 03 Apr 2022 03:33:26 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05600c191000b0038ca3500494sm23251924wmq.27.2022.04.03.03.33.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 03:33:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 12:31:46 +0200
Message-Id: <20220403103146.2873012-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flac: fix build on ppc64
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable vsx to avoid the following build failure on ppc64 raised since
bump to version 1.3.3 in commit 89337e4f39343b3cba0e9f77b3a198fa8ea340af
and
https://github.com/xiph/flac/commit/cdb030cd3749b4547399a049ce3cae5e974ccd48:

In file included from lpc_intrin_vsx.c:46:
/home/autobuild/autobuild/instance-1/output-1/host/lib/gcc/powerpc64-buildroot-linux-gnu/9.4.0/include/altivec.h:34:2: error: #error Use the "-maltivec" flag to enable PowerPC AltiVec support
   34 | #error Use the "-maltivec" flag to enable PowerPC AltiVec support
      |  ^~~~~
lpc_intrin_vsx.c: In function 'FLAC__lpc_compute_autocorrelation_intrin_power8_vsx_lag_16':
lpc_intrin_vsx.c:94:7: warning: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Wimplicit-function-declaration]
   94 |  d0 = vec_vsx_ld(0, base);
      |       ^~~~~~~~~~
      |       vec_vslh

Fixes:
 - http://autobuild.buildroot.org/results/a97a0522c58964fa51815236bc39b378e10b5008

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flac/flac.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flac/flac.mk b/package/flac/flac.mk
index 2ff048b6e6..3a18d81591 100644
--- a/package/flac/flac.mk
+++ b/package/flac/flac.mk
@@ -20,7 +20,8 @@ FLAC_CONF_OPTS = \
 	$(if $(BR2_INSTALL_LIBSTDCPP),--enable-cpplibs,--disable-cpplibs) \
 	--disable-xmms-plugin \
 	--disable-altivec \
-	--disable-stack-smash-protection
+	--disable-stack-smash-protection \
+	--disable-vsx
 
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 FLAC_CONF_OPTS += --with-ogg=$(STAGING_DIR)/usr
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
