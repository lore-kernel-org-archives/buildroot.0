Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04065C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1C9E84820;
	Mon, 19 May 2025 11:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zocvj6rR1AR4; Mon, 19 May 2025 11:01:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB5E18481B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB5E18481B;
	Mon, 19 May 2025 11:01:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 19177193
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2DD00411BB
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovxC28gQZL3R for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C04411AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C04411AD
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E5AF872E7; Mon, 19 May 2025 10:40:04 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 15:31:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2e05f22ff862192a7e512d0db0486351bba94ae8
X-Git-Newrev: f5d4ed04acd448fc70d330edf3c2a6ac886749b1
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.3E5AF872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/psplash: bump to
 revision 53ae74a
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f5d4ed04acd448fc70d330edf3c2a6ac886749b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This includes the following changes:

53ae74a configure.ac: fix autoconf code for img_fullscreen
ec1ed35 configure.ac: standardize default-enabled options
1f64c65 README: Update mailing list to point to yocto-patches ml
b1a75fd psplash: Only define bool if using C standard older than C23
5a32cf6 psplash.c: fix crash from length becoming negative
ecc1913 SECURITY.md: Add file

Signed-off-by: Olivier Benjamin <olivier.benjamin@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/psplash/psplash.hash | 2 +-
 package/psplash/psplash.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/psplash/psplash.hash b/package/psplash/psplash.hash
index 61514f57c0..e28f35b4f3 100644
--- a/package/psplash/psplash.hash
+++ b/package/psplash/psplash.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  06def825088f44422fad8a885077d917db6f47688457d4a0953c2ff6f6036378  psplash-44afb7506d43cca15582b4c5b90ba5580344d75d-git4.tar.gz
+sha256  18efa5f56e5b2ff4e8916b7632e7da59122e33f79bb514a8e225e12931e3ef20  psplash-53ae74a36bf17675228552abb927d2f981940a6a-git4.tar.gz
 sha256  f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505  COPYING
diff --git a/package/psplash/psplash.mk b/package/psplash/psplash.mk
index bb249e7de8..ea57d884d5 100644
--- a/package/psplash/psplash.mk
+++ b/package/psplash/psplash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PSPLASH_VERSION = 44afb7506d43cca15582b4c5b90ba5580344d75d
+PSPLASH_VERSION = 53ae74a36bf17675228552abb927d2f981940a6a
 PSPLASH_SITE = https://git.yoctoproject.org/psplash
 PSPLASH_SITE_METHOD = git
 PSPLASH_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
