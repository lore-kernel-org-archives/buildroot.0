Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE6B6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 21:31:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C07424D7;
	Wed, 25 May 2022 21:31:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y36muO1KBIqa; Wed, 25 May 2022 21:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2ED7424D4;
	Wed, 25 May 2022 21:31:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3FFE11BF356
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E812410BA
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 21:31:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3nZv2LGTRF_f for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 21:31:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FF72400CE
 for <buildroot@buildroot.org>; Wed, 25 May 2022 21:31:35 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id y1so56790pfr.6
 for <buildroot@buildroot.org>; Wed, 25 May 2022 14:31:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h6x4SROdZhwIcGk4/M6q8F9vMAa3QCFiVi4yhUZsRCU=;
 b=UQOhYL5Dub2mPw6S8l3+X2RCudVl5FdZiw3x+nD12Y3qPudz+e+wnycp0ojueznhui
 RkOyHJ+FjoihC9os8eKJJ9T7tz/1USLc367MbFCfztpFvSp1LsPgA/+Yd/Z38eeIWJMp
 iUmt3/819Nqun1t1VrCACkvpdLadCpkRZ4Dnm6kVxWFQphf6RfqM0cZzmDwiL41MtK/J
 EyAeIvIlwtDEYhTbA0BqIy0+UMw+xEVuT4TfOaEJOfr1Xu+rGzxfAGgSu9brImvlZhq3
 PAcfbk3kf/TrZpxqXO1+8vEXEJNvTNaHp9ntu/Qh9yivkp9AAEQ6eLp2uH2mlNtabWQ8
 TjeA==
X-Gm-Message-State: AOAM532UIMy2HvxRIf6TDcoasZqjEqu283VeQBcVCwSo1rjJTRXFdEgM
 vFaUGC/4UOpO9BbupA8XEr8LRtPMqX3htQ==
X-Google-Smtp-Source: ABdhPJxfwPm7CxPlD86SPe2ArJ7B2Mlh//6f5iPEixllm6fddwUAVYxzjv9C1tdGNDci/F3JgGItOw==
X-Received: by 2002:a63:4c2:0:b0:3f5:d1f7:f492 with SMTP id
 185-20020a6304c2000000b003f5d1f7f492mr29953644pge.392.1653514294113; 
 Wed, 25 May 2022 14:31:34 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 u8-20020a170903124800b0016196bd15f4sm10030017plh.15.2022.05.25.14.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 May 2022 14:31:33 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 May 2022 14:31:31 -0700
Message-Id: <20220525213131.154515-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/go: update patch for
 go-bootstrap fix
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add a patch to fix a build failure due to the target GOARCH being used while
bootstrapping the Go compiler with the go-bootstrap compiler.

Uses the host architecture variable instead.

This commit updates the patch with improvements from the upstream PR.

PR: https://github.com/golang/go/pull/52362

Signed-off-by: Christian Stewart <christian@paral.in>

---

v1 -> v2:

 - simplify patch according to upstream comments
 - update commit message in patch

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...explicit-option-for-crosscompilation.patch |   2 +-
 ...set-environment-before-generating-bu.patch | 119 ------------------
 ...use-gohostarch-for-ssa-rewrite-check.patch |  93 ++++++++++++++
 3 files changed, 94 insertions(+), 120 deletions(-)
 delete mode 100644 package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
 create mode 100644 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch

diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
index 3a9b47474c..11e265a2ca 100644
--- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -1,4 +1,4 @@
-From 335c6245674088de616324398137416c7a1cbe8f Mon Sep 17 00:00:00 2001
+From a8f2a2b9ade01a099a05a2f4ea47e9a1de85df14 Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo@amarulasolutions.com>
 Date: Tue, 8 May 2018 16:08:44 +0200
 Subject: [PATCH] build.go: explicit option for crosscompilation
diff --git a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
deleted file mode 100644
index 5a6b694857..0000000000
--- a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 4d43f7c4dd06e6f62be446996019d4505af54764 Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@paral.in>
-Date: Thu, 14 Apr 2022 13:34:26 -0700
-Subject: [PATCH] build: bootstrap: set environment before generating buildcfg
-
-The GOOS and GOARCH environment variables should be unset before calling
-mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
-
-Building Go toolchain1 using go-1.4-bootstrap-20171003.
-src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
-invalid operation: y << x (shift count type int64, must be unsigned integer)
-
-There is a build issue with go1.4 with the riscv64 code: however, why is the
-riscv64 code being compiled at all?
-
-GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
-
-[Buildroot]: submitted to upstream:
-
- - https://github.com/golang/go/issues/52583
- - https://go-review.googlesource.com/c/go/+/400376
- - GitHub-Pull-Request: golang/go#52362
-
-Signed-off-by: Christian Stewart <christian@paral.in>
----
- src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
- 1 file changed, 29 insertions(+), 27 deletions(-)
-
-diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
-index f1f3d50b6f..dabf01cf84 100644
---- a/src/cmd/dist/buildtool.go
-+++ b/src/cmd/dist/buildtool.go
-@@ -116,9 +116,6 @@ func bootstrapBuildTools() {
- 	}
- 	xprintf("Building Go toolchain1 using %s.\n", goroot_bootstrap)
- 
--	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
--	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
--
- 	// Use $GOROOT/pkg/bootstrap as the bootstrap workspace root.
- 	// We use a subdirectory of $GOROOT/pkg because that's the
- 	// space within $GOROOT where we store all generated objects.
-@@ -130,6 +127,34 @@ func bootstrapBuildTools() {
- 	base := pathf("%s/src/bootstrap", workspace)
- 	xmkdirall(base)
- 
-+	// Set up environment for invoking Go 1.4 go command.
-+	// GOROOT points at Go 1.4 GOROOT,
-+	// GOPATH points at our bootstrap workspace,
-+	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
-+	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
-+	// so that Go 1.4 builds whatever kind of binary it knows how to build.
-+	// Restore GOROOT, GOPATH, and GOBIN when done.
-+	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
-+	// because setup will take care of those when bootstrapBuildTools returns.
-+
-+	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
-+	os.Setenv("GOROOT", goroot_bootstrap)
-+
-+	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
-+	os.Setenv("GOPATH", workspace)
-+
-+	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
-+	os.Setenv("GOBIN", "")
-+
-+	os.Setenv("GOOS", "")
-+	os.Setenv("GOHOSTOS", "")
-+	os.Setenv("GOARCH", "")
-+	os.Setenv("GOHOSTARCH", "")
-+
-+	// Create the build config files.
-+	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
-+	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
-+
- 	// Copy source code into $GOROOT/pkg/bootstrap and rewrite import paths.
- 	writefile("module bootstrap\n", pathf("%s/%s", base, "go.mod"), 0)
- 	for _, dir := range bootstrapDirs {
-@@ -176,30 +201,6 @@ func bootstrapBuildTools() {
- 		})
- 	}
- 
--	// Set up environment for invoking Go 1.4 go command.
--	// GOROOT points at Go 1.4 GOROOT,
--	// GOPATH points at our bootstrap workspace,
--	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
--	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
--	// so that Go 1.4 builds whatever kind of binary it knows how to build.
--	// Restore GOROOT, GOPATH, and GOBIN when done.
--	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
--	// because setup will take care of those when bootstrapBuildTools returns.
--
--	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
--	os.Setenv("GOROOT", goroot_bootstrap)
--
--	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
--	os.Setenv("GOPATH", workspace)
--
--	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
--	os.Setenv("GOBIN", "")
--
--	os.Setenv("GOOS", "")
--	os.Setenv("GOHOSTOS", "")
--	os.Setenv("GOARCH", "")
--	os.Setenv("GOHOSTARCH", "")
--
- 	// Run Go 1.4 to build binaries. Use -gcflags=-l to disable inlining to
- 	// workaround bugs in Go 1.4's compiler. See discussion thread:
- 	// https://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ
-@@ -221,6 +222,7 @@ func bootstrapBuildTools() {
- 		cmd = append(cmd, "-toolexec="+tool)
- 	}
- 	cmd = append(cmd, "bootstrap/cmd/...")
-+
- 	run(base, ShowOutput|CheckExit, cmd...)
- 
- 	// Copy binaries into tool binary directory.
--- 
-2.35.1
-
diff --git a/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch b/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
new file mode 100644
index 0000000000..e01cdf1e4c
--- /dev/null
+++ b/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
@@ -0,0 +1,93 @@
+From 6d862f5ac181b8a003480ed80e94c79cf4be51bb Mon Sep 17 00:00:00 2001
+From: Christian Stewart <christian@paral.in>
+Date: Thu, 14 Apr 2022 13:34:26 -0700
+Subject: [PATCH] cmd/dist: use gohostarch for ssa rewrite check
+
+Fix a build failure when bootstrapping the Go compiler with go-bootstrap 1.4
+while the environment contains GOARCH=riscv64.
+
+Building Go toolchain1 using go-1.4-bootstrap-20171003.
+src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
+invalid operation: y << x (shift count type int64, must be unsigned integer)
+
+This is because:
+
+ - buildtool.go:198: calls bootstrapRewriteFile(src)
+ - bootstrapRewriteFile: buildtool.go:283 calls:
+ - isUnneededSSARewriteFile: checks os.Getenv("GOARCH")
+ - isUnneededSSARewriteFile: returns "", false
+ - bootstrapRewriteFile: calls bootstrapFixImports
+ - boostrapFixImports: generates code go1.4 cannot compile
+
+Instead of checking "GOARCH" in the environment, use the gohostarch variable.
+
+---
+
+[Buildroot]: submitted to upstream:
+
+- https://github.com/golang/go/issues/52583
+- https://go-review.googlesource.com/c/go/+/400376
+- GitHub-Pull-Request: golang/go#52362
+
+Signed-off-by: Christian Stewart <christian@paral.in>
+---
+ src/cmd/dist/buildtool.go | 16 ++++++----------
+ 1 file changed, 6 insertions(+), 10 deletions(-)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index f1f3d50b6f..947da115e3 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -16,7 +16,6 @@ import (
+ 	"os"
+ 	"path/filepath"
+ 	"regexp"
+-	"runtime"
+ 	"strings"
+ )
+ 
+@@ -243,11 +242,11 @@ var ssaRewriteFileSubstring = filepath.FromSlash("src/cmd/compile/internal/ssa/r
+ 
+ // isUnneededSSARewriteFile reports whether srcFile is a
+ // src/cmd/compile/internal/ssa/rewriteARCHNAME.go file for an
+-// architecture that isn't for the current runtime.GOARCH.
++// architecture that isn't for the given GOARCH.
+ //
+ // When unneeded is true archCaps is the rewrite base filename without
+ // the "rewrite" prefix or ".go" suffix: AMD64, 386, ARM, ARM64, etc.
+-func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
++func isUnneededSSARewriteFile(srcFile, goArch string) (archCaps string, unneeded bool) {
+ 	if !strings.Contains(srcFile, ssaRewriteFileSubstring) {
+ 		return "", false
+ 	}
+@@ -262,13 +261,10 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
+ 	archCaps = fileArch
+ 	fileArch = strings.ToLower(fileArch)
+ 	fileArch = strings.TrimSuffix(fileArch, "splitload")
+-	if fileArch == os.Getenv("GOHOSTARCH") {
++	if fileArch == goArch {
+ 		return "", false
+ 	}
+-	if fileArch == strings.TrimSuffix(runtime.GOARCH, "le") {
+-		return "", false
+-	}
+-	if fileArch == strings.TrimSuffix(os.Getenv("GOARCH"), "le") {
++	if fileArch == strings.TrimSuffix(goArch, "le") {
+ 		return "", false
+ 	}
+ 	return archCaps, true
+@@ -277,9 +273,9 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
+ func bootstrapRewriteFile(srcFile string) string {
+ 	// During bootstrap, generate dummy rewrite files for
+ 	// irrelevant architectures. We only need to build a bootstrap
+-	// binary that works for the current runtime.GOARCH.
++	// binary that works for the current gohostarch.
+ 	// This saves 6+ seconds of bootstrap.
+-	if archCaps, ok := isUnneededSSARewriteFile(srcFile); ok {
++	if archCaps, ok := isUnneededSSARewriteFile(srcFile, gohostarch); ok {
+ 		return fmt.Sprintf(`// Code generated by go tool dist; DO NOT EDIT.
+ 
+ package ssa
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
