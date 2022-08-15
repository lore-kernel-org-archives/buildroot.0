Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADD3C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B67AC40BA2;
	Sun, 11 Sep 2022 08:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B67AC40BA2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 27uBOVKu3rzJ; Sun, 11 Sep 2022 08:52:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A47B140B86;
	Sun, 11 Sep 2022 08:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A47B140B86
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 301EC1BF990
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6BCA783ED2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BCA783ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KPkJN_uMe5PJ for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BDF783EC2
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BDF783EC2
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3809F83622; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 12:01:51 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b389385666687ecfd09cdbce6c6ecfd74ce11ab
X-Git-Newrev: 22b3b3a77720d9527b8279d033d9fbca65b2bcba
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.3809F83622@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump to version 1.19
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22b3b3a77720d9527b8279d033d9fbca65b2bcba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Go 1.19 is a major release with changes to the implementation of the toolchain,
runtime, and libraries.

Dropped patch 0002-cmd-dist-use-gohostarch... as it was merged upstream.

https://go.dev/doc/go1.19

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d.go-explicit-option-for-crosscompilation.patch |  4 +-
 ...dist-use-gohostarch-for-ssa-rewrite-check.patch | 95 ----------------------
 package/go/go.hash                                 |  2 +-
 package/go/go.mk                                   |  2 +-
 4 files changed, 4 insertions(+), 99 deletions(-)

diff --git a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
index 3a9b47474c..992a83a644 100644
--- a/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
+++ b/package/go/0001-build.go-explicit-option-for-crosscompilation.patch
@@ -1,4 +1,4 @@
-From 335c6245674088de616324398137416c7a1cbe8f Mon Sep 17 00:00:00 2001
+From 6aed475557032a7ff9009e9b4b691b40b561876a Mon Sep 17 00:00:00 2001
 From: Angelo Compagnucci <angelo@amarulasolutions.com>
 Date: Tue, 8 May 2018 16:08:44 +0200
 Subject: [PATCH] build.go: explicit option for crosscompilation
@@ -17,7 +17,7 @@ Signed-off-by: Anisse Astier <anisse@astier.eu>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/cmd/dist/build.go b/src/cmd/dist/build.go
-index f99f1f4e43..08a9f24f59 100644
+index 7c44c4a605..03500920c4 100644
 --- a/src/cmd/dist/build.go
 +++ b/src/cmd/dist/build.go
 @@ -286,12 +286,13 @@ func xinit() {
diff --git a/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch b/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
deleted file mode 100644
index 2346208640..0000000000
--- a/package/go/0002-cmd-dist-use-gohostarch-for-ssa-rewrite-check.patch
+++ /dev/null
@@ -1,95 +0,0 @@
-From 38d841a18ab0bcb63554fed6b38012e504599891 Mon Sep 17 00:00:00 2001
-From: Christian Stewart <christian@paral.in>
-Date: Wed, 1 Jun 2022 20:52:12 +0000
-Subject: [PATCH] cmd/dist: use gohostarch for ssa rewrite check
-
-Fix a build failure when bootstrapping the Go compiler with go-bootstrap 1.4
-while the environment contains GOARCH=riscv64.
-
-Building Go toolchain1 using go-1.4-bootstrap-20171003.
-src/cmd/compile/internal/ssa/rewriteRISCV64.go:4814
-invalid operation: y << x (shift count type int64, must be unsigned integer)
-
-This is because:
-
- - buildtool.go:198: calls bootstrapRewriteFile(src)
- - bootstrapRewriteFile: buildtool.go:283 calls:
- - isUnneededSSARewriteFile: checks os.Getenv("GOARCH")
- - isUnneededSSARewriteFile: returns "", false
- - bootstrapRewriteFile: calls bootstrapFixImports
- - boostrapFixImports: generates code go1.4 cannot compile
-
-Instead of checking "GOARCH" in the environment, use the gohostarch variable.
-
-Change-Id: Ie9c190498555c4068461fead6278a62e924062c6
-GitHub-Last-Rev: 300d7a7fea0a67c696970fd271e2ce709674a658
-GitHub-Pull-Request: golang/go#52362
-Reviewed-on: https://go-review.googlesource.com/c/go/+/400376
-Reviewed-by: Bryan Mills <bcmills@google.com>
-TryBot-Result: Gopher Robot <gobot@golang.org>
-Reviewed-by: Dmitri Shuralyov <dmitshur@google.com>
-Auto-Submit: Bryan Mills <bcmills@google.com>
-Run-TryBot: Bryan Mills <bcmills@google.com>
-Reviewed-by: Joel Sing <joel@sing.id.au>
-Run-TryBot: Joel Sing <joel@sing.id.au>
----
- src/cmd/dist/buildtool.go | 16 ++++++----------
- 1 file changed, 6 insertions(+), 10 deletions(-)
-
-diff --git a/src/cmd/dist/buildtool.go b/src/cmd/dist/buildtool.go
-index 036f8c52fa..2d8ace52d8 100644
---- a/src/cmd/dist/buildtool.go
-+++ b/src/cmd/dist/buildtool.go
-@@ -16,7 +16,6 @@ import (
- 	"os"
- 	"path/filepath"
- 	"regexp"
--	"runtime"
- 	"strings"
- )
- 
-@@ -239,11 +238,11 @@ var ssaRewriteFileSubstring = filepath.FromSlash("src/cmd/compile/internal/ssa/r
- 
- // isUnneededSSARewriteFile reports whether srcFile is a
- // src/cmd/compile/internal/ssa/rewriteARCHNAME.go file for an
--// architecture that isn't for the current runtime.GOARCH.
-+// architecture that isn't for the given GOARCH.
- //
- // When unneeded is true archCaps is the rewrite base filename without
- // the "rewrite" prefix or ".go" suffix: AMD64, 386, ARM, ARM64, etc.
--func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
-+func isUnneededSSARewriteFile(srcFile, goArch string) (archCaps string, unneeded bool) {
- 	if !strings.Contains(srcFile, ssaRewriteFileSubstring) {
- 		return "", false
- 	}
-@@ -258,13 +257,10 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
- 	archCaps = fileArch
- 	fileArch = strings.ToLower(fileArch)
- 	fileArch = strings.TrimSuffix(fileArch, "splitload")
--	if fileArch == os.Getenv("GOHOSTARCH") {
-+	if fileArch == goArch {
- 		return "", false
- 	}
--	if fileArch == strings.TrimSuffix(runtime.GOARCH, "le") {
--		return "", false
--	}
--	if fileArch == strings.TrimSuffix(os.Getenv("GOARCH"), "le") {
-+	if fileArch == strings.TrimSuffix(goArch, "le") {
- 		return "", false
- 	}
- 	return archCaps, true
-@@ -273,9 +269,9 @@ func isUnneededSSARewriteFile(srcFile string) (archCaps string, unneeded bool) {
- func bootstrapRewriteFile(srcFile string) string {
- 	// During bootstrap, generate dummy rewrite files for
- 	// irrelevant architectures. We only need to build a bootstrap
--	// binary that works for the current runtime.GOARCH.
-+	// binary that works for the current gohostarch.
- 	// This saves 6+ seconds of bootstrap.
--	if archCaps, ok := isUnneededSSARewriteFile(srcFile); ok {
-+	if archCaps, ok := isUnneededSSARewriteFile(srcFile, gohostarch); ok {
- 		return fmt.Sprintf(`// Code generated by go tool dist; DO NOT EDIT.
- 
- package ssa
--- 
-2.35.1
-
diff --git a/package/go/go.hash b/package/go/go.hash
index 2a0f02abfd..2b877145e9 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  9920d3306a1ac536cdd2c796d6cb3c54bc559c226fc3cc39c32f1e0bd7f50d2a  go1.18.5.src.tar.gz
+sha256  9419cc70dc5a2523f29a77053cafff658ed21ef3561d9b6b020280ebceab28b9  go1.19.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 16602e590b..2220953e55 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.18.5
+GO_VERSION = 1.19
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
