Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069F7C3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 17:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9FB0600D1;
	Sun, 21 Jul 2024 17:38:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaXccd8SHCsm; Sun, 21 Jul 2024 17:38:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE548605BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE548605BB;
	Sun, 21 Jul 2024 17:38:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD5771BF2C3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C86B2810B3
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 17:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEI_j_xUzzke for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 17:38:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9C326810B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C326810B0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9C326810B0
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 17:38:51 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4266fd395eeso24887605e9.3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 10:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721583529; x=1722188329;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lfrt7eOMiQeMZ69C1j7PNEd5zltM+KCSRkrKEh7DpUg=;
 b=MRHDYkTkAI5TgiWo0D+P2QQoXfoD/0ld8sQae7L3k8+2396mAMa06yrvZ0m66tynMx
 StlYhQtSEcZmRwG5ksQAaBb+ARPDxc4gLYCGAr23UY/fJmNkx8BvcmXW9DxeI5lAvsDG
 iA9g/FOLlN5xxfMJEfmKYqnWyfmO0s77jvh5MTE8WMTGFlGIzEbHgz/zMNVi1wn//Dvb
 Kzuk8z75I+Pn+zaWehNCysDl9g3AfsJeVP7IssHM3PpuX3NPdl4g+bBVZfIMm9cNEHhw
 MiSt/wKCZEd03jj3toYVwNu9PbtLSFDRLKPzArWd3Q7FmMPFiWD47SWbzDA0D51wBxTa
 atxw==
X-Gm-Message-State: AOJu0Yz5dzVeP9LJbWUmrepJTTpitXbU6qCCZRpcYoloAgyUiVNR2v7Y
 82S1R+zFTpOnZFqihO9xMyzG8RJ3XZ5/8SjLClbwTmUeHdNTmET2+H+azA==
X-Google-Smtp-Source: AGHT+IFhCF6cEom5qBixW1TXnuB1oEoSCMjuao97cD47DZizsAoNjSmZlFQmVGxG00+9kt1y+WiVlw==
X-Received: by 2002:a05:600c:19c7:b0:426:6551:3174 with SMTP id
 5b1f17b1804b1-427dc58f4aamr34648815e9.29.1721583529026; 
 Sun, 21 Jul 2024 10:38:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d692996bsm98001375e9.37.2024.07.21.10.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Jul 2024 10:38:48 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 19:38:31 +0200
Message-ID: <20240721173831.2350206-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721583529; x=1722188329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lfrt7eOMiQeMZ69C1j7PNEd5zltM+KCSRkrKEh7DpUg=;
 b=WG+mpIHc/Fc80wlw6ZloXOg79hVF2j7xmmOpaeuWdG7rpzltTFwMmU9o4T83SwNvBi
 AELRF7hIFxlpyZKJGCwNdVOPiY0inwJb/TP6KKYO6ZwT74C6KBiIFJezdwcceoWkSwzI
 3WMQTWb5vxc77orT8r5GyGUhH1cdCJuilO8LSX7Ar9MQiCJOB9gc2cy0l5Vyb/lb1fnB
 89AWXbfen66RAAjXwb1xDZr87XemC5nPafB7t14FNaedfyMQljyFlpr5PsewID5UTWde
 oG11bmC9aOfAXavoCZjtDpQLSAo5NLsATTeaRZP4erJXKeoJveT0huht4/blZjXgOQ9h
 ylGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WG+mpIHc
Subject: [Buildroot] [PATCH 1/1] package/picotool: fix libusb dependencies
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libusb dependencies are wrong since the addition of the package in
commit f7aac1c008f9c59f8c669bade17864b099221065:
 - BR2_HOST_GCC_AT_LEAST_4_9 is used instead of
   BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 - BR2_TOOLCHAIN_HAS_THREADS is missing

Fixes: f7aac1c008f9c59f8c669bade17864b099221065
 - http://autobuild.buildroot.org/results/22689afc092e33b6e3c1c7ffea0d0e3b5bf76d99

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/picotool/Config.in | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/picotool/Config.in b/package/picotool/Config.in
index 0046f8ad61..bbbcef405d 100644
--- a/package/picotool/Config.in
+++ b/package/picotool/Config.in
@@ -1,10 +1,13 @@
-comment "picotool needs a toolchain w/ C++ and gcc >= 4.9"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_HOST_GCC_AT_LEAST_4_9
+comment "picotool needs a toolchain w/ C++, threads, gcc >= 4.9"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_PICOTOOL
 	bool "picotool"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_HOST_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_PICO_SDK
 	help
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
