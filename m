Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B4EC5DF6D
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 13:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ACEF813C9;
	Sat, 15 Aug 2026 13:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GTTrykBRkFH5; Sat, 15 Aug 2026 13:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F36E813A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786798905;
	bh=R3ZlhR5e1+tEAKtWSiuIW6k2x+GnqYpdXSADtC4Q1Js=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qwT+COqL8zs+2DBsXvN5LCSvgU/KDVCCsBaFHzP5+60LqBhrytxf+GbRLuVtVsJGZ
	 P8OTGqHLNPwAPsk2JFzj7BS0Gtru1kHKJca1notVB8229dBmQe0Z5fjpi5zpZqouDI
	 BEHtysCFiEXiNPcrQaVKmQHrIM/pw4JySBJQXC4KD3h7vqEHBw5ZCrtbgeZXh59339
	 2Aak2d/vUqEQ4E+Gn8PVfredrX7AipULEYeOXjLVJ6VHCZOXgLRoIJIrqR2GIRw543
	 hk2P4wmueJlcJ7YIRVoOcAkhTQnF3aXS1oMnIuVKst6LoHR0UL3Q8S+Ept6c94nhCD
	 WkeaFQwYledjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F36E813A6;
	Sat, 15 Aug 2026 13:01:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77D74361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69CB06066B
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whbFi7iFkwqF for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 13:01:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 38D9F6065E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38D9F6065E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B37568742C; Sat, 15 Aug 2026 13:00:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 14:50:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c96a67d9ba53dc152dce72e8ff08b5078a77b8c
X-Git-Newrev: cc224761b04ac447ef708838a298f09ccaca1595
X-Patchwork-Hint: ignore
Message-Id: <20260815130045.B37568742C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: bump to 3.4.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cc224761b04ac447ef708838a298f09ccaca1595
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Packaging changes:

- Drop patch that is upstream (it was an upstream backport)
- double-conversion now requires CMake 3.29, so we select
  BR2_HOST_CMAKE_AT_LEAST_3_29

Upstream changes:

CMake: Raised required version to 3.5 by @heirecka in #240
Bump ossf/scorecard-action from 2.4.0 to 2.4.1 by @dependabot[bot] in #241
Always initialize decimal-point variable. by @floitsch in #244
Explain that ToShortest might not be the shortest. by @floitsch in #245
Add higher bound for cmake. by @floitsch in #246
Bump ossf/scorecard-action from 2.4.1 to 2.4.2 by @dependabot[bot] in #248
Bump lukka/get-cmake from 4.0.2 to 4.0.3 by @dependabot[bot] in #250
Bump lukka/get-cmake from 4.0.3 to 4.1.0 by @dependabot[bot] in #252
Bump actions/checkout from 4.2.2 to 5.0.0 by @dependabot[bot] in #253
Bump lukka/get-cmake from 4.1.0 to 4.1.1 by @dependabot[bot] in #254
Add alias double-conversion::double-conversion by @Flamefire in #255
Revert "Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines (#202)" by @Osyotr in #256
Bump ossf/scorecard-action from 2.4.2 to 2.4.3 by @dependabot[bot] in #259
Install pkg-config file (from CMake build) by @Ericson2314 in #262
Update CI runners and minimal cmake. by @floitsch in #257
Bump lukka/get-cmake from 4.1.1 to 4.1.2 by @dependabot[bot] in #258
Bump lukka/get-cmake from 4.1.2 to 4.2.0 by @dependabot[bot] in #264
Bump actions/checkout from 5.0.0 to 6.0.0 by @dependabot[bot] in #265
Bump actions/checkout from 6.0.0 to 6.0.1 by @dependabot[bot] in #266
Prepare new release. by @floitsch in #267

See https://github.com/google/double-conversion/releases/tag/v3.4.0

Tested in a defconfig that has the two reverse dependencies of
double-conversion in Buildroot:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_QT6=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_UJSON=y

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...0001-CMake-Raised-required-version-to-3.5.patch | 27 ----------------------
 package/double-conversion/Config.in                |  1 +
 package/double-conversion/double-conversion.hash   |  2 +-
 package/double-conversion/double-conversion.mk     |  2 +-
 4 files changed, 3 insertions(+), 29 deletions(-)

diff --git a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch b/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
deleted file mode 100644
index 9d8482d5d2..0000000000
--- a/package/double-conversion/0001-CMake-Raised-required-version-to-3.5.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 101e1ba89dc41ceb75090831da97c43a76cd2906 Mon Sep 17 00:00:00 2001
-From: Heiko Becker <mail@heiko-becker.de>
-Date: Thu, 20 Feb 2025 15:20:07 +0100
-Subject: [PATCH] CMake: Raised required version to 3.5 (#240)
-
-CMake >= 4.0.0-rc1 removed compatibility with versions < 3.5 and errors
-out with such versions passed to cmake_minimum_required(). 3.5.0 has
-been released 9 years ago, so I'd assume it's available almost
-everywhere.
-
-Upstream: https://github.com/google/double-conversion/commit/101e1ba89dc41ceb75090831da97c43a76cd2906
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8749ef86..31457723 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -1,4 +1,4 @@
--cmake_minimum_required(VERSION 3.0)
-+cmake_minimum_required(VERSION 3.5)
- project(double-conversion VERSION 3.3.0)
- 
- option(BUILD_SHARED_LIBS "Build shared libraries (.dll/.so) instead of static ones (.lib/.a)" OFF)
diff --git a/package/double-conversion/Config.in b/package/double-conversion/Config.in
index b858b56c27..1c43a2a851 100644
--- a/package/double-conversion/Config.in
+++ b/package/double-conversion/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DOUBLE_CONVERSION
 	bool "double-conversion"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_HOST_CMAKE_AT_LEAST_3_29
 	help
 	  Provides binary-decimal and decimal-binary routines for
 	  IEEE doubles.
diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index a10da6d75d..3b61297332 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e  double-conversion-3.3.1.tar.gz
+sha256  42fd4d980ea86426e457b24bdfa835a6f5ad9517ddb01cdb42b99ab9c8dd5dc9  double-conversion-3.4.0.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index a4760236ca..0c73c07043 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.3.1
+DOUBLE_CONVERSION_VERSION = 3.4.0
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
