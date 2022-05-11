Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E95C433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 00:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3197D4181E;
	Wed, 11 May 2022 00:40:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UktvTkpz7dps; Wed, 11 May 2022 00:40:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D45A417CA;
	Wed, 11 May 2022 00:40:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5ADED1BF9B2
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5713A4023F
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 00:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x4SrocJlHFe3 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 00:40:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D60E400CB
 for <buildroot@buildroot.org>; Wed, 11 May 2022 00:40:14 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r71so57404pgr.0
 for <buildroot@buildroot.org>; Tue, 10 May 2022 17:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lmLuuHcMTv9AZWvvL7LZqwnPb+EZc8G16nErIQxCUcc=;
 b=aK/i0Kkt1IJh9BNOR1ILTdCsxvOet2qXLsliIbpSvoLyxa9KI47sdPE722Jo1TmxSP
 H/MePpEuzfW07M8897HsAoTEh5lw9aox95XUtbo4unGaL/gfEU1UMGpIh4CC97HY3DXt
 fVtvX8FWAToXt50wHxtzypXrTG1xwMotWp9DllVeWXUlEDFBNQKpQxIw6u5KERLRm3Du
 5gkJeL2rA2dE2TSi7yJBh9FLwf5N+nf4Kd00M4+u4+JXl5wWwMarRxcGFfvRTRZ5Nx7h
 aS8NiZ0bl3zRqdJp6oNW9MIJyF/zrEJx7kwUkaxM4OteUdW8AHtNnJ05XxwTVoolEf+d
 PCPw==
X-Gm-Message-State: AOAM533bMKHsH6goG/t8ZZeop3i4N9bC35HiV6qaWBxt+5672iz0DFCc
 jI56Ot/pxZrNSpIjsMi+6DE2h44eJNHHhQ==
X-Google-Smtp-Source: ABdhPJzTdSnNKzwacp8tecmhZnrP+8XQp/SxKSYd/cr1M/XBzpLLPJCGOyflMesy53AHtwkcAge0jg==
X-Received: by 2002:a63:114c:0:b0:3c2:3346:3c2b with SMTP id
 12-20020a63114c000000b003c233463c2bmr18674464pgr.226.1652229613216; 
 Tue, 10 May 2022 17:40:13 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 g1-20020aa79dc1000000b0050dc76281e1sm144875pfq.187.2022.05.10.17.40.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 17:40:12 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 10 May 2022 17:40:07 -0700
Message-Id: <20220511004007.3630-2-christian@paral.in>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220511004007.3630-1-christian@paral.in>
References: <20220511004007.3630-1-christian@paral.in>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] package/go: add support for riscv64
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

Signed-off-by: Christian Stewart <christian@paral.in>
---
 ...explicit-option-for-crosscompilation.patch |   8 +-
 ...set-environment-before-generating-bu.patch | 111 ++++++++++++++++++
 package/go/Config.in.host                     |   2 +-
 package/go/go.mk                              |   2 +
 4 files changed, 118 insertions(+), 5 deletions(-)
 create mode 100644 package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch

diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
index f76c5b1d03..a32a6ee355 100644
--- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -1,4 +1,4 @@
-From e1382a731a726293e30901038c6870fa77ef6095 Mon Sep 17 00:00:00 2001
+From 86fa3da18b5c73cc84dec91d92db4ae95f288bdc Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo@amarulasolutions.com>
 Date: Tue, 8 May 2018 16:08:44 +0200
 Subject: [PATCH] build.go: explicit option for crosscompilation
@@ -17,10 +17,10 @@ Signed-off-by: Anisse Astier <anisse@astier.eu>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index 99d1db5..eb4097f 100644
+index d37c3f83ef..d838485bd3 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
-@@ -252,12 +252,13 @@ func xinit() {
+@@ -273,12 +273,13 @@ func xinit() {
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
index 0000000000..44b3fbecc2
--- /dev/null
+++ b/package/go/0002-build-bootstrap-set-environment-before-generating-bu.patch
@@ -0,0 +1,111 @@
+From 00f3f4ee0d477779c87e4e60b08708362670e122 Mon Sep 17 00:00:00 2001
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
+---
+ src/cmd/dist/buildtool.go | 56 ++++++++++++++++++++-------------------
+ 1 file changed, 29 insertions(+), 27 deletions(-)
+
+diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
+index 036f8c52fa..73f6524969 100644
+--- a/src/cmd/dist/buildtool.go
++++ b/src/cmd/dist/buildtool.go
+@@ -112,9 +112,6 @@ func bootstrapBuildTools() {
+ 	}
+ 	xprintf("Building Go toolchain1 using %s.\n", goroot_bootstrap)
+ 
+-	mkbuildcfg(pathf("%s/src/internal/buildcfg/zbootstrap.go", goroot))
+-	mkobjabi(pathf("%s/src/cmd/internal/objabi/zbootstrap.go", goroot))
+-
+ 	// Use $GOROOT/pkg/bootstrap as the bootstrap workspace root.
+ 	// We use a subdirectory of $GOROOT/pkg because that's the
+ 	// space within $GOROOT where we store all generated objects.
+@@ -126,6 +123,34 @@ func bootstrapBuildTools() {
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
+@@ -172,30 +197,6 @@ func bootstrapBuildTools() {
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
+@@ -217,6 +218,7 @@ func bootstrapBuildTools() {
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
index e82ab6e81a..8be86103ea 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 	depends on (BR2_arm && BR2_TOOLCHAIN_SUPPORTS_PIE) || BR2_aarch64 \
 		|| BR2_i386 || BR2_x86_64 || BR2_powerpc64le \
-		|| BR2_mips64 || BR2_mips64el || BR2_s390x
+		|| BR2_mips64 || BR2_mips64el || BR2_riscv || BR2_s390x
 	depends on !BR2_ARM_CPU_ARMV4
 	# MIPS R6 support in Go has not yet been developed.
 	depends on !BR2_MIPS_CPU_MIPS64R6
diff --git a/package/go/go.mk b/package/go/go.mk
index 3df16c9a68..ba0da74b86 100644
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
