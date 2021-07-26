Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4C2C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B481860F9B
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B481860F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91D16607C6;
	Mon, 26 Jul 2021 21:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE0PnVWqDwqJ; Mon, 26 Jul 2021 21:43:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC42D607BF;
	Mon, 26 Jul 2021 21:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA8201BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4FCA400C6
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:43:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0GDPqfbld5wK for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E97D4402FE
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:43:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1C34B89015; Mon, 26 Jul 2021 21:08:54 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:42:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c19c8861a1c492a1ed5a03e0013d1243fd3fe937
X-Git-Newrev: b436b82411305839abc76bb438fe92661a067526
X-Patchwork-Hint: ignore
Message-Id: <20210726210854.1C34B89015@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/open62541: bump version to 1.2.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=b436b82411305839abc76bb438fe92661a067526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch   | 2 +-
 package/open62541/open62541.hash                                     | 2 +-
 package/open62541/open62541.mk                                       | 5 ++---
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
index 94ee76ad92..bdf3608041 100644
--- a/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
+++ b/package/open62541/0002-arch-posix-CMakeLists.txt-fix-build-without-threads.patch
@@ -29,7 +29,7 @@ index bb24757c..a53c9f2c 100644
            ua_architecture_append_to_library(m)
 -          #TODO - Error on first make run if pthread is included conditional?
 -          ua_architecture_append_to_library(pthread)
-           if(UA_ENABLE_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
+           if(UA_MULTITHREADING OR UA_BUILD_UNIT_TESTS)
              ua_architecture_append_to_library(pthread)
            endif()
 -- 
diff --git a/package/open62541/open62541.hash b/package/open62541/open62541.hash
index 3da8c8f5fb..5aa340ac18 100644
--- a/package/open62541/open62541.hash
+++ b/package/open62541/open62541.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  36273793e5247586fadaa73c0edad89be610100cbc839d1fb5f567f20c3cbc44  open62541-1.0-br1.tar.gz
+sha256  c59c85b519a18350f5014b6e7b7545ee144ceeb15094e75b0b7ecec7dce43dd0  open62541-v1.2.2-br1.tar.gz
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 3f75196817..9c6468d443 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-OPEN62541_VERSION = 1.0
-OPEN62541_DL_VERSION = v$(OPEN62541_VERSION)
+OPEN62541_VERSION = v1.2.2
 OPEN62541_SITE_METHOD = git
 OPEN62541_SITE = git://github.com/open62541/open62541.git
 OPEN62541_GIT_SUBMODULES = YES
@@ -19,7 +18,7 @@ OPEN62541_LICENSE_FILES = LICENSE
 OPEN62541_CONF_OPTS = \
 	-DCMAKE_BUILD_TYPE=Release \
 	-DGIT_EXECUTABLE=NO \
-	-DOPEN62541_VERSION=v$(OPEN62541_VERSION) \
+	-DOPEN62541_VERSION=$(OPEN62541_VERSION) \
 	-DUA_ENABLE_HARDENING=OFF
 
 ifeq ($(BR2_PACKAGE_OPEN62541_UA_NAMESPACE_ZERO_MINIMAL),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
