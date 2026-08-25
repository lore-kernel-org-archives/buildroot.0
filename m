Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C325C61DBD
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 21:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ED3C80B75;
	Tue, 25 Aug 2026 21:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E7wVj3QnkI-H; Tue, 25 Aug 2026 21:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787692724;
	bh=zZaik87MoIszmN2iO0I2t7PFSydCkUExB3iERALDvss=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tEfmn6u3xS2kpF0TQgQgVXnOoCk6xBHtmTSLiTI1mquqac105QJgmDiObFTEHu3vu
	 U0iy1i4OxgVGQlziNfT17JoMZi7Za5zp0yMlxp830jtpySuYHZIuSe/iHemHwKk/h1
	 qS9oqOOGEXUpIVYtHry+w4AKEN8e8N60/o3xYZy+TBT8unZnu2m0AycDCAnVgCU/Hp
	 1Y+CpLPwbtHFHZ3ZSDL0lRgAZSHysC7n8th23UW+qZEKXASvS2YoDF0ldLpVZOQowV
	 ePPg87cAFZUNu4zVLkyMhccdCWPD94PQC3dgOTWQxTPtWELewczPdo06SPtx01ERhS
	 LDDk5nZqHQK1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25CC980BC0;
	Tue, 25 Aug 2026 21:18:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0105B334
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB0B14008B
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swLsUKdPXeEh for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E7D640055
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 21:18:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54BB791F62; Tue, 25 Aug 2026 21:17:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 25 Aug 2026 23:17:12 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4221e786e0be6efefc4fffbf1ec4ee2c4374e608
X-Git-Newrev: 323f7e8492c87e1b761dbbc7d98fe0c535bd71da
X-Patchwork-Hint: ignore
Message-Id: <20260825211744.54BB791F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libnss: bump version
 to 3.127
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/323f7e8492c87e1b761dbbc7d98fe0c535bd71da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

Rework local patch

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/8c4f491f6746da84126df5c422811e914f12367d/doc/src/releases/nss_3_127.md

NOTE: libnss version 3.127 requires libnspr version 4.39.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[Julien: fix libnspr version typo in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
