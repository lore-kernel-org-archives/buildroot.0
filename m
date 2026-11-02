Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C8C606A32F
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 08:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FY3CvWL+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fBRaspxS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D58D60687;
	Mon,  2 Nov 2026 08:55:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oRqiVCnBxqqS; Mon,  2 Nov 2026 08:55:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5562560769
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793609707;
	b=Lt2Rl4MFElkUQ+veXLQdrVkTLnhoOrQzEl4ua51i+dbhq5e9DM6zPVfBMg/HF+e7BOih
	 4gc9JiY2bdFFpqHj6GO8b5MV9U8fHPIVM90T3Zlr6qHt9I6EjccnOl+6YMCJej332oipm
	 CcmNNFdnTxc43V6iTmxRwxi5fpWG9xpArkDtRGIUteJmmVpwU4sf0KIoam8uAGFqp48MT
	 LidUrqs52ufLjBUwpSDS/8TjJRn64Y18tS6uLObJlaXARZVQgjYSSXqBG6W1X1i3Nsvn2
	 pDl3hxuXpXdEqvtm73/O9qej+XIZOvd3/bqUczbMDoL0KGMRMa1WaXRzzM6j02ANxUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793609707;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=QMUFYO6aAyCtU3neG3HItJT89YoZ6BtQCSgPV5UgiKA=;
	b=gaEGYOZQWqVPg+aEci62I+HRmL1XdJzU9Y56EurtoOuwS6onpaBLE+r8hsKTW2rtSjhl
	 9CXTWD0g2mEJ77vQgk2wuaoerqMRLUT3v/nizlg9LsNYvEGkIJsmlFVEmRjtExm2BA7Uc
	 QO/Crwtix2rpo3fjb9yio8ykLVawtUU8jqQpWmeHhxa/vpJtV+wal4nSkIajlR2FpV0cH
	 vdNKbjxefJsacLJJSZ3H08OES8V1WAn9WvqYdy8v3Bp7FK7G6EipEeqCKtL2uADbXc9jZ
	 8K0q3bprBDy/hn6d0fuaJfj1fnw7xQZndo6BY501/vyhRP3Y4BrKLRgPCHgnYj9/vHA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793609707;
	bh=QMUFYO6aAyCtU3neG3HItJT89YoZ6BtQCSgPV5UgiKA=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FY3CvWL+kC1TrjrDElwvyihq9O294zMHRzrl3PpRhYVqQ+0RDElm3va1RiCVYIePm
	 ZF4SO0Xpp+IksRVenrhQ7RI3n+KMM93AhIplUNc97EXvOct9UG51NZF6hG9BlZQIl1
	 DZcLO8SVSmsCi6/b0VoJSTx0CIUFuQOzFz+Qw6sJ0LB8jrIY/qKcKR6u7rj3g/i17D
	 mBpRESreJPuToA5n1zbmwPq8mpRWdgRQgvPuYGzBj0Hv+V4bS6kSKmBQ2HE7lRf4xl
	 oEdNvHj0/9vWV1Z4xhItaGnQSQkfFwuxEhlccpZ7Vv664xX6FkQtJgAHqisBX0VZoD
	 kPSlpBvQiGW2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5562560769;
	Mon,  2 Nov 2026 08:55:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C6F356
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9F9E400C8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gPRyVimTtUL5 for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 08:55:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A27B8400A8
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793609706;
 b=sVWveH6UeGkg1SEgGIoXuLrUCmYe59IEgCX5qmOzEChcYjB5I3YUIbB6vWNNzv6OiIa3
 3o2F8/wY5pQPfzQcGB1cy/3QP4XYDwzrDFKKPeuLGBYqwGuDEd2EXXZzb4A/8p34HkY1z
 I3UtadUmHqWFgnZXACJLH+2tmmNOke2gKOQrrLjPtl5552l1MR+OxUYmKCdJhlG6nMrYm
 sHOsE27V5Dm4RA2vFUJf8CBI0D7AVbSGpVSqN5ISgISe67JdNT9vIwGTcbFw414trHMtr
 /McLMHWPyCz7gTYlRv4lL9jtCSO5Mm9zGi/KEWT9M8APxBDy8BiJKWGKrINJv7M8F+Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793609706;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=NelC08WbPC3NOcLLEQ8myER7CBouSecUQViOdG255+I=;
 b=WM6x3vO9fau2SXRGSMaBK7veqWYfaYPj8/mnY02IfvnrV64dA6dAC3KAuqZE0VEIAemK
 ayd9AMCm8+M2lS+VpqNLuKW2LIO1oxAJ3illAXpQl8ZjWDvj6YmmnNK43qqtdIUkYq4r5
 KuvhqeqXjXkVi64AwxtwWjRFO9AWlu/Vs2F8mjNlw87GUzoF849FV+E95EvwC7CAsNMaP
 o5PE4lX/V6eUpoKjSv/I9uD+HqYTJFjZa/40DM7W9qbcFmRQ8xB5kEGEZXZVMIc9/GRAc
 mR0hRh0qf4VC8DdFoO4huBYafWeihTAztvK67Cf6c2IueYpLj/PqynCWZSgCmnSrp5A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=fBRaspxS; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=fBRaspxS
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A27B8400A8
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 08:55:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a2153c8525so16656525e9.3
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 00:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793609703; x=1794214503; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=NelC08WbPC3NOcLLEQ8myER7CBouSecUQViOdG255+I=;
 b=fBRaspxSCc9LRjIbFuQeFppslvL9lUbgfeG3mu3ISGFZyT6/JP5kNzYsoiKyQsTTuB
 nHMm2Jn74Xgz9sd62hBm510fIGAaHSoERCDSz/Df/weX2VoBNmeMLMnnNgLY3T3yzesO
 yiMzMH6Q/fZSPRgUJEGXhhDq4LNDhVEqGwAyLiXSChEO3Z20irn00ZQUB32WpYCB1Hm2
 PXZlMadA5+9wkwAnllVzP+dXo77keo+zNR2pnFzdLeKztC8LS2ocf9l5b4nzq3F3fh/5
 k3jEmb7Sal8byjKrjG/afyQw3X1K7vOxEZr94XVpVkAp2STXFN41fwsl2/UZCaG3bUHQ
 v7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793609703; x=1794214503;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NelC08WbPC3NOcLLEQ8myER7CBouSecUQViOdG255+I=;
 b=DuEoDvwUBA+zthy1f3Fj9R/9Ar0KqA+BIirafvyvj0mafn3qfh02/caKm/NbTEyztq
 m9Q2qinuRrSOYs4ZdaUwkfZ3Aw8jKvZIovYQujHN3REKBNGjWHOe+rj4Ls+/HO2mKAVh
 xymvigxwMmNP34qo9XQIg8hw5XzI7JI216FLTRale9xIQIrZNoqkIpolHuVtgf+QYQf4
 deIQ4NnRuR1HMnomQuKrMA3MFjmvhuV564wBuKa1v10hMc06FoLmcmMjEzKQ3fLtntem
 2+Oxa/95tUWdF5PHIgopl+mfiI3fdDf9BfG/ljSt6Dl/m7G1FqDFh6TEnZXc3Wlv4chF
 kmwA==
X-Gm-Message-State: AFq9FYL8GBJcf37SVmlJGOAQ0oE7Js/XMYDUV2Vagz8QFVG8c+2qeQK8
 W/Tewfczf8nYs7vzviM6Yb3n8CtdMitAg8k9oRNjrICmGQPzYXVcA8gnvXn9oA==
X-Gm-Gg: AYBFou33oANyeXjEEt2n7Sx+SOrkhipHH4JkBOmX7lH/09nJAwn1lG1ZcyQ/C6bzu0B
 iVKWIj8QgamCZJ8pS0Of2BSKtLqOzStl7178Edf5EiyQ19hxhFvZdOMcqwODOEjypinC07+Ru1l
 avYrDIuI3hk8NAwozhrLXpG5Qx3AfpdsRQbajW/sRhOBHe69U+2KmPxl9k3vDW5oXEYWcuVVpv3
 Ff0mNjVRJMqkC3IFYB7et3d0q3xuOSBZqz3ifwi+GMFM/M+8RZNJTL6quXEdPKeJHwqu0Ad9Tc6
 3T0wGlHfvNd6sEw2dZU1AB5hIfw4IbuSBGM1YlY0qmU/FmvBKETVs+B7o/XpjbSpVhfHFqYURcY
 wntu6+rkdru9QsQ/xmnXNArcxukBHchwGv1ADMSlpdBzGZY6WebeIUUWrYCqMVwi6UxwrVddAvv
 eV+MmHTRafqexCEVuXWGdudq5puQ9A40goENo+06TD+E7RkTE8Y+48AqJQYsGPfGeLa/2/oljQX
 dG8UmW0kykbkBgzOWwP0H1wTOOkBKtBhXRXWTPQwBA0LhKCuX4PsuCSkAqC7qQdmNEf3fBj4zdj
 X/BYct3bn2sow+W/R3I2bujJUNfRxRn9wcLIvnLtbqmygHIRbyz21Y8anAVsJ74MRf21o7I3PvM
 =
X-Received: by 2002:a05:600c:1c23:b0:4a2:47:b79c with SMTP id
 5b1f17b1804b1-4ac180f2addmr247395015e9.32.1793609703137; 
 Mon, 02 Nov 2026 00:55:03 -0800 (PST)
Received: from angelo-Precision-7550.. ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b789ecsm18008066f8f.29.2026.11.02.00.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 00:55:02 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon,  2 Nov 2026 09:55:01 +0100
Message-Id: <20261102085501.2118632-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/qt6/qt6coap: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Qt CoAP implements the client side of the Constrained Application
Protocol (CoAP), already available for Qt5 as qt5coap.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 DEVELOPERS                       |  1 +
 package/qt6/Config.in            |  1 +
 package/qt6/qt6coap/Config.in    | 10 +++++++++
 package/qt6/qt6coap/qt6coap.hash |  9 ++++++++
 package/qt6/qt6coap/qt6coap.mk   | 35 ++++++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 package/qt6/qt6coap/Config.in
 create mode 100644 package/qt6/qt6coap/qt6coap.hash
 create mode 100644 package/qt6/qt6coap/qt6coap.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b9dd41f01..c12dab41ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -255,6 +255,7 @@ F:	package/qpdf/
 F:	package/qt5/qt5coap/
 F:	package/qt5/qt5knx/
 F:	package/qt5/qt5mqtt/
+F:	package/qt6/qt6coap/
 F:	package/rtl8723ds/
 F:	package/rtl8723ds-bt/
 F:	package/sam-ba/
diff --git a/package/qt6/Config.in b/package/qt6/Config.in
index d6ee9f3ea3..f3a540e9f8 100644
--- a/package/qt6/Config.in
+++ b/package/qt6/Config.in
@@ -45,6 +45,7 @@ if BR2_PACKAGE_QT6
 
 source "package/qt6/qt6base/Config.in"
 source "package/qt6/qt6charts/Config.in"
+source "package/qt6/qt6coap/Config.in"
 source "package/qt6/qt6core5compat/Config.in"
 source "package/qt6/qt6declarative/Config.in"
 source "package/qt6/qt6graphs/Config.in"
diff --git a/package/qt6/qt6coap/Config.in b/package/qt6/qt6coap/Config.in
new file mode 100644
index 0000000000..81ab7e9ab5
--- /dev/null
+++ b/package/qt6/qt6coap/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_QT6COAP
+	bool "qt6coap"
+	select BR2_PACKAGE_QT6BASE_NETWORK
+	help
+	  Qt is a cross-platform application and UI framework for
+	  developers using C++.
+
+	  This package corresponds to the qt6coap module.
+
+	  https://doc.qt.io/qt-6/qtcoap-index.html
diff --git a/package/qt6/qt6coap/qt6coap.hash b/package/qt6/qt6coap/qt6coap.hash
new file mode 100644
index 0000000000..cc5d159c82
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.hash
@@ -0,0 +1,9 @@
+# Locally computed
+sha256  c023098a523b939fdf69d289f82ad6108025a979ce95a4ed208e9ae4e30eb37b  qt6coap-6.11.2-git4.tar.gz
+
+# Hashes for license files
+sha256  9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce  LICENSES/BSD-3-Clause.txt
+sha256  110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4  LICENSES/GFDL-1.3-no-invariants-only.txt
+sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSES/GPL-3.0-only.txt
+sha256  9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700  LICENSES/LicenseRef-Qt-Commercial.txt
+sha256  40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2  LICENSES/Qt-GPL-exception-1.0.txt
diff --git a/package/qt6/qt6coap/qt6coap.mk b/package/qt6/qt6coap/qt6coap.mk
new file mode 100644
index 0000000000..af565ed5fa
--- /dev/null
+++ b/package/qt6/qt6coap/qt6coap.mk
@@ -0,0 +1,35 @@
+################################################################################
+#
+# qt6coap
+#
+################################################################################
+
+QT6COAP_VERSION = $(QT6_VERSION)
+QT6COAP_SITE = $(QT6_GIT)/qt/qtcoap.git
+
+QT6COAP_INSTALL_STAGING = YES
+
+QT6COAP_SUPPORTS_IN_SOURCE_BUILD = NO
+
+QT6COAP_CMAKE_BACKEND = ninja
+
+QT6COAP_LICENSE = \
+	BSD-3-Clause (examples), \
+	GFDL-1.3-invariants-only (docs), \
+	GPL-3.0
+
+QT6COAP_LICENSE_FILES = \
+	LICENSES/BSD-3-Clause.txt \
+	LICENSES/GFDL-1.3-no-invariants-only.txt \
+	LICENSES/GPL-3.0-only.txt
+
+QT6COAP_CONF_OPTS = \
+	-DQT_HOST_PATH=$(HOST_DIR) \
+	-DBUILD_WITH_PCH=OFF \
+	-DQT_BUILD_EXAMPLES=OFF \
+	-DQT_BUILD_TESTS=OFF
+
+QT6COAP_DEPENDENCIES = \
+	qt6base
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
