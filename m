Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADDCCD13CF
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 07:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4272B80F8C;
	Mon,  2 Sep 2024 07:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5F_yxvKAzRw8; Mon,  2 Sep 2024 07:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F9B880F8E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F9B880F8E;
	Mon,  2 Sep 2024 07:45:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BD0BB1BF33B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8DF780F8E
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 07:45:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhK0RymD15sp for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 07:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=lars@underjord.io; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6C98680F8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C98680F8C
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C98680F8C
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 07:45:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-5343eeb4973so5906900e87.2
 for <buildroot@buildroot.org>; Mon, 02 Sep 2024 00:45:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725263132; x=1725867932;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gs79WoPWO4vtNpaVrSFcvPsZyNxsRwrlxRPq/+mRGGA=;
 b=embM5ZkJDchJKw9/8Rb3rwl9bFihv53OhDzL6ngK6KPywyIhVWp56uznsOKef8566U
 n6JA5ZmtWJWPVoi84K1ishkJ/KZkQYV6FPJaUOqI1A9glW9aEBhr5c7OIV+bO4FvqsOT
 ZMQ8kasIANAQ1zsLHhdkvCGBIVrLATrduerxp4qSC3j4fQxtBTWTb4JPizRMAKIOJAsl
 ujHz5T+H7YsGDYkViJMuRLmgOHdiidmQ4X2a0lPcaiGUFcCUCU0kvpLrCW3nmhfvszy6
 G/oZKjZ4SiGN4pej78IcvkIk/ttvGQci4nFUlYIR/4PC6ZfO5RsidhcBf80mJQWibqWP
 LM8g==
X-Gm-Message-State: AOJu0YxBzBsgVWftr+3sVYJq0geaxWroouoGGFoRdueMrjY008CkSgI0
 e1rU4CQZl1EMT+mqduULtfsEKEp21OCw4ScyCJ4bS0U5CWW5N9CaMELwHxf0tQc41gn480lrtnr
 4
X-Google-Smtp-Source: AGHT+IEcHmA1skoONaM3FtJZPHik3QsbTZBBaps5Hlc2wdD1uyPTjEopaRGMC2kHaWSYcjeogT2v4Q==
X-Received: by 2002:a05:6512:238d:b0:52c:cd77:fe03 with SMTP id
 2adb3069b0e04-53546b32f72mr8262506e87.14.1725263130825; 
 Mon, 02 Sep 2024 00:45:30 -0700 (PDT)
Received: from monolith.tailb203e.ts.net (h-98-128-166-168.NA.cust.bahnhof.se.
 [98.128.166.168]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53540827f6bsm1489276e87.159.2024.09.02.00.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 00:45:30 -0700 (PDT)
From: Lars Wikman <lars@underjord.io>
To: buildroot@buildroot.org
Date: Mon,  2 Sep 2024 09:45:27 +0200
Message-Id: <20240902074527.2908996-1-lars@underjord.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=underjord.io; s=google; t=1725263132; x=1725867932; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gs79WoPWO4vtNpaVrSFcvPsZyNxsRwrlxRPq/+mRGGA=;
 b=lV/ygMDqzw5bpC8An65kNCrpDxRdn++9fUnUWrCPa8MFFCIxcAidHA2rXJqlQIfYKu
 ZhXSuEMvELNAR910RhtxUIGgiIyqI+PfV65/kkIvPgeqL12CbEDHA5/8bsArserkbdWC
 SfF30CNJJZkkrizA8VZLhPF/gTy77sBCb7hg6wW10a1y0KeNBfisQvwbnUeHejjjYZFC
 svMUnnX9wlNh0ZhFsKHRaFfXhXvWXo/eV5nK2N5P1t9pAuCG7rVL+fIR8hefCS2kUjgp
 HQBehDizkIANZFu+UIFajSr59sokuvlAXz7+kndFmvqpXfbqki8DIqCS6I4fL3TuP3ba
 aCgQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=underjord.io
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=underjord.io header.i=@underjord.io header.a=rsa-sha256
 header.s=google header.b=lV/ygMDq
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: add OpenSSL engine
 option
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
Cc: Lars Wikman <lars@underjord.io>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONFIG_SMARTCARD was unconditionally disabled which has meant that
even if OpenSSL is compiled with engine support and the supplicant
is configured to use an engine it would warn that it was compiled
without engine support.

This mechanism is used to enable the more secure forms of 802.1x
networking authentication such as EAP-TLS with hardware-delegated
cryptography and private keys protected in hardware.

It is still disabled by default in case there was an original reason.

Enabling the option will allow delegating private key access to TPM2,
ARM TrustZone and other specialized secure hardware for establishing
a network connection.

Signed-off-by: Lars Wikman <lars@underjord.io>
---
 package/wpa_supplicant/Config.in         | 6 ++++++
 package/wpa_supplicant/wpa_supplicant.mk | 7 +++++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/wpa_supplicant/Config.in b/package/wpa_supplicant/Config.in
index 92953f69f0..5ed5828bb1 100644
--- a/package/wpa_supplicant/Config.in
+++ b/package/wpa_supplicant/Config.in
@@ -175,4 +175,10 @@ config BR2_PACKAGE_WPA_SUPPLICANT_DBUS_INTROSPECTION
 	help
 	  Add introspection support for the DBus control interface.
 
+config BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL_ENGINE
+	bool "OpenSSL engine support"
+	help
+	  Enable the smart card support which enables OpenSSL engines
+	  using PKCS11 and 802.1x
+
 endif
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 984959f679..b986cfe643 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -24,8 +24,11 @@ WPA_SUPPLICANT_CONFIG_ENABLE = \
 	CONFIG_INTERNAL_LIBTOMMATH \
 	CONFIG_MATCH_IFACE
 
-WPA_SUPPLICANT_CONFIG_DISABLE = \
-	CONFIG_SMARTCARD
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_OPENSSL_ENGINE),y)
+WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_SMARTCARD
+else
+WPA_SUPPLICANT_CONFIG_DISABLE = CONFIG_SMARTCARD
+endif
 
 # libnl-3 needs -lm (for rint) and -lpthread if linking statically
 # And library order matters hence stick -lnl-3 first since it's appended
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
