Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AB4CD6E6E
	for <buildroot@archiver.kernel.org>; Thu,  4 Jun 2026 20:17:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F7B76F8E9;
	Thu,  4 Jun 2026 20:17:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoUP3-TlDZRl; Thu,  4 Jun 2026 20:17:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 370786F8EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780604251;
	bh=KCyjNlkVcyDrIYSsfZnV0x/P4xsx01IKN5qd8is6BQk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GPMmdcpNoNo/MOaObKoQghcxfTBq5M/POL8DLkfhyveI2L43J4Vuuv5AQ04ToXXv8
	 7Pjdqd7QCF3gvNFtwkxy6PtM5L/T5azJi5ADeXjxhb4fxPPgk3wfS1UwrvWszdPNLk
	 JTDsLv14Iek//UnVMc5hFv2R91rADpxAuvun6PfA+4WUdm8nvJXohi/jEYiGTvXH+C
	 Ri/pC/PyGNMyQD0mwmW+yasyiR6QZEMtfXu6tH6KeZqdfLlBVXR4wAodvEXO5iGs9e
	 4SP4vJMrLnSSQr5e0rm5ZsX1EKEYRoL7MB1jTqTBFEq9CFCPwMygR8U0XNlPmf+QXN
	 BkD6k2P/3rbpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 370786F8EA;
	Thu,  4 Jun 2026 20:17:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C2CD26A
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E489C428C8
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lTzvLsNDAP1 for <buildroot@buildroot.org>;
 Thu,  4 Jun 2026 20:17:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4915428C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4915428C7
 for <buildroot@buildroot.org>; Thu,  4 Jun 2026 20:17:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A64087A97; Thu,  4 Jun 2026 20:17:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 22:08:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4be78ccb572f9e44271becb7af3c1987718456e
X-Git-Newrev: 35b57a0787a07b71051a180ebe2ebaafca989ee7
X-Patchwork-Hint: ignore
Message-Id: <20260604201712.4A64087A97@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libde265: security bump version to
 1.1.1
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
Content-Type: multipart/mixed; boundary="===============3297170199015122701=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3297170199015122701==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35b57a0787a07b71051a180ebe2ebaafca989ee7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/strukturag/libde265/releases/tag/v1.1.1

Fixes the following security problems:

CVE TBD (GHSA-ccfw-29x7-rrx3)
- Pixel accessor signed integer overflow causes heap OOB read/write

CVE TBD (GHSA-j2qq-x2xq-g9wr)
- SAO sequential filter heap buffer overflow via signed integer overflow

This version bump includes upstream commit
https://github.com/strukturag/libde265/commit/9ded37bda4e9fbc2570c0bd710ee407636bc4f34
which uses constexpr() and causes a build error caught by the Gitlab
pipelines with the gcc-6-based bootlin-aarch64-glibc-old defconfig:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/libde265-1.1.1/libde265/deblock.cc:594:14:
 error: expected ‘(’ before ‘constexpr’
           if constexpr (sizeof(pixel_t)==1) {

Therefore we need to raise the minimum gcc version according to
https://gcc.gnu.org/projects/cxx-status.html#cxx17 to gcc 7.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libde265/Config.in     | 8 ++++++--
 package/libde265/libde265.hash | 4 ++--
 package/libde265/libde265.mk   | 2 +-
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/libde265/Config.in b/package/libde265/Config.in
index 2436beff41..ca91b0a226 100644
--- a/package/libde265/Config.in
+++ b/package/libde265/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBDE265
 	bool "libde265"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libde265 is an open source implementation of the h.265 video
@@ -8,5 +9,8 @@ config BR2_PACKAGE_LIBDE265
 
 	  https://github.com/strukturag/libde265
 
-comment "libde265 needs a toolchain w/ threads, C++"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+comment "libde265 needs a toolchain w/ threads, C++, gcc >= 7"
+	depends on \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
diff --git a/package/libde265/libde265.hash b/package/libde265/libde265.hash
index 71a0221089..0385364e2e 100644
--- a/package/libde265/libde265.hash
+++ b/package/libde265/libde265.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libde265/releases/tag/v1.1.0
-sha256  afc19dd28e2fc523de5952bba5224ee1d28e286c72436d2843df126cca1181fd  libde265-1.1.0.tar.gz
+# From https://github.com/strukturag/libde265/releases/tag/v1.1.1
+sha256  fd48a927e94ed74fc7ce8829d222b9d8599fcbfe8b6448ba66705babc56ab219  libde265-1.1.1.tar.gz
 # Locally computed
 sha256  02cc1585a20677992e0ba578fa692635dc193735f2691dc81de924b51c4e8020  COPYING
diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 2a10dce6d0..81ffb39501 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDE265_VERSION = 1.1.0
+LIBDE265_VERSION = 1.1.1
 LIBDE265_SITE = https://github.com/strukturag/libde265/releases/download/v$(LIBDE265_VERSION)
 LIBDE265_LICENSE = LGPL-3.0+
 LIBDE265_LICENSE_FILES = COPYING

--===============3297170199015122701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3297170199015122701==--
