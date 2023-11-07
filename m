Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 455E1C4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 15:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C5741793;
	Tue,  7 Nov 2023 15:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5C5741793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id koVkLZrvnY81; Tue,  7 Nov 2023 15:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F30E41763;
	Tue,  7 Nov 2023 15:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F30E41763
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 231231BF32E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0895041848
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0895041848
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQtlaiZUQL01 for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 15:56:24 +0000 (UTC)
X-Greylist: delayed 693 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 07 Nov 2023 15:56:23 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45DA41844
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E45DA41844
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 15:56:23 +0000 (UTC)
Feedback-ID: 3578:1022:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1849453095; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 07 Nov 2023 15:44:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  7 Nov 2023 10:44:24 -0500
Message-Id: <20231107154424.1602940-1-wdouglass@carnegierobotics.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/opencv4: bump version to 4.8.1
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
From: Woodrow Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woodrow Douglass <wdouglass@carnegierobotics.com>
Cc: Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Also, bump package/opencv4-contrib to keep in lock-step. This should address CVE-2023-2617 and CVE-2023-2618

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index 4f15162e50..954a0c2beb 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1777d5fd2b59029cf537e5fd6f8aa68d707075822f90bde683fcde086f85f7a7  opencv4-contrib-4.6.0.tar.gz
+sha256  0c082a0b29b3118f2a0a1856b403bb098643af7b994a0080f402a12159a99c6e  opencv4-contrib-4.8.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 81c45c6e02..52d2682b26 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_CONTRIB_VERSION = 4.6.0
+OPENCV4_CONTRIB_VERSION = 4.8.1
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = FALSE
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 419b420917..2736752633 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1ec1cba65f9f20fe5a41fda1586e01c70ea0c9a6d7b67c9e13edf0cfe2239277  opencv4-4.6.0.tar.gz
+sha256  62f650467a60a38794d681ae7e66e3e8cfba38f445e0bf87867e2f2cdc8be9d5  opencv4-4.8.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 2a05de42fb..74cec511a9 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV4_VERSION = 4.6.0
+OPENCV4_VERSION = 4.8.1
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
