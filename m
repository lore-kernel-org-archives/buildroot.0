Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0453FCD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D095141B62;
	Mon,  4 May 2026 14:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXdYN0tszK3L; Mon,  4 May 2026 14:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC3DD410F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906032;
	bh=1YMqAV6TcixDRyT+BL/whGNCKxpWa05mq67eTwRmVkg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rCgG4Ls5U65/oUiLL2FoHRPqwsAyUmSAC4lwlKDHRN7fD60wxLWkJQKtcmV+vJKrr
	 Sq/V0WZoWlT1GECim9/qBFoP0pdRCltkuGxSmEvwdoX/MJ+MaWHMBJggZ6hwvjG1dt
	 KRZhewatSsoXx8q20YwdZQnDHSkDH73VCDvSvdZAUJOqRqa5STLihl6LiryuhqITnz
	 C1MAwJZSt372IOAoD1RQ97SfiLv9lL+fE4lEhJCyB0v5Ev+eS+JI/d0Gk07tNdrWgb
	 C/k1BRjA4qzBsyQ149EJB+la/46HGsxl9Kt9iy9TdNeTn3RXzj+rPc6iBAdOeRk/1Z
	 LRzR9SVL55hHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC3DD410F8;
	Mon,  4 May 2026 14:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 10AE630A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61B2F844A2
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cT_mpZk2EbUa for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BA95845A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BA95845A0
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 639288427E; Mon,  4 May 2026 14:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:59:04 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 51237f6cf263b2df94be5a2a6a9f4cb9bd68b2a8
X-Git-Newrev: fc8841477ddf5cb474a6e0e4f9fe1712401ae0e0
X-Patchwork-Hint: ignore
Message-Id: <20260504144643.639288427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/log4cxx: bump to
 version 1.6.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fc8841477ddf5cb474a6e0e4f9fe1712401ae0e0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changelog:
https://logging.apache.org/log4cxx/1.6.1/changelog.html

Remove dependency on Boost.DateTime because since Boost 1.77 it's
not a dependency of Boost.Thread anymore and that's the only thing
log4cxx actually requires as fallback.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cff850cfdbe1cd24fd427c3fe2239b61fca35736)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/log4cxx/Config.in    | 1 -
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
index d9daf27eb6..8305217a48 100644
--- a/package/log4cxx/Config.in
+++ b/package/log4cxx/Config.in
@@ -14,7 +14,6 @@ config BR2_PACKAGE_LOG4CXX
 	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	help
 	  Apache log4cxx is a logging framework for C++ patterned
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index d9e9af18cf..f6770e287c 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
-sha512  0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c  apache-log4cxx-1.3.1.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.6.1/apache-log4cxx-1.6.1.tar.gz.sha512
+sha512  6ee406314bd7ab02a46c98cc8a0d5ad5aec8928a23716a81a152775ca315cd3b950d600b2e221d5b4a88416ae9bbda1215fae43626107feea4df2f3e074303ad  apache-log4cxx-1.6.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 4b85adbf92..57f9b1e844 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.3.1
+LOG4CXX_VERSION = 1.6.1
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
