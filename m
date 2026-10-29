Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92932606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=A7AKDio9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F33A812D2;
	Fri, 30 Oct 2026 14:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc1R7K1k6DGK; Fri, 30 Oct 2026 14:07:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7262781330
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369276;
	b=X6NU/YYaGNjNXtygNFn1rAZNMgYgmMGSV9VEd0zc0rF4pETcW0hIKiapzvwM3g46/z0a
	 avZE4lrDaFdYdjkRKzN9Alg5GMlH/6wBXwpyFGPHAtg/TmPUtf36jORfENyuJk2Qc+41N
	 6n74by1i7w7ynIK7I44H74eN3qyCzHTIjiDLPnbudXWz/zxzf2WsEaAPZhzFc88NmbgKQ
	 AR8Z8WSTJRCU9/NXmKlNDaGM/CigNDXym/AGnJ8sQSlpv/U3MyQnRimEwrspBKnv23C0C
	 sDSUHhfAkaoFgyFIVdKsnQEZG1bUc0zTZn67VKAPJ6LPTyxHuyYLiDya3rTYaAnrk+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369276;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=n5hJlRrNox2BYZuSIWQobFr7GlrmgaNz11LmyxmJELs=;
	b=OlWMBESWZR5m0mS86O1wAm/94wouSwlSPS6SbASKaauSLPM+GeZK1Fy6IK1alxgklRCo
	 taKgxgyUgs2Al1TmVABWPW9lPCz7i9IaHQiLyFkl3XwM6v1iWGnvdXhulQxxA5lkGcNiu
	 0vWW9YTbFqUM5vsmsCgSxoFmT4IDcv3KjZz+d9cuH9kKFLAaSFr8qFsoop3CPwq5Oug73
	 KtPXN55uRmqcQUXkuf2dKpmccCanijILrrEu0W8e1k8U22u+9OG6HnW/Y1N7k4D9CfGFx
	 h8lIFbXv9uIIn0FAFwoV+uFauGgWhdrFe6xrx8b49EbfksQvzVwOYBbp9+5Qh6dzW/Q==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369276;
	bh=n5hJlRrNox2BYZuSIWQobFr7GlrmgaNz11LmyxmJELs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=A7AKDio9E7X8QIJ8A1j5vcrOoAsLYcsLmgBagPstFBLsNCCV6SHXXDYPkiF2b3Szq
	 3+Fu3NSyi0CK0HDptrEmelyk1bUchHQbLxAsh5vIOLChPSCUm5Mi/qxUu8SwQ8bRN1
	 Odfs7O2bU4eZiY10o93oVndbg69JBCsNFQT6Vu1/Zu0P8uJK4jrxWwEqh7Rfhf+z8m
	 J+qYoMelsouQE5ABLgvrnG163KoiGYiItGjdtm3rHFV8Y6Xhm3lxuT8TawwU+7Wp/0
	 wGfMvqt0xcRi0xNrsqiZuJRtzA85yW0rh8LuZ6m4jz6WEPsKoeDE5dmQX64u5WxG9V
	 AG9GfdStxcQIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7262781330;
	Fri, 30 Oct 2026 14:07:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26E99D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A81340B1F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ixJTr-UesFk9 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1B76F40B37
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369167;
 b=En/b1gAicRBzg8twkVLynRbFalyWjcW36By91mhLyQOrv8/zN6dv5Va1Igmce0Fu6RM1
 JayOfeNGX4ODEWfO3njhWezz3Uv1HfVmAKGCudFRl87gUlT3XuyhSMCw04r045WYEpEMc
 2pcfMRKORANTPmW96sZ6GELN7NA2dWixoERC1ze+zp57oe79ma9n+bOX8QnDNQvIAI5wD
 jfI1rGMXFUexhOuTCasmSflhMy9PeKHsldOt3b3WcuxM9sC2EM0hbWzPSx7HrpATxTAq+
 Japp2xi9hkUYKCeETcOX5EZwejhuJp9I+qocVoVj3o4LVLiaxmLYkgUI4mqxUugfXLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369167;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=ciulTQ0InOqWvJfatwuqBFMrRnnSFp3qc/SeAe8zp4Y=;
 b=lnqvayNw8qAAwhs4V1DWKUnCDyB2VsWb/gL7dMhIuLZdIJjGSd7HAiPZNtiALx98ui20
 0NufzZk8yqBecmdIYF7nX6wumoG3uIVM3OuK0kj9EvfPxWl2BvsYy+dFD8aLeC+TKbI+7
 JHNCxz7L0LAAMskuAotJnVZaupC3HPt+PrPPPG8Dk7GOdHS8MW9rZqDH5tWQVuRuQ6ZO1
 y4QjV//FQ9xDyT+yvUF1eaZizzhpX6Cqt/XI5q0SEF8kTJqhr5u98gx66IuunK3wlWJ9W
 /e+ikm7OKzI83SwlaJ4UrAabn94GQeI/iD07+GKvFes54MREl8Pq9YHiqfKpJaq19eg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B76F40B37
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B5EB9D388; Fri, 30 Oct 2026 14:04:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:59 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: a4478cf45b5501eca97303c3af3ef4fece14b555
X-Git-Newrev: bb0ff90cc62bf9eeecf2cc86320a63b394856691
X-Patchwork-Hint: ignore
Message-Id: <20261030140439.3B5EB9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
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
Content-Type: multipart/mixed; boundary="===============0379542627446589068=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0379542627446589068==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bb0ff90cc62bf9eeecf2cc86320a63b394856691
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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

--===============0379542627446589068==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0379542627446589068==--
