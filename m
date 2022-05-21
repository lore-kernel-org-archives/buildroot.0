Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB75EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 03:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1B1642697;
	Sat, 21 May 2022 03:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vk6z_YlLgpVP; Sat, 21 May 2022 03:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CA0241B8F;
	Sat, 21 May 2022 03:45:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A5681BF59A
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 03:45:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC8E360AF2
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 03:45:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P4jpf3taP55i for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 03:45:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE15F60A9F
 for <buildroot@buildroot.org>; Sat, 21 May 2022 03:45:01 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id u15so9170401pfi.3
 for <buildroot@buildroot.org>; Fri, 20 May 2022 20:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HWdxnlVZ47y9tnDzEWFtXnP+e+lmxK/N5n1oDWBSDSc=;
 b=eBoeYphsi9w11Nr+OJOPUiJGw3NakSfkI/HSKFF0Q7TQXtjypy0M/kdY0UeT9zABdP
 uLJVaC2RgQjVC2vdpgZHCorBLRq1QOXbCutJFrFdD18LQ9s7P1t7ScrIznbZb+ceeK1y
 C4m6ryMOUkW4EtlfVpYcNIaaqgdjG6kH8qdECmjMZeqL3gRbig7Fv48znGPlBlRSfzZ0
 hdaM5eBx8CYlPAmljs7oxFE+mC96VQr5RFJlSum3CNzYx4xDJ8zX6Wp4vLxG/vjRLwf/
 Xc5vN0qy7qVULwrJavqabxfUmp9PlCcrFUVxNh4j7c/xU3DEHTHPfiEdS8gDvuhxYSHM
 oaoQ==
X-Gm-Message-State: AOAM533kzoOuOhk1S2oA0lNnh1xR21XdRlLj2Sv69vnAPG45wXyT0EXT
 59HZrPeSJu5izNO34LfoClqLXoVY1+7QJg==
X-Google-Smtp-Source: ABdhPJwFX8Y6uHOX+kLyOvbHHqbidKR+vlRCQaV67TJnELxvcIkMSKSFuU/h/cYwbwPx2IjG5VBN6A==
X-Received: by 2002:a05:6a00:1490:b0:50d:f304:61ea with SMTP id
 v16-20020a056a00149000b0050df30461eamr13261045pfu.73.1653104700490; 
 Fri, 20 May 2022 20:45:00 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 w5-20020a170902e88500b0015e8d4eb201sm476044plg.75.2022.05.20.20.44.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 20:44:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 20 May 2022 20:44:55 -0700
Message-Id: <20220521034455.470070-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: update patch for go-bootstrap
 fix
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

Add a patch to fix a build failure due to GOARCH leaking into the calls to the
go-bootstrap compiler. Unsets the GOARCH before calling go-bootstrap.

This commit updates the patch with improvements from the upstream PR.

PR: https://github.com/golang/go/pull/52362

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...explicit-option-for-crosscompilation.patch |  2 +-
 ...nset-goarch-when-rewriting-compiler.patch} | 65 +++++++++----------
 2 files changed, 31 insertions(+), 36 deletions(-)
 rename package/go/{0002-build-bootstrap-set-environment-before-generating-bu.patch => 0002-build-bootstrap-unset-goarch-when-rewriting-compiler.patch} (64%)

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
diff --git a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch b/package/go/0002-build-bootstrap-unset-goarch-when-rewriting-compiler.patch
similarity index 64%
rename from package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
rename to package/go/0002-build-bootstrap-unset-goarch-when-rewriting-compiler.patch
index 5a6b694857..375699b97e 100644
--- a/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
+++ b/package/go/0002-build-bootstrap-unset-goarch-when-rewriting-compiler.patch
@@ -1,46 +1,52 @@
-From 4d43f7c4dd06e6f62be446996019d4505af54764 Mon Sep 17 00:00:00 2001
+From 451e55eef1c5958388bc782683aba423448ab9bb Mon Sep 17 00:00:00 2001
 From: Christian Stewart <christian@paral.in>
 Date: Thu, 14 Apr 2022 13:34:26 -0700
-Subject: [PATCH] build: bootstrap: set environment before generating buildcfg
+Subject: [PATCH] build: bootstrap: unset goarch when rewriting compiler files
 
 The GOOS and GOARCH environment variables should be unset before calling
-mkbuildcfg. This change fixes a build failure when GOARCH=riscv64.
+mkbuildcfg, as the target GOOS and GOARCH is not relevant while compiling the
+bootstrap Go compiler using the C-based go-bootstrap go1.4 compiler.
+
+This change fixes a build failure when GOARCH=riscv64:
 
 Building Go toolchain1 using go-1.4-bootstrap-20171003.
 src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
 invalid operation: y << x (shift count type int64, must be unsigned integer)
 
-There is a build issue with go1.4 with the riscv64 code: however, why is the
-riscv64 code being compiled at all?
+This is because:
+
+ - buildtool.go:198: calls bootstrapRewriteFile(src)
+ - bootstrapRewriteFile: buildtool.go:283 calls:
+ - isUnneededSSARewriteFile: checks os.Getenv("GOARCH")
+ - isUnneededSSARewriteFile: returns "", false
+ - bootstrapRewriteFile: calls bootstrapFixImports
+ - boostrapFixImports: generates code go1.4 cannot compile
+
+By unsetting GOARCH here we are causing isUnneededSSARewriteFile to return true
+instead of false which generates stub functions bypassing the incompatible code.
 
-GOARCH is set when calling mkbuildcfg, so go1.4 is trying to compile riscv64.
+buildtool.go:272 in isUnneededSSARewriteFile is the only place the GOARCH
+environment variable is checked apart from the xinit function.
+
+This patch simply moves the os.Setenv("GOARCH", "") to before the block of code
+where bootstrapRewriteFile is called.
 
 [Buildroot]: submitted to upstream:
 
- - https://github.com/golang/go/issues/52583
- - https://go-review.googlesource.com/c/go/+/400376
- - GitHub-Pull-Request: golang/go#52362
+- https://github.com/golang/go/issues/52583
+- https://go-review.googlesource.com/c/go/+/400376
+- GitHub-Pull-Request: golang/go#52362
 
 Signed-off-by: Christian Stewart <christian@paral.in>
 ---
- src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
- 1 file changed, 29 insertions(+), 27 deletions(-)
+ src/cmd/dist/buildtool.go | 49 ++++++++++++++++++++-------------------
+ 1 file changed, 25 insertions(+), 24 deletions(-)
 
 diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
-index f1f3d50b6f..dabf01cf84 100644
+index f1f3d50b6f..c8fd583832 100644
 --- a/src/cmd/dist/buildtool.go
 +++ b/src/cmd/dist/buildtool.go
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
+@@ -130,6 +130,31 @@ func bootstrapBuildTools() {
  	base := pathf("%s/src/bootstrap", workspace)
  	xmkdirall(base)
  
@@ -53,6 +59,7 @@ index f1f3d50b6f..dabf01cf84 100644
 +	// Restore GOROOT, GOPATH, and GOBIN when done.
 +	// Don't bother with GOOS, GOHOSTOS, GOARCH, and GOHOSTARCH,
 +	// because setup will take care of those when bootstrapBuildTools returns.
++	// Note: GOARCH is read by bootstrapRewriteFile -> isUnneededSSARewriteFile.
 +
 +	defer os.Setenv("GOROOT", os.Getenv("GOROOT"))
 +	os.Setenv("GOROOT", goroot_bootstrap)
@@ -67,10 +74,6 @@ index f1f3d50b6f..dabf01cf84 100644
 +	os.Setenv("GOHOSTOS", "")
 +	os.Setenv("GOARCH", "")
 +	os.Setenv("GOHOSTARCH", "")
-+
-+	// Create the build config files.
-+	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
-+	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
 +
  	// Copy source code into $GOROOT/pkg/bootstrap and rewrite import paths.
  	writefile("module bootstrap\n", pathf("%s/%s", base, "go.mod"), 0)
@@ -106,14 +109,6 @@ index f1f3d50b6f..dabf01cf84 100644
  	// Run Go 1.4 to build binaries. Use -gcflags=-l to disable inlining to
  	// workaround bugs in Go 1.4's compiler. See discussion thread:
  	// https://groups.google.com/d/msg/golang-dev/Ss7mCKsvk8w/Gsq7VYI0AwAJ
-@@ -221,6 +222,7 @@ func bootstrapBuildTools() {
- 		cmd = append(cmd, "-toolexec="+tool)
- 	}
- 	cmd = append(cmd, "bootstrap/cmd/...")
-+
- 	run(base, ShowOutput|CheckExit, cmd...)
- 
- 	// Copy binaries into tool binary directory.
 -- 
 2.35.1
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
