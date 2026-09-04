Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F0DC79F80
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 17:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8F7D40B12;
	Fri,  4 Sep 2026 17:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dX6g5saoinZm; Fri,  4 Sep 2026 17:10:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 49F6440B03
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788541839;
	b=IKcet7hAklfg3oXdPSvrpKyg3Aa4G6lyc6uBGKTkJrMoTfCHP8AaTSDU/thQ72sx5fW1
	 5Rqdevo9dh8bRe7qNjGYbiow2i8NhJ4IL6SO/pUmtLd77QTgrh5QwVDmXYL3AcfJxY4hp
	 XtZnZ+sTjv46G46tjYyATgl0d0QkXAhNgneLcw+k8APfKoh8pBbB5yUFeE5v670WL+nT/
	 FvbEksROWsEjNqoQpdhNLrtbsoXtOpF36Sq4PDbrSwIUaJQ0mPZnzlFjbpkFXk/RXAUcT
	 N+ovg1Pns7p3Xa/+/kGAgLFpZWzPS379LGxg7k9oqa8tqks2IxQEaoZ0dOqTCTtg6Qw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788541839;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=kFwG62awEtYsjB8s1qyNsIdcko50c7EK7eamEqftZ1A=;
	b=WH5llZKG22td2LgSVs7X0AzwGWLjJtFcKXF9pfWuLTanS/cyvk2Dcrc3+9n80aRWnGaz
	 n583AjIGkGw7I9l2eLTrdvBjgusl/F5LtI4emQb3ARTCWc6DnJF4+j0N9FkQEOnxw2plE
	 2B9nCgP/INhDtSUB2TZX/atwdRtGqaKjk28XBUC/PF6g+JSGFFzj7o6STQLfMm2lIVtE5
	 GVjaHBzL8AwuCYQgDWm1BJZMTPwnnoomQPpexH09qNCOe9ULb4Sw0GLrvVXgb749Rz1rV
	 j6QT6t7V9FB0T+8u3eSZnL2Iw8hwvve80kBAy2cs3QZZIjNTEVhAgMJVZXgKUiO1HQA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788541839;
	bh=kFwG62awEtYsjB8s1qyNsIdcko50c7EK7eamEqftZ1A=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hmUKNPo/BCCAHhbU6+I3CVpc+RtkVfyWgyQ3GrphswVCgx158bBDbYKCQgr17WEXF
	 DdYP5AMQPDl/Nz0W/ZhCzeb6xYnNOXqNYpZWHPnhu/2n5vDBR9EqZaVjWuDuyJy3rW
	 zzy0g5xigQ85J9g9xT+AmnG16AZMnlm5ip6EFMGPcHF4EXYwcZUF6kn5DnUr03I+2e
	 F8OHEg8nTCSdbd8GYlTT3ex3O0esbmGrcaKit2O3WInaLaGDelz0X51WoGS8Km4XoU
	 MTZfgDZ8ik8TkAilGf8pVwWgPsJCE3oqI6O/20E2/WjJrlpojB4oVSKlKR5zDUW4CZ
	 Wk64avByfk68w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49F6440B03;
	Fri,  4 Sep 2026 17:10:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E88979CF
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDE2840082
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:10:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2so56VaU1xss for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 17:10:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org C2F6B40077
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788541836;
 b=ZX2WjP5AUeu40UzadAgwn4WAzF6uhd42knvnjnQrcn8O339ihPIqutiJdI44ti9bpCww
 HSl9XJC6ee8wzn0qVj7j5h2xSQDiUG09/pRIrP8hywLrn8DRUH0zogGNchtY3LjUEDL/V
 4jevcdUFUp3iEFJNjsFxWOYqSQ9a4fXL/EAzis0zIPj4X++0aJVBdbOH6DmribS+i17ZR
 Z74c3AE6/9oWuwC2eIlHRyr/t9Mv1lUfJNuUYK2LrW4IQEPyOMDBpOo9OHieJh9BMBpBF
 4CmlwotzoJ00SMyN0qzGB3EDzuS7QzhgigiWeLuQrA5/7dJXAe5VoFI8Km1XIhJAU3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788541836;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=u8zd/cKzPzW1cLx1ll7hnDH2o8fsz9AXddBK6hECFs8=;
 b=pR4WGMYY+EhYe1zpi5JziZAUlumn/RrbwXsDt1cbBerEVff0ESAYRoyEPIAKPwfMwnJ1
 ae9HwLYGW84xJOBPtz1sLXoMnL3x7XqrmYu8iFpzHIp253BQTIHFY53g2/1jMw+1Wp7SG
 HTVpQ//24cYb+dnhistKFiP/vQq9rGIbq2lmJmF5BULIR+kpqWp06Fxb6j9st9PibYNbK
 izZrihZSPROeMQ7wuv713bhnbG96y7jf05xER3cTI7OFnP4iJIQgI/6afb4+XZRRsa/27
 fcq21Mp8xXpEPMzYmBh4jayXxSjco/tUrNfgpKcOADQkFBdwDsUiGwmB7JgJYhMnKjQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U94bmDR0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=U94bmDR0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2F6B40077
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 17:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788541832;
 bh=u8zd/cKzPzW1cLx1ll7hnDH2o8fsz9AXddBK6hECFs8=;
 h=From:To:Cc:Subject:Date:From;
 b=U94bmDR0RrT32SpK8qIebiw1fIHTPyvxQH2E1A6cFGwEWLybxjBNBi3QlldVw2zkc
 X6rvyUk8TO0hPB5DJBm8ePf5c12jSl0qohesHXfwu2ADvv3PP4TJejGCwpMsKBs24Y
 SfETyTnAqtfxSCgh7Br8n9CzZHuLfA1TbFhOGSms86DLhEauPpaXdMASE3Bvw+8ij9
 UREYdSvX/IQtAbNO+DTtY924FwQqKQXocpfcdcN0ZnaMSP2NSfU762MVy5srm2aF5L
 6C1tSnrxGrOucwQpADLuyuC8BWYO3EgK/rR8pOy2/PUl0I3XhiSg6nQ6IdGTLYF2qz
 FPLhdmCrzu+Lg==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4713FA4C1FF0;
 Fri,  4 Sep 2026 19:10:32 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56146)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2XQt-000000004nY-3sq1;
 Fri, 04 Sep 2026 17:10:32 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>
Date: Fri,  4 Sep 2026 19:10:31 +0200
Message-ID: <20260904171031.194697-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/sentry-cli: bump version to 3.7.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/getsentry/sentry-cli/blob/3.7.0/CHANGELOG.md

Removed patch which is not needed anymore.

Updated license hash due to upstream commits:

copyright year bump:
https://github.com/getsentry/sentry-cli/commit/734fa8cddc8308133d6f807cec01a9e5e668aba8

switch to FSL-1.1-MIT license:
https://github.com/getsentry/sentry-cli/commit/3ed4ada174945c83702350ceb83944651f1d8ff2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...able-SSL-support-for-the-curl-module.patch | 62 -------------------
 package/sentry-cli/sentry-cli.hash            |  4 +-
 package/sentry-cli/sentry-cli.mk              |  4 +-
 3 files changed, 4 insertions(+), 66 deletions(-)
 delete mode 100644 package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch

diff --git a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch b/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
deleted file mode 100644
index 819d8016ae..0000000000
--- a/package/sentry-cli/0001-Disable-SSL-support-for-the-curl-module.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 5b4179af15b435a476c006260718d4f6e22ea2ab Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Mon, 31 Jul 2023 22:34:04 +0200
-Subject: [PATCH] Disable SSL support for the curl module
-
-Fixes build with OpenSSL v3.
-
-Downloaded Cargo.toml patch from
-https://cgit.freebsd.org/ports/tree/devel/sentry-cli/files/patch-Cargo.toml
-
-Upstream: https://github.com/getsentry/sentry-cli/issues/1706
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Cargo.lock | 10 ----------
- Cargo.toml |  2 +-
- 2 files changed, 1 insertion(+), 11 deletions(-)
-
-diff --git a/Cargo.lock b/Cargo.lock
-index e5031db..7357215 100644
---- a/Cargo.lock
-+++ b/Cargo.lock
-@@ -1521,15 +1521,6 @@ version = "0.1.5"
- source = "registry+https://github.com/rust-lang/crates.io-index"
- checksum = "ff011a302c396a5197692431fc1948019154afc178baf7d8e37367442a4601cf"
- 
--[[package]]
--name = "openssl-src"
--version = "111.25.0+1.1.1t"
--source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "3173cd3626c43e3854b1b727422a276e568d9ec5fe8cec197822cf52cfb743d6"
--dependencies = [
-- "cc",
--]
--
- [[package]]
- name = "openssl-sys"
- version = "0.9.80"
-@@ -1539,7 +1530,6 @@ dependencies = [
-  "autocfg",
-  "cc",
-  "libc",
-- "openssl-src",
-  "pkg-config",
-  "vcpkg",
- ]
-diff --git a/Cargo.toml b/Cargo.toml
-index c8c9ca9..117e77d 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -25,7 +25,7 @@ clap = { version = "4.1.6", default-features = false, features = [
-   "error-context",
- ] }
- console = "0.15.5"
--curl = { version = "0.4.44", features = ["static-curl", "static-ssl"] }
-+curl = { version = "0.4.44" }
- dirs = "4.0.0"
- dotenv = "0.15.0"
- elementtree = "1.2.3"
--- 
-2.39.2
-
diff --git a/package/sentry-cli/sentry-cli.hash b/package/sentry-cli/sentry-cli.hash
index 0b1ef402e1..af50304475 100644
--- a/package/sentry-cli/sentry-cli.hash
+++ b/package/sentry-cli/sentry-cli.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256  19d62065788c0b72d54875e834462f444204fcae99fe76f69a836cc17a7a0935  sentry-cli-2.20.3-cargo6.tar.gz
-sha256  9503def7b54ceb6e3cd182fd59bc05d3a30d7eae481e65aaba4b495133c83c14  LICENSE
+sha256  bf37c6beeebd1b1d7302e61653083f4d7bcfdb6ef7a8081d42b0bcd8ea2e677a  sentry-cli-3.7.0-cargo6.tar.gz
+sha256  f8171b7a645bca1eff1e69f911dc4c1fa93bf92a2f7d4d7fa24b4b7660c33041  LICENSE
diff --git a/package/sentry-cli/sentry-cli.mk b/package/sentry-cli/sentry-cli.mk
index 3ddf5e44fc..ff49f479a8 100644
--- a/package/sentry-cli/sentry-cli.mk
+++ b/package/sentry-cli/sentry-cli.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SENTRY_CLI_VERSION = 2.20.3
+SENTRY_CLI_VERSION = 3.7.0
 SENTRY_CLI_SITE = $(call github,getsentry,sentry-cli,$(SENTRY_CLI_VERSION))
-SENTRY_CLI_LICENSE = BSD-3-clause
+SENTRY_CLI_LICENSE = FSL-1.1-MIT
 SENTRY_CLI_LICENSE_FILES = LICENSE
 
 HOST_SENTRY_CLI_DEPENDENCIES = host-pkgconf host-openssl host-zlib
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
