Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2745C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 08:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF4141832;
	Sun, 12 Jun 2022 08:48:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CwchdXTK0Qg2; Sun, 12 Jun 2022 08:48:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4D8D4182F;
	Sun, 12 Jun 2022 08:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 27D371BF4DA
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2570A82FA2
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 08:48:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LpX9_Ze461w5 for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 08:48:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4290A82871
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 08:48:23 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q15so3636224wrc.11
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 01:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eQ8a4ZGwQjZGA+felf/YACuoLvdvTfmZebM2mfXmRdg=;
 b=nbbkj3g9uAoUt9PoygdlDS1JUcCHFm6LZKdrrp5ABOXz3A4I5YCtJCybnzs8xedF+i
 /2SQk6PsOaSiZa8937porH3QAr+UH0XQHcURdFzrvHrGzxHU+15hm/VPdyj2nOQCzggd
 zNDSATy76FWeYf7Z4/LV063tzX3XQ0B5q/+09qB5zCzT29cIjGckmfv/zxKPrhP3llqI
 MZUcJ6nwkAP97rZHL2kb3n+rWKr8sc1A3klbTLel6MdP2iasnp6QAIGiMYSNjKk/JhIT
 xkb1nvMThXwxs4uOztOMtGZFS5PA+xoXbiJA2q0yYbjX4f+5HstAm8VRl3jbZkt64L1v
 vjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eQ8a4ZGwQjZGA+felf/YACuoLvdvTfmZebM2mfXmRdg=;
 b=W9ZJxi6z62QcUiOKNAGuzxCKUd/1xSMWZN7gcaMAuJRi4EgjuiSc35763ct4uIiPpS
 bgWOLiI49Eac7DnkfJF59u3Ua6vzf3ssSLC5dE4kmzaOz4Bhpgiy5nl62sFADNkhcgZ+
 iizri7BX7jKAio0XzdevOot1KeELUXKX1vK3v78rxdz8lLg+bWVn3UtgCRrVuPRvXV1V
 LMaEPjyR5egR1rDYGi0oaNb0xEtHtTC9Jtuq7MnadOBqMlqcNFgnMrSKatCT18P03ioZ
 tttfQQSVbaRv8CMM0lKrKzXIeLMcSQRlrLrma+r1usR0eZPDqsVuI5DhqwbJVkPbyT3n
 VkgA==
X-Gm-Message-State: AOAM532bJU6teZHbO6Rwt3v3QwwMP8A1BnaZZvLk0PdLZ4sb0GgbWlQQ
 RXLpKkjtvbGdG4oLCVWD6UKN3Y0sw5w=
X-Google-Smtp-Source: ABdhPJyu9iBY0mcy+/x1CXUsDarMXv80OqFLrXE/bYy9tN0grqLjldXgBjA6cIEAE+yY4M3CokuqMw==
X-Received: by 2002:a05:6000:1f0b:b0:219:ff47:2090 with SMTP id
 bv11-20020a0560001f0b00b00219ff472090mr2858544wrb.582.1655023701199; 
 Sun, 12 Jun 2022 01:48:21 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j18-20020a05600c191200b003974a00697esm10769309wmq.38.2022.06.12.01.48.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 01:48:20 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Jun 2022 10:45:38 +0200
Message-Id: <20220612084538.1873673-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
References: <20220612084538.1873673-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 2/2] package/wolftpm: drop WOLFTPM_CPE_ID_VENDOR
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
Cc: Dimitar Tomov <dimi@tpm.dev>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:wolfssl:wolftpm has never been a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Awolfssl%3Awolftpm

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wolftpm/wolftpm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wolftpm/wolftpm.mk b/package/wolftpm/wolftpm.mk
index 760656e134..a4a9edce85 100644
--- a/package/wolftpm/wolftpm.mk
+++ b/package/wolftpm/wolftpm.mk
@@ -9,7 +9,6 @@ WOLFTPM_SITE = $(call github,wolfSSL,wolfTPM,v$(WOLFTPM_VERSION))
 WOLFTPM_INSTALL_STAGING = YES
 WOLFTPM_LICENSE = GPL-2.0+
 WOLFTPM_LICENSE_FILES = LICENSE
-WOLFTPM_CPE_ID_VENDOR = wolfssl
 WOLFTPM_CONFIG_SCRIPTS = wolftpm-config
 
 # wolfTPM's source code is released without a configure script,
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
