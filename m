Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C56E8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 16:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DBE060B97;
	Thu, 30 Dec 2021 16:37:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sz3k_gCBUjOp; Thu, 30 Dec 2021 16:37:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7E3060B6B;
	Thu, 30 Dec 2021 16:37:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51FCA1BF3CB
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40B6060B6B
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 16:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id siG1jvjhln8I for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 16:37:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88372607F0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 16:37:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5BA3682DDE; Thu, 30 Dec 2021 16:31:18 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 17:36:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2f9523c554ad4a78a6f01b931c8f0a224146a8d
X-Git-Newrev: 6b1a0864b21735db64e7c076e362e1cd7e902755
X-Patchwork-Hint: ignore
Message-Id: <20211230163118.5BA3682DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/at91bootstrap3: add svn repository
 method
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6b1a0864b21735db64e7c076e362e1cd7e902755
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: CHEN Xiangyu <xiangyu.chen@aol.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/at91bootstrap3/Config.in         | 12 +++++++++---
 boot/at91bootstrap3/at91bootstrap3.mk |  4 ++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/boot/at91bootstrap3/Config.in b/boot/at91bootstrap3/Config.in
index 650d3a23c8..b3e18fce7c 100644
--- a/boot/at91bootstrap3/Config.in
+++ b/boot/at91bootstrap3/Config.in
@@ -30,6 +30,12 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
 	  This option allows Buildroot to get the AT91 Bootstrap 3
 	  source code from a Git repository.
 
+config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
+	bool "Custom SVN repository"
+	help
+	  This option allows Buildroot to get the AT91 Bootstrap 3
+	  source code from a Subversion repository
+
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 	bool "Custom tarball"
 
@@ -39,7 +45,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION
 	string "URL of custom AT91Bootstrap tarball"
 	depends on BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
-if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 	string "URL of custom repository"
@@ -47,7 +53,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION
 	string "Custom repository version"
 	help
-	  Revision to use in the typical format used by Git
+	  Revision to use in the typical format used by Git or SVN
 	  E.G. a sha id, a tag, branch, ..
 
 endif
@@ -57,7 +63,7 @@ config BR2_TARGET_AT91BOOTSTRAP3_VERSION
 	default "v4.0.0" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION
 	default "v3.10.3" if BR2_TARGET_AT91BOOTSTRAP3_LATEST_VERSION_3X
 	default BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION \
-		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT
+		if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT || BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN
 	default "custom"	if BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL
 
 config BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_PATCH_DIR
diff --git a/boot/at91bootstrap3/at91bootstrap3.mk b/boot/at91bootstrap3/at91bootstrap3.mk
index 1e2a3a44b0..4bbe7cc718 100644
--- a/boot/at91bootstrap3/at91bootstrap3.mk
+++ b/boot/at91bootstrap3/at91bootstrap3.mk
@@ -15,6 +15,10 @@ else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT),y)
 AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
 AT91BOOTSTRAP3_SITE_METHOD = git
 BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
+else ifeq ($(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_SVN),y)
+AT91BOOTSTRAP3_SITE = $(call qstrip,$(BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL))
+AT91BOOTSTRAP3_SITE_METHOD = svn
+BR_NO_CHECK_HASH_FOR += $(AT91BOOTSTRAP3_SOURCE)
 else
 AT91BOOTSTRAP3_SITE = $(call github,linux4sam,at91bootstrap,$(AT91BOOTSTRAP3_VERSION))
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
