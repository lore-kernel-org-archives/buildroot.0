Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36477EB64D9
	for <buildroot@archiver.kernel.org>; Fri,  7 Jul 2023 18:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 833AB400FC;
	Fri,  7 Jul 2023 18:51:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 833AB400FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1AZOf0XSYZ7; Fri,  7 Jul 2023 18:51:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 887A24019D;
	Fri,  7 Jul 2023 18:51:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 887A24019D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AFC511BF4E2
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 18:51:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9634041BE2
 for <buildroot@lists.busybox.net>; Fri,  7 Jul 2023 18:51:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9634041BE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jn7v7x7YOjLl for <buildroot@lists.busybox.net>;
 Fri,  7 Jul 2023 18:51:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D338C41B99
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D338C41B99
 for <buildroot@buildroot.org>; Fri,  7 Jul 2023 18:51:21 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-c6cad6a3998so1371029276.3
 for <buildroot@buildroot.org>; Fri, 07 Jul 2023 11:51:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688755880; x=1691347880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LctQGRSWiR8+APq3v8SulJTcMENhofuYg8kv2gJLCKw=;
 b=iiOf3Yzx2eUIMQrK2Wh/QYCnWAIZvIr7kpEMFI6qN3ju0Vg7i7i7bYy5tbu4PSw9SP
 0jUGsFonxj78KDgy2EYbuHr074rKd8zq2/6fYuNSZF2+XqdtRdYBh07A8KyXWlz46PEE
 FjJEipMDkVok7c878mQkdD19uvtdkESMPRcLIDw6qEkgSnHVOCmThpY3uz9NAN3fMw1e
 XyuUmhie6fmiIDbS2xgXYKqXAhuD8O7IpgC9kOn4fXI33PgFG91XCiRfuEtFqfuQ8HzM
 LSbPX33OJVHjCeyBvsUPAFgiU4kK8sBjpugrpAiTN5IxBlpkrfH2AvnSdZv7WhFdatUA
 1EtA==
X-Gm-Message-State: ABy/qLbakfKu941sc+DTyb98hjLNKsSZqseDw2bmiBv+JsQJqfpkgrtk
 29HDzr0aZ86IJoLzVm5CLrwB+Vz0JdA=
X-Google-Smtp-Source: APBJJlFpzZHaRwsAgSgbcrTLAPWJ8hnVfIWeDs4MKd9PFmhM6zwucutIy7FpNUgnUbmYoNsIG8+I3g==
X-Received: by 2002:a05:6902:cd:b0:c02:7c99:629 with SMTP id
 i13-20020a05690200cd00b00c027c990629mr5062826ybs.34.1688755880097; 
 Fri, 07 Jul 2023 11:51:20 -0700 (PDT)
Received: from purgatory.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 h126-20020a255384000000b00c4e4668835dsm1091694ybb.4.2023.07.07.11.51.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 07 Jul 2023 11:51:19 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jul 2023 11:51:06 -0700
Message-Id: <20230707185106.98208-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688755880; x=1691347880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LctQGRSWiR8+APq3v8SulJTcMENhofuYg8kv2gJLCKw=;
 b=Z9qLPHfpduMgQ7q+11XijIGsYCFJp1cjt0QnsT4oz01QogC8c9B/RUGeFSrZpyTs/o
 gv0dMnAeqefYxqMAJtyXH22/7KSD1cChMUnUdvCr5z4r8L9aSbp5CXfJUEB9LDhBz5p/
 v6ObnN2prgCzoXVfTXxGFkm9ofiYWRfcKSvBkZdKf62ynJbaO666Zgfm12DA8rKCcXr+
 dTgyWuG23Ysl1/yqeX9ATywZluyr6znQN9jEoEO0kSwivRvNtjSKcShDQXHKBxsaIvSl
 fDvlpZOoExEkjKI7XV7IUIeCaBq8i9CPLl0X58UK9jSr0IJRhlhuoe+HP9DUpr2TMUAI
 sUew==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=Z9qLPHfp
Subject: [Buildroot] [PATCH 1/1] package/go-native: add a new download only
 package for go compilers
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The go-native is mainly for the aarch64 support since that was
added after the go-bootstrap written in C was dropped. So, to
get a cross compiler for go a host/native compiler needs to be
available to generate the setup for the needed target. This is
using the same go version as the expected cross-compiler to
keep the packages in sync. A specific version could be used.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/Config.in.host           |  1 +
 package/go-native/Config.in.host | 12 ++++++++
 package/go-native/go-native.hash |  5 ++++
 package/go-native/go-native.mk   | 48 ++++++++++++++++++++++++++++++++
 package/go/Config.in.host        |  6 ++--
 package/go/go.mk                 | 12 +++++++-
 6 files changed, 81 insertions(+), 3 deletions(-)
 create mode 100644 package/go-native/Config.in.host
 create mode 100644 package/go-native/go-native.hash
 create mode 100644 package/go-native/go-native.mk

diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..d7932f048b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -41,6 +41,7 @@ menu "Host utilities"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
 	source "package/go-bootstrap/Config.in.host"
+	source "package/go-native/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go-native/Config.in.host b/package/go-native/Config.in.host
new file mode 100644
index 0000000000..7e978e02b5
--- /dev/null
+++ b/package/go-native/Config.in.host
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_HOST_GO_NATIVE_ARCH_SUPPORTS
+	bool
+	# See https://go.dev/dl/ for supported architecture downloads
+	default y if BR2_HOSTARCH = "x86"
+	default y if BR2_HOSTARCH = "x86_64"
+	default y if BR2_HOSTARCH = "arm"
+	default y if BR2_HOSTARCH = "aarch64"
+
+config BR2_PACKAGE_HOST_GO_NATIVE
+	bool "host go-native"
+	depends on BR2_PACKAGE_HOST_GO_NATIVE_ARCH_SUPPORTS
+	default y if !BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
diff --git a/package/go-native/go-native.hash b/package/go-native/go-native.hash
new file mode 100644
index 0000000000..3af2f51abc
--- /dev/null
+++ b/package/go-native/go-native.hash
@@ -0,0 +1,5 @@
+# From https://go.dev/dl/
+sha256  45a34313664d66087d49b46ca63a3ecf292f56e9e63bd439829b5eaf0270586d  go1.19.10.linux-386.tar.gz
+sha256  8b045a483d3895c6edba2e90a9189262876190dbbd21756870cdd63821810677  go1.19.10.linux-amd64.tar.gz
+sha256  df98698821211c819e8b2420c77a0f802d989e377718578a31b1f91f6be2c5b4  go1.19.10.linux-arm64.tar.gz
+sha256  937f885c35f191be4c6a618868ae0dbbb15b0213925a1a104d122eba02622356  go1.19.10.linux-armv6l.tar.gz
diff --git a/package/go-native/go-native.mk b/package/go-native/go-native.mk
new file mode 100644
index 0000000000..4b541cce73
--- /dev/null
+++ b/package/go-native/go-native.mk
@@ -0,0 +1,48 @@
+################################################################################
+#
+# go-native
+#
+################################################################################
+
+# Fixup the host arch as needed
+ifeq ($(HOSTARCH),x86)
+GO_NATIVE_HOST_ARCH = 386
+else ifeq ($(HOSTARCH),x86_64)
+GO_NATIVE_HOST_ARCH = amd64
+else ifeq ($(HOSTARCH),arm)
+GO_NATIVE_HOST_ARCH = armv6l
+else ifeq ($(HOSTARCH),aarch64)
+GO_NATIVE_HOST_ARCH = arm64
+else
+GO_NATIVE_HOST_ARCH = $(HOSTARCH)
+endif
+
+# Download the native tools from as the same go version from golang
+GO_NATIVE_VERSION = $(GO_VERSION)
+GO_NATIVE_SITE = https://go.dev/dl
+GO_NATIVE_LICENSE = BSD-3-Clause
+GO_NATIVE_LICENSE_FILES = LICENSE
+
+HOST_GO_NATIVE_SOURCE = go$(GO_NATIVE_VERSION).linux-$(GO_NATIVE_HOST_ARCH).tar.gz
+
+# To build programs that need cgo support the toolchain needs to be
+# available, so the toolchain is not needed to build host-go-native
+# itself, but needed by other packages that depend on
+# host-go-native.
+HOST_GO_NATIVE_DEPENDENCIES = toolchain
+
+HOST_GO_NATIVE_ROOT = $(HOST_DIR)/lib/go-$(GO_NATIVE_VERSION)
+
+define HOST_GO_NATIVE_INSTALL_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_NATIVE_ROOT)/bin/go
+	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_NATIVE_ROOT)/bin/gofmt
+
+	cp -a $(@D)/lib $(HOST_GO_NATIVE_ROOT)/
+	cp -a $(@D)/pkg $(HOST_GO_NATIVE_ROOT)/
+
+	# There is a known issue which requires the go sources to be installed
+	# https://golang.org/issue/2775
+	cp -a $(@D)/src $(HOST_GO_NATIVE_ROOT)/
+endef
+
+$(eval $(host-generic-package))
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index ded02d3b3a..4dbbe9a221 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -2,7 +2,8 @@
 config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS \
+		|| BR2_PACKAGE_HOST_GO_NATIVE_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
 		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
@@ -28,4 +29,5 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS \
+		|| BR2_PACKAGE_HOST_GO_NATIVE_ARCH_SUPPORTS
diff --git a/package/go/go.mk b/package/go/go.mk
index 545d2117b7..af2e3b2f74 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -12,7 +12,11 @@ GO_LICENSE = BSD-3-Clause
 GO_LICENSE_FILES = LICENSE
 GO_CPE_ID_VENDOR = golang
 
+ifeq ($(BR2_PACKAGE_HOST_GO_NATIVE),y)
+HOST_GO_DEPENDENCIES = host-go-native
+else
 HOST_GO_DEPENDENCIES = host-go-bootstrap
+endif
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -123,10 +127,16 @@ HOST_GO_HOST_ENV = \
 
 # The go build system is not compatible with ccache, so use
 # HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+ifeq ($(BR2_PACKAGE_HOST_GO_NATIVE),y)
 HOST_GO_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(HOST_GO_NATIVE_ROOT)
+else
+HOST_GO_MAKE_ENV = \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT)
+endif
+HOST_GO_MAKE_ENV += \
 	GO111MODULE=off \
 	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_ROOT) \
 	GOROOT_FINAL=$(HOST_GO_ROOT) \
 	GOROOT="$(@D)" \
 	GOBIN="$(@D)/bin" \
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
