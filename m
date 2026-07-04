Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F8FC43458
	for <buildroot@archiver.kernel.org>; Sat,  4 Jul 2026 14:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F68B80CC3;
	Sat,  4 Jul 2026 14:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsEoE7oaVrHG; Sat,  4 Jul 2026 14:42:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 979C880DE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783176150;
	bh=ty5oZLk93w84x/IPPoGgiWI+G7ZchfRu+aEaZIfWVD4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VMG4anZoGm6uJQh8c2QOIGfTja3i6ZdoLQMoE+ca0QlHY6QJiel48WcULQti5RHiX
	 /0YoE4a036q7etokGSGSNxtORyDpUhOhApkJmz2qUHWwuRALoE3NeDP9qE4toX1UOh
	 2RWlpyenkOHrlvwaQcFhoYAM+Oaei6UHffgGo080ELFdtsDymErr8lshoJnmS2jZCi
	 45+odvMR+9rtg8S+IvWv6t+5A4Gn6i5725Lr6/6CCdir3hRoRoP39CeIEAMglVfx2I
	 QY92iHA1CHC5H+jjRdgyYuDtPhX6S3fwSWNrqlz7QwUErJic5+3Lgy6uE/UPSXCCKQ
	 1eljgzgoulDmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 979C880DE7;
	Sat,  4 Jul 2026 14:42:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3001C363
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16894606C1
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5O_SITMPwrGL for <buildroot@buildroot.org>;
 Sat,  4 Jul 2026 14:42:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 220E3606AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 220E3606AF
 for <buildroot@buildroot.org>; Sat,  4 Jul 2026 14:42:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16CF1883EC; Sat,  4 Jul 2026 14:41:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Jul 2026 16:34:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 275faf6d61d04f1e01df12ef4ce0b0f2710a194f
X-Git-Newrev: 45a0ce557d9508f437dd196eb95107958283abf5
X-Patchwork-Hint: ignore
Message-Id: <20260704144157.16CF1883EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wolfssl: security bump to v5.9.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/45a0ce557d9508f437dd196eb95107958283abf5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For more information about the release, see:

- https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.2-stable

Fixes the following vulnerabilities:

- CVE-2026-6091: https://www.cve.org/CVERecord?id=CVE-2026-6091

- CVE-2026-6092: https://www.cve.org/CVERecord?id=CVE-2026-6092

- CVE-2026-6094: https://www.cve.org/CVERecord?id=CVE-2026-6094

- CVE-2026-6291: https://www.cve.org/CVERecord?id=CVE-2026-6291

- CVE-2026-6325: https://www.cve.org/CVERecord?id=CVE-2026-6325

- CVE-2026-6329: https://www.cve.org/CVERecord?id=CVE-2026-6329

- CVE-2026-6330: https://www.cve.org/CVERecord?id=CVE-2026-6330

- CVE-2026-6331: https://www.cve.org/CVERecord?id=CVE-2026-6331

- CVE-2026-6412: https://www.cve.org/CVERecord?id=CVE-2026-6412

- CVE-2026-6450: https://www.cve.org/CVERecord?id=CVE-2026-6450

- CVE-2026-6678: https://www.cve.org/CVERecord?id=CVE-2026-6678

- CVE-2026-6681: https://www.cve.org/CVERecord?id=CVE-2026-6681

- CVE-2026-6731: https://www.cve.org/CVERecord?id=CVE-2026-6731

- CVE-2026-7511: https://www.cve.org/CVERecord?id=CVE-2026-7511

- CVE-2026-7531: https://www.cve.org/CVERecord?id=CVE-2026-7531

- CVE-2026-7532: https://www.cve.org/CVERecord?id=CVE-2026-7532

- CVE-2026-8720: https://www.cve.org/CVERecord?id=CVE-2026-8720

- CVE-2026-10097: https://www.cve.org/CVERecord?id=CVE-2026-10097

- CVE-2026-10098: https://www.cve.org/CVERecord?id=CVE-2026-10098

- CVE-2026-10512: https://www.cve.org/CVERecord?id=CVE-2026-10512

- CVE-2026-10592: https://www.cve.org/CVERecord?id=CVE-2026-10592

- CVE-2026-11310: https://www.cve.org/CVERecord?id=CVE-2026-11310

- CVE-2026-11703: https://www.cve.org/CVERecord?id=CVE-2026-11703

- CVE-2026-11999: https://www.cve.org/CVERecord?id=CVE-2026-11999

- CVE-2026-12340: https://www.cve.org/CVERecord?id=CVE-2026-12340

- CVE-2026-55958: https://www.cve.org/CVERecord?id=CVE-2026-55958

- CVE-2026-55960: https://www.cve.org/CVERecord?id=CVE-2026-55960

- CVE-2026-55961: https://www.cve.org/CVERecord?id=CVE-2026-55961

- CVE-2026-55962: https://www.cve.org/CVERecord?id=CVE-2026-55962

- CVE-2026-55964: https://www.cve.org/CVERecord?id=CVE-2026-55964

- CVE-2026-55967: https://www.cve.org/CVERecord?id=CVE-2026-55967

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ..._LIMITS_H-in-options.h-rather-than-config.patch | 59 ----------------------
 package/wolfssl/wolfssl.hash                       |  2 +-
 package/wolfssl/wolfssl.mk                         |  2 +-
 3 files changed, 2 insertions(+), 61 deletions(-)

diff --git a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
deleted file mode 100644
index 0599f9d615..0000000000
--- a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
-From: Kareem <kareem@wolfssl.com>
-Date: Fri, 27 Mar 2026 17:01:02 -0700
-Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
- types.h depends on this definition and config.h isn't consistently available
- at runtime. Fixes #9936.
-
-Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cmake/config.in    | 3 ---
- cmake/options.h.in | 3 +++
- configure.ac       | 4 +++-
- 3 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/cmake/config.in b/cmake/config.in
-index f2524e41e43..6054b6dbe7b 100644
---- a/cmake/config.in
-+++ b/cmake/config.in
-@@ -19,9 +19,6 @@
- /* Define to 1 if you have the `gmtime_r' function. */
- #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
- 
--/* Define to 1 if you have the <limits.h> header file. */
--#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
--
- /* Define to 1 if you have the <pcap/pcap.h> header file. */
- #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
- 
-diff --git a/cmake/options.h.in b/cmake/options.h.in
-index 985b54241d6..c46ada8045d 100644
---- a/cmake/options.h.in
-+++ b/cmake/options.h.in
-@@ -33,6 +33,9 @@ extern "C" {
- #endif
- 
- #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
-+/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
-+#undef HAVE_LIMITS_H
-+#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
- #undef _GNU_SOURCE
- #cmakedefine _GNU_SOURCE
- #undef _POSIX_THREADS
-diff --git a/configure.ac b/configure.ac
-index bce600f2ecc..c5cf9f320c7 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -185,7 +185,9 @@ AC_ARG_ENABLE([freebsdkm-crypto-register],
-     [ENABLED_BSDKM_REGISTER=no]
-     )
- 
--AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
-+AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h ctype.h sys/random.h])
-+# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
-+AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
- AC_CHECK_LIB([network],[socket])
- AC_C_BIGENDIAN
- AC_C___ATOMIC
diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.hash
index e1ecd5f98a..c259734875 100644
--- a/package/wolfssl/wolfssl.hash
+++ b/package/wolfssl/wolfssl.hash
@@ -1,5 +1,5 @@
 # Locally computed:
-sha256  d5ca7af48cd2d9a91d539e9baedeba55a0605a28d7ac8b01dc3d5254a13ca341  wolfssl-5.9.1.tar.gz
+sha256  2f4ef3d4fd387a9b3191d36a6316d69116c46ff69bb9583b6c82b36d7b8ca114  wolfssl-5.9.2.tar.gz
 
 # Hash for license files:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
index 44f51e06e6..779fd2cabf 100644
--- a/package/wolfssl/wolfssl.mk
+++ b/package/wolfssl/wolfssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WOLFSSL_VERSION = 5.9.1
+WOLFSSL_VERSION = 5.9.2
 WOLFSSL_SITE = $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-stable)
 WOLFSSL_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
