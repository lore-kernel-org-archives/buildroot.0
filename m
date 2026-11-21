Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D6B606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kWfdsLYc
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A21A780F39;
	Sat, 21 Nov 2026 20:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5S3CZLNbVLdy; Sat, 21 Nov 2026 20:07:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 916AA80F35
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291628;
	b=cS1opNSUa0jCUEBvwr01geXio0MbipFnEABqEG+78xMxPmpo+g7SJNOpc8ViO+jKJWng
	 1c/U2wh2L7gcrefTy2kh+pZwXAU5zhK81t+nmN5Qj/lBO1/h97fRBR8yHgh7LcuhJl6eV
	 jhvs6nrQeGtrsiMT3oBBmnre3gJ7xybBXEq00NNw0IW2W9MO8Qkt8CJYDMi6BHvSrw02S
	 4TE9TbJDIIJD71HXg8NbPvjwsPrfIZGs5IBadd/bVgfI5Au+J0IkD5YZX6EksFXuNTu4G
	 X/WafXvDHRj6iYDkmS4oig8DtkzhE8wQdTXC0vqBy7Gqj2j6tKOnyIraLmpilZ+JWCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=oIKIDoIlcMG34hYZVi/6LPvLOIYthsYZ/q5zdTHOXTM=;
	b=WRXWYPQs/INE+3dVnisx12N5Dy8Of5Lauw7xU9bHt4IlvH9up84Rh2OJNVoYcMT6QnKh
	 CemGbWBBbbp4dkzqxzmiJA+NBPFPD3NU80gIbwokAOdK8yb3UkbaF1qb/BQxAIc6QZUjL
	 3FiY4IZHklhIFXO6g+V7FpgoXJCpJUbxBInYmTc28ps5sbvvZbLvNjyJfXC6OZ0OZGzG3
	 TpVXlVxBX5O8+Yf+81BJkpFrxpvf2o85xKwHBkwSYSt+SxtSsJEmIFlbDcNLaqT55ZYL6
	 V64lYj6YCS0/fK7PTIlMPxNNwLbDkkkpsnSs63bA/1hmkQEJsQPtIQck1Bt41BQgiaQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291628;
	bh=oIKIDoIlcMG34hYZVi/6LPvLOIYthsYZ/q5zdTHOXTM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kWfdsLYcnf6bgbotjiaDakN0rAh2Wou+LrSi7Ye6mirf+tjCA7rBhGp782ahBhEiC
	 egjL8co6M9i4eVnPf7u7tdb1mWqVzYd+arwE6niDGssPWvmrVuTO2uBrABQOanxHU1
	 qJ2Yt4LmTTgJfcnHn6hNXeJVUiil/ojUVYmm1zlYWE1BOhQBMe/Mbuwp6sYCaEU9Bw
	 qgjGFvVdyVQaLetiGq4TZTkhNK32+8NjuNTA4ucK+h6UefCTw1Pp6x5Q/xuPrOdb5P
	 TN52tGtJ7m4/LqUXpOLotOLyMNd8h9luSDvzHOTlwEs09vJJvKV/gtSFyfj04LmtGf
	 rcp61OU/bCn4A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 916AA80F35;
	Sat, 21 Nov 2026 20:07:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A431465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C83E6061F
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CrjKQa1uqPOh for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:07:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 03C4B60619
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=209.85.128.49
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.49;
 helo=mail-wm1-f49.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03C4B60619
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:05 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4ba013938d7so18071505e9.2
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795291624; x=1795896424;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=KW01SQYyO8bYXLVfcJJrKCTzwlFKshCT12HP9QGchf8=;
 b=Am43zP3xdbS6pO52RzGH74Rl2UFh989ll7HoHqs5tgpj3sRAr5cNvouktvsjs4oXWt
 T2aLyrQK/7tnUpOXItSKv3eqC9nvuzyCn6/4vM/Ws/KMYHs9B+XiGn+v/9PfenlnlVQ0
 G4EnR2QmsuTtwV89Aad3tUTBK1sLQZHur4Pve/fbcSQErxfMUZUzNZUFyC8FQsMSrVNM
 E/lY4u/kQWwmrRAe8e2ywqKgw/dPodoYJs4akU1Pe1qsOaxVZHc8Q4WO5jRQmqhlR7/O
 1hBlHQMw9iCEQam331q5WjFu/gJbqCyX1K2TYs9/rumOc87y5oQvnxKqcWThVIUQvpSL
 bKOg==
X-Gm-Message-State: APuU4Z8oqHLyb1NHvaex1rHOhKQ3JIUJNw5dAUTHn2XxG+vMHfg5SrSi
 pwD29ZURSsy5yvmE01AZOixG39VdzYBvb/afHpq5/a4MxTGtxoTi69mRsbvYvg3B
X-Gm-Gg: AZFdTZfnBAFnnUaxQr2+bLhm7sKc/FAByuTin42AOw4ts8WizUzaOx+SyJLNrLuGBK6
 anMBBe6lxRLU/9Oke7ACe9atiDvdFeYl4Te5zBdR+NQtttq7zcpgw50mwJxhyTqNgcx2W7mFTZJ
 iwDjytmiK6r9qXZ+QDQoE9I67D7X8HoXwnueW6A54eH2smcl1yNm2sGtlhPDinb1VNmBAMvVIHy
 XAwiI64zFCfg/F+wLLIaldTNh0Il3tJ+8Trl9j+tn11AVn/q5Od1WV71TF89Wi1fnBjTvrlRNPk
 XrhyIgZ3mjOfRF/3DnXLNVSQRHrP0//kei4SwAjO2/lVS/Vi9VZ6zaAfx0JoGr5Oo9TX1++C3eu
 KXc3dnidyeOt0Yuq1qwpnvKYDhEecqkMmNINfIpkQn5myhJS74rssZnjZOwIbnivp/rtaUvIDed
 H9SgpZ8zIutDb1JwHVSPEAiG6tkdwoUNEUYpBupsb+KZ2Qatu/xgVM37AKAIp3A+pxVjop/EDQA
 FRlu5zD5W1D34mO5Fs+6aNG0NqkERawep2Y5nwcMLXE/pV3FJ7u8uvQnTih4O2DR6fBAILyy8k8
 xR/yXxl3ZA1qCebBCXN/8THThCZrUO2VCz6YoJ/XNMA4+alDl4KqyVNIcWLu1+NdVZPWfGhoPfH
 eSxWzO0A+rdNWx/gUlM5H+KHDe9Hs1xy6JAKC34PBnRZgG12O8Xi98/j5UKFdV/Lt
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id
 5b1f17b1804b1-4bb8881c726mr185053795e9.5.1795291623566; 
 Sat, 21 Nov 2026 12:07:03 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:bd15:7649:1768:4d97])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm151944255e9.4.2026.11.21.12.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 12:07:03 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Sat, 21 Nov 2026 21:06:51 +0100
Message-ID: <20261121200654.28019-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119140223.1968045-3-thomas@devoogdt.com>
References: <20261119140223.1968045-3-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3] package/openjdk{-bin}: security bump
 17.x to version 17.0.21.1+2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix CVE-2026-114938, a heap-based buffer overflow in the HotSpot
compiler which may result in takeover of affected Java runtimes.

This also includes security fixes from the OpenJDK advisories published
on 2026-04-21, 2026-07-21, 2026-08-18, 2026-10-20, 2026-10-21,
2026-10-24, and 2026-11-17.

Other relevant changes include certificate and cryptographic hardening,
updates to libpng 1.6.59, FreeType 2.15.0 and tzdata2026f, and fixes
for TLS, HTTP, Kerberos, JMX, JFR, and HotSpot.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
- Restore AArch64 host support with the matching Corretto archive because
  Temurin does not provide a glibc AArch64 JDK for this release:
  https://corretto.aws/downloads/resources/17.0.21.1.2/amazon-corretto-17.0.21.1.2-linux-aarch64.tar.gz
- Cite the Corretto GitHub release page in the hash file:
  https://github.com/corretto/corretto-17/releases/tag/17.0.21.1.2
- Cite the exact Temurin JDK checksum sidecar:
  https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz.sha256.txt
- Successfully cross-built OpenJDK 17 with the matching Corretto x64
  boot JDK to verify archive layout and toolchain compatibility.

v3:
- Use the now-available Temurin AArch64 JDK; the asset was published in
  the meantime, so the Corretto fallback is no longer needed:
  https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.21.1_2.tar.gz

 .checkpackageignore                                      | 2 +-
 package/openjdk-bin/17.0.18_8/openjdk-bin.hash           | 7 -------
 package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash         | 9 +++++++++
 package/openjdk-bin/openjdk-bin.mk                       | 4 ++--
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch  | 0
 .../0002-awt-fix-HEADLESS-compilation-without-X11.patch  | 0
 package/openjdk/openjdk.hash                             | 2 +-
 package/openjdk/openjdk.mk                               | 4 ++--
 8 files changed, 15 insertions(+), 13 deletions(-)
 delete mode 100644 package/openjdk-bin/17.0.18_8/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
 rename package/openjdk/{17.0.18+8 => 17.0.21.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{17.0.18+8 => 17.0.21.1+2}/0002-awt-fix-HEADLESS-compilation-without-X11.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 25c668db542..b5ad45705a0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -657,7 +657,7 @@ package/olsr/0006-build-patch-for-gpsd-3-25.patch lib_patch.Upstream
 package/olsr/S50olsr Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch lib_patch.Upstream
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
-package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/21.0.10+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
diff --git a/package/openjdk-bin/17.0.18_8/openjdk-bin.hash b/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
deleted file mode 100644
index c2169350c17..00000000000
--- a/package/openjdk-bin/17.0.18_8/openjdk-bin.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# https://github.com/adoptium/temurin17-binaries/releases
-sha256  0c94cbb54325c40dcf026143eb621562017db5525727f2d9131a11250f72c450  OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
-sha256  592a6702b3a07a0e0b82cb38aaab149bfce1b0c24d6b57ddb410bd9009333095  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.18_8.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash b/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
new file mode 100644
index 00000000000..6c6e4250a00
--- /dev/null
+++ b/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz.sha256.txt
+sha256  0b0ac5eab6db6abaec68c9913bcddb31321e5da411c45073d520d9c125e6f7b4  OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz
+
+# From https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.21.1_2.tar.gz.sha256.txt
+sha256  1d808f4b558e9de63d8ba3ead21ffc8b9de204894eff3c19d52c1480aa17cc58  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.21.1_2.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 4a21cbb4601..e2f771bdb22 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -14,8 +14,8 @@ HOST_OPENJDK_BIN_VERSION_MINOR = 0.10
 HOST_OPENJDK_BIN_VERSION_BUILD = 7
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.18
-HOST_OPENJDK_BIN_VERSION_BUILD = 8
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.21.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 endif
 
 ifeq ($(HOSTARCH),x86_64)
diff --git a/package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.18+8/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch b/package/openjdk/17.0.21.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
similarity index 100%
rename from package/openjdk/17.0.18+8/0002-awt-fix-HEADLESS-compilation-without-X11.patch
rename to package/openjdk/17.0.21.1+2/0002-awt-fix-HEADLESS-compilation-without-X11.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 3f83ab48f89..40879824ad7 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
 sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
 sha256  6500906cb7cc49268ce4ca368db3ddf3541b40afd25eecb378e13d5a72f43214  openjdk-21.0.10+7.tar.gz
-sha256  7ebfcc2aafd514c23df3fe5280e1a34630b9b1d429c65a80dd5a4b6e7f177bc3  openjdk-17.0.18+8.tar.gz
+sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index e1d68e9a458..25fa001d840 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -14,8 +14,8 @@ OPENJDK_VERSION_MINOR = 0.10
 OPENJDK_VERSION_BUILD = 7
 else
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.18
-OPENJDK_VERSION_BUILD = 8
+OPENJDK_VERSION_MINOR = 0.21.1
+OPENJDK_VERSION_BUILD = 2
 endif
 
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)+$(OPENJDK_VERSION_BUILD)
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
