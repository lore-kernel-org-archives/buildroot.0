Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F05606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sFyUqO0k
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31F40406FC;
	Sat, 21 Nov 2026 20:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6XrByF1KNqbm; Sat, 21 Nov 2026 20:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 913EA406FE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291633;
	b=rip9yx//HIahW/vyRyi4I0SyAlo9CVrqmxyLTT08Fr/1PqBf6Y9Qebpv8XWvQ4JFTRlz
	 RUKMWJu1rUTcGW0+YEBKJ9iw91Q1u3PcWsWgRhEZFpay2rGntlH377LudQSPE8SnPEoSM
	 ZVtsTI54ds/0mfPZUm6y/oH2oqJM2zr2hnOyETrSgvqPk962N6CzweGz4YxKSoavHJ/2o
	 dFOTzh63lEzsjN6Q/oUSgAvRsgwaAmPjThKRjTnUOf0kmWxP/oINo4ZWSz1jbJmeLBSFL
	 jX27y9NpVBYM/Jb1l8A01l4ylTXfYzUwRz8sQAVcXGzxuVeMpdurlDFKRgJYx0SYQpQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6ZY6R55+PHK6zMwqZUs9egFcEKWZ9z4v0w67GYw98Fg=;
	b=A4w3hbTfvisri8slHjfrysfB6tWdTE7TIzkA6PHkGa7eLrvubEtFev5oSiN8GGNxIXhT
	 s9ru/vOgeZTKVXEDFLN6hqaPC0RDiDThHnD5go5wMp5sp+qnin9UH64U+fygIUHkEU69d
	 BLmkKbXspDiiBI1tbDNIgw6M6mrHb0cBAwDepAFR5EucrTvnT+1pNbwdPpp7McP65vIkO
	 8q6TsAlM/Wab+D8kkUwsS6VHUM2CX3YLjb5WRcHOZDX0p9MhrIWYXNoJHHFkRcAG1OozF
	 AJSzcvvTC4pjkpK7szkeFR9nAt0gQVI/dhlMLTxEeVpYWj6XBTjGNGCX2PlSRQXBJeg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291633;
	bh=6ZY6R55+PHK6zMwqZUs9egFcEKWZ9z4v0w67GYw98Fg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sFyUqO0khuShEKnHUJz83V7uzIYXCFsFdcuVYL28EXTMqwNKpkaXEy/JUVU9uImXP
	 pcNQDKn3B7pG6eUOOWI5PUZaHM/p9YOVLx5OJBL/hGGOBqn+ggi13FFnsXAdKucOzi
	 nQT3YYssC9/QxNpKFnHet0tz0x63Z2//xZr2WklxNaw64pHpINGnIFRkd+BDoyCWNS
	 9pnrmhtVWqdyz7gj7FF6s6r7lnhbGRUlPdbNhuW7K7RcPJPyoVU6MsF7zdTntpym0A
	 Y/4mEA+lErVumTDM1Y+TaFpp+CNgYEZmMWVFV30WiLorxZnxBJruayrOzT8oUTnd+z
	 qFR65jnkyw5aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913EA406FE;
	Sat, 21 Nov 2026 20:07:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EABE579D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAE5480F62
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ggdNBlc4hHO5 for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:07:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DBD7F80F32
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=209.85.128.42
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.42;
 helo=mail-wm1-f42.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DBD7F80F32
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:07:08 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so24237045e9.1
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 12:07:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795291627; x=1795896427;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=YELDNRVt2m+Er4BzmF17DJAiEgpQ1Rsmocbfo5UIokE=;
 b=0ksl4pn7bC0jWTAvhsnqpCNU2Qh/WApo8gGWKx1EvEi6Zf4xymwaTBJIhbw7mZNwVU
 WLhRnozU/8KlLVEGzJ7vzQdtFx4eem28CVkbSU0jCs1UZHrYF457qTiRPRIbtpVe65sL
 h70Mqld7y60WD7WAsBpuaHuzOXJ01ofyxnAA6AiuldHIM8fmmV7oO87lK2dgq8O57Dhj
 uTk7CGumDXzzdABkMszWg1+lmZqw9AceeF4HOcF2z4zy18PYMo7mCP3gOu94UvIRH5rr
 gGRj86AdlzmZzUxHRRb8D24PvlyJBcQAINOnJWdufFMDY7GGAQD1+iq305fmpKzIMFKN
 IaQw==
X-Gm-Message-State: APuU4Z+bl/Gjo5JX9l+d0WTJ2myg3KGnsCeZOBtZ8Xm8TdBPGuqcEzrx
 Hl7/7OdFMrBi/096KSNkQR3y+pMmVgFbQyr4bRdxMOw8CR2MdtO6Swow
X-Gm-Gg: AZFdTZfelQlHeQmNTEkN6TQAIUngiHMDZ3ZzH+EcIwsVDb9W/S70Ku18ypRPQT2tdaj
 bXPRz3LZydbZk4SuFRJfMXB+OBz3CsbF/tvnAPjJ+mmOLsd0F6AWAjT9+iDyplep+TdBggH47q2
 nmBI35YytXRPDIEXYF3PLwH5MMj+W9vi+XTshb2WVhgLYOLTI7n+uMp4C2oputZCjePxQ2OnN8q
 obwpQspeZfXBa7gAfrcjwvRq0BY+FkGtlAmtm5dQk8XRiXESKTJs7dAJnv6+qJtkPGeKLNizgi3
 2F4GIoU1m41sT6UnhuOJ4ZrlUrPesY2U7+J77jWfGrjVwhXB6REaRJ4cRClxhl7jUgVIfDz6ybw
 zUWakC4dPD6heryZk8QLrY1e3tWwmv7tDwQJZna06FnO7bUII/0GqtdNWwvVRE1MyNOPGgSplKi
 nNkGDtw/bujMSCJNGqxjlWsn9pgKVZVqMQElbvIm6NQn4Vko5vWCAilwisrStqN/Y3pzhSFAO5H
 AGzcZvrLowCnmmUC6PmfHoyprSgUPE1LlzVH36It7JK6Qqq0T3sFkSTwbDKsdow/GnIDBvfo6kz
 w+WDk2LuKFmCAKXS3MZFN0wA2AfRTtWCCfoADunSuKcZ2KKCP/fm9UFqBhXGs0OZP98Zk08Z2Gv
 u5XpcuRX4g+ZDvFurxTx60cGGbyvNiCMgwfvw3gh+I2m+3JYyzXBRbotTXz06r6Wv
X-Received: by 2002:a05:600c:46c4:b0:4bb:6a5a:7834 with SMTP id
 5b1f17b1804b1-4bb888106damr156027345e9.20.1795291626516; 
 Sat, 21 Nov 2026 12:07:06 -0800 (PST)
Received: from KORLIN44614.barco.com
 ([2a02:a03f:eb5f:fa00:bd15:7649:1768:4d97])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-4bb8d4f9aa8sm151944255e9.4.2026.11.21.12.07.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 12:07:06 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Sat, 21 Nov 2026 21:06:53 +0100
Message-ID: <20261121200654.28019-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121200654.28019-1-thomas@devoogdt.com>
References: <20261119140223.1968045-3-thomas@devoogdt.com>
 <20261121200654.28019-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 3/3] package/openjdk{-bin}: security bump
 25.x to version 25.0.5.1+2
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
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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

The headless-build patch is now upstream and can be removed.

For details, see:
https://openjdk.org/groups/vulnerability/advisories/2026-11-17

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
---
v2:
- Restore AArch64 host support with the matching Corretto archive because
  Temurin does not provide a glibc AArch64 JDK for this release:
  https://corretto.aws/downloads/resources/25.0.5.1.2/amazon-corretto-25.0.5.1.2-linux-aarch64.tar.gz
- Cite the Corretto GitHub release page in the hash file:
  https://github.com/corretto/corretto-25/releases/tag/25.0.5.1.2
- Cite the exact Temurin JDK checksum sidecar:
  https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.5.1%2B2/OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz.sha256.txt

v3:
- Use the now-available Temurin AArch64 JDK; the asset was published in
  the meantime, so the Corretto fallback is no longer needed:
  https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.5.1%2B2/OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.5.1_2.tar.gz

 .checkpackageignore                           |   2 +-
 .../openjdk-bin/25.0.2_10/openjdk-bin.hash    |   7 -
 .../openjdk-bin/25.0.5.1_2/openjdk-bin.hash   |   9 ++
 package/openjdk-bin/openjdk-bin.mk            |   4 +-
 ...OpenJDK-in-headless-mode-without-req.patch | 144 ------------------
 ...ARCv2-ISA-processors-support-to-Zero.patch |   0
 ...pot-aarch64-macro-assembler-fix-cmp.patch} |   0
 ...t-share-gc-shenandoah-fix-constexpr.patch} |   0
 package/openjdk/openjdk.hash                  |   2 +-
 package/openjdk/openjdk.mk                    |   4 +-
 10 files changed, 15 insertions(+), 157 deletions(-)
 delete mode 100644 package/openjdk-bin/25.0.2_10/openjdk-bin.hash
 create mode 100644 package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
 delete mode 100644 package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
 rename package/openjdk/{25.0.2+10 => 25.0.5.1+2}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)
 rename package/openjdk/{25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch => 25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch} (100%)
 rename package/openjdk/{25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch => 25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch} (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index c875aa796be..5861b778f93 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -659,7 +659,7 @@ package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch
 package/open2300/0001-fix-makefile.patch lib_patch.Upstream
 package/openjdk/17.0.21.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openjdk/21.0.13.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
-package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
+package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch lib_patch.Upstream
 package/openldap/0001-fix-bignum.patch lib_patch.Upstream
 package/openldap/0002-disable-docs.patch lib_patch.Upstream
 package/openntpd/S49ntp Shellcheck lib_sysv.Variables
diff --git a/package/openjdk-bin/25.0.2_10/openjdk-bin.hash b/package/openjdk-bin/25.0.2_10/openjdk-bin.hash
deleted file mode 100644
index 42892b1e6ce..00000000000
--- a/package/openjdk-bin/25.0.2_10/openjdk-bin.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://github.com/adoptium/temurin25-binaries/releases
-sha256  987387933b64b9833846dee373b640440d3e1fd48a04804ec01a6dbf718e8ab8  OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz
-sha256  a9d73e711d967dc44896d4f430f73a68fd33590dabc29a7f2fb9f593425b854c  OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.2_10.tar.gz
-
-# Locally calculated
-sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
-sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash b/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
new file mode 100644
index 00000000000..77b3e0fab19
--- /dev/null
+++ b/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.5.1%2B2/OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz.sha256.txt
+sha256  760f91b22c3efc9bd1b64ff950598231be82928cc807e30691a0e7a2995a62c0  OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz
+
+# From https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.5.1%2B2/OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.5.1_2.tar.gz.sha256.txt
+sha256  c37879e0d08eeb1baa69fcbb7758cd455b7b1c0ceab1e2a136ccb1713c530984  OpenJDK25U-jdk_aarch64_linux_hotspot_25.0.5.1_2.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index f56d96504d8..ef11d7e9e67 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,8 +6,8 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 25
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.2
-HOST_OPENJDK_BIN_VERSION_BUILD = 10
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.5.1
+HOST_OPENJDK_BIN_VERSION_BUILD = 2
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 21
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.13.1
diff --git a/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch b/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
deleted file mode 100644
index 78ab31ff621..00000000000
--- a/package/openjdk/25.0.2+10/0002-8376684-Compile-OpenJDK-in-headless-mode-without-req.patch
+++ /dev/null
@@ -1,144 +0,0 @@
-From 434d082d9082c1ce2d9ea46ec3c90420442567b9 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas@devoogdt.com>
-Date: Wed, 4 Feb 2026 06:48:59 +0000
-Subject: [PATCH] 8376684: Compile OpenJDK in headless mode without required
- X11 libraries
-
-Reviewed-by: erikj, aivanov
-
-Upstream: https://github.com/openjdk/jdk/pull/28310
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- doc/building.html                                |  7 +++----
- doc/building.md                                  |  6 ++----
- make/autoconf/libraries.m4                       |  8 ++++----
- make/modules/java.desktop/lib/AwtLibraries.gmk   | 16 ++++++++++++++--
- .../unix/native/common/awt/utility/rect.h        |  4 ++--
- 5 files changed, 25 insertions(+), 16 deletions(-)
-
-diff --git a/doc/building.html b/doc/building.html
-index da8465bc532..f8d815a5474 100644
---- a/doc/building.html
-+++ b/doc/building.html
-@@ -1380,10 +1380,9 @@ <h4 id="alsa-1">ALSA</h4>
- can specify it by <code>--with-alsa</code>.</p></li>
- </ul>
- <h4 id="x11-1">X11</h4>
--<p>You will need X11 libraries suitable for your <em>target</em> system.
--In most cases, using Debian's pre-built libraries work fine.</p>
--<p>Note that X11 is needed even if you only want to build a headless
--JDK.</p>
-+<p>When not building a headless JDK, you will need X11 libraries
-+suitable for your <em>target</em> system. In most cases, using Debian's
-+pre-built libraries work fine.</p>
- <ul>
- <li><p>Go to <a href="https://www.debian.org/distrib/packages">Debian
- Package Search</a>, search for the following packages for your
-diff --git a/doc/building.md b/doc/building.md
-index 1a9fe6b2e78..92ebd3d32c7 100644
---- a/doc/building.md
-+++ b/doc/building.md
-@@ -1173,10 +1173,8 @@ #### ALSA
- 
- #### X11
- 
--You will need X11 libraries suitable for your *target* system. In most cases,
--using Debian's pre-built libraries work fine.
--
--Note that X11 is needed even if you only want to build a headless JDK.
-+When not building a headless JDK, you will need X11 libraries suitable for your
-+*target* system. In most cases, using Debian's pre-built libraries work fine.
- 
- * Go to [Debian Package Search](https://www.debian.org/distrib/packages),
-   search for the following packages for your *target* system, and download them
-diff --git a/make/autoconf/libraries.m4 b/make/autoconf/libraries.m4
-index 96f377c2f99..8f02b7ec8a7 100644
---- a/make/autoconf/libraries.m4
-+++ b/make/autoconf/libraries.m4
-@@ -42,12 +42,12 @@ m4_include([lib-tests.m4])
- AC_DEFUN_ONCE([LIB_DETERMINE_DEPENDENCIES],
- [
-   # Check if X11 is needed
--  if test "x$OPENJDK_TARGET_OS" = xwindows || test "x$OPENJDK_TARGET_OS" = xmacosx; then
--    # No X11 support on windows or macosx
-+  if test "x$OPENJDK_TARGET_OS" = xwindows ||
-+     test "x$OPENJDK_TARGET_OS" = xmacosx ||
-+     test "x$ENABLE_HEADLESS_ONLY" = xtrue; then
-     NEEDS_LIB_X11=false
-   else
--    # All other instances need X11, even if building headless only, libawt still
--    # needs X11 headers.
-+    # All other instances need X11 for libawt.
-     NEEDS_LIB_X11=true
-   fi
- 
-diff --git a/make/modules/java.desktop/lib/AwtLibraries.gmk b/make/modules/java.desktop/lib/AwtLibraries.gmk
-index 463e09e12dc..8b6b50b9e62 100644
---- a/make/modules/java.desktop/lib/AwtLibraries.gmk
-+++ b/make/modules/java.desktop/lib/AwtLibraries.gmk
-@@ -88,6 +88,10 @@ LIBAWT_EXTRA_HEADER_DIRS := \
- 
- LIBAWT_CFLAGS := -D__MEDIALIB_OLD_NAMES -D__USE_J2D_NAMES -DMLIB_NO_LIBSUNMATH
- 
-+ifeq ($(ENABLE_HEADLESS_ONLY), true)
-+  LIBAWT_CFLAGS += -DHEADLESS
-+endif
-+
- ifeq ($(call isTargetOs, windows), true)
-   LIBAWT_CFLAGS += -EHsc -DUNICODE -D_UNICODE -DMLIB_OS64BIT
-   LIBAWT_RCFLAGS ?= -I$(TOPDIR)/src/java.base/windows/native/launcher/icons
-@@ -167,11 +171,18 @@ ifeq ($(call isTargetOs, windows macosx), false)
-       $(TOPDIR)/src/$(MODULE)/$(OPENJDK_TARGET_OS_TYPE)/native/common/awt \
-       #
- 
-+  LIBAWT_HEADLESS_EXCLUDE_FILES := \
-+      GLXGraphicsConfig.c \
-+      GLXSurfaceData.c \
-+      X11PMBlitLoops.c \
-+      X11Renderer.c \
-+      X11SurfaceData.c \
-+      #
-+
-   LIBAWT_HEADLESS_EXTRA_HEADER_DIRS := \
-       $(LIBAWT_DEFAULT_HEADER_DIRS) \
-       common/awt/debug \
-       common/font \
--      common/java2d/opengl \
-       java.base:libjvm \
-       #
- 
-@@ -191,7 +202,8 @@ ifeq ($(call isTargetOs, windows macosx), false)
-   $(eval $(call SetupJdkLibrary, BUILD_LIBAWT_HEADLESS, \
-       NAME := awt_headless, \
-       EXTRA_SRC := $(LIBAWT_HEADLESS_EXTRA_SRC), \
--      EXCLUDES := medialib, \
-+      EXCLUDES := medialib opengl, \
-+      EXCLUDE_FILES := $(LIBAWT_HEADLESS_EXCLUDE_FILES), \
-       ONLY_EXPORTED := $(LIBAWT_HEADLESS_ONLY_EXPORTED), \
-       OPTIMIZATION := LOW, \
-       CFLAGS := -DHEADLESS=true $(CUPS_CFLAGS) $(FONTCONFIG_CFLAGS) \
-diff --git a/src/java.desktop/unix/native/common/awt/utility/rect.h b/src/java.desktop/unix/native/common/awt/utility/rect.h
-index ceea38f4349..91b5a17ec58 100644
---- a/src/java.desktop/unix/native/common/awt/utility/rect.h
-+++ b/src/java.desktop/unix/native/common/awt/utility/rect.h
-@@ -28,7 +28,7 @@
- #ifndef _AWT_RECT_H
- #define _AWT_RECT_H
- 
--#ifndef MACOSX
-+#if !defined(HEADLESS) && !defined(MACOSX)
- #include <X11/Xlib.h>
- typedef XRectangle RECT_T;
- #else
-@@ -39,7 +39,7 @@ typedef struct {
-     int width;
-     int height;
- } RECT_T;
--#endif /* !MACOSX */
-+#endif /* !HEADLESS && !MACOSX */
- 
- #define RECT_EQ_X(r1,r2)        ((r1).x==(r2).x && (r1).width==(r2).width)
- 
--- 
-2.43.0
-
diff --git a/package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/25.0.5.1+2/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch b/package/openjdk/25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0003-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
rename to package/openjdk/25.0.5.1+2/0002-src-hotspot-aarch64-macro-assembler-fix-cmp.patch
diff --git a/package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch b/package/openjdk/25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
similarity index 100%
rename from package/openjdk/25.0.2+10/0004-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
rename to package/openjdk/25.0.5.1+2/0003-src-hotspot-share-gc-shenandoah-fix-constexpr.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index 33124c17a8c..85c9f2ba009 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  9b3164cedf78d7a76a59499d7a6833145c7e0269ec7b664bfe5ee03ced2f449e  openjdk-25.0.2+10.tar.gz
+sha256  b3ecd75437342ee932f71792bbbdd09cd336659324f94ad0e81e527af74d8c5c  openjdk-25.0.5.1+2.tar.gz
 sha256  2f00670ffe781881c6fdb60f49ecdfd12a6c0f5e2943b94d17b1f4bc714397f9  openjdk-21.0.13.1+2.tar.gz
 sha256  1358a7fbe258370744a11a4be8017bd9d30a00a5fc5b784f9221815bb7444a4d  openjdk-17.0.21.1+2.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 94e96e4924a..495ef58a0c3 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,8 +6,8 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_25),y)
 OPENJDK_VERSION_MAJOR = 25
-OPENJDK_VERSION_MINOR = 0.2
-OPENJDK_VERSION_BUILD = 10
+OPENJDK_VERSION_MINOR = 0.5.1
+OPENJDK_VERSION_BUILD = 2
 else ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
 OPENJDK_VERSION_MAJOR = 21
 OPENJDK_VERSION_MINOR = 0.13.1
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
