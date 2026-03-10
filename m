Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66700FD88C3
	for <buildroot@archiver.kernel.org>; Tue, 10 Mar 2026 21:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3757A80E37;
	Tue, 10 Mar 2026 21:57:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bR52fq0V_wyF; Tue, 10 Mar 2026 21:57:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B5AD80EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773179826;
	bh=/AN/eGoS1Qa8vKc6lmTujlARf41GtkgiLSoph6M2Pm4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=eFGWbGdkASmOF0cJbIBcLOKwOrzyNKR5uNfg995Gp06+5XTfJIu2zJijn+zQg73IP
	 W8bNMteLrMSkoNrCV4pvD8ryVWHo6bLqYe9DGOQD2VpNVwPcCCxzTzGNWYZFhKvoiN
	 sRjs+vYoyz2Y6QaJfBez1Ef295R2odw5JQq7xNWW48HviSGhXDmUwHVaoWb3KHb47i
	 P7ZUEyIPsYyci/NoJ8WOvqjDiEfJjPunBo6rivH5fK5apZsRuDW9mE9EGZioEr/eoa
	 L0PG7XAmAHzUCDHQfbky+k6cmJs+0bb630sNID1Be12tozl2hF0C1IZF2Un5V3hR1V
	 dyHQJJ306Oqeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B5AD80EEF;
	Tue, 10 Mar 2026 21:57:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C6EC201
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DE6E60A40
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z4dZ-y_SbBGQ for <buildroot@buildroot.org>;
 Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E698608E2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E698608E2
 for <buildroot@buildroot.org>; Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF3CC8688B; Tue, 10 Mar 2026 21:57:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Mar 2026 19:11:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b95b9ed076e203868a8990a0e6ee44aa4776293a
X-Git-Newrev: 937f7289d9f3026044e6ace0fef32ad2d4968372
X-Patchwork-Hint: ignore
Message-Id: <20260310215701.BF3CC8688B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcc: bump version to 0.36.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1456154429688751950=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1456154429688751950==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/937f7289d9f3026044e6ace0fef32ad2d4968372
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/iovisor/bcc/blob/v0.36.1/debian/changelog

Added upstream commit to fix build with the upcoming bump of llvm to
22.1.0.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...001-Fix-a-build-failure-with-clang21-5369.patch | 53 ------------------
 package/bcc/0001-Fix-build-with-LLVM-22.patch      | 64 ++++++++++++++++++++++
 package/bcc/bcc.hash                               |  2 +-
 package/bcc/bcc.mk                                 |  2 +-
 4 files changed, 66 insertions(+), 55 deletions(-)

diff --git a/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch b/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
deleted file mode 100644
index 0aeb6a6fea..0000000000
--- a/package/bcc/0001-Fix-a-build-failure-with-clang21-5369.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 051be0c987622683c75b335bda16b9b61fc67fa4 Mon Sep 17 00:00:00 2001
-From: yonghong-song <ys114321@gmail.com>
-Date: Mon, 14 Jul 2025 20:21:59 -0700
-Subject: [PATCH] Fix a build failure with clang21 (#5369)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-The build error message:
-  src/cc/frontends/clang/loader.cc:400:73: error: no matching function for
-   call to ‘clang::TextDiagnosticPrinter::TextDiagnosticPrinter(
-     llvm::raw_fd_ostream&, clang::DiagnosticOptions*)’
-  400 |   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
-      |                                                                         ^
-The llvm commit
-  https://github.com/llvm/llvm-project/pull/139584
-caused the build failure.
-
-Adjust the code properly and the error is fixed.
-
-Upstream: https://github.com/iovisor/bcc/commit/8c5c96ad3beeed2fa827017f451a952306826974
-Signed-off-by: Julien Olivain <ju.o@free.fr>
----
- src/cc/frontends/clang/loader.cc | 8 ++++++++
- 1 file changed, 8 insertions(+)
-
-diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
-index 07dc9d6a..6f8387aa 100644
---- a/src/cc/frontends/clang/loader.cc
-+++ b/src/cc/frontends/clang/loader.cc
-@@ -396,11 +396,19 @@ int ClangLoader::do_compile(
-                     flags_cstr_rem.end());
- 
-   // set up the error reporting class
-+#if LLVM_VERSION_MAJOR >= 21
-+  DiagnosticOptions diag_opts;
-+  auto diag_client = new TextDiagnosticPrinter(llvm::errs(), diag_opts);
-+
-+  IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
-+  DiagnosticsEngine diags(DiagID, diag_opts, diag_client);
-+#else
-   IntrusiveRefCntPtr<DiagnosticOptions> diag_opts(new DiagnosticOptions());
-   auto diag_client = new TextDiagnosticPrinter(llvm::errs(), &*diag_opts);
- 
-   IntrusiveRefCntPtr<DiagnosticIDs> DiagID(new DiagnosticIDs());
-   DiagnosticsEngine diags(DiagID, &*diag_opts, diag_client);
-+#endif
- 
-   // set up the command line argument wrapper
- 
--- 
-2.51.1
-
diff --git a/package/bcc/0001-Fix-build-with-LLVM-22.patch b/package/bcc/0001-Fix-build-with-LLVM-22.patch
new file mode 100644
index 0000000000..c9491ef5c1
--- /dev/null
+++ b/package/bcc/0001-Fix-build-with-LLVM-22.patch
@@ -0,0 +1,64 @@
+From 4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
+Date: Mon, 2 Mar 2026 10:03:15 +0100
+Subject: [PATCH] Fix build with LLVM-22
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+LLVM-22 changed the signatures of various createDiagnostics() calls [1].
+Introduce a new version macro guard and adapt the code to the changed API.
+
+Fixes #5483
+
+[1] https://github.com/llvm/llvm-project/commit/30633f30894129919050f24fdd1f8f6bc46beae0
+
+Signed-off-by: Holger Hoffstätte <holger@applied-asynchrony.com>
+
+Upstream: https://github.com/iovisor/bcc/commit/4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/cc/frontends/clang/loader.cc | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
+index 6f8387aaf017..1f706344724d 100644
+--- a/src/cc/frontends/clang/loader.cc
++++ b/src/cc/frontends/clang/loader.cc
+@@ -464,7 +464,10 @@ int ClangLoader::do_compile(
+   }
+   invocation0.getFrontendOpts().DisableFree = false;
+ 
+-#if LLVM_VERSION_MAJOR >= 20
++#if LLVM_VERSION_MAJOR >= 22
++  compiler0.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
++  compiler0.createDiagnostics(new IgnoringDiagConsumer());
++#elif LLVM_VERSION_MAJOR >= 20
+   compiler0.createDiagnostics(*llvm::vfs::getRealFileSystem(), new IgnoringDiagConsumer());
+ #else
+   compiler0.createDiagnostics(new IgnoringDiagConsumer());
+@@ -487,7 +490,10 @@ int ClangLoader::do_compile(
+   add_main_input(invocation1, main_path, &*out_buf);
+   invocation1.getFrontendOpts().DisableFree = false;
+ 
+-#if LLVM_VERSION_MAJOR >= 20
++#if LLVM_VERSION_MAJOR >= 22
++  compiler1.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
++  compiler1.createDiagnostics();
++#elif LLVM_VERSION_MAJOR >= 20
+   compiler1.createDiagnostics(*llvm::vfs::getRealFileSystem());
+ #else
+   compiler1.createDiagnostics();
+@@ -517,7 +523,10 @@ int ClangLoader::do_compile(
+   invocation2.getCodeGenOpts().setInlining(CodeGenOptions::NormalInlining);
+   // suppress warnings in the 2nd pass, but bail out on errors (our fault)
+   invocation2.getDiagnosticOpts().IgnoreWarnings = true;
+-#if LLVM_VERSION_MAJOR >= 20
++#if LLVM_VERSION_MAJOR >= 22
++  compiler2.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
++  compiler2.createDiagnostics();
++#elif LLVM_VERSION_MAJOR >= 20
+   compiler2.createDiagnostics(*llvm::vfs::getRealFileSystem());
+ #else
+   compiler2.createDiagnostics();
diff --git a/package/bcc/bcc.hash b/package/bcc/bcc.hash
index 5e2c79f7b4..02ec50f450 100644
--- a/package/bcc/bcc.hash
+++ b/package/bcc/bcc.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  66c588bf5dfcd557a9f14f7e21a7b4dfdfcc4a574fd4b9897037059f046a6558  bcc-v0.35.0-git4.tar.gz
+sha256  ea8562246801c52a9c21c47076dae9ff1d3719bb86b96d7a6222b3724461f52c  bcc-v0.36.1-git4.tar.gz
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE.txt
diff --git a/package/bcc/bcc.mk b/package/bcc/bcc.mk
index f113761c2f..c3c9eabbbe 100644
--- a/package/bcc/bcc.mk
+++ b/package/bcc/bcc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCC_VERSION = v0.35.0
+BCC_VERSION = v0.36.1
 BCC_SITE = https://github.com/iovisor/bcc
 BCC_SITE_METHOD = git
 BCC_GIT_SUBMODULES = YES

--===============1456154429688751950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1456154429688751950==--
