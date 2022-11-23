Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED57C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 19:59:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7540140C3F;
	Wed, 23 Nov 2022 19:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7540140C3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Ykq62Ff4IJX; Wed, 23 Nov 2022 19:59:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F3F540C62;
	Wed, 23 Nov 2022 19:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F3F540C62
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 29B6E1BF314
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12C6280CD0
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 19:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12C6280CD0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ATBbN59smkNI for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 19:58:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43BFA80C30
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43BFA80C30
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 19:58:33 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 y14-20020a17090a2b4e00b002189a1b84d4so2781030pjc.2
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 11:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGpigAdmVTYKVejpj/CNqb+Epqd94DCPbztInEPIt1E=;
 b=sBYC+2bBtxXu5g9d1g/KEmcgwCOfzj1JTe5oBzodrhBQg0qiDeaBpDlKClLyODnylM
 Yi1XI9Bk78fSqzmtQVHvUghTuLYEXFnbpS9eVlWPw2Fnna/YmtEqFJYMHFqK2Uyc7ssp
 hvcKAhBv1c5SOCQGelCD/rWSbOIvxLI6m511uhnofM2uUrkd4UUdMMowD9Fhid+QYfKd
 0DoqD8e0fXSNUiCbuf8zW5BJJFW4ow9+/B6iymSaWZ9E6r/tcSoNMCTcyFNfm03V/KJE
 PkqHqYyMCHRErkY2xkyNjYVBIjeHC0PCvaBn7r2iI1v4TOsnFJHs35R6ttq/j3ujc2V8
 4EXg==
X-Gm-Message-State: ANoB5pm6qUwugECx03sIUd2EXruQKKhj8oP7v5Mh7bOEoCMyjvVuIQJN
 Et0aOCuWDTWptbrR4dIA6i9lBtb6D1LIPg==
X-Google-Smtp-Source: AA0mqf58VnuYcQorjkDlf3RxUhB4en0zesHX8nAGc6NZjEZ+H7Bp07HR6tFrzTMkEogJgvo1H1QoRw==
X-Received: by 2002:a17:903:240a:b0:188:abb9:290 with SMTP id
 e10-20020a170903240a00b00188abb90290mr10569735plo.86.1669233512263; 
 Wed, 23 Nov 2022 11:58:32 -0800 (PST)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 q15-20020aa7842f000000b0056b9df2a15esm13124508pfn.62.2022.11.23.11.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 11:58:31 -0800 (PST)
From: Chris Dimich <chris.dimich@boundarydevices.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 11:58:15 -0800
Message-Id: <20221123195815.1583545-6-chris.dimich@boundarydevices.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
References: <20221123195815.1583545-1-chris.dimich@boundarydevices.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dGpigAdmVTYKVejpj/CNqb+Epqd94DCPbztInEPIt1E=;
 b=et4ZRDv7RBCg494tOu9Xws5onXz/hjrp2ZtAyGbGQXwPqUYQKR7aodxcxt4VYDXdB0
 y5o+feYepOMa84+5bJVrW0sCNT8HT9POj/gPCHzIwSYserQkjzvdiFf/IV8/oXkS0yeq
 Y0kJEUGDYjhsr/MGisKEW/xqFxwtHWL/2eRxk=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=et4ZRDv7
Subject: [Buildroot] [PATCH 3/3] configs/nitrogen8*: bump arm trusted
 firmware revision
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Chris Dimich <chris.dimich@boundarydevices.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Bump ATF to boundary-lf-5.15.52-2.1.0.

Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
---
 configs/nitrogen8m_defconfig  | 4 ++--
 configs/nitrogen8mm_defconfig | 4 ++--
 configs/nitrogen8mn_defconfig | 4 ++--
 configs/nitrogen8mp_defconfig | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/nitrogen8m_defconfig b/configs/nitrogen8m_defconfig
index 41e2ddb79d..be2ce0cb3c 100644
--- a/configs/nitrogen8m_defconfig
+++ b/configs/nitrogen8m_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mq"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mm_defconfig b/configs/nitrogen8mm_defconfig
index c20c64b121..e0a7552e94 100644
--- a/configs/nitrogen8mm_defconfig
+++ b/configs/nitrogen8mm_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mn_defconfig b/configs/nitrogen8mn_defconfig
index 5a78df3865..e2a36c0c75 100644
--- a/configs/nitrogen8mn_defconfig
+++ b/configs/nitrogen8mn_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mn"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
diff --git a/configs/nitrogen8mp_defconfig b/configs/nitrogen8mp_defconfig
index 078476b004..3e275f101e 100644
--- a/configs/nitrogen8mp_defconfig
+++ b/configs/nitrogen8mp_defconfig
@@ -28,8 +28,8 @@ BR2_PACKAGE_FIRMWARE_IMX=y
 # ARM Trusted Firmware
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-# Latest revision of branch boundary-imx_5.4.70_2.3.0
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/9f6114fd.tar.gz"
+# Latest revision of branch boundary-lf-5.15.52-2.1.0
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="https://github.com/boundarydevices/imx-atf/archive/697a8319.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
