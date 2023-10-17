Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05056CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 17:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BAAD820F7;
	Tue, 17 Oct 2023 17:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7BAAD820F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BugjMI_Nm0cR; Tue, 17 Oct 2023 17:36:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6375A821F4;
	Tue, 17 Oct 2023 17:36:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6375A821F4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8677F1BF32B
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D092613E5
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 17:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D092613E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOjm52Fb4oyI for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 17:36:26 +0000 (UTC)
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10D36613E4
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 17:36:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D36613E4
Received: by mail-lj1-x244.google.com with SMTP id
 38308e7fff4ca-2c50cf61f6dso58531721fa.2
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 10:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697564183; x=1698168983;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MYY8YUO38keKEjsZxo3uGl58yLBe4t2EbxZqGhbQ0iE=;
 b=MTUiWcU8NlT9K+jsGt/rfR2Galh450MyGyM6Ov697y1Zd4jHJdQl/4s9G2MwFECGe8
 BKq7/HOIUgYNLez6njcSjW20WEobL2W1JHGnVlXniXV2QP+ZRDdyc2LFEN91LnTRZZgm
 RbYWHp4tFzcXVF5RoXIcYb9PaaSeeTut6ehB+HtO+xAC/+PyrTEW2w2MOkVaVUdUbCr4
 k2M9J76h1pO/WQ2sVy+crwoymrC3V2lJKBoH/iwSj27vtZkJCupcGM6lzp8RmbgevnEe
 QxOvzE5BEqjaeQa45K0z8kJekGJIlymdJ05KQw5mBIGOqFMnpAQTJDyXHl4DfcXIvCfh
 p1Yw==
X-Gm-Message-State: AOJu0YyY5JWbbEL6cQu5u7yqMmSko/tTenYyuvC1z0swXUDF5gpcMY1J
 SKPdFDohYLttKrSCHJAKWrnEoMn/veTIduPOge+68a+6m6qylQ==
X-Google-Smtp-Source: AGHT+IHcZkGxn3encOZE1RfipQn/qLtwRqR2FCRmVKERHe1gHM24eqzX9BqCSU5pZwcdF8J8e+3XcA==
X-Received: by 2002:a2e:1648:0:b0:2bf:7894:a490 with SMTP id
 8-20020a2e1648000000b002bf7894a490mr2219986ljw.38.1697564183501; 
 Tue, 17 Oct 2023 10:36:23 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 d9-20020a05600c34c900b004063cced50bsm2412193wmq.23.2023.10.17.10.36.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 10:36:23 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 19:36:11 +0200
Message-ID: <20231017173611.2881905-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
References: <20231017173611.2881905-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697564183; x=1698168983;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MYY8YUO38keKEjsZxo3uGl58yLBe4t2EbxZqGhbQ0iE=;
 b=YsSyhr0WpsFRN/+jscKi7aasoUX1hy1E3zFS1XGEA/jR3fBYGQ/MZw0ak5wXrxxHcn
 jKDhN5Ec6CS4EqactK0+ZW5IR0hCeTSwKSKh0Q+I8g23c3x1aOiB5S3kl13bV8fNO8QZ
 j0zbcMyLSPXXgS/JeCDZYnfrzcK+QVXDecFkc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=YsSyhr0W
Subject: [Buildroot] [PATCH 2/2] package/openjdk{-bin}: Drop OpenJDK11 and
 add OpenJDK21
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

OpenJDK 21 is out and with it, OpenJDK11 is now EOL.
See: https://endoflife.date/oracle-jdk As such, drop support for 11 and do the
following:

  - The 0001-Add-ARCv2-ISA-processors-support-to-Zero.patch patch now applies to
    both 17 and 21. Move it out of the version-specific directoriy.

  - BR2_OPENJDK_VERSION_LTS is now set to 17.

  - BR2_OPENJDK_VERSION_LATEST is now set to 21.

  - Drop --disable-hotspot-gtest as it has been removed, and was ignored in 17.

  - Add two separate HOST_OPENJDK_BIN_VERSION defines in openjdk-bin.mk as
    there is not a point release yet for OpenJDK 21.

  - Update the expectedVersion variable in JniTest.java from 0x000A0000 to
    0x00150000

Tested with:
./support/testing/run-tests tests.package.test_openjdk.TestOpenJdk.test_run

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 .checkpackageignore                                |  2 +-
 package/openjdk-bin/openjdk-bin.hash               |  8 ++++----
 package/openjdk-bin/openjdk-bin.mk                 | 11 ++++++-----
 ...-Add-ARCv2-ISA-processors-support-to-Zero.patch |  0
 package/openjdk/Config.in                          | 14 ++++++--------
 package/openjdk/openjdk.hash                       |  2 +-
 package/openjdk/openjdk.mk                         | 13 +++++++------
 .../openjdk/package/openjdk-jni-test/JniTest.java  |  2 +-
 8 files changed, 26 insertions(+), 26 deletions(-)
 rename package/openjdk/{17.0.8.1+1 => }/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 437566a2a0..8a705e3fb3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1008,7 +1008,7 @@ package/olsr/S50olsr Indent Shellcheck Variables
 package/omxplayer/0001-Update-Makefile-to-be-compatible-with-buildroot.patch Upstream
 package/open-plc-utils/0001-Remove-OWNER-and-GROUPS-parameters-to-install.patch Upstream
 package/open2300/0001-fix-makefile.patch Upstream
-package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
+package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch Upstream
 package/openldap/0001-fix_cross_strip.patch Upstream
 package/openldap/0002-fix-bignum.patch Upstream
 package/openldap/0003-disable-docs.patch Upstream
diff --git a/package/openjdk-bin/openjdk-bin.hash b/package/openjdk-bin/openjdk-bin.hash
index 98f12cb2b8..1bd33d3d7a 100644
--- a/package/openjdk-bin/openjdk-bin.hash
+++ b/package/openjdk-bin/openjdk-bin.hash
@@ -1,11 +1,11 @@
+# From https://github.com/adoptium/temurin21-binaries/releases
+sha256  82f64c53acaa045370d6762ebd7441b74e6fda14b464d54d1ff8ca941ec069e6  OpenJDK21U-jdk_x64_linux_hotspot_21_35.tar.gz
+sha256  33e440c237438aa2e3866d84ead8d4e00dc0992d98d9fd0ee2fe48192f2dbc4b  OpenJDK21U-jdk_aarch64_linux_hotspot_21_35.tar.gz
+
 # https://github.com/adoptium/temurin17-binaries/releases
 sha256  c25dfbc334068a48c19c44ce39ad4b8427e309ae1cfa83f23c102e78b8a6dcc0  OpenJDK17U-jdk_x64_linux_hotspot_17.0.8.1_1.tar.gz
 sha256  eefd3cf3b3dd47ff269fa5b5c10b5e096b163f4e9c1810023abdbc00dc6cc304  OpenJDK17U-jdk_aarch64_linux_hotspot_17.0.8.1_1.tar.gz
 
-# From https://github.com/adoptium/temurin11-binaries/releases
-sha256  7a99258af2e3ee9047e90f1c0c1775fd6285085759501295358d934d662e01f9  OpenJDK11U-jdk_x64_linux_hotspot_11.0.20_8.tar.gz
-sha256  eb821c049c2d2f7c3fbf8ddcce2d608d3aa7d488700e76bfbbebabba93021748  OpenJDK11U-jdk_aarch64_linux_hotspot_11.0.20_8.tar.gz
-
 # Locally calculated
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  legal/java.prefs/LICENSE
 sha256  a44eb7b5caf5534c6ef536b21edb40b4d6babf91bf97d9d45596868618b2c6fb  legal/java.prefs/ASSEMBLY_EXCEPTION
diff --git a/package/openjdk-bin/openjdk-bin.mk b/package/openjdk-bin/openjdk-bin.mk
index 785ca87337..05d95dbbc0 100644
--- a/package/openjdk-bin/openjdk-bin.mk
+++ b/package/openjdk-bin/openjdk-bin.mk
@@ -4,12 +4,14 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
+HOST_OPENJDK_BIN_VERSION_MAJOR = 21
+HOST_OPENJDK_BIN_VERSION_MINOR = 35
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR)_$(HOST_OPENJDK_BIN_VERSION_MINOR)
+else
 HOST_OPENJDK_BIN_VERSION_MAJOR = 17
 HOST_OPENJDK_BIN_VERSION_MINOR = 0.8.1_1
-else
-HOST_OPENJDK_BIN_VERSION_MAJOR = 11
-HOST_OPENJDK_BIN_VERSION_MINOR = 0.20_8
+HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 endif
 
 ifeq ($(HOSTARCH),x86_64)
@@ -19,7 +21,6 @@ ifeq ($(HOSTARCH),aarch64)
 HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME = aarch64
 endif
 
-HOST_OPENJDK_BIN_VERSION = $(HOST_OPENJDK_BIN_VERSION_MAJOR).$(HOST_OPENJDK_BIN_VERSION_MINOR)
 HOST_OPENJDK_BIN_SOURCE = OpenJDK$(HOST_OPENJDK_BIN_VERSION_MAJOR)U-jdk_$(HOST_OPENJDK_BIN_DOWNLOAD_ARCH_NAME)_linux_hotspot_$(HOST_OPENJDK_BIN_VERSION).tar.gz
 HOST_OPENJDK_BIN_SITE = https://github.com/adoptium/temurin$(HOST_OPENJDK_BIN_VERSION_MAJOR)-binaries/releases/download/jdk-$(subst _,%2B,$(HOST_OPENJDK_BIN_VERSION))
 
diff --git a/package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch b/package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
similarity index 100%
rename from package/openjdk/17.0.8.1+1/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
rename to package/openjdk/0001-Add-ARCv2-ISA-processors-support-to-Zero.patch
diff --git a/package/openjdk/Config.in b/package/openjdk/Config.in
index 24a56e6b84..25d6960ecf 100644
--- a/package/openjdk/Config.in
+++ b/package/openjdk/Config.in
@@ -57,20 +57,18 @@ if BR2_PACKAGE_OPENJDK
 
 choice
 	prompt "openjdk version"
-	default BR2_PACKAGE_OPENJDK_VERSION_11 if BR2_OPENJDK_VERSION_LTS # legacy
-	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LATEST # legacy
-	default BR2_PACKAGE_OPENJDK_VERSION_17
+	default BR2_PACKAGE_OPENJDK_VERSION_17 if BR2_OPENJDK_VERSION_LTS # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_21 if BR2_OPENJDK_VERSION_LATEST # legacy
+	default BR2_PACKAGE_OPENJDK_VERSION_21
 	help
 	  Select the version of OpenJDK you wish to use.
 
-config BR2_PACKAGE_OPENJDK_VERSION_11
-	bool "OpenJDK 11"
-	# The ARC-specific OpenJDK patch only applies to OpenJDK 17.
-	depends on !BR2_arc
-
 config BR2_PACKAGE_OPENJDK_VERSION_17
 	bool "OpenJDK 17"
 
+config BR2_PACKAGE_OPENJDK_VERSION_21
+	bool "OpenJDK 21"
+
 endchoice
 
 config BR2_PACKAGE_OPENJDK_FULL_JDK
diff --git a/package/openjdk/openjdk.hash b/package/openjdk/openjdk.hash
index fcb9143748..76d419f255 100644
--- a/package/openjdk/openjdk.hash
+++ b/package/openjdk/openjdk.hash
@@ -1,4 +1,4 @@
 # Locally computed
+sha256  b798ebc2e899a98edf2be99e786bb0fbad144e2270925dffe624fbe052f07ade  openjdk-21+35.tar.gz
 sha256  e57251d8306911282b6f0a2f721431dab5f87c99cce0930fc062e690f7c77f04  openjdk-17.0.8.1+1.tar.gz
-sha256  b2a37ef209ae7eaf8f34182b7c9aa3252af20a214d02970f96ce62242c805479  openjdk-11.0.20+8.tar.gz
 sha256  4b9abebc4338048a7c2dc184e9f800deb349366bdf28eb23c2677a77b4c87726  LICENSE
diff --git a/package/openjdk/openjdk.mk b/package/openjdk/openjdk.mk
index 068d16b770..e3e63e2382 100644
--- a/package/openjdk/openjdk.mk
+++ b/package/openjdk/openjdk.mk
@@ -4,14 +4,16 @@
 #
 ################################################################################
 
-ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_17),y)
+ifeq ($(BR2_PACKAGE_OPENJDK_VERSION_21),y)
+OPENJDK_VERSION_MAJOR = 21
+OPENJDK_VERSION_MINOR = 35
+OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR)+$(OPENJDK_VERSION_MINOR)
+else
 OPENJDK_VERSION_MAJOR = 17
 OPENJDK_VERSION_MINOR = 0.8.1+1
-else
-OPENJDK_VERSION_MAJOR = 11
-OPENJDK_VERSION_MINOR = 0.20+8
-endif
 OPENJDK_VERSION = $(OPENJDK_VERSION_MAJOR).$(OPENJDK_VERSION_MINOR)
+endif
+
 OPENJDK_SITE = $(call github,openjdk,jdk$(OPENJDK_VERSION_MAJOR)u,jdk-$(OPENJDK_VERSION))
 
 OPENJDK_LICENSE = GPL-2.0+ with exception
@@ -83,7 +85,6 @@ OPENJDK_CONF_ENV = \
 
 OPENJDK_CONF_OPTS = \
 	--disable-full-docs \
-	--disable-hotspot-gtest \
 	--disable-manpages \
 	--disable-warnings-as-errors \
 	--enable-headless-only \
diff --git a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
index 3d6c17b746..21d9679788 100644
--- a/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
+++ b/support/testing/tests/package/br2-external/openjdk/package/openjdk-jni-test/JniTest.java
@@ -33,7 +33,7 @@ public class JniTest
 	public static void main(String[] args)
 	{
 		var actualVersion = JniWrapper.get_jni_version();
-		var expectedVersion = 0x000A0000;
+		var expectedVersion = 0x00150000;
 		JniTest.Test(
 			"Get JNI Version",
 			actualVersion,
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
