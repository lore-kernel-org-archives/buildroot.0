Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D7606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rBPmrarb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E8CC60BFC;
	Fri, 30 Oct 2026 14:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1xq5ubKja3Lw; Fri, 30 Oct 2026 14:18:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1C9F460BF7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369930;
	b=ciqo8tnVVJYsbddR+QcKSrJSgjHzScgppM2KCdTeWSMESiR1hUwajl2v3F70XECqoB8s
	 xLL0b3dnyhI1CQ9fTlbYQwnloMbMxzk337kUeasCn/0DiBzTqSLKf/mdLLbzS1A2DpkIE
	 wB2Ka3NhJo9Fl1Iy1+xUL6LMUzGaUpp9xojTB5kEQsL+fCZPGq3KOrFKLAoTQvhYYhZsN
	 qCwkI4r8sjTUlBopbv0NV7KhJowIGQUz+wWHHYrGbzhiLWI66PWcpiz+k7x/G7P96b+xq
	 Yse7AsJT5YQePGIlxP/84HzK+/r2U/SGVDqGWamWHgz6hUgC44S6oO2Byw3OUi24Y6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369930;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=/RfqogbMkGSi3XlWJsTrducMXrzLqKVtADfBnlXl6+s=;
	b=UX5FkL/lrulXmSZHyiz+NOY2DRjj3BMbcfFzjyxxd0zlx8oMZgBscFFANsttmzlnyq8r
	 Ox03sbJOu7fCcpHG6U15IOsrMYbspLqWWFwEDaZ2BRXuegZLsqWMibsbDem+xGkewALsX
	 cQblBR59hJegAMt9MhdzDp0ye5/WoslhvDc2YPbLfKnXrzG5CL2arNyt3CXeMttKZyMXv
	 YBPJof9mIUXeCuMEvr/BU3BnZ8AMwJNAMTeJv5n/8Oyc1JrgoWroeocsr5njXze6B7weN
	 V1zBpz2r4mUxmhitGzEgyf5H/usjaoAVeFZDNaJ1icmEgZFE5yvaadzc2hJJ4aG9J8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369930;
	bh=/RfqogbMkGSi3XlWJsTrducMXrzLqKVtADfBnlXl6+s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rBPmrarbZz1NOuZENIF51yzwtHMtzMG1/tfzk/ycdK2kw3iXOyn5BeG3AxIUwugl1
	 E49ZQN8y0BZ2NwgSB/5Oi1BLFdb8xWR05idkJSDPi+qFCKISdA5LLsRwaClKs0Llmt
	 uXxwVyzaL8VwOwW1XabK4UV1tJkq3g0Hc8yaL9+ZxNychYKcQHIE6ah6zyHu03Pk2W
	 WyP3cgKpAk3qhmqWLclBQevGgKQc0RYKolxDCLpRjkth8+JjzIHSvl1MxVo/CFjSAi
	 7MQ7gYs3mVeEG53DoDtQzS1ZhEZTK0xFPBClzhKGGJvpBQvza6cJ/B+WmSz+9/9Pay
	 ggsGZMl+9Edbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C9F460BF7;
	Fri, 30 Oct 2026 14:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3AB01712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3663A810B7
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hHlO18h1gWim for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org DCF63808AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=L0sqdGnicOOcNngafGbqLvtn2EHFU6dtF0BXU5ZW2YB35C39wnOSddJ08eVIpWCx2WB1
 e6jBuvdjYDW7FL0nklNSzUcDd7pq+R6H1QPhktpmWB8+ZyhHZctPwzR0RRonrMXaOkukW
 ujxDYxfhFtCs0gZSlsBDkFhCh6Kyg47freoI8MlBXXqDFRe7lE47+OrPKnVr/L1cNNqjE
 xBcpzpvdLCH6mpa04BnVMaihg6NTdQacNEl2UYVXJOTJAcISuwYt+XR724Zr51ejucfpx
 Bz1cs/R7khsXuuWKRj5NG4gmwUH7yDHwn9yrVr1PLUOAADjXwug4iQhSjiDZGp0LMNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=khHBAvRgKGzRajMnBy5U/MUtc0n0g0j9KpaxxrKHF08=;
 b=QB/I9+jqsD9OmxcunVZ/sEWVMh1+W54V8IxhsQd+M70qgXflyh3iKqR5g2e9LR676f1c
 KJm0exn9I1boDcMHum8ZlxGDM6ZXV2Gc+5q0PXtrfx3MyUU389CSm8a8K2FH9+iKmn7m9
 J7Bd4ktmNEqAPoZ14vU/Z1mRDDGzZfAqwum4PeYwdTTktY7lpqU52Goq/kRz598oMXleF
 1MYJ67NXQc9trtlHLLn/29ziHRSS+8djDDb+WzIqWb8yHGbyL2NT9CmXGAs93tb+vfYH0
 nAcF+VNFnrQHSfnFCoJE2zP3tXU0V0ZczidbSxTfDmXmw9AyV/UinvzU+AgpYPI5VUg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DCF63808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 084139D388; Fri, 30 Oct 2026 14:16:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:05 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b6e74d2e8bf5de1c0663a3efd0d8db0f09e8f192
X-Git-Newrev: 10df8e9c96751420cb0234efd9294dc7b3bd27b4
X-Patchwork-Hint: ignore
Message-Id: <20261030141637.084139D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libressl:
 security bump version to 4.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3668256558418729895=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3668256558418729895==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/10df8e9c96751420cb0234efd9294dc7b3bd27b4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d6a3f70beeac58b7ac3748a0fd3ea0b2b79e1182)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 .../0001-always-expose-SSL_OP_NO_TLSv1_3.patch     |  4 +++-
 ...MakeLists-txt-Fix-HOST-variable-for-ppc64.patch | 26 ----------------------
 package/libressl/libressl.hash                     |  4 ++--
 package/libressl/libressl.mk                       |  2 +-
 package/sscep/Config.in                            |  5 +++--
 5 files changed, 9 insertions(+), 32 deletions(-)

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

--===============3668256558418729895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3668256558418729895==--
