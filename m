Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30FA1C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:09:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0096560EB2
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 21:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0096560EB2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEEA761379;
	Thu, 23 Sep 2021 21:09:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xzsikjBQSUoF; Thu, 23 Sep 2021 21:09:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1032760C06;
	Thu, 23 Sep 2021 21:09:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 735201BF9C2
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 414DE60AFE
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 21:06:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gsKqAEKeMmjT for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D724760643
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 21:06:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 45E7A8D211; Thu, 23 Sep 2021 21:04:42 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 23 Sep 2021 22:23:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3a907a770b88529ea5a93c77cf001096799c556
X-Git-Newrev: 83a0e8dea203dc37c6c207a36b3f46160578dcc2
X-Patchwork-Hint: ignore
Message-Id: <20210923210442.45E7A8D211@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: bump to version 0.12.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=83a0e8dea203dc37c6c207a36b3f46160578dcc2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Switch to cmake-package

https://www.mail-archive.com/announce@apache.org/msg06525.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cxx/0001-fix-build-without-wchar.patch | 55 ----------------------
 package/log4cxx/log4cxx.hash                       |  4 +-
 package/log4cxx/log4cxx.mk                         | 16 ++-----
 3 files changed, 6 insertions(+), 69 deletions(-)

diff --git a/package/log4cxx/0001-fix-build-without-wchar.patch b/package/log4cxx/0001-fix-build-without-wchar.patch
deleted file mode 100644
index fc0e7be5c9..0000000000
--- a/package/log4cxx/0001-fix-build-without-wchar.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From 1fa70eaf24d75e84625f22779ec347fd29bf1ae6 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 24 Sep 2020 08:47:37 +0200
-Subject: [PATCH] fix build without wchar
-
-Disable wencode without wchar or the build will fail on:
-
-odbcappender.cpp: In static member function 'static void log4cxx::db::ODBCAppender::encode(wchar_t**, const LogString&, log4cxx::helpers::Pool&)':
-odbcappender.cpp:362:22: error: 'wencode' is not a member of 'log4cxx::helpers::Transcoder'
-  *dest = Transcoder::wencode(src, p);
-                      ^~~~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/bab5329fdeb894471bfd5192ce04d3fbd2f9be5c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/apache/logging-log4cxx/commit/f171f818c798d48631d5b45851e4593953f31d9c]
----
- src/main/cpp/odbcappender.cpp              | 2 ++
- src/main/include/log4cxx/db/odbcappender.h | 2 ++
- 2 files changed, 4 insertions(+)
-
-diff --git a/src/main/cpp/odbcappender.cpp b/src/main/cpp/odbcappender.cpp
-index 6bfa519e..218df132 100644
---- a/src/main/cpp/odbcappender.cpp
-+++ b/src/main/cpp/odbcappender.cpp
-@@ -357,10 +357,12 @@ void ODBCAppender::setSql(const LogString& s)
- 	}
- }
- 
-+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
- void ODBCAppender::encode(wchar_t** dest, const LogString& src, Pool& p)
- {
- 	*dest = Transcoder::wencode(src, p);
- }
-+#endif
- 
- void ODBCAppender::encode(unsigned short** dest,
- 	const LogString& src, Pool& p)
-diff --git a/src/main/include/log4cxx/db/odbcappender.h b/src/main/include/log4cxx/db/odbcappender.h
-index a26bc35b..fdc144ff 100644
---- a/src/main/include/log4cxx/db/odbcappender.h
-+++ b/src/main/include/log4cxx/db/odbcappender.h
-@@ -300,8 +300,10 @@ class LOG4CXX_EXPORT ODBCAppender : public AppenderSkeleton
- 	private:
- 		ODBCAppender(const ODBCAppender&);
- 		ODBCAppender& operator=(const ODBCAppender&);
-+#if LOG4CXX_WCHAR_T_API || LOG4CXX_LOGCHAR_IS_WCHAR_T || defined(WIN32) || defined(_WIN32)
- 		static void encode(wchar_t** dest, const LogString& src,
- 			log4cxx::helpers::Pool& p);
-+#endif
- 		static void encode(unsigned short** dest, const LogString& src,
- 			log4cxx::helpers::Pool& p);
- }; // class ODBCAppender
diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 535a0c4aac..6fc0d8836e 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/0.11.0/apache-log4cxx-0.11.0.tar.gz.sha512
-sha512  f8aa37c9c094e7a4d6ca92dff13c032f69f1e078c51ea55e284fcb931c13256b08950af3ea6eaf7a12282240f6073e9acab19bfe217f88dbd62a5d2360f3fbdd  apache-log4cxx-0.11.0.tar.gz
+# From https://www.apache.org/dist/logging/log4cxx/0.12.0/apache-log4cxx-0.12.0.tar.gz.sha512
+sha512  00fe571f9c511bf93b17cac8269ce00f7e817e8d723acf62bddff1bbe0e7facd0ab2fd75c01a93870f7e5c66718b2b73fc22c5f193bfd204e34d052b1123e60d  apache-log4cxx-0.12.0.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 075f8cb371..49f4667a9a 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,29 +4,21 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 0.11.0
+LOG4CXX_VERSION = 0.12.0
 LOG4CXX_SITE = http://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
 LOG4CXX_LICENSE = Apache-2.0
 LOG4CXX_LICENSE_FILES = LICENSE
-# error: required file './compile' not found
-LOG4CXX_AUTORECONF = YES
 
 LOG4CXX_CONF_OPTS = \
-	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config \
-	--with-apr-util=$(STAGING_DIR)/usr/bin/apu-1-config \
-	--disable-dot \
-	--disable-doxygen \
-	--disable-html-docs
+	-DAPR_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apr-1-config \
+	-DAPR_UTIL_CONFIG_EXECUTABLE=$(STAGING_DIR)/usr/bin/apu-1-config
 
 LOG4CXX_DEPENDENCIES = apr apr-util
 
 ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 LOG4CXX_DEPENDENCIES += libesmtp
-LOG4CXX_CONF_OPTS += --with-SMTP=libesmtp
-else
-LOG4CXX_CONF_OPTS += --without-SMTP
 endif
 
-$(eval $(autotools-package))
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
