Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C19EDF152
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 11:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BC17606CE;
	Fri, 13 Feb 2026 11:12:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vM9v-VfQxp8j; Fri, 13 Feb 2026 11:12:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ADBCD606FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770981157;
	bh=fg4tgj+xuVeKY0tjpsBcnPmxIunTXjoYStxsVzaDxM8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FVkQyJS8emQtHJwn1TJiXd8J691iSlU5wLUbc/jTptxXWBifFo/3tFYlLlX0OaL8E
	 bTQBwVXqVkniz8idpzgS2XKL/uG/KBL9f5Ouf/PAofnpu95cMP84ncoFDaqlDEffjz
	 CiwCz2lvvHXEyxCRLYK0+/7ugZNSnv5fDP/7YMJISacYZeLRZ0+1XdvL3BzKQyMaAM
	 LqwinpB38A4ksY67nDghWpO4KqnMIB1eqjfF6nQoYZzyrVf2nGl4l/9a7GOvTi0c52
	 534B5dBWy20t3ie5SHis6oQQLTZgaiaRrPZcaPuvCDIKdHrW396957vFr9Qnc3lEF+
	 xtxILUARX5yfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADBCD606FF;
	Fri, 13 Feb 2026 11:12:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7142EEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6275A40AA1
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T-HPIcgPkfFI for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6C8040988
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B6C8040988
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 994EC86D5A; Fri, 13 Feb 2026 11:12:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Feb 2026 11:54:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 70a16560b21cc8a911031b0457f4159a3eb14cb7
X-Git-Newrev: cff850cfdbe1cd24fd427c3fe2239b61fca35736
X-Patchwork-Hint: ignore
Message-Id: <20260213111234.994EC86D5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: bump to version 1.6.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cff850cfdbe1cd24fd427c3fe2239b61fca35736
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://logging.apache.org/log4cxx/1.6.1/changelog.html

Remove dependency on Boost.DateTime because since Boost 1.77 it's
not a dependency of Boost.Thread anymore and that's the only thing
log4cxx actually requires as fallback.

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
