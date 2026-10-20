Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5261606A319
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 20:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=E+27jcDR
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B320E80D2B;
	Tue, 20 Oct 2026 20:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MWX3PBDeyv4U; Tue, 20 Oct 2026 20:54:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F52780D2D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792529643;
	b=jpEAZ4Uzt/qTR2+8gS1HV0nhL6NVbWG2HFrQoQUSWvF8hE7nK/wGCFclL4Rj1spQ4oDF
	 Nv8gDEBMbc59Qn79/V3cEukZ2SviTz3tdwme3PBV+gGExW+SErhAhQ7ZiQwEhdhRsmWVE
	 GWR7ZXIba7nrNVyVjBQDodcIPrf19OsntiMYJu0GA0XzhDr5mARUne21QGIYmPFDhjCwu
	 /wkZqt/LXicr+fcUiGGnSRWrgCvFloW19aFgUQ8alUHJKAcfXKL/xC7R1U199csROgrGI
	 YjXNjsJgVqQDa8zkXF8ZuT1HQnjeThc3BWUZn9+dBCpGmddI+7Zw2vpe/hRmAsckHqw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792529643;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Mngl6Bnme0znnE/danYOG5QrFKZqox/+KexUCeFSYOE=;
	b=nFOo9/Z1IPAuHlrLuCpDinfqh93kj6nwkzXh6pGQ+iCJXUEwwsTc/fjV/7M59tjkJ/2F
	 S3pLvCEMnSqV+/jRTRitXj/LyRJLUemlCo1f1ZLeaLPQ/WfLEfby0OJ06HykzbCMbblXq
	 flJ7d1hoKKW8GhIzSUxOrRUk7skUm9KY+vM5JJf7f3ov0JM1+8XNkmZBbyVRtSijBSXqh
	 G/NCi2VrSyvV1YMwW5sRES80GCC3Sa13qiGZqv/Pp3FklWn70D4Fqr3qRVA6IIx47O0hJ
	 7cYSG8L68fujYOlKLpZLaMGE7Uvf7YEgVoDeW4UWwgqZ+bgKd7rb1mk0Sp04cufdV3w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792529643;
	bh=Mngl6Bnme0znnE/danYOG5QrFKZqox/+KexUCeFSYOE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E+27jcDRZPw3zHLhQc0tqJhCfVnPXzQkwreH12StRHhtTGRpWxhh7ZdcnJ3N90b1X
	 d+CDaMj6+dn/bdxoM7fWQNFrp1rwApJvhF50Rp+08x5lAqH9CTDPp3AKFBDGynhIlI
	 ms9LW30J0Kg49LPxvcn5uA+KCBJsnSpaojjiq08CXXt3LtFelQpzrERfQnta8rqH5c
	 vzFOHTsPMTlaVjHGTKg20iu8uGttKRDgzBdBN0s90FQIDHEilIMOggSniFpBZ3AhcD
	 tF9WwqopAtN7chPTl25K0rQ4HPLnc8LaIkMBF5AAXSYX9isvr8SEZcwGCpj+ZnilgX
	 Cb9pEE+AjnNqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F52780D2D;
	Tue, 20 Oct 2026 20:54:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16288255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:54:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07B006070C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:54:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7It3sgwUJ2T for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 20:54:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 71AE360606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792529640;
 b=Q9IGUDTilWSrCwp7edbYQr07t3l+CzRJfb2yzYz7tJ0bcijeDBH0FU0qTAONLb4iNFYg
 GGeO31U6wKnHQb1sugGXdIo8nT5pCYpEHyK7BzYBVSPMVv3JSI12AoUpcgnjSyKiHpm7N
 xL6p60XnuyL3Epu9Cq/Eb0FaaACkDnsHFmiqWXQ/fjQ1XPfFxzsy8mDax6xnMDOEmggia
 uEbYjDexn76cfZegTvZQOJs1ehn5U7PVuvIAFhn/RMcFDizohQDgIB7ikfyFjjGYkx00y
 fKEyORFuSZd/6mAJn7JC9hjzhn8ZVqa38ro7y8Zb4aLG9yXPlNmtUIFUMLz1toSc9iw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792529640;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=MN5jKM0bESiQJbL4z2asGlwF0Sjg7wx77t1CtQytr/w=;
 b=j7gB0cKqK0BivOfOjbetHaeg0FBFGy+C43FxYJ09DKnynnLmdgp729HNlhGbb7pvq8wB
 AcOJGjAKHOAjc0hwJwOl2FYZeZqx0xSKxMAxa9g0R+MJKgsRQaHSm/pUwuWUNaFbKeqEe
 dOJ3tCIQu2unpJRfS2rPvjEGQrIdLxmcKCZlV5rfNWYhbS0rd+VoeHfSyLticl060QeOe
 w+iujPNLcxEQp9ftvoCh9sWZGuhuAfxzFEiB8nOZfIlHhAmfoXsVTHIML7KzCTQO9wO80
 3kxrwODJnIFKthFPOVQCvNLyamaci10UXScxw4rokrKutF7Odeqo9wVjQ39VUa9oEhA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71AE360606
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 20:54:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3880199993; Tue, 20 Oct 2026 20:52:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 22:42:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9ec34dc363d7db8d5bc460d2607b1facf2103961
X-Git-Newrev: d6a3f70beeac58b7ac3748a0fd3ea0b2b79e1182
X-Patchwork-Hint: ignore
Message-Id: <20261020205237.3880199993@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libressl: security bump version to
 4.3.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d6a3f70beeac58b7ac3748a0fd3ea0b2b79e1182
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
