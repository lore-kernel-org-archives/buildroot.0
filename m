Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA0606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PfpP7d9g
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91A6440927;
	Thu, 19 Nov 2026 14:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uHKo7xpKbrT1; Thu, 19 Nov 2026 14:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E62A340AE2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795096957;
	b=nyfisEhr5neRQIU2CqqAni/RpETT56O+IXJyOH7u6e5cjtPobfBh3dQRZYp9c/zphJmi
	 1Js9DzZ5+BS4I3pO+YOt42H+aAYLtghtAAuXqGtUpMy9J2YuqQzx9OtSsx3hDIKGPLQ08
	 tK8ECP3PcHwrceuJERp1IIxiUB2BPDLdRwXhRBpUh628MUAG9tys07+ybwjorNzhGT9G9
	 w+CVgxQIxX/eQ6vXtDhD7wIPcrxEr7Fi6o/netVfMJPuA6QKCH135Oi1z8XPIeTSwemqH
	 mdJiZ24wePMCMLwF9MWp6DXxtsqFDZoWKtryq4zdLeZNXJ+UnD+kbMBWe4HqeHq6+UQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795096957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=fLKvomerAYqdKYK0TJbEKGnraqz41izSbtsswLn37b4=;
	b=FgIgmzKz8P8zv2PfP/rGrVZOOZqFtBDtqm9oeG5EkgqhxVYfYNri8u/SzxJzOb/AATxG
	 nL7ucSjcAHoGSUeE2eDz7VK6gk6aO2FBDGSu66AQFl0xA5pCBzrC4ikBEx2k6syhUWUZQ
	 Etm6rEW9I20mFonD7u+WFf0d7Ol02TKiN96A7UkMSgizJRcd1jzz+1DvH06d8Egw38dRj
	 ISCnK6mWhjU4Xi4B4geLBj9JrcpMuXHJ1xBRUiv4Ug/2wifytZQNwB8P2AbsRTPQSf0sI
	 qPBnnI3MXOT9lzAP33QeqESDXJ+MCBfS/viJd9rIvv5rYO2JO8bAQreJcYv2KIxET8Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795096957;
	bh=fLKvomerAYqdKYK0TJbEKGnraqz41izSbtsswLn37b4=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PfpP7d9gGDUmp3yxbFAes4SBkzLQM3vPE0dXhpYNAg0BT7Exj0W+90/s8H29zLx0y
	 c1aszos2wO5WqWZ1FTvpX0kZRODsyWnYQudEQawyOFd/EL8twMznh0c328D07uyeDs
	 b+qcBuWkTSBU/2pOe8c++3B4+c6+aRBjUdzkXOoGucUBv7R+teMZp+7wRjOHu9ezGi
	 HiKYCYcFQlqt/pqzU5WJr0U986+T4Vu1uhTUf7rufCVZJuQlzdDheg54PYVgA7hK48
	 gaJjEBr6mtV96f4qUVoyPEPs91gCGkeMrk5gPFGZABKDH3fKIZWt+yja+56kH0z7My
	 wpAaURVfTO8YQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E62A340AE2;
	Thu, 19 Nov 2026 14:02:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A4F3F22B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BABE40540
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OeClVWWhWgZs for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:02:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E78394052F
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=209.85.221.54
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.221.54;
 helo=mail-wr1-f54.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=devoogdt.com
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E78394052F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:02:31 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4a357b1c649so1463971f8f.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 06:02:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795096949; x=1795701749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SuIbqqEcdgBVgdqfHEgxe2QYg6HnnzBqamgKWuE8Hgg=;
 b=FPBFBQfm5DphskyFrcQqtF9Lhp4HaobpWjrHCydL96XrFe/VCqROPmEu8TCubyWe9f
 Y4AqQP1IvGZZA+BF1Re/dpuGXIrpFTFkgLtyxSKH0GQam91JrEx4Kfnv6YFxgeQp3ga3
 2L/2lBdONpL4J3gs+j0uhMB1IGxYeW/b1FTzVzgEf7moVKa5ncG6JKqxbTuOQIB0hmFG
 nWa4xNJanPjHVAA8e99Onepq77J3YWqFUTnm1buPyScjNOFniMyjbToFIKCaWevEDCXb
 kxEeDGJoiW4bOJReap9NWc3PcWBFzsNpiv11tiVeSS39XlsVLkXHJJoJndeUC7Exf0U5
 L5Sg==
X-Gm-Message-State: APuU4Z/nlfoH07+7ZUaA3cLxz0dpJGEYElrlw8aeGwGkZoyFQhjHddbv
 O0zZh1EqOv7xZMkFpOVdB+kTMneVJmCQRhpc/hJRsHEgeoNwYQJPMIZGe8XD5ZJg
X-Gm-Gg: AZFdTZcmuXF6FViTfgJuOWYa0SNqnPaPTbOxmHtF9ex2Za6bJAJhghdrCynIdhYAb9E
 c3izdeGaEB5kpZR8jPEDgwKukyg1dwCvAndgjupEgz/ubLqqI2EwE8ibCjasyQEFyjWOaj35rqv
 ladY8l+jHq4TzysmpXg3aK4QnJFe8VkAJ5U1UohgDBz9QptjZuuU/UIq5Uxas0pVFeqzTgE82f2
 crQBakaT9MCgGjIac4CNXfQut6Cj46JDwvpyHCWlG6KyuvQIQoWRr8N84iEGrYEbislNNUugBfY
 iB8Yzg/bZPeBTGeQKFaXVWCpEOYHrxIfVXCr6rGmGKkquVvf+ZRlgbRPyHHiZyFaaSTZnzkiTkU
 fAzjKcSF3VyQ54t2mTOGrzXlos58gUWSXCToMhzONMaTLSk49A1uffCUzwD79RQYm0VxueH6ZjP
 2N/R4m13WatIsJmOsYxLivEMmvpGQAmBV/J2RNBgPdvfVotmh2namHlJu5wq1UAWm63Fn6PvzdQ
 UH5payjcmw29+LBDVIu2Vz1Ps4aSJUCnZDBp9OvKPKo6+BD0IjdtP11u9R9rHok63LcyE5/VTYX
 fZ7Xa4MdSj/F0HfMxazXGOKcRKTHwEeh/wcOzb6cCP/oJmenu3b/zpvAdwH+mplavBmjk2uZi9L
 Wrm2BcEvRastIVOnJX3At3MingwowMG6dSqMSNGOag21iOuZVYzOueIfdzB6/j1bHOCr/3a+1la
 MP8PcxqFZ+DFeS59ZYLt7KZdZ+WkbfSRg=
X-Received: by 2002:a05:6000:4b1e:b0:499:9f62:d64c with SMTP id
 ffacd0b85a97d-4a63984a9dcmr12668073f8f.10.1795096949226; 
 Thu, 19 Nov 2026 06:02:29 -0800 (PST)
Received: from KORLIN44614.barco.com (d528f5fdc.static.telenet.be.
 [82.143.95.220]) by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-4ab5539af30sm2696f8f.41.2026.11.19.06.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 06:02:28 -0800 (PST)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: thomas@devoogdt.com
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
Date: Thu, 19 Nov 2026 15:02:23 +0100
Message-ID: <20261119140223.1968045-3-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119140223.1968045-1-thomas@devoogdt.com>
References: <20261119123532.1749442-3-thomas@devoogdt.com>
 <20261119140223.1968045-1-thomas@devoogdt.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 3/3] package/openjdk{-bin}: security bump
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

The headless-build patch is now upstream and can be removed.

Temurin does not provide a glibc AArch64 JDK for this security release,
so use the matching Amazon Corretto archive on those hosts.

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
index 00000000000..6a77e91b507
--- /dev/null
+++ b/package/openjdk-bin/25.0.5.1_2/openjdk-bin.hash
@@ -0,0 +1,9 @@
+# From https://github.com/adoptium/temurin25-binaries/releases/download/jdk-25.0.5.1%2B2/OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz.sha256.txt
+sha256  760f91b22c3efc9bd1b64ff950598231be82928cc807e30691a0e7a2995a62c0  OpenJDK25U-jdk_x64_linux_hotspot_25.0.5.1_2.tar.gz
+
+# From https://github.com/corretto/corretto-25/releases/tag/25.0.5.1.2
+sha256  9370d3e5bcf0d165e6be4a78c3f6b57160af16d3033319af583800251eb91df2  amazon-corretto-25.0.5.1.2-linux-aarch64.tar.gz
+
+# Locally calculated
+sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
+sha256  75292f03bf23d3db7c985aecc191029b93883200721ed23ed34a2e601463df33  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 2da773d2e8b..f2876a9c6b1 100644
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
