Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B124DE77188
	for <buildroot@archiver.kernel.org>; Thu, 26 Dec 2024 20:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CDCB40323;
	Thu, 26 Dec 2024 20:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id InRpOxtvJDVJ; Thu, 26 Dec 2024 20:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED4CE40328
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED4CE40328;
	Thu, 26 Dec 2024 20:19:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DF8B8F1B
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:19:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE49E606E9
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GQeia6ej9WjT for <buildroot@buildroot.org>;
 Thu, 26 Dec 2024 20:19:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 657B86075D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 657B86075D
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 657B86075D
 for <buildroot@buildroot.org>; Thu, 26 Dec 2024 20:19:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id D74A5240003;
 Thu, 26 Dec 2024 20:19:21 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2024 21:19:19 +0100
Message-ID: <20241226201920.2233441-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1735244362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=V20DcI/dFlJSvF3VipODIvnFJlia+kw43WP0plG5OLM=;
 b=lA+U59w6I0BJWa315UW1caukqEjTpxZZKSQoDrAa4/9Ii02gJ8mcl2saDY4Dc3DeAaWZZU
 Xl7pnMcGPspdWlFTiIm/h3lTIHUSyRynNf6LrCzs2YLsk4aM5L8pp6Gy3ppKLzyH5Qw59s
 3gGUjXSni0WWUCq2lfKEpsvBhZhgaC7fX3XEQzGH8hnBZ5ACKgcbPs5IHLbKom6V8xAdyg
 PDEMZ61tu/uaGPtp7Gev7uayXuENBaYO8PBy5TxhbxLmKIF6e2PAe4yaWRijCrQViLQxJV
 xrjtoT3DqHHWd5QVcFChB54nOXsKTmxRMUZETdQrJRxXyQDNA7Yhagid0J+bdw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lA+U59w6
Subject: [Buildroot] [PATCH] package/log4cxx: bump to version 1.3.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

According to
https://logging.apache.org/log4cxx/1.3.1/changelog.html:

Release 1.3.1 - 2024-11-30
==========================

This is a minor bugfix release to fix issues found with 1.3.0.
Bug

- Properly prevent undefined behaviour when an appender is deleted without being closed [#431]
- Prevent abnormal termination on exit when using a static NDC/MDC variable [#426]
- Support for std::experimental::optional (in the standard library used by gcc 5.4) [#419]

Release 1.3.0 - 2024-10-21
==========================

Release 1.3.0 includes the following new features:

- Overhead reduction of upto 60% sending logging events to an appender
- Statistics on the AsyncAppender's queue length (in Log4cxx debug output)
- Fuzz tests along with Google OSS-Fuzz integration

The following issues have been addressed:

- MSYS2/MINGW build errors [#389]
- thread_local problems in MSYS2/MINGW [#394]
- A potential 'use after free' fault when using AsyncAppender [#397]

Release 1.2.0 - 2024-01-01
==========================

The following issues have been addressed:

- The locale external character encoding option reverting to US-ASCII [LOGCXX-483]
- A segfault during process exit when log4cxx::LogManager::shutdown is not called [#268] [#219]
- The cmake option to include a MultiprocessRollingFileAppender did not work
- Build failure in a MSYS2 environment
- Format settings (e.g. std::hex) were retained across LOG4CXX_XXXXX macro logging requests
- When the APR library was built without support for threads (APR_HAS_THREADS=0):
    the AsyncAppender and dynamically loaded configuration changes were not available
    a single nested/mapped diagnostic context (NDC/MDC) would be used and updated (without synchronization)
- On Windows, GetThreadDescription() called for each logging event when the thread name was empty [#321]

Release 1.2.0 includes the following new features:

- LOG4CXX_XXXX macros now support logging of QStrings directly
- log4cxx::hexdump function that returns a string of hexadecimal byte values
- Ability to remove a HierarchyEventListener [#233]
- Less string copying when sending a logging event to an appender
- Less frequent mutex contention when logging from multiple threads concurrently [#320]
- Allow thread information to be included in JSON formatted output
- Optional support for logging during process termination [#271]
- A cmake option to place Log4cxx functions in a different namespace [#277]
- Optionally use std::format in LOG4CXX_XXXX_FMT macros instead of fmt::format [#291]
- Support for per object enabling/disabling of logging requests (see log4cxx::LoggerInstancePtr)

Note: the LOG4CXX_CHARSET cmake option (external character encoding) default value has changed to utf-8

Within Buildroot, log4cxx has no reverse dependencies, and we tested
building it with gcc 7.x to verify compatibility with reasonably old
compilers.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/log4cxx/log4cxx.hash | 4 ++--
 package/log4cxx/log4cxx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/log4cxx/log4cxx.hash b/package/log4cxx/log4cxx.hash
index 728d49ee38..d9e9af18cf 100644
--- a/package/log4cxx/log4cxx.hash
+++ b/package/log4cxx/log4cxx.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/logging/log4cxx/1.1.0/apache-log4cxx-1.1.0.tar.gz.sha512
-sha512  66a66eab933a6afd0779e3f73f65afa4fb82481208b591fd7c7c86ded805f50abcd9cdf954bdb49e1e7f5198e6c1c4fff8a7e180ff5fff9491f1946e9ba6fe2b  apache-log4cxx-1.1.0.tar.gz
+# From https://downloads.apache.org/logging/log4cxx/1.3.1/apache-log4cxx-1.3.1.tar.gz.sha512
+sha512  0956fd034fd1a98d2e48ed461578c1e85da02d176850a580195b6a60b959feaf402a2743cc84ccb5d467dd924ee46422b8a7b39d2be9ee131e4e275e65ba839c  apache-log4cxx-1.3.1.tar.gz
 # Locally computed
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 8024c96d46..2d8d57a612 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LOG4CXX_VERSION = 1.1.0
+LOG4CXX_VERSION = 1.3.1
 LOG4CXX_SITE = https://archive.apache.org/dist/logging/log4cxx/$(LOG4CXX_VERSION)
 LOG4CXX_SOURCE = apache-log4cxx-$(LOG4CXX_VERSION).tar.gz
 LOG4CXX_INSTALL_STAGING = YES
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
