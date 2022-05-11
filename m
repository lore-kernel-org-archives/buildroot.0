Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13BDC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 01:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70AA640B3F;
	Wed, 11 May 2022 01:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dGfuCz4AzilA; Wed, 11 May 2022 01:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A76B4056F;
	Wed, 11 May 2022 01:08:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 789431BF2C4
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 01:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6627F4056F
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 01:08:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGt5aJedSyuO for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 01:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4DA8E4023B
 for <buildroot@buildroot.org>; Wed, 11 May 2022 01:08:53 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 7so415751pga.12
 for <buildroot@buildroot.org>; Tue, 10 May 2022 18:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dEc9pjGN442gPVdyCljQrzzNjSRjRcFShgyLlQ+Jd8s=;
 b=22qnaI8fiAuLKfCkkReIePOJIX7iOOZw19dWZ61n/J47vRz6Iz44IDiPOM9WsK5IV3
 35VSgUun33gbqfGB0H7Av2TtKFFL9jsohHJg/T7UjbSzU5DStDa8NDsGDOCBkpQESDGj
 RtDv7nJQGG/F+b8ih2mpWQzs4fCSMXdzeN6tY+YtpEMdPBwLQHIfhw0OzvqPfkimsIoU
 2Sst0g0BLLkI4BHziacfJZeupqhHEVLfgKotfauidIxPp337jtsQxQq37Fdkc7aSY2Pa
 LbiALWrV3DEPI5BrjCPfk8qVz2ciXEYsybUpquGaNRV3pqLi52xtYWGMT6qIJHU1cjr2
 Og6Q==
X-Gm-Message-State: AOAM531EDFY0hwd3WyyGCVs90RscRrSwABFQtSrtNwN9t9SSRz6ARZtm
 DhbzfVohnhSWzaZXdpxWs+SxF3FDwwX7Ow==
X-Google-Smtp-Source: ABdhPJzwFe+/JdOxfOOI47VGB5mi+v5ThDQtJuRl1V4eG6JCF4S51tfxC+3fMFhNZzLpPg9+IHdX8Q==
X-Received: by 2002:a05:6a00:1914:b0:50e:128e:ef42 with SMTP id
 y20-20020a056a00191400b0050e128eef42mr22629375pfi.65.1652231332063; 
 Tue, 10 May 2022 18:08:52 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 s3-20020a170902c64300b0015e8d4eb2a9sm235686pls.243.2022.05.10.18.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 18:08:51 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 18:08:45 -0700
Message-Id: <20220511010845.158093-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/go: add support for riscv64
 architecture
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anisse Astier <anisse@astier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable the supported "riscv64" GOARCH.

Add a patch to fix a build failure due to GOARCH leaking into the calls to the
go-bootstrap compiler. Unsets the GOARCH before calling go-bootstrap.

PR: https://github.com/golang/go/pull/52362

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - fixed build error with go-bootstrap

v2 -> v3:

 - patch: add a signed-off-by and upstream link
 - go: does not support riscv-32bit
 - go: check for required riscv ISA extensions

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...explicit-option-for-crosscompilation.patch |   8 +-
 ...set-environment-before-generating-bu.patch | 119 ++++++++++++++++++
 package/go/Config.in.host                     |   8 +-
 package/go/go.mk                              |   2 +
 4 files changed, 132 insertions(+), 5 deletions(-)
 create mode 100644 package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch

diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
index f76c5b1d03..3a9b47474c 100644
--- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -1,4 +1,4 @@
-From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001
+From 335c6245674088de616324398137416c7a1cbe8f Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo@amarulasolutions.com>
 Date: Tue, 8 May 2018 16:08:44 +0200
 Subject: [PATCH] build.go: explicit option for crosscompilation
@@ -17,10 +17,10 @@ Signed-off-by: Anisse Astier <anisse@astier.eu>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 99d1db5..eb4097f 100644
+index f99f1f4e43..08a9f24f59 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -252,12 +252,13 @@ func xinit() {
+@@ -286,12 +286,13 @@ func xinit() {
  // $CC_FOR_goos_goarch, if set, applies only to goos/goarch.
  func compilerEnv(envName, def string) map[string]string {
  	m := map[string]string{"": def}
@@ -36,5 +36,5 @@ index 99d1db5..eb4097f 100644
  		}
  		m[""] = env
 -- 
-2.7.4
+2.35.1
 
diff --git a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
new file mode 100644
index 0000000000..5a6b694857
--- /dev/null
+++ b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
@@ -0,0 +1,119 @@
+From 4d43f7c4dd06e6f62be446996019d4505af54764 Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 14 Apr 2022 13:34:26 -0700
+Subject: [PATCH] build: bootstrap: set environment before generating buildcfg
+
+The GOOS and GOARCH environment variables should be unset before calling
+mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
+
+Building Go toolchain1 using go-1.4-bootstrap-20171003.
+src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
+invalid operation: y << x (shift count type int64, must be unsigned integer)
+
+There is a build issue with go1.4 with the riscv64 code: however, why is the
+riscv64 code being compiled at all?
+
+GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
+
+[Buildroot]: submitted to upstream:
+
+ - https://github.com/golang/go/issues/52583
+ - https://go-review.googlesource.com/c/go/+/400376
+ - GitHub-Pull-Request: golang/go#52362
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
+ 1 file changed, 29 insertions(+), 27 deletions(-)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index f1f3d50b6f..dabf01cf84 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -116,9 +116,6 @@ func bootstrapBuildTools() {
+ 	}
+ 	xprintf("Building Go toolchain1 using %s.\n", goroot_bootstrap)
+ 
+-	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
+-	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
+-
+ 	// Use $GOROOT/pkg/bootstrap as the bootstrap workspace root.
+ 	// We use a subdirectory of $GOROOT/pkg because that's the
+ 	// space within $GOROOT where we store all generated objects.
+@@ -130,6 +127,34 @@ func bootstrapBuildTools() {
+ 	base := pathf("%s/src/bootstrap", workspace)
+ 	xmkdirall(base)
+ 
++	// Set up environment for invoking Go 1.4 go command.
++	// GOROOT points at Go 1.4 GOROOT,
++	// GOPATH points at our bootstrap workspace,
++	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
++	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
++	// so that Go 1.4 builds whatever kind of binary it knows how to build.
++	// Restore GOROOT, GOPATH, and GOBIN when done.
++	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
++	// because setup will take care of those when bootstrapBuildTools returns.
++
++	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
++	os.Setenv("GOROOT", goroot_bootstrap)
++
++	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
++	os.Setenv("GOPATH", workspace)
++
++	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
++	os.Setenv("GOBIN", "")
++
++	os.Setenv("GOOS", "")
++	os.Setenv("GOHOSTOS", "")
++	os.Setenv("GOARCH", "")
++	os.Setenv("GOHOSTARCH", "")
++
++	// Create the build config files.
++	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
++	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
++
+ 	// Copy source code into $GOROOT/pkg/bootstrap and rewrite import paths.
+ 	writefile("module bootstrap\n", pathf("%s/%s", base, "go.mod"), 0)
+ 	for _, dir := range bootstrapDirs {
+@@ -176,30 +201,6 @@ func bootstrapBuildTools() {
+ 		})
+ 	}
+ 
+-	// Set up environment for invoking Go 1.4 go command.
+-	// GOROOT points at Go 1.4 GOROOT,
+-	// GOPATH points at our bootstrap workspace,
+-	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
+-	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
+-	// so that Go 1.4 builds whatever kind of binary it knows how to build.
+-	// Restore GOROOT, GOPATH, and GOBIN when done.
+-	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
+-	// because setup will take care of those when bootstrapBuildTools returns.
+-
+-	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
+-	os.Setenv("GOROOT", goroot_bootstrap)
+-
+-	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
+-	os.Setenv("GOPATH", workspace)
+-
+-	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
+-	os.Setenv("GOBIN", "")
+-
+-	os.Setenv("GOOS", "")
+-	os.Setenv("GOHOSTOS", "")
+-	os.Setenv("GOARCH", "")
+-	os.Setenv("GOHOSTARCH", "")
+-
+ 	// Run Go 1.4 to build binaries. Use -gcflags=-l to disable inlining to
+ 	// workaround bugs in Go 1.4's compiler. See discussion thread:
+ 	// https://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ
+@@ -221,6 +222,7 @@ func bootstrapBuildTools() {
+ 		cmd = append(cmd, "-toolexec="+tool)
+ 	}
+ 	cmd = append(cmd, "bootstrap/cmd/...")
++
+ 	run(base, ShowOutput|CheckExit, cmd...)
+ 
+ 	// Copy binaries into tool binary directory.
+-- 
+2.35.1
+
diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index e82ab6e81a..ded02d3b3a 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -5,10 +5,16 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el || BR2_s390x
+		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
+	# Go doesn't support Risc-v 32-bit.
+	depends on !BR2_RISCV_32
+	# Go requires the following Risc-v General (G) features:
+	depends on !BR2_riscv || (BR2_RISCV_ISA_RVI && \
+		BR2_RISCV_ISA_RVM && BR2_RISCV_ISA_RVA && \
+		BR2_RISCV_ISA_RVF && BR2_RISCV_ISA_RVD)
 
 config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	bool
diff --git a/package/go/go.mk b/package/go/go.mk
index cf90ac8765..f4e33fd2c4 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -63,6 +63,8 @@ else ifeq ($(BR2_mips64),y)
 GO_GOARCH = mips64
 else ifeq ($(BR2_mips64el),y)
 GO_GOARCH = mips64le
+else ifeq ($(BR2_riscv),y)
+GO_GOARCH = riscv64
 else ifeq ($(BR2_s390x),y)
 GO_GOARCH = s390x
 endif
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
