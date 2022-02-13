Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3628BC433FE
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 21:28:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F93181322;
	Sun, 13 Feb 2022 21:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4e8TRJaZxbk; Sun, 13 Feb 2022 21:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA985812E2;
	Sun, 13 Feb 2022 21:28:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C7B161BF475
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE71A403B9
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 21:28:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k-5znF-4ZFMC for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 21:28:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5918D40176
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 21:28:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w11so23916892wra.4
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 13:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mIKaOoSPOqBS1JnFq23OORhHwdIIusSHEykWdAt8OA=;
 b=Sq0Yds2Oib3++vecIkQ4NK7/Nk+M5Y7gFS6J2xoh4Iw2q6XX7h3a8p6cnCerRh+wKG
 1H5Dicbz5eOFbyre3/pVyc6igAxKq154rad8Ti8b1+WYhrm85r4xh3oz1VK27GTaWnFT
 zS4WaElCxS8eCf2q5t8G3NSTdu+wbhKNr0gtZBXOSehaV81QygaLJcD9WsfSCgqzzKHf
 r+xZIiE1V4H1HU2yih174JatxOLDX8Tyx22B+AdbRR0+xrnYdWOpERf3gTcOxfs1Is/T
 RyZMOc6WoOZQfXtCOiy4HnaM1ZokiEa7f3le0Oce2kwaVbRq6id+g/3vriWImJLPBe30
 oWGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1mIKaOoSPOqBS1JnFq23OORhHwdIIusSHEykWdAt8OA=;
 b=Q5wu4Jb1qyK9mNOIxekUEzA2S6CUE9uoSyGIt2l0Fn+Wb0K08nUB6bpjgNW4WXoh1r
 JCLvDWeMywhNbCb+afXy/FDPCKzjZy4+LYgcaiC1vqsGbFBle488+ly9KsiFw2RoH3sM
 mjRYKD2RwOph6pzugxuVbonSY4gDwnBOVVoetI6AAJbd52FRfChqbNGS5em4InUp7Lp2
 YsR1uULGcRhIdS/45tiF8YnGPgv52WdMlnZTgo0/r3oK4j773ZPG1hDA4+xTLamlZfXs
 SmV6QUT7l6OlEHpPJPCTSrv3m845z09CP/XRzfTHNMcduitUlUeXDMEdIYE4dmEVv1xy
 +HJA==
X-Gm-Message-State: AOAM533fAIYIz6d+CxV2d8w9e8/J0K5k6wMQq03I5VpERyQ70VSvzkTu
 UHWIy2pHsOySjgkiLUX+jDOTctxSQ/M=
X-Google-Smtp-Source: ABdhPJwEfE5jwys/smZxWaPEJWVTQ5Dkv9fFXUhYIv15cmHodSrFu/9406BXrXMBYnXNZGE38rvriw==
X-Received: by 2002:a5d:4f07:: with SMTP id c7mr8663466wru.146.1644787731420; 
 Sun, 13 Feb 2022 13:28:51 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 20sm8243554wmk.26.2022.02.13.13.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 13:28:50 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 22:29:09 +0100
Message-Id: <20220213212909.1504992-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: openssl is the default
 crypto backend
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssl is the default crypto backend since version 2.1.0 and
https://github.com/mbroz/cryptsetup/commit/bc3d0feb5cd33f9181102b418cc7bf44fe112e82

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/cryptsetup/cryptsetup.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
index 55cc70576c..b50ac698bb 100644
--- a/package/cryptsetup/cryptsetup.mk
+++ b/package/cryptsetup/cryptsetup.mk
@@ -22,15 +22,15 @@ CRYPTSETUP_AUTORECONF = YES
 CRYPTSETUP_CONF_ENV += LDFLAGS="$(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)"
 CRYPTSETUP_CONF_OPTS += --enable-blkid --enable-libargon2
 
-# cryptsetup uses libgcrypt by default, but can be configured to use OpenSSL
+# cryptsetup uses OpenSSL by default, but can be configured to use libgcrypt
 # or kernel crypto modules instead
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+CRYPTSETUP_DEPENDENCIES += openssl
+CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 CRYPTSETUP_DEPENDENCIES += libgcrypt
 CRYPTSETUP_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=gcrypt
-else ifeq ($(BR2_PACKAGE_OPENSSL),y)
-CRYPTSETUP_DEPENDENCIES += openssl
-CRYPTSETUP_CONF_OPTS += --with-crypto_backend=openssl
 else
 CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
 endif
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
