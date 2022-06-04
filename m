Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1211C43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 11:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69253405A8;
	Sat,  4 Jun 2022 11:15:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dumaUkplCW68; Sat,  4 Jun 2022 11:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23CE540157;
	Sat,  4 Jun 2022 11:15:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AA9551BF962
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 994D741C96
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ubd6i6jb_EkE for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 11:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 710F7419E3
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 11:15:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e086:bc2a:8b9d:c22])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 465C65FFA6;
 Sat,  4 Jun 2022 13:15:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654341341;
 bh=wvwonxzXU64JSLlbgVuTwUehD2i1icsrq4WKnHyO7JI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jf3ydPwHJT978zMXZmimiLrqqVe8dAtv1t0PBVtGe/1Goj4Fb/Rk2lEY0lExnhF1M
 sG/LsyeNL0wXQAl2VRIWDolaebrubgfyzzWAhGckakXNFJ8Vxl/vjHKkFJ2eCHyGaH
 WAhVfxcW58fArSjGDkqJD6BTgjZKZJXPnS6I1lS7B79QmCDCcR3jaFZrWAWRSz4vsL
 78QHAGxJ5O0cUYfw7f7XETLK+kHe8LQkzbPWIleeveISVvNjgkXAOhuhDwubuV7G5F
 ULte+jUdGhjZcPTv9Sfhtivx51M4gJ/07aFKMaLKfFxzZmXUm/zwRFtcFwVg4XrR1Y
 vDwgR0/skoYVw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Jun 2022 13:15:38 +0200
Date: Sat, 4 Jun 2022 13:15:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220604111537.GI427639@scaer>
References: <20220602211818.452956-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220602211818.452956-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v3 1/1] package/go: update patch for
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-06-02 14:18 -0700, Christian Stewart via buildroot spake thusly:
> Add a patch to fix a build failure due to the target GOARCH being used while
> bootstrapping the Go compiler with the go-bootstrap compiler.
> 
> Uses the host architecture variable instead.
> 
> This commit updates the patch with improvements from the upstream PR.
> 
> PR: https://github.com/golang/go/pull/52362
> 
> Signed-off-by: Christian Stewart <christian@paral.in>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> v1 -> v2:
> 
>  - simplify patch according to upstream comments
>  - update commit message in patch
> 
> v2 -> v3:
> 
>  - upstream has accepted & merged patch
>  - update commit with upstream patch information
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  ...set-environment-before-generating-bu.patch | 119 ------------------
>  ...use-gohostarch-for-ssa-rewrite-check.patch |  95 ++++++++++++++
>  2 files changed, 95 insertions(+), 119 deletions(-)
>  delete mode 100644 package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
>  create mode 100644 package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
> 
> diff --git a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> deleted file mode 100644
> index 5a6b694857..0000000000
> --- a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
> +++ /dev/null
> @@ -1,119 +0,0 @@
> -From 4d43f7c4dd06e6f62be446996019d4505af54764 Mon Sep 17 00:00:00 2001
> -From: Christian Stewart <christian@paral.in>
> -Date: Thu, 14 Apr 2022 13:34:26 -0700
> -Subject: [PATCH] build: bootstrap: set environment before generating buildcfg
> -
> -The GOOS and GOARCH environment variables should be unset before calling
> -mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
> -
> -Building Go toolchain1 using go-1.4-bootstrap-20171003.
> -src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
> -invalid operation: y << x (shift count type int64, must be unsigned integer)
> -
> -There is a build issue with go1.4 with the riscv64 code: however, why is the
> -riscv64 code being compiled at all?
> -
> -GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
> -
> -[Buildroot]: submitted to upstream:
> -
> - - https://github.com/golang/go/issues/52583
> - - https://go-review.googlesource.com/c/go/+/400376
> - - GitHub-Pull-Request: golang/go#52362
> -
> -Signed-off-by: Christian Stewart <christian@paral.in>
> ----
> - src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
> - 1 file changed, 29 insertions(+), 27 deletions(-)
> -
> -diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> -index f1f3d50b6f..dabf01cf84 100644
> ---- a/src/cmd/dist/buildtool.go
> -+++ b/src/cmd/dist/buildtool.go
> -@@ -116,9 +116,6 @@ func bootstrapBuildTools() {
> - 	}
> - 	xprintf("Building Go toolchain1 using %s.\n", goroot_bootstrap)
> - 
> --	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
> --	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
> --
> - 	// Use $GOROOT/pkg/bootstrap as the bootstrap workspace root.
> - 	// We use a subdirectory of $GOROOT/pkg because that's the
> - 	// space within $GOROOT where we store all generated objects.
> -@@ -130,6 +127,34 @@ func bootstrapBuildTools() {
> - 	base := pathf("%s/src/bootstrap", workspace)
> - 	xmkdirall(base)
> - 
> -+	// Set up environment for invoking Go 1.4 go command.
> -+	// GOROOT points at Go 1.4 GOROOT,
> -+	// GOPATH points at our bootstrap workspace,
> -+	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
> -+	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
> -+	// so that Go 1.4 builds whatever kind of binary it knows how to build.
> -+	// Restore GOROOT, GOPATH, and GOBIN when done.
> -+	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
> -+	// because setup will take care of those when bootstrapBuildTools returns.
> -+
> -+	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
> -+	os.Setenv("GOROOT", goroot_bootstrap)
> -+
> -+	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
> -+	os.Setenv("GOPATH", workspace)
> -+
> -+	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
> -+	os.Setenv("GOBIN", "")
> -+
> -+	os.Setenv("GOOS", "")
> -+	os.Setenv("GOHOSTOS", "")
> -+	os.Setenv("GOARCH", "")
> -+	os.Setenv("GOHOSTARCH", "")
> -+
> -+	// Create the build config files.
> -+	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
> -+	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
> -+
> - 	// Copy source code into $GOROOT/pkg/bootstrap and rewrite import paths.
> - 	writefile("module bootstrap\n", pathf("%s/%s", base, "go.mod"), 0)
> - 	for _, dir := range bootstrapDirs {
> -@@ -176,30 +201,6 @@ func bootstrapBuildTools() {
> - 		})
> - 	}
> - 
> --	// Set up environment for invoking Go 1.4 go command.
> --	// GOROOT points at Go 1.4 GOROOT,
> --	// GOPATH points at our bootstrap workspace,
> --	// GOBIN is empty, so that binaries are installed to GOPATH/bin,
> --	// and GOOS, GOHOSTOS, GOARCH, and GOHOSTOS are empty,
> --	// so that Go 1.4 builds whatever kind of binary it knows how to build.
> --	// Restore GOROOT, GOPATH, and GOBIN when done.
> --	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
> --	// because setup will take care of those when bootstrapBuildTools returns.
> --
> --	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
> --	os.Setenv("GOROOT", goroot_bootstrap)
> --
> --	defer os.Setenv("GOPATH", os.Getenv("GOPATH"))
> --	os.Setenv("GOPATH", workspace)
> --
> --	defer os.Setenv("GOBIN", os.Getenv("GOBIN"))
> --	os.Setenv("GOBIN", "")
> --
> --	os.Setenv("GOOS", "")
> --	os.Setenv("GOHOSTOS", "")
> --	os.Setenv("GOARCH", "")
> --	os.Setenv("GOHOSTARCH", "")
> --
> - 	// Run Go 1.4 to build binaries. Use -gcflags=-l to disable inlining to
> - 	// workaround bugs in Go 1.4's compiler. See discussion thread:
> - 	// https://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ
> -@@ -221,6 +222,7 @@ func bootstrapBuildTools() {
> - 		cmd = append(cmd, "-toolexec="+tool)
> - 	}
> - 	cmd = append(cmd, "bootstrap/cmd/...")
> -+
> - 	run(base, ShowOutput|CheckExit, cmd...)
> - 
> - 	// Copy binaries into tool binary directory.
> --- 
> -2.35.1
> -
> diff --git a/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch b/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
> new file mode 100644
> index 0000000000..2346208640
> --- /dev/null
> +++ b/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
> @@ -0,0 +1,95 @@
> +From 38d841a18ab0bcb63554fed6b38012e504599891 Mon Sep 17 00:00:00 2001
> +From: Christian Stewart <christian@paral.in>
> +Date: Wed, 1 Jun 2022 20:52:12 +0000
> +Subject: [PATCH] cmd/dist: use gohostarch for ssa rewrite check
> +
> +Fix a build failure when bootstrapping the Go compiler with go-bootstrap 1.4
> +while the environment contains GOARCH=riscv64.
> +
> +Building Go toolchain1 using go-1.4-bootstrap-20171003.
> +src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
> +invalid operation: y << x (shift count type int64, must be unsigned integer)
> +
> +This is because:
> +
> + - buildtool.go:198: calls bootstrapRewriteFile(src)
> + - bootstrapRewriteFile: buildtool.go:283 calls:
> + - isUnneededSSARewriteFile: checks os.Getenv("GOARCH")
> + - isUnneededSSARewriteFile: returns "", false
> + - bootstrapRewriteFile: calls bootstrapFixImports
> + - boostrapFixImports: generates code go1.4 cannot compile
> +
> +Instead of checking "GOARCH" in the environment, use the gohostarch variable.
> +
> +Change-Id: Ie9c190498555c4068461fead6278a62e924062c6
> +GitHub-Last-Rev: 300d7a7fea0a67c696970fd271e2ce709674a658
> +GitHub-Pull-Request: golang/go#52362
> +Reviewed-on: https://go-review.googlesource.com/c/go/+/400376
> +Reviewed-by: Bryan Mills <bcmills@google.com>
> +TryBot-Result: Gopher Robot <gobot@golang.org>
> +Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
> +Auto-Submit: Bryan Mills <bcmills@google.com>
> +Run-TryBot: Bryan Mills <bcmills@google.com>
> +Reviewed-by: Joel Sing <joel@sing.id.au>
> +Run-TryBot: Joel Sing <joel@sing.id.au>
> +---
> + src/cmd/dist/buildtool.go | 16 ++++++----------
> + 1 file changed, 6 insertions(+), 10 deletions(-)
> +
> +diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
> +index 036f8c52fa..2d8ace52d8 100644
> +--- a/src/cmd/dist/buildtool.go
> ++++ b/src/cmd/dist/buildtool.go
> +@@ -16,7 +16,6 @@ import (
> + 	"os"
> + 	"path/filepath"
> + 	"regexp"
> +-	"runtime"
> + 	"strings"
> + )
> + 
> +@@ -239,11 +238,11 @@ var ssaRewriteFileSubstring = filepath.FromSlash("src/cmd/compile/internal/ssa/r
> + 
> + // isUnneededSSARewriteFile reports whether srcFile is a
> + // src/cmd/compile/internal/ssa/rewriteARCHNAME.go file for an
> +-// architecture that isn't for the current runtime.GOARCH.
> ++// architecture that isn't for the given GOARCH.
> + //
> + // When unneeded is true archCaps is the rewrite base filename without
> + // the "rewrite" prefix or ".go" suffix: AMD64, 386, ARM, ARM64, etc.
> +-func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
> ++func isUnneededSSARewriteFile(srcFile, goArch string) (archCaps string, unneeded bool) {
> + 	if !strings.Contains(srcFile, ssaRewriteFileSubstring) {
> + 		return "", false
> + 	}
> +@@ -258,13 +257,10 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
> + 	archCaps = fileArch
> + 	fileArch = strings.ToLower(fileArch)
> + 	fileArch = strings.TrimSuffix(fileArch, "splitload")
> +-	if fileArch == os.Getenv("GOHOSTARCH") {
> ++	if fileArch == goArch {
> + 		return "", false
> + 	}
> +-	if fileArch == strings.TrimSuffix(runtime.GOARCH, "le") {
> +-		return "", false
> +-	}
> +-	if fileArch == strings.TrimSuffix(os.Getenv("GOARCH"), "le") {
> ++	if fileArch == strings.TrimSuffix(goArch, "le") {
> + 		return "", false
> + 	}
> + 	return archCaps, true
> +@@ -273,9 +269,9 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
> + func bootstrapRewriteFile(srcFile string) string {
> + 	// During bootstrap, generate dummy rewrite files for
> + 	// irrelevant architectures. We only need to build a bootstrap
> +-	// binary that works for the current runtime.GOARCH.
> ++	// binary that works for the current gohostarch.
> + 	// This saves 6+ seconds of bootstrap.
> +-	if archCaps, ok := isUnneededSSARewriteFile(srcFile); ok {
> ++	if archCaps, ok := isUnneededSSARewriteFile(srcFile, gohostarch); ok {
> + 		return fmt.Sprintf(`// Code generated by go tool dist; DO NOT EDIT.
> + 
> + package ssa
> +-- 
> +2.35.1
> +
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
