Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6CC4345F
	for <buildroot@archiver.kernel.org>; Mon, 15 Apr 2024 16:23:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9603B81831;
	Mon, 15 Apr 2024 16:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXh8-NCHceNB; Mon, 15 Apr 2024 16:23:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C6B581852
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C6B581852;
	Mon, 15 Apr 2024 16:23:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1610C1BF298
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01FED40628
 for <buildroot@lists.busybox.net>; Mon, 15 Apr 2024 16:23:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OnfdX3QVBM76 for <buildroot@lists.busybox.net>;
 Mon, 15 Apr 2024 16:22:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 935144027C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 935144027C
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 935144027C
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 16:22:58 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-418672b4714so6021075e9.3
 for <buildroot@buildroot.org>; Mon, 15 Apr 2024 09:22:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713198176; x=1713802976;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tb4u9gMZDG5pbaDq+WSDdlpQGXpWHnLyJGufKG+Vq78=;
 b=bIL8gcqIvh0GDuHL8uTcNCwcxaD6O93hcxdNmXXy0dwq0kwlPP45PMfa1ojwXHGsCr
 P7kYtRa085D62mxAk+SvkfDoW/kpakiQm+v33CdMnD20Ln/stRAtfLFuyUR6iN675Bey
 eggrAGGmg26S31zxHMzijuimnzKctlmmyeCwOpFH//CfYQ5CEYNz8Ycgt6lw8ibOpoew
 RWoeGsHqrNBUlclzK/dlnBovKCkNlSwTcQ/RV29Nxa5WB76dIsO+2t9dd6ooPY03sJ+a
 2EpDpGCCOC74BP3xLvpzUAFJfJmbYbg+YTig8eTKs/3CfDac2dawq5+1jdYmovP+RWpR
 1KSQ==
X-Gm-Message-State: AOJu0Yz+BSg54iTacG24J9s26yA03kwf3Yeme+w+jUdaCI4RVkoLMB55
 h9wP/8oPHsPZJAux2lXDnxBNFkH7rBwcXsPXBmJW9XktmpYXJrJkT6dqdHvABp7TUqfUrvGz65M
 u900=
X-Google-Smtp-Source: AGHT+IGZuVByW7ZM8Kego1iUEWTnZSJm1jMEoq5RT6sQ3TVNkdP64QuXWOv9Xu1HieovoMt7j1E/uQ==
X-Received: by 2002:a05:600c:4749:b0:414:12f6:a105 with SMTP id
 w9-20020a05600c474900b0041412f6a105mr7137711wmo.5.1713198175950; 
 Mon, 15 Apr 2024 09:22:55 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 fl16-20020a05600c0b9000b00418631f91c1sm4302938wmb.28.2024.04.15.09.22.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:22:55 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Mon, 15 Apr 2024 18:22:23 +0200
Message-ID: <20240415162229.1357491-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415162229.1357491-1-thomas.perale@mind.be>
References: <20240415162229.1357491-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1713198176; x=1713802976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tb4u9gMZDG5pbaDq+WSDdlpQGXpWHnLyJGufKG+Vq78=;
 b=QoJkqoovYTu+bJ6+L2GNjNDSuihDr5vzmXaZCLEkIYAVwjU9h54Sqji03VslZVuxnU
 wrLBokobahoDT4c/44/oOJ0TOPIWIMdK96lerPpDzpHgskRptsg2Xm3HI/Tdx3fGyUUW
 /ob1/1B1pGx3uqXJqjAK+GNap6JjJa/Yy9gqwP+KK81//P7+Vl1Mx1TBsMikQm1FKK+/
 K/ntpglQCQcdbvyCfRH+B1pMAQtk85aELznW4UsC4HUulUl42Sbs0FbH5GZV0RVfZzim
 yz7G0L++CyxMe1ijxZcS5pKo7VIs+0nUjNLaMKgvxDQI0nnF0//5mOj78NOA1Crw/gvW
 bwKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=QoJkqoov
Subject: [Buildroot] [PATCH v2 2/6] package/go: new subdirectory for go
 variants
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Move every go compiler-related packages into a newly created
package/go/ subdirectory.

This subdirectory structure moves the GO_VERSION variable into the
common package/go/go.mk file. In the next commits, host-go will be
turned into a virtual-package and the common GO_VERSION force the
providers to use the same Go compiler version.
Common variables to all providers are kept in package/go/go.mk and
package/go/Config.in.host.
Also, the subdirectory structure forces the evaluation of the common
GO_VERSION before the providers access it.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                           |  2 +-
 DEVELOPERS                                    |  3 --
 package/Config.in.host                        |  3 --
 package/go/Config.in.host                     |  4 ++
 .../go-bootstrap-stage1/Config.in.host        |  0
 .../go-bootstrap-stage1.hash                  |  0
 .../go-bootstrap-stage1.mk                    |  0
 .../go-bootstrap-stage2/Config.in.host        |  0
 .../go-bootstrap-stage2.hash                  |  0
 .../go-bootstrap-stage2.mk                    |  0
 .../go-bootstrap-stage3/Config.in.host        |  0
 .../go-bootstrap-stage3.hash                  |  0
 .../go-bootstrap-stage3.mk                    |  0
 package/go/go.mk                              | 40 +-------------
 ...explicit-option-for-crosscompilation.patch |  0
 ...ldvcs-false-when-building-go-bootstr.patch |  0
 package/go/{ => go}/go.hash                   |  0
 package/go/go/go.mk                           | 53 +++++++++++++++++++
 18 files changed, 60 insertions(+), 45 deletions(-)
 rename package/{ => go}/go-bootstrap-stage1/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.hash (100%)
 rename package/{ => go}/go-bootstrap-stage1/go-bootstrap-stage1.mk (100%)
 rename package/{ => go}/go-bootstrap-stage2/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.hash (100%)
 rename package/{ => go}/go-bootstrap-stage2/go-bootstrap-stage2.mk (100%)
 rename package/{ => go}/go-bootstrap-stage3/Config.in.host (100%)
 rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.hash (100%)
 rename package/{ => go}/go-bootstrap-stage3/go-bootstrap-stage3.mk (100%)
 rename package/go/{ => go}/0001-build.go-explicit-option-for-crosscompilation.patch (100%)
 rename package/go/{ => go}/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch (100%)
 rename package/go/{ => go}/go.hash (100%)
 create mode 100644 package/go/go/go.mk

diff --git a/.checkpackageignore b/.checkpackageignore
index 1b336ce7a3..b3eab26071 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -465,7 +465,7 @@ package/glorytun/0002-aegis256.c-fix-aarch64-build-with-uclibc.patch lib_patch.U
 package/gnu-efi/0001-Make.defaults-don-t-override-ARCH-when-cross-compili.patch lib_patch.Upstream
 package/gnupg/0001-build-Always-use-EXTERN_UNLESS_MAIN_MODULE-pattern.patch lib_patch.Upstream
 package/gnuplot/0001-configure-add-without-demo-option.patch lib_patch.Upstream
-package/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
+package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch lib_patch.Upstream
 package/gob2/0001-dont-include-from-prefix.patch lib_patch.Upstream
 package/gobject-introspection/0001-disable-tests.patch lib_patch.Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch lib_patch.Upstream
diff --git a/DEVELOPERS b/DEVELOPERS
index 039b803d50..51fc4962c9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -603,9 +603,6 @@ F:	package/docker-engine/
 F:	package/embiggen-disk/
 F:	package/fuse-overlayfs/
 F:	package/go/
-F:	package/go-bootstrap-stage1/
-F:	package/go-bootstrap-stage2/
-F:	package/go-bootstrap-stage3/
 F:	package/gocryptfs/
 F:	package/mbpfan/
 F:	package/moby-buildkit/
diff --git a/package/Config.in.host b/package/Config.in.host
index 9543a22ffc..2c481cfae7 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -44,9 +44,6 @@ menu "Host utilities"
 	source "package/genpart/Config.in.host"
 	source "package/gnupg/Config.in.host"
 	source "package/go/Config.in.host"
-	source "package/go-bootstrap-stage1/Config.in.host"
-	source "package/go-bootstrap-stage2/Config.in.host"
-	source "package/go-bootstrap-stage3/Config.in.host"
 	source "package/google-breakpad/Config.in.host"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imagemagick/Config.in.host"
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 0d89e875ad..7edf45850d 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -31,3 +31,7 @@ config BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_STAGE3_ARCH_SUPPORTS
+
+source "package/go/go-bootstrap-stage1/Config.in.host"
+source "package/go/go-bootstrap-stage2/Config.in.host"
+source "package/go/go-bootstrap-stage3/Config.in.host"
diff --git a/package/go-bootstrap-stage1/Config.in.host b/package/go/go-bootstrap-stage1/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage1/Config.in.host
rename to package/go/go-bootstrap-stage1/Config.in.host
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.hash b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.hash
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.hash
diff --git a/package/go-bootstrap-stage1/go-bootstrap-stage1.mk b/package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
similarity index 100%
rename from package/go-bootstrap-stage1/go-bootstrap-stage1.mk
rename to package/go/go-bootstrap-stage1/go-bootstrap-stage1.mk
diff --git a/package/go-bootstrap-stage2/Config.in.host b/package/go/go-bootstrap-stage2/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage2/Config.in.host
rename to package/go/go-bootstrap-stage2/Config.in.host
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.hash b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.hash
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.hash
diff --git a/package/go-bootstrap-stage2/go-bootstrap-stage2.mk b/package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
similarity index 100%
rename from package/go-bootstrap-stage2/go-bootstrap-stage2.mk
rename to package/go/go-bootstrap-stage2/go-bootstrap-stage2.mk
diff --git a/package/go-bootstrap-stage3/Config.in.host b/package/go/go-bootstrap-stage3/Config.in.host
similarity index 100%
rename from package/go-bootstrap-stage3/Config.in.host
rename to package/go/go-bootstrap-stage3/Config.in.host
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.hash b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
similarity index 100%
rename from package/go-bootstrap-stage3/go-bootstrap-stage3.hash
rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.hash
diff --git a/package/go-bootstrap-stage3/go-bootstrap-stage3.mk b/package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
similarity index 100%
rename from package/go-bootstrap-stage3/go-bootstrap-stage3.mk
rename to package/go/go-bootstrap-stage3/go-bootstrap-stage3.mk
diff --git a/package/go/go.mk b/package/go/go.mk
index 0e39ad9f8c..104a4a73fb 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -5,14 +5,7 @@
 ################################################################################

 GO_VERSION = 1.22.2
-GO_SITE = https://storage.googleapis.com/golang
-GO_SOURCE = go$(GO_VERSION).src.tar.gz

-GO_LICENSE = BSD-3-Clause
-GO_LICENSE_FILES = LICENSE
-GO_CPE_ID_VENDOR = golang
-
-HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
 HOST_GO_ROOT = $(HOST_DIR)/lib/go
@@ -96,15 +89,6 @@ else
 HOST_GO_CGO_ENABLED = 0
 endif

-HOST_GO_CROSS_ENV = \
-	CC_FOR_TARGET="$(TARGET_CC)" \
-	CXX_FOR_TARGET="$(TARGET_CXX)" \
-	GOOS="linux" \
-	GOARCH=$(GO_GOARCH) \
-	$(if $(GO_GO386),GO386=$(GO_GO386)) \
-	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
-	GO_ASSUME_CROSSCOMPILING=1
-
 else # !BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # host-go can still be used to build packages for the host. No need to set all
 # the arch stuff since we will not be cross-compiling.
@@ -123,27 +107,7 @@ HOST_GO_HOST_ENV = \
 	CGO_CXXFLAGS="$(HOST_CXXFLAGS)" \
 	CGO_LDFLAGS="$(HOST_LDFLAGS)"

-# The go build system is not compatible with ccache, so use
-# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
-HOST_GO_MAKE_ENV = \
-	GO111MODULE=off \
-	GOCACHE=$(HOST_GO_HOST_CACHE) \
-	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
-	GOROOT_FINAL=$(HOST_GO_ROOT) \
-	GOROOT="$(@D)" \
-	GOBIN="$(@D)/bin" \
-	GOOS=linux \
-	CC=$(HOSTCC_NOCCACHE) \
-	CXX=$(HOSTCXX_NOCCACHE) \
-	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
-	$(HOST_GO_CROSS_ENV)
-
-define HOST_GO_BUILD_CMDS
-	cd $(@D)/src && \
-		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
-endef
-
-define HOST_GO_INSTALL_CMDS
+define GO_BINARIES_INSTALL
 	$(INSTALL) -D -m 0755 $(@D)/bin/go $(HOST_GO_ROOT)/bin/go
 	$(INSTALL) -D -m 0755 $(@D)/bin/gofmt $(HOST_GO_ROOT)/bin/gofmt

@@ -165,4 +129,4 @@ define HOST_GO_INSTALL_CMDS
 	find $(HOST_GO_ROOT) -type f -exec touch -r $(@D)/bin/go {} \;
 endef

-$(eval $(host-generic-package))
+include $(sort $(wildcard package/go/*/*.mk))
diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
similarity index 100%
rename from package/go/0001-build.go-explicit-option-for-crosscompilation.patch
rename to package/go/go/0001-build.go-explicit-option-for-crosscompilation.patch
diff --git a/package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch b/package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
similarity index 100%
rename from package/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
rename to package/go/go/0002-cmd-dist-set-buildvcs-false-when-building-go-bootstr.patch
diff --git a/package/go/go.hash b/package/go/go/go.hash
similarity index 100%
rename from package/go/go.hash
rename to package/go/go/go.hash
diff --git a/package/go/go/go.mk b/package/go/go/go.mk
new file mode 100644
index 0000000000..c3c40922f4
--- /dev/null
+++ b/package/go/go/go.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# go
+#
+################################################################################
+
+GO_SITE = https://storage.googleapis.com/golang
+GO_SOURCE = go$(GO_VERSION).src.tar.gz
+
+GO_LICENSE = BSD-3-Clause
+GO_LICENSE_FILES = LICENSE
+GO_CPE_ID_VENDOR = golang
+
+HOST_GO_DEPENDENCIES = host-go-bootstrap-stage3
+
+ifeq ($(BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS),y)
+
+HOST_GO_CROSS_ENV = \
+	CC_FOR_TARGET="$(TARGET_CC)" \
+	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
+	GOARCH=$(GO_GOARCH) \
+	$(if $(GO_GO386),GO386=$(GO_GO386)) \
+	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
+	GO_ASSUME_CROSSCOMPILING=1
+
+endif
+
+# The go build system is not compatible with ccache, so use
+# HOSTCC_NOCCACHE.  See https://github.com/golang/go/issues/11685.
+HOST_GO_MAKE_ENV = \
+	GO111MODULE=off \
+	GOCACHE=$(HOST_GO_HOST_CACHE) \
+	GOROOT_BOOTSTRAP=$(HOST_GO_BOOTSTRAP_STAGE3_ROOT) \
+	GOROOT_FINAL=$(HOST_GO_ROOT) \
+	GOROOT="$(@D)" \
+	GOBIN="$(@D)/bin" \
+	GOOS=linux \
+	CC=$(HOSTCC_NOCCACHE) \
+	CXX=$(HOSTCXX_NOCCACHE) \
+	CGO_ENABLED=$(HOST_GO_CGO_ENABLED) \
+	$(HOST_GO_CROSS_ENV)
+
+define HOST_GO_BUILD_CMDS
+	cd $(@D)/src && \
+		$(HOST_GO_MAKE_ENV) ./make.bash $(if $(VERBOSE),-v)
+endef
+
+define HOST_GO_INSTALL_CMDS
+	$(GO_BINARIES_INSTALL)
+endef
+
+$(eval $(host-generic-package))
--
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
