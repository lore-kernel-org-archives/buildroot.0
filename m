Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C990C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2BF941954;
	Wed, 15 Jun 2022 16:18:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OZqBNCYO4D4p; Wed, 15 Jun 2022 16:18:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD951403A8;
	Wed, 15 Jun 2022 16:18:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3FAC41BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F2A182E19
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5BM9qAHXLCuw for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:18:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77B2482DD9
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 16:18:09 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 c130-20020a1c3588000000b0039c6fd897b4so1427897wma.4
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 09:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QdYyeQSJx1kxd6FMPVRV4jptqKoVsO4Z0Bi5hNkGN/w=;
 b=R0Qe29F7rgft/0NraF4I+nDgINWheIfbpLxeA6noUEx7vpATY8LPC0hcR5/jOybhhq
 otqPaaL53cw9X8cF1k5nLa3EI/gf627Wp2+Hwv6MlsRhtD/FOBKHfdLdeTkjYA42TyB5
 PgoxAqctdi25cCPmjDZvOfUdvRfc9utQGEEL8El+vMAsMiCZtm9QMnViBIFsVkiAsMnU
 VnxM/ZKjCorEQsWZbtz12Pf1S55rmO5ydt6Gufkpgi3mkW0ReQd6/hao0JsxxHHrvc3H
 EdrHGxSzxkAVTFnHMmvz/tyji7xu9otih99/atDzcrvsFWGopzmyTTX64h6oVx4SXDY/
 myLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QdYyeQSJx1kxd6FMPVRV4jptqKoVsO4Z0Bi5hNkGN/w=;
 b=zd9wWW/sDDG/9Qzx11YJic9GV9ZzDOpBKc7r+TF8MgIUcbqw7FBLaRlh2OnLgDrTLH
 XWLXh5XTcYNz9meXUVujz0/i2pLkgk6/vDBFgbU8aOmIoJhLs5xNvEGnAikWDeZnFVXF
 VKDqItzjE3luo09F2UPR8acXjq+FdNIshqy/Pys3q7DtViBD6Sx0QGrQOVAZ9zc3eRG/
 1+ziH15cPw33Xt6bF3xDeCin2xLYVg25dG5d5M4mlWTChmJnYp1KBv2HXYmigfrq8pza
 vho/ZgkpLFKBPzIoNwPj4JxPFwyw1JTwxCjAub/QsEj5QeIxPbkHu8CHVdxi+TWUTjWx
 9HTw==
X-Gm-Message-State: AJIora/pa23tVt8S5sgiM6uvUnoVBKopHRXBcXmlQ2W/CJUXnxpoPHMo
 RGsHckBxSLSS5Uc+awlvqgMuN9YcvAeXcA==
X-Google-Smtp-Source: AGRyM1smM4U6pIzxvp974O2jakituv4nhmgSinuOb3BG7DendJtgy4bTmE3BZtL7Jxk8VChb7fgjFA==
X-Received: by 2002:a7b:c154:0:b0:39c:4f4a:79c0 with SMTP id
 z20-20020a7bc154000000b0039c4f4a79c0mr224943wmi.152.1655309887724; 
 Wed, 15 Jun 2022 09:18:07 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm17723325wrr.51.2022.06.15.09.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:18:07 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Jun 2022 18:17:52 +0200
Message-Id: <20220615161753.2580142-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615161753.2580142-1-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/open62541: add encryption support
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/Config.in    | 19 +++++++++++++++++++
 package/open62541/open62541.mk | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 3f5eb78d5..ceca2ca1f 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -7,6 +7,25 @@ config BR2_PACKAGE_OPEN62541
 
 if BR2_PACKAGE_OPEN62541
 
+choice
+	prompt "encryption"
+	default BR2_PACKAGE_OPEN62541_ENCRYPTION_NONE
+	help
+	  Encryption support
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_NONE
+	bool "none"
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_MBEDTLS
+	bool "mbedtls"
+	select BR2_PACKAGE_MBEDTLS
+
+config BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL
+	bool "openssl"
+	select BR2_PACKAGE_LIBOPENSSL
+
+endchoice
+
 choice
 	prompt "namespace zero nodes"
 	help
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 9757aa18c..0935581b0 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -23,6 +23,16 @@ OPEN62541_CONF_OPTS = \
 	-DUA_ENABLE_HARDENING=OFF \
 	-DUA_FORCE_WERROR=OFF
 
+ifeq ($(BR2_PACKAGE_OPEN62541_ENCRYPTION_MBEDTLS),y)
+OPEN62541_DEPENDENCIES += mbedtls
+OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=MBEDTLS
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_ENCRYPTION_OPENSSL),y)
+OPEN62541_DEPENDENCIES += libopenssl
+OPEN62541_CONF_OPTS += -DUA_ENABLE_ENCRYPTION=OPENSSL
+endif
+
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
 else ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_REDUCED),y)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
