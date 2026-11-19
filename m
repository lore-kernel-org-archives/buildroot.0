Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829CA606A332
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mjjxXc31
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52AF840ADC;
	Thu, 19 Nov 2026 14:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hC9rFhfJMzZb; Thu, 19 Nov 2026 14:02:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 21E4C40AE0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795096952;
	b=H+YLHyN+JqCDvu541zA/e+2KRBqsbQDZx18vs+JSQNMXn4F1kf8p+177XJjsZdNqFG09
	 fzlIbN2Rx7Ve5oquabUdGaBD6WKMPJy3KtjCLoVswBW4nTPIAiL7SQf0GOWRuaSAenJ2e
	 Na2NtxhsIVcV+jwZ8r+X45l8BnBJGL87x3I6t1lQY41Wcoxe7XZ/Dz7LYPdSCs6I1X+OR
	 2otArZEiKRuv0boVuBaZs2iqizssxRpXDoAWkspkn/jR4QaE4YMdgf6LhQQ+wOvtVzXhy
	 ps4wEdDNeLVbjkW5tgUf5/CjWBxmo0Fu3K0EKGEnVcDfQj1v9x8ni1/aU8wDQoFZdUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795096952;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0GDaSfOovCCyG5D9meHWH2lDO/lMVU7Q+X2/0qkJXoU=;
	b=Sdxp56acrgGpb1BL6H4vlcaYtoot+EvrOzcNvLtWmzxHtsgAS17ylxeSLVXOQ+vXUhQm
	 wjoqJ+0xeS4Jp070BIeHbIcfvt+8evuDj4YRtKMXJZ7ceci/smubBzehTjzAYk1V++izr
	 472OxKibXI2AePfb2Ha9o/KqC5TXrEQvu3w/rW8iO5omfV+5EPkg0BfZswppv2/lbFy7c
	 4HymrDr7PV9uQXdhIsvhn/jQXVBbsp95I0y2CLxDTNEkiP30Q0yqulhmpz+3uzqKA6kOM
	 OKSES90yM6ZjbKlevIMud8D78t5bORWkIqXhUm7I9wsbQMLt6c4fpcI5upoPtFigGMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=none header.from=devoogdt.com;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795096952;
	bh=0GDaSfOovCCyG5D9meHWH2lDO/lMVU7Q+X2/0qkJXoU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mjjxXc31u5HvzT6SECPmxXbGC91FIMBHmignAHlNNBGELxCH/MqGEtbnVE9q66OhY
	 Nz70XBOLO++5n+L2i0V2SdSvlYjg5q09Ln/b90/xnZ5tG4DXn0VJ/ufoKTSAM70880
	 THat5c50+qQYYeGMPOLzluwSQULjbooHFdH3exN2klFvjcV4ylWQXDb/JSXuWHSmoV
	 jWuXPtnhwEg50uP4XgJromy/cZ8HBs1eGJ+kxy+Iddi/eTiorTOcR9S5RYhzp+Xj0l
	 KcMZ1ciC23ulAu/20iWCLrmdFslvzK4ssYPbrqP5FJ9Ci6kZ6X1GWih7JU2Xu89JaS
	 cmcF3iYDicj8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E4C40AE0;
	Thu, 19 Nov 2026 14:02:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D3191C9
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA2D40AE4
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aWT6BgJ6I9bC for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:02:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBF5F40AE0
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=209.85.221.48
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.48;
 helo=mail-wr1-f48.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBF5F40AE0
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:28 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-491971ac844so2263581f8f.2
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:02:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795096947; x=1795701747;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xfl81H+YTvM2yEJMryof3SNz22h14ytgUO5YTJYbpU0=;
 b=uogaQguKX8gdbPCUTUpN9MVOOLbwIrLVvx3sGQlzswH6zsm0lNyIjsJy4Ox+PfbgFT
 94ObnyceuyhQ0ytSvaRFr877W+kywl3kyE3aevgrZsAIqy9JM6aEtCc6uAa32drEAJTa
 fJG7miZyn4arXd7JaHZLmjNzi1dnks9HfGU+UbvKSxGFv1wlPXmkZNt+AbGURIO6Mugb
 JGBLVyXSJ30AafHnW0GTFB09C6g68zlaDlLoBSKU7ukBKJFm3kSypkoRtqm8oWw3APVS
 8iVJ+82IjX9XxSJrkA0WpVeGMmctXq4rn3TD4vQI2uk3ybwWbtUGiqJgE7nB8r8H2PoG
 guYQ==
X-Gm-Message-State: APuU4Z93oljX9MNBqoaqCMaDyztijQ6eEkLVSa+plZMZ/upi8ruWaKqN
 XYQu4OTE0dajoFZelznz1yCPUgUEP3waF2rAj3/awJ60kkOTtjycIVYC+s63ehxZ
X-Gm-Gg: AZFdTZf+F+XkrwcZGaVfPsMED2SljZeDBC6Wb5iwfsT2aVZzewkskf2AgkTyZOfnQ6A
 H8x9terXdSVwKTxrm+AbxoU47ydbGUSJ7wIzOT5u++b5eOJIIrcQY7AQAPiAdfboSZoPflPb+9y
 oWk8Z+L7C3Tj0TowUyA7fnky0H59RiDGAf3TKlbHTTjSVMo9bUmSAY/SeSsvzWL/mKdZpFfLyiI
 JydsUj6srB1oTnoftqXsjs3MwW4JykTSShaCUIYd8+U+kRK7solB7jl4bSg381B8oheS8u5k0pT
 q0uOqzsGvKZb8/Gj5+PavNgmqPXF1m+moQqX6oWKiACjxs13sZANhBOTzIKG082frqaXUhmOPiy
 v8/RI6016RcaIysM6X/8ozeKWxTBiKn3Xp27S+XfS2FVL78NsxiuYz/x/gxthBukpz1vf/WFvOk
 bQWSsHs2SrDuVqbX5trpM3knlFOvdZBbmJkPAks7Vg3LI1647tkyIs0NcVJNPFprhEZ0H/1xCVa
 qLF/KqoXxjGd+45oXXXEHGMYg6SlRn02db3FjtAmKBbmtNyJfpG7hb5tizGEEzsl6B7S5mQITGk
 fO78hNuQtVMyFrAZKlGesr28FnvWcKOzvn7nkZSL1k2lHcUAI6M+9pKm3UF6iD5jE86ti/Zp4P6
 g3TfuugIWTfSISwvBVIYyhhvXMgAr/N4E8tqTD4uHB4SIleoYL8C02k6/4aPrlziIkeLoql9KYw
 4jnmTM2eO5DJgeGOdqg/AjkENS937ycG4=
X-Received: by 2002:a05:6000:400f:b0:488:7dc6:4e9 with SMTP id
 ffacd0b85a97d-4a63a1e0223mr12467787f8f.10.1795096946325; 
 Thu, 19 Nov 2026 06:02:26 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4ab5539af30sm2696f8f.41.2026.11.19.06.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:02:25 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Thu, 19 Nov 2026 15:02:21 +0100
Message-ID: <20261119140223.1968045-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119123532.1749442-3-thomas@devoogdt.com>
References: <20261119123532.1749442-3-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/3] package/openjdk{-bin}: security bump
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

Temurin does not provide a glibc AArch64 JDK for this security
release, so use the matching Amazon Corretto archive on those hosts.

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

 .checkpackageignore                                   |  2 +-
 package/openjdk-bin/17.0.18_8/openjdk-bin.hash        |  7 -------
 package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash      |  9 +++++++++
 package/openjdk-bin/openjdk-bin.mk                    | 11 +++++++++--
 ...001-Add-ARCv2-ISA-processors-support-to-Zero.patch |  0
 ...002-awt-fix-HEADLESS-compilation-without-X11.patch |  0
 package/openjdk/openjdk.hash                          |  2 +-
 package/openjdk/openjdk.mk                            |  4 ++--
 8 files changed, 22 insertions(+), 13 deletions(-)
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
index 00000000000..7ae070f22d1
--- /dev/null
+++ b/package/openjdk-bin/17.0.21.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.21.1%2B2/OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz.sha256.txt
+sha256  0b0ac5eab6db6abaec68c9913bcddb31321e5da411c45073d520d9c125e6f7b4  OpenJDK17U-jdk_x64_linux_hotspot_17.0.21.1_2.tar.gz
+
+# From https://github.com/corretto/corretto-17/releases/tag/17.0.21.1.2
+sha256  f58bea1d8fca5788081a438e46997af0fe62491ef29b6ba4d9258cbfe8eeb5bb  amazon-corretto-17.0.21.1.2-linux-aarch64.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 4a21cbb4601..a0206010f46 100644
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
@@ -29,6 +29,13 @@ HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
+# Temurin does not provide a glibc AArch64 binary for this release.
+ifeq ($(HOSTARCH),aarch64)
+HOST_OPENJDK_BIN_CORRETTO_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR).$(HOST_OPENJDK_BIN_VERSION_BUILD)
+HOST_OPENJDK_BIN_SOURCE = amazon-corretto-$(HOST_OPENJDK_BIN_CORRETTO_VERSION)-linux-aarch64.tar.gz
+HOST_OPENJDK_BIN_SITE = https://corretto.aws/downloads/resources/$(HOST_OPENJDK_BIN_CORRETTO_VERSION)
+endif
+
 # Override automatic CPE ID because '_' in $(HOST_OPENJDK_BIN_VERSION) is not used by NVD
 HOST_OPENJDK_BIN_CPE_ID_VENDOR = oracle
 HOST_OPENJDK_BIN_CPE_ID_PRODUCT = openjdk
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
