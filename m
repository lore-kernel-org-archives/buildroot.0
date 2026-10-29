Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFE606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i4Ev5WOE
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CB3560D4D;
	Fri, 30 Oct 2026 14:19:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W95e1g7Viwkf; Fri, 30 Oct 2026 14:19:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C70D60D64
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369997;
	b=CY9uVIqnesWENQA0tyCSPEG6JBOTPvFehvqm/rCgXMHTi1SbL2HFXcnm0pJMFR+l5R9N
	 QnciP7veT375JtCzVuSlhmqsv4MvkGsJ4lKJ4cfLKy1wZAh+T/tLE18QVLcZa9nvWXbfh
	 gMkJZ7KU8ZKGGsyyybfZRUNZaUt9rTY3XvRlkvx/t9wLdmWQX2hC1ckda/Z/jRZVwycrf
	 8Gd/qQIH8yXZIiapyZ4UQxpkB3XbA7eY8JDs/1i09ZfTroNy3RIoeKciQvjO3QUswInZW
	 8KPwWiGHL9Is0jXB7xu7meiUwrvNrf2ZeGBkKEvbe+k7kknLfyNzxzm5qUXFynkf3KQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369997;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=h5lp0gtaybZ29o8+xUBQpgiFIG6f2okp+ZOe17LLRZI=;
	b=AKvNShkbd6RbPTEZ6S3ZurG0H93SInMDxfpn+03sMAV3/W/6Lpc5XBBZ/mtozQGaPtda
	 0frEgX2PtNKxlMJwyQRgMsTKuL5Naw7SqEXQZqf+2wjnW7/xG/PxbFM8jdE4ELclov5B7
	 9KQ04ibSK5CFCfJcGS2pZuM/CfGxr6ZxEhtEwT9lY79lEuly5dieDHOdomFrj3cUSJhXN
	 bNCBKGQoSYeJOVPdRJAfW5U5Ks4efrj0IfQuxOVUTTt0keNuzp7mxWiW3JhUBpbUyHEC9
	 vxBZ9N7e1cdNFsOZ7zxF1mC2JVpcaxVbI4Sbh5tVCRkFpQqkDbWclZ+MtnOMtctzbDQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369997;
	bh=h5lp0gtaybZ29o8+xUBQpgiFIG6f2okp+ZOe17LLRZI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i4Ev5WOEJnYJVA9JWq2e5V+HN5oDJNeReDppvzitBZrfO5yRtYeoIfr2mPt7SGIPN
	 40KRSJRamTMI0QeEYwOs1kjcVfIeUffwZtcgizYWqrfiJ+1rUtZnwwm17GDVN23bOH
	 UiD0dLR3ZoFOskCPWru91oOWMYVozscIp0Hy9H7xGi8cEv3096PMpxKYDByjxeFXZX
	 X5neNLEx0QJ6UL3nCExJ1gkt014/Nu7sCbG0eo00csIigYP2DTV0zR4pVtjaG8uEAW
	 Aem98wCVObekB76W7ESZCj4lGKEcoxc2SGgfecuGRaVd+PteS18NQB5fj3gJ8kt7AB
	 MXnOngVNa9tdg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C70D60D64;
	Fri, 30 Oct 2026 14:19:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2161AD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0681C812F9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jkpRWfg-EYso for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 152B7812E1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369894;
 b=In0uQ9t9da5x2dLH8U//iGdVGuRE3zEJ7HS0lPey31D/nEr2kIExTwvRQP4DwFjHDV/4
 1uUO6pID8qJBi1xu9y2L0BmLU0lq1LdptwnhL4iLX1+0hGMBoOcHRjbZPUzybZCm7O8Kt
 Jb4Y3TJ4s9D2dam0XAhrUxjT9OXguQwVXrj2SK3/BxBpCLOC6RkORWaYk9hVAfrO2IQn1
 i/d1F8fyCHzo60HoJHRrLlHTdrcnE3DqCKTBeXvtEZN4ddZdmE+h2g7PjO/a1NoBHLdhT
 E14VtAODHlWnEfxm6QKBTPj2ZS3fR9850trvdEhwR0wj9FIuFxNujZ3Z5bwO15fPNxA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369894;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QulT8gtnmTTXpoeCJzAiAx6Av/q5mhqfL3d/94q3kXs=;
 b=qrC2r/QOZmXY29BRHzu1q+Exyq9j3tHxs9NsvT+TxokuGV/+CtLhdFK1bt2Q0718PU9y
 8JDq5BCbmtJ5oxClxiVgOM83Et6UnppEP5xQC6rWXKKggnVsQGv137D9Vxtr0Gzd1clTP
 4vUq2Xsl6edYQPZDL+YRHKLHODiuNuhSTgp9QBzhN9/kbtIqBM89yoDZXhMCYmCh0Kiuh
 rwADDPRqSzPnXirdjGPPXsIidAjc/oBjdfyCaS6dpcmAP+E1OST7tyja2eTFSUs1JEV+a
 5tPum67imyG4xYhQ095IGiKVOMx6bGjiyoAPWFYmzY3mOPjKxzZKCxSxbwofxzuxu3Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 152B7812E1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 346789D388; Fri, 30 Oct 2026 14:16:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:10 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: e13239da7fa32d50898f0c5d203d95c436fdb0b0
X-Git-Newrev: b7e08d6de2511b2913b04c9d6f6ca6547bdc9dfa
X-Patchwork-Hint: ignore
Message-Id: <20261030141646.346789D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libnss: bump
 version to 3.127
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
Content-Type: multipart/mixed; boundary="===============4818612077701556133=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4818612077701556133==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b7e08d6de2511b2913b04c9d6f6ca6547bdc9dfa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Rework local patch

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/8c4f491f6746da84126df5c422811e914f12367d/doc/src/releases/nss_3_127.md

NOTE: libnss version 3.127 requires libnspr version 4.39.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix libnspr version typo in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 323f7e8492c87e1b761dbbc7d98fe0c535bd71da)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch | 10 ++++++----
 package/libnss/libnss.hash                                     |  4 ++--
 package/libnss/libnss.mk                                       |  2 +-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
index 1ddfc61576..f2c48c8fee 100644
--- a/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
+++ b/package/libnss/0002-Bug-2027768-Fix-build-failure-due-to-missing-gcm-stu.patch
@@ -1,4 +1,4 @@
-From 974469740e6fa9b7ad15f6d9b3945370dc11fa1e Mon Sep 17 00:00:00 2001
+From 897ebeb9c38d4dc4844f5f414db5aaa17c261eee Mon Sep 17 00:00:00 2001
 From: Giulio Benetti <giulio.benetti@benettiengineering.com>
 Date: Mon, 30 Mar 2026 17:06:14 +0200
 Subject: [PATCH] Bug 2027768 - Fix build failure due to missing gcm stubs if
@@ -16,6 +16,7 @@ DHAVE_PLATFORM_GHASH definition depending on LITTLE_ENDIAN VARIABLE.
 
 Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=2027768
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Giulio: rebased to version 3.127]
 ---
  nss/coreconf/Linux.mk   |  8 ++++++++
  nss/lib/freebl/Makefile | 28 ++++++++++++++++++++++------
@@ -41,7 +42,7 @@ index dcb432415f..cf1f62378d 100644
  ZLIB_LIBS = -lz
  
 diff --git a/lib/freebl/Makefile b/lib/freebl/Makefile
-index 4ee9d61f50..39ef28ec8c 100644
+index 0ab50b093a..21c3cf62d8 100644
 --- a/nss/lib/freebl/Makefile
 +++ b/nss/lib/freebl/Makefile
 @@ -112,7 +112,10 @@ endif
@@ -68,7 +69,7 @@ index 4ee9d61f50..39ef28ec8c 100644
          EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
      else ifeq (1,$(CC_IS_GCC))
          # GCC versions older than 4.9 don't support ARM AES. The check
-@@ -146,18 +152,26 @@ ifeq ($(CPU_ARCH),aarch64)
+@@ -146,11 +152,17 @@ ifeq ($(CPU_ARCH),aarch64)
          # and then rejects any major versions prior to 5. Note that
          # there has been no GCC 4.10, as it was renamed to GCC 5.
          ifneq (,$(filter 4.9,$(word 1,$(GCC_VERSION)).$(word 2,$(GCC_VERSION))))
@@ -88,6 +89,7 @@ index 4ee9d61f50..39ef28ec8c 100644
              EXTRA_SRCS += aes-armv8.c ghash-aarch64.c sha1-armv8.c sha256-armv8.c
          endif
      endif
+@@ -183,7 +195,9 @@ ifeq ($(CPU_ARCH),aarch64)
  endif
  ifeq ($(CPU_ARCH),arm)
  ifndef NSS_DISABLE_ARM32_NEON
@@ -98,7 +100,7 @@ index 4ee9d61f50..39ef28ec8c 100644
      EXTRA_SRCS += ghash-arm32-neon.c
  endif
      ifdef CC_IS_CLANG
-@@ -290,7 +304,9 @@ ifeq ($(CPU_ARCH),arm)
+@@ -316,7 +330,9 @@ ifeq ($(CPU_ARCH),arm)
      MPI_SRCS += mpi_arm.c
  endif
  ifeq ($(CPU_ARCH),ppc)
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 544681c9a4..b87c3376b4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_125_RTM/src/SHA256SUMS
-sha256  1ad541f10da7c58dec01f540ecc44d28cbbc033f741a57473de5a0893d91606d  nss-3.125.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_127_RTM/src/SHA256SUMS
+sha256  5a899cad21ae2c9d3c5132de79726eda8df3b7fdf18eeb239fc544d43b87338b  nss-3.127.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index c01d313da5..734376f61b 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.125
+LIBNSS_VERSION = 3.127
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============4818612077701556133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4818612077701556133==--
