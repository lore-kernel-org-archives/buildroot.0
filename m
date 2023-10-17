Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01D1CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 17:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 750A2820F2;
	Tue, 17 Oct 2023 17:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750A2820F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wA6NNqwmFxyE; Tue, 17 Oct 2023 17:36:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98181820F7;
	Tue, 17 Oct 2023 17:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98181820F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6A3651BF32B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DCC64046B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DCC64046B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ITbVaquOarW3 for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 17:36:25 +0000 (UTC)
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0D15400F3
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 17:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B0D15400F3
Received: by mail-wm1-x342.google.com with SMTP id
 5b1f17b1804b1-4064867903cso65465605e9.2
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 10:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697564182; x=1698168982;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=863imAZxJHXZeX0LDJ2AvTjyl+TXfYKabZtds5aAHvs=;
 b=rJmAgKd5GdB6q9WLjCkiq84wVxXPObIMMPETOKD6apfCo43iyWH78wJFxlaFvaWN2c
 88/g3Yu0TO/gvdxRcmWPxzFu+x7mfrikd1NCZh9/2nF10S+NdaiWqu0rfH6jA1RGzjoz
 DFkoJZfOs13s5I2mOrdxQLG4UmG8UmjZXB/XI6scjtMYkbfxWt8TMVhiELqZzNUqwbqN
 QGeKWMu5YGI7tU1xGmlirjblZTkuFUvbvqnBR2PfGWcO1bS19O+UEM6tfHReXqLP23a8
 Rwi1KfaocrUezpGOltxDjaqYLCldRzzLuhDFhgS2DaMEfoAeUgRxD8fCSfT+Uxp11YrO
 bzxw==
X-Gm-Message-State: AOJu0YwyDtolrNEe/xNgMoE7cMRLuT15/GbDO0cdEPpvYnEM6miY2UVD
 AhSBzLRAnXV+TdRc9DZfjRPBliPj3bMbx/cBql7ioBHNSFDX7Q==
X-Google-Smtp-Source: AGHT+IGgbp4OvnKLbieA4RtrSvk0jSWz+chjeQVEVOwxySS6lGRQFTGqsVcRkLsMoT+0NDrMVLSgRQ==
X-Received: by 2002:a05:600c:3c87:b0:3fe:1b4e:c484 with SMTP id
 bg7-20020a05600c3c8700b003fe1b4ec484mr2310926wmb.5.1697564182389; 
 Tue, 17 Oct 2023 10:36:22 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 d9-20020a05600c34c900b004063cced50bsm2412193wmq.23.2023.10.17.10.36.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:36:22 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 19:36:10 +0200
Message-ID: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697564182; x=1698168982;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=863imAZxJHXZeX0LDJ2AvTjyl+TXfYKabZtds5aAHvs=;
 b=dDw+h46SrGCJ47VFwKLC+/rNt3Z3S3G7oI3jao6v4BgSWuDw7Gs0GN/6GPVS2S4wIW
 ZoQoljmQkqFc45vt+avzDr4pAJM94s9A6E+rlJV6y12WcYR6+hmMkveSoIXUBablQ4u6
 99lskteFsjAsn8jnjmbivTTQ3u+sr51YaaE7s=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=dDw+h46S
Subject: [Buildroot] [PATCH 1/2] package/openjdk-bin: bump OpenJDK17 version
 to 17.0.8.1+1
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>,
 Tudor Holton <buildroot@tudorholton.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                                           | 2 +-
 package/openjdk-bin/openjdk-bin.hash                          | 4 ++--
 package/openjdk-bin/openjdk-bin.mk                            | 2 +-
 .../0001-Add-ARCv2-ISA-processors-support-to-Zero.patch       | 0
 package/openjdk/openjdk.hash                                  | 2 +-
 package/openjdk/openjdk.mk                                    | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)
 rename package/openjdk/{17.0.8+7 => 17.0.8.1+1}/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index b1d0b93b32..437566a2a0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1008,7 +1008,7 @@ package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 401e83e75e..98f12cb2b8 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,6 +1,6 @@
 # https://github.com/adoptium/temurin17-binaries/releases
-sha256  aa5fc7d388fe544e5d85902e68399d5299e931f9b280d358a3cbee218d6017b0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8_7.tar.gz
-sha256  c43688163cfdcb1a6e6fe202cc06a51891df746b954c55dbd01430e7d7326d00  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8_7.tar.gz
+sha256  c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz
+sha256  eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz
 
 # From https://github.com/adoptium/temurin11-binaries/releases
 sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 616c8d917d..785ca87337 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.8_7
+HOST_OPENJDK_BIN_VERSION_MINOR = 0.8.1_1
 else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 11
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
diff --git a/package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.8+7/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index ba398b84be..fcb9143748 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  643ff42dcdf8751e0fee716c1a1914ddc7348b174e871a5eb2636578a181f20d  openjdk-17.0.8+7.tar.gz
+sha256  e57251d8306911282b6f0a2f721431dab5f87c99cce0930fc062e690f7c77f04  openjdk-17.0.8.1+1.tar.gz
 sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index d1a2fa23ee..068d16b770 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -6,7 +6,7 @@
 
 ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
 OPENJDK_VERSION_MAJOR = 17
-OPENJDK_VERSION_MINOR = 0.8+7
+OPENJDK_VERSION_MINOR = 0.8.1+1
 else
 OPENJDK_VERSION_MAJOR = 11
 OPENJDK_VERSION_MINOR = 0.20+8
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
