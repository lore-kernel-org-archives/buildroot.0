Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED5ADC4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 17:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B99E40BBE;
	Wed, 14 Dec 2022 17:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B99E40BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CYYikjyPpfHY; Wed, 14 Dec 2022 17:18:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C53B40BCD;
	Wed, 14 Dec 2022 17:18:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C53B40BCD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B5ECA1BF45A
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 17:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9C8454173E
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 17:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C8454173E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NzMqdBcQaTSe for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 17:18:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D10241740
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D10241740
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 17:18:07 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 18:17:54 +0100
Message-Id: <20221214171754.178428-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1671038284; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=UwhR+5Nfrq2QPj+vW4M3pBH8txv5qReWRQ3dzZrlito=;
 b=kBDNE3QDHl6FB1wf2oj0Jli0w8VNtWKaQweidj0mp09zlY/XJQct07PI5I3m6l70/iyMca
 IfkTP9EMtb6RwnditdaKSKF/kHRiecGcIKkeam7RJUOrv0TcZ8vo91cD6CxrVq2/HKWPYh
 s1ab2e7FuSg3vqDUiRSrhz/aF8t7uDE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=crapouillou.net header.i=@crapouillou.net
 header.a=rsa-sha256 header.s=mail header.b=kBDNE3QD
Subject: [Buildroot] [PATCH] package/lightning: bump version to 2.2.0
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Notable changes in this new version include support for the Apple
Aarch64 ABI, and compare-and-swap atomic instructions.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 ...e.am-don-t-install-lightning.h-twice.patch | 38 -------------------
 package/lightning/lightning.hash              |  2 +-
 package/lightning/lightning.mk                |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch

diff --git a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch b/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
deleted file mode 100644
index fb5299c25f..0000000000
--- a/package/lightning/0001-include-Makefile.am-don-t-install-lightning.h-twice.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 604c931bc673c507254a84c0f423c9ec8ce6e3a1 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 10 Oct 2019 20:36:46 +0200
-Subject: [PATCH] include/Makefile.am: don't install lightning.h twice
-
-Commit 17164ed32d8f3530153b9cad67a4399c65f24512 added lightning.h to
-nodist_include_HEADERS without removing it from include_HEADERS
-
-This raises the following error on one of the buildroot autobuilders:
-/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
-/usr/bin/install -c -m 644 lightning.h '/home/test/autobuild/run/instance-3/output-1/target/usr/include'
-/usr/bin/install: cannot create regular file `/home/test/autobuild/run/instance-3/output-1/target/usr/include/lightning.h': File exists
-
-Fix this by removing lightning.h from include_HEADERS
-
-Fixes:
- - http://autobuild.buildroot.org/results/05ebc75598627d2a08e08e194f51cb8464f97b95
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/Makefile.am | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index e754dd3..8f91594 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -14,7 +14,6 @@
- # License for more details.
- #
- 
--include_HEADERS = lightning.h
- SUBDIRS =		\
- 	lightning
- 
--- 
-2.23.0
-
diff --git a/package/lightning/lightning.hash b/package/lightning/lightning.hash
index 2840a97f91..998ae3743b 100644
--- a/package/lightning/lightning.hash
+++ b/package/lightning/lightning.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ed856b866dc6f68678dc1151579118fab1c65fad687cf847fc2d94ca045efdc9  lightning-2.1.3.tar.gz
+sha256  4e3984ff1ccf0ba30a985211d40fc5c06b25f014ebdf3d80d0fe3d0c80dd7c0e  lightning-2.2.0.tar.gz
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSER
diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index da8c07e61f..572f6d281d 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIGHTNING_VERSION = 2.1.3
+LIGHTNING_VERSION = 2.2.0
 LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
 LIGHTNING_LICENSE = LGPL-3.0+
 LIGHTNING_LICENSE_FILES = COPYING.LESSER
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
