Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783B7C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 20:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEBE980AC4;
	Sat, 12 Sep 2026 20:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8lS5mYWVjbjs; Sat, 12 Sep 2026 20:25:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1AC4D80E55
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789244708;
	b=XV7U+pf/Zo2jol66pue8E4dUD+S+RhkJr3s3eA8xVqqRQgRmJro7hlnpOA1v05soIzg9
	 9s8Edef1QtRiV/TfAunyYHGhQCffdKlZPQr55Qo/nKjAvF8mAWCersWJTa2lxQz5YpAv0
	 /YehLkeOyRe/E8aiSwsEMU6alRvrErtQmhzCkQgDJSRF7Lx8EEDKrSpHN7u7kJExHXq/1
	 u/hPoC47bLgiO3JOp6jzTVOFQ3aU5rJJWszbVRTlsUaQNFAdIuGeX7Hw3xX+l0DWQahFs
	 dDJT4+j6actlUSN83sBiv3r8g6fa7FKbccWjuedcRp+9Yd675l4ZMUHsa+y/kGvI9Ew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789244708;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gTLzNL8erupql88UZ5Gj7zNuDbsxkHhIn1PO72z3Qus=;
	b=NPeGGFwJWlPspJ4GQfELdDSjyyAO5qST0aS72WW62Sg9r4HQCHiZH0vsxpSMfvIOb2M9
	 yca9pTiLAiydm4XElTf+b5z3LzLCLLJ8jKddUW48d0pxQ7q4LHJY5kCjncnJl3TF88wtj
	 wQKxwQrzA9WiI9BPTEj2O2h6wmVE9uLEWd0n3BWk8+CLI6IGhJX6dCbQu6RIM5ToU4rIB
	 ctDgfsP5XTwYH5/R3L5Md8aEJryhTdbiPZ75LTE10G1bh6mA7YluIMVzgLYTsdB+McCcg
	 a5ctK30c62jYIXbssQsdLn9ipNX/2mu/J+fz3JUnRp52LQiz5iajFzuZ+76BnR9pHUQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789244708;
	bh=gTLzNL8erupql88UZ5Gj7zNuDbsxkHhIn1PO72z3Qus=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gtqQDo/HRPUOs82pRElV/Vhf1nupbx4biMNaBqicqqQseZoAJElpZiZ3fGQPRw52q
	 OBdaPAsnBxEgEcwjUXJOkRg16EG/0auuzm9VSahkjURXpylPnn4gKZepYntcjP+HzH
	 CCoMVgtWSWlW4+cbPVbnqwyh5Vpu8ZEwF7Qr2YYJSbCn/Hl6KKxCag9j5OZMmUeHxd
	 8jHZebnAxXJIT7b43uEcVLBJsAA5SDmpIAvLdGQSTu8UoxVO8C/ahuk2icHrxP3SMM
	 Vn85aSFCfyny5SO4qpLWgYeticoS7wH6sipK0wH5/DdvfIqSsWcDT09HKJpGuO8sQ+
	 rFLY4WcUPQutg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1AC4D80E55;
	Sat, 12 Sep 2026 20:25:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9599D32F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E0C40575
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zc62hHmRNRvc for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 20:25:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 041F74032E
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789244705;
 b=NrZ/g98U/4v4pb7nav/y8mLoPnsRSwd3pgzRpkNsS2umIQsk2k/Szh59B+LC9qPLKVOD
 exVRwnRDT2MpjCJttnnM+TZBKRZ1sWE/t0VhCeeQvfOrwO4K/sNMG+5Fw7OQBsoZg6Hih
 iQQXAI+sYTszuRjUIHi7dY7ea+cxk24hnffU99471v5zuSsEu8mIfPdSpueEuVz0rE3D1
 t6K5Aayf1grD3d2wMjrU4bZOA524lbPaxEQO5yNTUll3DLPXemc2JHfXjJkFsypkklBvl
 PUi5uqknDjpqxpGweiam9A00bmm0UbhuHtBh4CPWqt6oILkQxlNCNNgA2Sf3u2G5wNA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789244705;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=9WicQpYDLSiPCJprKYSiiZqPW8Ybh4eKgAunT+Pi82U=;
 b=BYjJt5uMW1g3cR+Z3ZQGXXhH6saOGieqhbiSXIpu1cS8++AKPjdcRpqy5vriQX03SbOA
 cE5LNlye+Q3znOAVQlUHXlBU/3bAryR/h1Y26whtgttOeTu7swiIWp6yvgRWK9vAEr0yl
 VM89vxsP3XDuYwNRYLDEXr5lbfGpmi84wAjNgl0hUmNgzzdtvK6xYfdS4WJU4fRIwo3P5
 g5pFDqtHJSNFg506WqmvSpr6/flCF86ybm0a09UBrl6ZWT4TOhjk4HczSoUldztPZRrpD
 kCr6PPhDSdxHfua30W7Kl42rrF85+kkTiD1fb2UbnvhChBGtUVDRBhctPa0l+LN62Xw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ih+1Ny4f; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Ih+1Ny4f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 041F74032E
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 20:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789244688;
 bh=9WicQpYDLSiPCJprKYSiiZqPW8Ybh4eKgAunT+Pi82U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ih+1Ny4f9ygKBnmcF+b0D4U9SuZFccmOUe2o3oZeunsr2/xsvpZiONyMVl/dNMo1c
 77Kdgdv6NpuLJDcbMophnfs01OJvxGOSvHkywl0eZZ8RWIoQAlgUwFIScUvflmmv2R
 CHBymiWVDj6Cssn7tHv7XDmGOLP7ogtBv4EYBaiI/BQSYsyLYBQAWNUjTrNYRCVak1
 3kiJHP8UnrZcXnFAWjXg/3D4zG1svgZ85T9TrX++Td174+crkluBc36HwpgoPcHAud
 8/d9gAz3U4fyLrkqOprFQl1EG8VEwNaWxu7heYQLb0H0iw+0GY6ls1wk8bJXyc+fIV
 HEPWWtf8jpEfA==
Received: from fli4l.lan.fli4l (p5b3a0da7.dip0.t-ipconnect.de [91.58.13.167])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 94C1CA4C3D96;
 Sat, 12 Sep 2026 22:24:48 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42304)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x5UHI-000000001US-0N8Y;
 Sat, 12 Sep 2026 20:24:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 12 Sep 2026 22:24:47 +0200
Message-ID: <20260912202448.1673161-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260912202448.1673161-1-bernd@kuhls.net>
References: <20260912202448.1673161-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 2/2] package/libressl: security bump version to
 4.3.2
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

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.0-relnotes.txt
"- The mips32 platform is no longer actively supported."

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.0.1-relnotes.txt
Fixes CVE-2025-9230.

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.0-relnotes.txt
"- Fixed compilation for mips32 and reenable CI."

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.1-relnotes.txt
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.1.2-relnotes.txt
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.2.0-relnotes.txt
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.0-relnotes.txt
https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.1-relnotes.txt

https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-4.3.2-relnotes.txt
"This is the first stable release of the 4.3.x branch"

Rebased patch 0001.
Removed patch 0002 which is included in this release.

Updated license hash due to upstream commit
https://github.com/libressl/portable/commit/30598098a5df3059332327fa0c2bb5877740ac5d

Force OpenSSL for sscep due to the usage of NCONF_default()[1] which
was removed from LibreSSL 4.0.0:
https://github.com/libressl/openbsd/commit/646547a8a28c7b6931751a2ab064fd70d5d8cf92

and will cause build errors with this bump.

[1] https://github.com/certnanny/sscep/blob/v0.10.0/src/configuration.c#L37

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/834ad4accb3fc6eaef48724509c893431e9d0c67

with the exception of bootlin-aarch64-glibc-old:
https://gitlab.com/bkuhls/buildroot/-/jobs/16464936859

  ./.libs/libfreeswitch.so: undefined reference to `getentropy'

Freeswitch added the usage of getentropy in version 1.11.0:
https://github.com/signalwire/freeswitch/commit/7f9dd270b492907ddd063be18003e18719bdb80b

getentropy was added in glibc 2.25
https://sourceware.org/git/?p=glibc.git;a=blob;f=NEWS;h=ec15dde7613306cfa574149f61ea38ab3fbba76d;hb=db0242e3023436757bbc7c488a779e6e3343db04#l116

causing a build error with bootlin-aarch64-glibc-old which is based on
glibc 2.24. I found no way to disable freeswitch for this toolchain.

 ...0001-always-expose-SSL_OP_NO_TLSv1_3.patch |  4 ++-
 ...ists-txt-Fix-HOST-variable-for-ppc64.patch | 26 -------------------
 package/libressl/libressl.hash                |  4 +--
 package/libressl/libressl.mk                  |  2 +-
 package/sscep/Config.in                       |  5 ++--
 5 files changed, 9 insertions(+), 32 deletions(-)
 delete mode 100644 package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch

diff --git a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
index 48f3fa16e0..1efb25f1fa 100644
--- a/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
+++ b/package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch
@@ -12,6 +12,8 @@ ssl.c:98:18: error: 'SSL_OP_NO_TLSv1_3' undeclared (first use in this function);
 
 Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 Fetched from: https://github.com/libressl-portable/openbsd/pull/124
+[Bernd: rebased for 4.2.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  include/openssl/ssl.h | 4 ----
  1 file changed, 4 deletions(-)
@@ -20,7 +22,7 @@ diff --git a/include/openssl/ssl.h b/include/openssl/ssl.h
 index 46f24b2ea..4048a6e63 100644
 --- a/include/openssl/ssl.h
 +++ b/include/openssl/ssl.h
-@@ -412,11 +412,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
+@@ -402,11 +402,7 @@ typedef int (*tls_session_secret_cb_fn)(SSL *s, void *secret, int *secret_len,
  #define SSL_OP_NO_TLSv1					0x04000000L
  #define SSL_OP_NO_TLSv1_2				0x08000000L
  #define SSL_OP_NO_TLSv1_1				0x10000000L
diff --git a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch b/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
deleted file mode 100644
index 8da8fedae2..0000000000
--- a/package/libressl/0002-CMakeLists-txt-Fix-HOST-variable-for-ppc64.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d Mon Sep 17 00:00:00 2001
-From: OPNA2608 <opna2608@protonmail.com>
-Date: Fri, 19 Jul 2024 11:41:46 +0200
-Subject: [PATCH] CMakeLists.txt: Fix HOST variable for ppc64
-
-The code here defined HOST_PPC64, but the rest of the build system expects HOST_POWERPC64.
-
-Upstream: https://github.com/libressl/portable/commit/e6c7de3f03c51fbdcf5ad88bf12fe9e128521f0d
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c496ad97b5..670aa9a1a0 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -373,7 +373,7 @@ elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "mips")
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "powerpc")
- 	set(HOST_POWERPC true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
--	set(HOST_PPC64 true)
-+	set(HOST_POWERPC64 true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "riscv64")
- 	set(HOST_RISCV64 true)
- elseif(CMAKE_SYSTEM_PROCESSOR MATCHES "sparc64")
diff --git a/package/libressl/libressl.hash b/package/libressl/libressl.hash
index 692dce28e3..70fe19dce9 100644
--- a/package/libressl/libressl.hash
+++ b/package/libressl/libressl.hash
@@ -1,4 +1,4 @@
 # From https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/SHA256
-sha256  7b031dac64a59eb6ee3304f7ffb75dad33ab8c9d279c847f92c89fb846068f97  libressl-3.9.2.tar.gz
+sha256  edf01aee24c65d69e6a9efcb9d44bcda682ff9d4f3bbbd95e794e1dfa90847b5  libressl-4.3.2.tar.gz
 # Locally computed
-sha256  5c63613f008f16a9c0025c096bbd736cecf720494d121b5c5203e0ec6e5955b1  COPYING
+sha256  9853507b8821c3f277aa60bf554eade41441ef06b2df538d247183ad28789b7f  COPYING
diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
index 7e92ea3a11..2b4e97abf3 100644
--- a/package/libressl/libressl.mk
+++ b/package/libressl/libressl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBRESSL_VERSION = 3.9.2
+LIBRESSL_VERSION = 4.3.2
 LIBRESSL_SITE = https://ftp.openbsd.org/pub/OpenBSD/LibreSSL
 LIBRESSL_LICENSE = ISC (new additions), OpenSSL or SSLeay (original OpenSSL code)
 LIBRESSL_LICENSE_FILES = COPYING
diff --git a/package/sscep/Config.in b/package/sscep/Config.in
index 549c65274b..2e85ea7709 100644
--- a/package/sscep/Config.in
+++ b/package/sscep/Config.in
@@ -1,8 +1,9 @@
 config BR2_PACKAGE_SSCEP
 	bool "sscep"
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
-	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  SSCEP is a client-only implementation of the SCEP
 	  (Cisco System's Simple Certificate Enrollment Protocol).
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
