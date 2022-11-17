Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202FEC4332F
	for <buildroot@archiver.kernel.org>; Thu, 17 Nov 2022 19:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97CBF418F4;
	Thu, 17 Nov 2022 19:45:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97CBF418F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3sh1olO6Cjj; Thu, 17 Nov 2022 19:45:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79A5C417D0;
	Thu, 17 Nov 2022 19:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79A5C417D0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 654811BF3D7
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C63F417D0
 for <buildroot@lists.busybox.net>; Thu, 17 Nov 2022 19:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C63F417D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTIb_-KN5mUC for <buildroot@lists.busybox.net>;
 Thu, 17 Nov 2022 19:45:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AD3B4175E
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AD3B4175E
 for <buildroot@buildroot.org>; Thu, 17 Nov 2022 19:45:07 +0000 (UTC)
Received: from localhost.localdomain ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vkosoCMVUEclovkosoTm6R; Thu, 17 Nov 2022 20:45:06 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 17 Nov 2022 20:45:05 +0100
Message-Id: <20221117194505.949846-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMqthbKd74nd0BopO+kT7oWHEMQ50+mGjC8JCVFTFWp1GOiwtZIWwNbFibOjuPW4w+5jNeGBgQIyM57DDRwaInsn/rwUYDm5mCLEJgotV/YbllKnlict
 slifA21zHcdIIUcXbmjQat58hVS3MV/r6m4z3ObW2li6tqVw30n6+zhPbe+uZ0Wav/kGBFF2ZST9D2Em+IXCrdfYjpR8Lv35HtumGBweVve7jLFwaxQvRWF4
 HzGhB7JLVgu7Lil2k0y2mBDskC5yW09+OCl/EnvA4GpbYy1vsMV8UiscT0g6/sw2pIlIN1SnL//+PvhL/oQFiticDQBSLasMauk0Yi1Q8ZCT6EhRR0byU3md
 VjfUJcQH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668714306; bh=1ZKPLcCqZPyr5UugoIeEy3ZYTqXeSg42GBkUZYWXsCE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ndwd9yQGkV4X519sqBr9vKWyaeuDK8Cx8njhCkqoFcTkWkBaDcex7MqOqgwsXLkzf
 WK4ryDdvW1ThoYrAEeebT5og0z8R/okhGgktFQtf92stH5/7K+VFsreJhahnpAvmXV
 7wS9yr9WIwt3m9AlxfvswHb7W7l8AkJNWvBOCwW6dV//aPPTsM11B0HsFs6Lwe2qWX
 GzUg5q7PykimUo/s4qY0CATUi56VptJib7JuJeXXMFHYVFur7JUOuecHvt3XrSwdxP
 hkUEbghrkUirS0igmqCky7pCARw/I72bvPtY8G67WfWE2ZlAb5innvQ/31WSBUycSX
 KP7rJFsx6ezKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ndwd9yQG
Subject: [Buildroot] [PATCH] package/libnss: fix build failure with make
 4.3.91
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make 4.3.91 doesn't allow to safely override Simple Expanded Variables, so
let's add a patch pending upstream[0] to make those variable Conditional
Expanded.

[0]: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182

Fixes:
http://autobuild.buildroot.net/results/1074143dbea60567cd83be0a23f7c0214d470de9/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...w-overriding-OS_ARCH-OS_TEST-and-OS_.patch | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch

diff --git a/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
new file mode 100644
index 0000000000..7b3abea307
--- /dev/null
+++ b/package/libnss/0001-Bug-1801182-Allow-overriding-OS_ARCH-OS_TEST-and-OS_.patch
@@ -0,0 +1,45 @@
+From a1a5f3afea2ee59bdbb7a74eb2d7f82b635dbd1a Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Thu, 17 Nov 2022 20:38:48 +0100
+Subject: [PATCH] Bug 1801182 - Allow overriding OS_ARCH, OS_TEST and
+ OS_RELEASE in Makefile
+
+Starting from Make 4.3.91 simple expanded variables can't be safely
+overriden via command line anymore, so let's use conditional expanded
+variables to override OS_ARCH, OS_TEST and OS_RELEASE.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+[Upstream status: https://bugzilla.mozilla.org/show_bug.cgi?id=1801182]
+---
+ nss/coreconf/arch.mk | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/nss/coreconf/arch.mk b/nss/coreconf/arch.mk
+index 17e9faeac..85aac9341 100644
+--- a/nss/coreconf/arch.mk
++++ b/nss/coreconf/arch.mk
+@@ -20,17 +20,17 @@
+ # Macros for getting the OS architecture
+ #
+ 
+-OS_ARCH := $(subst /,_,$(shell uname -s))
++OS_ARCH ?= $(subst /,_,$(shell uname -s))
+ 
+ #
+ # Attempt to differentiate between sparc and x86 Solaris
+ #
+ 
+-OS_TEST := $(shell uname -m)
++OS_TEST ?= $(shell uname -m)
+ ifeq ($(OS_TEST),i86pc)
+-    OS_RELEASE := $(shell uname -r)_$(OS_TEST)
++    OS_RELEASE ?= $(shell uname -r)_$(OS_TEST)
+ else
+-    OS_RELEASE := $(shell uname -r)
++    OS_RELEASE ?= $(shell uname -r)
+ endif
+ 
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
