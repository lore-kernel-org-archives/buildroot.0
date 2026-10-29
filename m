Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C0B606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sg5/Pzc7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80B94811CB;
	Fri, 30 Oct 2026 14:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fkiYJlBxddGN; Fri, 30 Oct 2026 14:06:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5468B811A9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369188;
	b=CKeR676pyCX8fzc2zGIEha3frshENbzsixXcrDaohbxnAJCs8jgCRx9pjTHyJJ5V5SON
	 7qZLc2K8/tc+mPCUU7ovQcAL95YU6e9GHTYs07cOBM5WJNJGyklDzyLMuy76sfsCjoG8q
	 a0vvvaJRWR2w7ykSifZE5aYJpVcEXmPRFN9cTtiGFx/htiB48Aqe5JL7uH41EesqP3Kr4
	 LlpU8V2wrvFzIwbGb3a44J4wVf9zoR/oSLPJFauNwleL9BDtqDghFus+uvxxkunBhkfN6
	 uxsI3pG14PtbiK3XbhmHY6XSPdXJqNDxcIl2NKV4eGT3znRMP4PzgCwmwDOyDRXWlkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369188;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=+l6PJr2clguegwvrelIemXX24kM5vFvSbEfc1r/fQ/g=;
	b=dV5JPVL6zibrpdPLfZhkgoBumbeakUyo3pXuoXjJrXUfK6jA/wfbXxFX4O3ib4V1GK1l
	 2LxaEpEQf6HPdhV90h7IbHVumsjJ0K0D9Sg7R7kBSc/BlmRMqa6HCL51WVAVpDGZCF7Ep
	 9EnS09T+KZIRXtmzBIbfvZ/wUUCqkzsTi8CSwnk0pv+Ors9kHHx43Ll15G41U4MzEVG8s
	 k5l9lQnvsQLeC90MrzteHO9LnVGufjy2L8BlLYDtH7MqtlNqmAya/yHg6/+NNEaQ+lESM
	 rdIiIS2OgZlXvKv+L6jO4XJlhwy/WizZJqi9b3SYGaydCtR+5fzpbq2bpaQoFQk0bdg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369188;
	bh=+l6PJr2clguegwvrelIemXX24kM5vFvSbEfc1r/fQ/g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sg5/Pzc7X+sUoX3Raq7LhWvG8vJWpDsdhP/8IOzqzlLeMsjkzqs9bSbJNqsUFcS7t
	 9v1GrJNuLhaG7rkt0WUvDsFZNcffMNrxErb6GpHkP2qgEmLoTVEuHyoHQKnhJ6QirP
	 X6kPo81HSSHgwrOYHiSfb1aASRXzfb7fu4ZzNs2RkD++XMPxZDL+dboubTo+oADJZ5
	 j8YKFB6TKrPYr2fj0lRp0w73j/8aLEzzuQqNXVgQlMtx/fFR66s/Mxrf1ZUuNZYXRo
	 HZiuFYdCf0TE+zR5H5/vnDAFS59B/VQLUHbCvr7jJFwOkkY8e4IPexhxn3A9WQ4rtr
	 uvqF1d+b7kYsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5468B811A9;
	Fri, 30 Oct 2026 14:06:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08397D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF220607A0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j5WGiZU7VCnt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D899960ABC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369157;
 b=CoLZDermZmAZkyvM9KrUQnkmP5lKjmkeumZFE4ZO51yDYgH5i3jwqSu9g7rHd+xsQSg8
 laLGRe/bWcf4Anbr34iX2FNLbMJMhLKDig1NY09s+IhNm6DB0s10/+I8uCThWbSj1fF00
 hBqWpIoXn30ye1qEQ3r0cn+8q41cFFPCYZYchzS99NlBdUtheBz5S9+q/MnaOzlMh8ddM
 4SxqMoQOdaHp75nSOWBBC7kP5EbzIH1HBDe30I8zKKpTf3pMNMtQFxgAtrz0VGdzfe7K1
 U/6/+9X1AsZOHJWvPGdjns0Aaz0nB432/qQXTdZN4aU3ttvDkZaXu6jcQ1vLYICWItQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369157;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Hz88ieanilwigE5otBUen2W5Y0CRTXoSL2WqI5s7yqw=;
 b=GlWQ2Cd6vvlt+hLX5P3Abex/pwu6cyPYIRJsXrOaZ47JhQjzyH6ViGIAy1QPRmDpq6hs
 h3VrSS+9ByXSveeUTTYA2MZFYnybtWHxfuOSd97w7bco4GDXLjyA7J32K3J71GGxiDGSP
 tPhT906LCM1StBOppWrjUNttGIUaZ8NZsgWg7Iwai+NGomZIGIh9PrelVVeFBeGP1m92h
 /aQtJFA7g6UJKaac4eqmCoI7GnwIOqgyXyxG6cdYbnr82GWXO3gowtD/qOEgAdF36dOTh
 olRZo16CJD/RtUZ5s2i2aV/isEzrvWcetxAYFyDrakbK+NGN0gbZhWRtoNoD8wCeGpQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D899960ABC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:05:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D16C89D388; Fri, 30 Oct 2026 14:04:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5b2e0ab658e50e84483b191dd3b633bca0fe5dba
X-Git-Newrev: d2423524b9ded72911f1dd5945386121b6d5d525
X-Patchwork-Hint: ignore
Message-Id: <20261030140429.D16C89D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libressl:
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
Content-Type: multipart/mixed; boundary="===============8700233629010492341=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8700233629010492341==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2423524b9ded72911f1dd5945386121b6d5d525
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============8700233629010492341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8700233629010492341==--
