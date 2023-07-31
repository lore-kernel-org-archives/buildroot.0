Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF97C001DE
	for <buildroot@archiver.kernel.org>; Mon, 31 Jul 2023 20:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 604A860BCF;
	Mon, 31 Jul 2023 20:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 604A860BCF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OekV_ZT7S4Rj; Mon, 31 Jul 2023 20:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3993A610DB;
	Mon, 31 Jul 2023 20:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3993A610DB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9844D1BF954
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 954D440B8B
 for <buildroot@lists.busybox.net>; Mon, 31 Jul 2023 20:50:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 954D440B8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvRkpfbJ3q6y for <buildroot@lists.busybox.net>;
 Mon, 31 Jul 2023 20:50:02 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 808B9405DD
 for <buildroot@buildroot.org>; Mon, 31 Jul 2023 20:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 808B9405DD
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A26B2A4C0DE5;
 Mon, 31 Jul 2023 22:49:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38104)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qQZpr-0007Gg-13;
 Mon, 31 Jul 2023 22:49:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 31 Jul 2023 22:49:47 +0200
Message-Id: <20230731204947.2275706-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230731204947.2275706-1-bernd@kuhls.net>
References: <20230731204947.2275706-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1690836587;
 bh=cz7jgHCultehQ90rS6vD5cNCzUhTHvu0IFSNh0J5mhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dNPN2GNw2uc76/0zJQDCGC0L3BLJnOSUT1o+azM1LPtpGzTvxH3Vj2/vTmZGyms+h
 zi01rgWXsYf55UwLm4zQ8B0+60gZiJBx7n0wddPFJQ2NY4A8GPXvI82SurXXZ4CPkS
 StB9TKYSJKWefCk1yMmU1VcDT13JMbEbnFCTTWn9X28GTz9dEdidoK8NYb3IELfnwT
 2Sn3rkgLCvHgjvCa9q3qlf5ro3Ybb/a+L7SmQct6XQ/2KOnDgQCT0//x6/VQogCAFX
 ZRXFW4fFvTZhXjnNXfpyRlS+yq0hqTXy4MPyx9ChmU82bcknUYsixiWTi6UXEQaeI1
 ht9rcWVdQNPLw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dNPN2GNw
Subject: [Buildroot] [PATCH 2/2] package/sentry-cli: bump version to 2.20.3
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/getsentry/sentry-cli/blob/master/CHANGELOG.md

Rebased patch 0001.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...able-SSL-support-for-the-curl-module.patch | 24 +++++++++----------
 package/sentry-cli/sentry-cli.hash            |  2 +-
 package/sentry-cli/sentry-cli.mk              |  2 +-
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
index e68401da78..819d8016ae 100644
--- a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
+++ b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
@@ -1,4 +1,4 @@
-From a3754088b4cf7d19ff4f9a98412dd132d5baf1c1 Mon Sep 17 00:00:00 2001
+From 5b4179af15b435a476c006260718d4f6e22ea2ab Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
 Date: Mon, 31 Jul 2023 22:34:04 +0200
 Subject: [PATCH] Disable SSL support for the curl module
@@ -17,26 +17,26 @@ Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
  2 files changed, 1 insertion(+), 11 deletions(-)
 
 diff --git a/Cargo.lock b/Cargo.lock
-index 75e1c8c..5121211 100644
+index e5031db..7357215 100644
 --- a/Cargo.lock
 +++ b/Cargo.lock
-@@ -1557,15 +1557,6 @@ version = "0.1.5"
+@@ -1521,15 +1521,6 @@ version = "0.1.5"
  source = "registry+https://github.com/rust-lang/crates.io-index"
  checksum = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
  
 -[[package]]
 -name = "openssl-src"
--version = "111.22.0+1.1.1q"
+-version = "111.25.0+1.1.1t"
 -source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "8f31f0d509d1c1ae9cada2f9539ff8f37933831fd5098879e482aa687d659853"
+-checksum = "3173cd3626c43e3854b1b727422a276e568d9ec5fe8cec197822cf52cfb743d6"
 -dependencies = [
 - "cc",
 -]
 -
  [[package]]
  name = "openssl-sys"
- version = "0.9.74"
-@@ -1575,7 +1566,6 @@ dependencies = [
+ version = "0.9.80"
+@@ -1539,7 +1530,6 @@ dependencies = [
   "autocfg",
   "cc",
   "libc",
@@ -45,18 +45,18 @@ index 75e1c8c..5121211 100644
   "vcpkg",
  ]
 diff --git a/Cargo.toml b/Cargo.toml
-index abd6839..ddc141f 100644
+index c8c9ca9..117e77d 100644
 --- a/Cargo.toml
 +++ b/Cargo.toml
-@@ -19,7 +19,7 @@ clap = { version = "3.2.22", default-features = false, features = [
-   "wrap_help",
+@@ -25,7 +25,7 @@ clap = { version = "4.1.6", default-features = false, features = [
+   "error-context",
  ] }
- console = "0.15.2"
+ console = "0.15.5"
 -curl = { version = "0.4.44", features = ["static-curl", "static-ssl"] }
 +curl = { version = "0.4.44" }
  dirs = "4.0.0"
  dotenv = "0.15.0"
- elementtree = "1.2.2"
+ elementtree = "1.2.3"
 -- 
 2.39.2
 
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 3562199a82..78f137da3a 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  fa06f9f47782713eef8a4f10b674e2375b9439360ab34b37558ec4b30ec84861  sentry-cli-2.8.0.tar.gz
+sha256  2188b8eead4f2b6543725b23852427bea164e8dd76bf1ce33f41ca0c03cfeee7  sentry-cli-2.20.3.tar.gz
 sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 15094c2d01..df419f81e1 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SENTRY_CLI_VERSION = 2.8.0
+SENTRY_CLI_VERSION = 2.20.3
 SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
 SENTRY_CLI_LICENSE = BSD-3-clause
 SENTRY_CLI_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
