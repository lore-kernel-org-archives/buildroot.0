Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F958C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C833261037
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 01:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C833261037
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A18214254E;
	Wed,  4 Aug 2021 01:14:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KwCZiQPNSUPB; Wed,  4 Aug 2021 01:14:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9A414254A;
	Wed,  4 Aug 2021 01:14:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 261891BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BCDB414C6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5Tv-a7531FG for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:53 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D70141511
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8FCCC89015; Tue,  3 Aug 2021 21:10:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 18:08:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c5b016c618dfc64532e4b431b014900d68905041
X-Git-Newrev: 315ce3264840f827ea15970d7957b170d4cfa171
X-Patchwork-Hint: ignore
Message-Id: <20210803211028.8FCCC89015@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/open62541: disable
 -Werror
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=315ce3264840f827ea15970d7957b170d4cfa171
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable -Werror to avoid the following build failures raised since bump
to version 1.2.2 in commit b436b82411305839abc76bb438fe92661a067526:

/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
   96 |     UA_fd_set(connection->sockfd, &fdset);
      |     ^~~~~~~~~

/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
      |                     ^

Fixes:
 - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
 - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch  | 54 ++++++++++++++++++++++
 package/open62541/open62541.mk                     |  3 +-
 2 files changed, 56 insertions(+), 1 deletion(-)

diff --git a/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
new file mode 100644
index 0000000000..f912445b7f
--- /dev/null
+++ b/package/open62541/0004-CMakeLists.txt-add-UA_FORCE_WERROR.patch
@@ -0,0 +1,54 @@
+From a439daafdc98391eed13e23f93ecfca81d71c731 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Mon, 2 Aug 2021 09:49:48 +0200
+Subject: [PATCH] CMakeLists.txt: add UA_FORCE_WERROR
+
+Allow the user to disable -Werror to avoid the following build failures:
+
+/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c: In function 'connection_recv':
+/tmp/instance-0/output-1/build/open62541-v1.2.2/arch/network_tcp.c:96:5: error: conversion to 'unsigned int' from 'int' may change the sign of the result [-Werror=sign-conversion]
+   96 |     UA_fd_set(connection->sockfd, &fdset);
+      |     ^~~~~~~~~
+
+/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c: In function 'UA_PubSubChannelUDPMC_receive':
+/tmp/instance-6/output-1/build/open62541-v1.2.2/plugins/ua_pubsub_udp.c:477:21: error: conversion to '__suseconds_t' {aka 'int'} from 'UA_UInt32' {aka 'unsigned int'} may change the sign of the result [-Werror=sign-conversion]
+  477 |     tmptv.tv_usec = (long int)(timeout % 1000000);
+      |                     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/911811de81d8abb2a31feb8f27af1592641c6fbc
+ - http://autobuild.buildroot.org/results/f0187b3f2d62e955fddeef4e90f84ba4fd642bd2
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/open62541/open62541/pull/4572]
+---
+ CMakeLists.txt | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index bc839f27..963460d0 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -292,6 +292,8 @@ if(UA_FORCE_CPP)
+     add_definitions(-D__STDC_CONSTANT_MACROS) # We need the UINT32_C define
+ endif()
+ 
++option(UA_FORCE_WERROR "Force compilation with -Werror" ON)
++
+ #General PubSub setup
+ option(UA_ENABLE_PUBSUB "Enable the PubSub protocol" OFF)
+ 
+@@ -589,7 +591,9 @@ if(NOT UA_FORCE_CPP AND (CMAKE_COMPILER_IS_GNUCC OR "x${CMAKE_C_COMPILER_ID}" ST
+     check_add_cc_flag("-Wall")      # Warnings
+     check_add_cc_flag("-Wextra")    # More warnings
+     check_add_cc_flag("-Wpedantic") # Standard compliance
+-    check_add_cc_flag("-Werror")    # All warnings are errors
++    if(UA_FORCE_WERROR)
++        check_add_cc_flag("-Werror")    # All warnings are errors
++    endif()
+ 
+     check_add_cc_flag("-Wno-static-in-inline") # Clang doesn't like the use of static inline methods inside static inline methods
+     check_add_cc_flag("-Wno-overlength-strings") # May happen in the nodeset compiler when complex values are directly encoded
+-- 
+2.30.2
+
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 9c6468d443..671ec3b2dc 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -19,7 +19,8 @@ OPEN62541_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
 	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
-	-DUA_ENABLE_HARDENING=OFF
+	-DUA_ENABLE_HARDENING=OFF \
+	-DUA_FORCE_WERROR=OFF
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
 OPEN62541_CONF_OPTS += -DUA_NAMESPACE_ZERO=MINIMAL
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
