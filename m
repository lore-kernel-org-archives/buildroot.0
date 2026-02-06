Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C085CEE6B69
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 22:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8511840664;
	Fri,  6 Feb 2026 22:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZsDjp4AOgLcK; Fri,  6 Feb 2026 22:16:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D03440563
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770416185;
	bh=ihC22JesX8/G8LKqD/cD/IUQLwj2TQYoyYUFgKfVqRY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CpdbdfVdFyBXiEL74iPx2AMOSXItMcE34RfVWgNymPdRFn6o1nvYWqjJhpSrduf7z
	 ZmV2wiqFjIwpStCEVHOLtNYR2a301eItgiqV8Sd8fTy6m3xE2eEGeBtguoCTH1snZA
	 Fbhxk0G2+IXQpyU8tM8vd/TgbPngRpC3xvCzGrEKtLkgHaZier/NxDUZEP4jOLOTYx
	 TlO4cUw4Y4NQ0oxepavoEgNi1gExPefshm+sKrB1CMiAhf/WkKwYT7KL6abNvTkiLO
	 7gWvPkY7VfWdcTRqwwJC1c9bEVtggZTSp9Qetfsswg+XsBac/LRGarcL5GWLkPaL+s
	 RR7HO6KMxSaTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D03440563;
	Fri,  6 Feb 2026 22:16:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C57F173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E4CA8437B
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3qvNs_7eb-Cg for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 22:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6770284376
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6770284376
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:16:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 55BC886B1F; Fri,  6 Feb 2026 22:16:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Feb 2026 23:13:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d892c5afad921bc7c6a012b07c3e5c0eb9e94c84
X-Git-Newrev: 6b7b895d10a8156e96f17742c6b05eb6fd47ca40
X-Patchwork-Hint: ignore
Message-Id: <20260206221622.55BC886B1F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {boot/optee-os,
 package/optee-*}: bump version to 4.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6b7b895d10a8156e96f17742c6b05eb6fd47ca40
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Unfortunately, if all optee-related packages are not updated at the same
time, optee-test will not build. This commit bumps all the optee
components at once.

The version bump is needed since optee-examples and optee-test can no
longer compile (compatibility with CMake < 3.5 has been removed from
CMake).

For release details, see:
https://github.com/OP-TEE/optee_os/blob/4.9.0/CHANGELOG.md#op-tee---version-490-2026-01-16

Signed-off-by: Jakob Kastelic <jkastelic@thinksrs.com>
[Julien: add link to release details]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/optee-os/Config.in                    | 4 ++--
 boot/optee-os/optee-os.hash                | 2 +-
 package/optee-client/Config.in             | 4 ++--
 package/optee-client/optee-client.hash     | 2 +-
 package/optee-examples/Config.in           | 4 ++--
 package/optee-examples/optee-examples.hash | 2 +-
 package/optee-test/Config.in               | 4 ++--
 package/optee-test/optee-test.hash         | 2 +-
 8 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/boot/optee-os/Config.in b/boot/optee-os/Config.in
index 4bd7debefd..af08375b9a 100644
--- a/boot/optee-os/Config.in
+++ b/boot/optee-os/Config.in
@@ -18,7 +18,7 @@ choice
 	  Select the version of OP-TEE OS you want to use
 
 config BR2_TARGET_OPTEE_OS_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	select BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY
 	help
@@ -79,7 +79,7 @@ endif
 
 config BR2_TARGET_OPTEE_OS_VERSION
 	string
-	default "4.6.0"		if BR2_TARGET_OPTEE_OS_LATEST
+	default "4.9.0"		if BR2_TARGET_OPTEE_OS_LATEST
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 		if BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 	default "custom"	if BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL
diff --git a/boot/optee-os/optee-os.hash b/boot/optee-os/optee-os.hash
index c86bd1e0d9..3db5c85cf1 100644
--- a/boot/optee-os/optee-os.hash
+++ b/boot/optee-os/optee-os.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c947c6972bf50c483cb993af01041d4094b1e03711c7246cdde6ba2ffc351fe  optee-os-4.6.0.tar.gz
+sha256  9400e16c45bfa45f15585b2c933b86c449e7de05def0ecaaa62a4f38973a3a45  optee-os-4.9.0.tar.gz
 sha256  1247ee90858f4037b6cac63cbffddfed435d0d73c631b37d78c1e6e6ab3e5d1a  LICENSE
diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
index ac3b680743..04849ffce4 100644
--- a/package/optee-client/Config.in
+++ b/package/optee-client/Config.in
@@ -30,7 +30,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_CLIENT_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-client official Git
 	  repository.
@@ -60,7 +60,7 @@ config BR2_PACKAGE_OPTEE_CLIENT_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_CLIENT_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_CLIENT_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_CLIENT_CUSTOM_TARBALL
 
 config BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH
diff --git a/package/optee-client/optee-client.hash b/package/optee-client/optee-client.hash
index a5d98521a3..f6150aaf6c 100644
--- a/package/optee-client/optee-client.hash
+++ b/package/optee-client/optee-client.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  a970338c9f69861901336716d89684646e4480b9970996a5b3581ae7d49fdaa3  optee-client-4.6.0.tar.gz
+sha256  2ef152f25b682e59c3684d6d73d7c5a138495615f6b045e95266eb3d0bc0d04e  optee-client-4.9.0.tar.gz
 sha256  fda8385993f112d7ca61b88b54ba5b4cbeec7e43a0f9b317d5186703c1985e8f  LICENSE
diff --git a/package/optee-examples/Config.in b/package/optee-examples/Config.in
index 702adc84db..fca9aca07c 100644
--- a/package/optee-examples/Config.in
+++ b/package/optee-examples/Config.in
@@ -42,7 +42,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-examples official
 	  Git repository.
@@ -72,7 +72,7 @@ config BR2_PACKAGE_OPTEE_EXAMPLES_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_EXAMPLES_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_EXAMPLES_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_EXAMPLES_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_EXAMPLES
diff --git a/package/optee-examples/optee-examples.hash b/package/optee-examples/optee-examples.hash
index 54b98868d7..df3bbcbf66 100644
--- a/package/optee-examples/optee-examples.hash
+++ b/package/optee-examples/optee-examples.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6891390aefa2046d500d3ffec05c327d7763e89645b2e99ef2330b561ba645f5  optee-examples-4.6.0.tar.gz
+sha256  b95a3d72f2b266aedde0ed9b855f9c59cd0b2608df59b27e3f46935dfb6f919c  optee-examples-4.9.0.tar.gz
 sha256  6f1ef8449cb82ae79d2155605f7985bdf0f08e7ab5007de9b4362e8bf28733b9  LICENSE
diff --git a/package/optee-test/Config.in b/package/optee-test/Config.in
index dd1160ea48..8631d12cef 100644
--- a/package/optee-test/Config.in
+++ b/package/optee-test/Config.in
@@ -48,7 +48,7 @@ config BR2_PACKAGE_OPTEE_TEST_AS_OS
 	depends on BR2_TARGET_OPTEE_OS_CUSTOM_VERSION
 
 config BR2_PACKAGE_OPTEE_TEST_LATEST
-	bool "4.6.0"
+	bool "4.9.0"
 	help
 	  Use the latest release tag from the optee-test official Git
 	  repository.
@@ -77,7 +77,7 @@ config BR2_PACKAGE_OPTEE_TEST_VERSION
 	string
 	default BR2_TARGET_OPTEE_OS_CUSTOM_VERSION_VALUE \
 				if BR2_PACKAGE_OPTEE_TEST_AS_OS
-	default "4.6.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
+	default "4.9.0"		if BR2_PACKAGE_OPTEE_TEST_LATEST
 	default "custom"	if BR2_PACKAGE_OPTEE_TEST_CUSTOM_TARBALL
 
 endif # BR2_PACKAGE_OPTEE_TEST
diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 058d95e29b..80e1b36571 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  db4de73fa955a7db70a64a2c4ad1d2c48ddcb54c369821aba670fec6131a6f61  optee-test-4.6.0.tar.gz
+sha256  b7158740dc4ea2f585363097ebd60a265eef0e078674d70636b1731be94780cc  optee-test-4.9.0.tar.gz
 sha256  2b36458cd0292200e406a608efe7dfda17aae39646a86b730a2776b61d0fa410  LICENSE-BSD
 sha256  a094472b51f57d0403953d087e410793519cb6f3a7cea2be34eb44e09a426a73  LICENSE-GPL
 sha256  a562ab14c307d0e02b7bf6f1bdb0d1cf789409e6375a500e15dc7a0503e5c2c3  LICENSE.md
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
