Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCBFC3DA4B
	for <buildroot@archiver.kernel.org>; Wed, 17 Jul 2024 14:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D64EF60654;
	Wed, 17 Jul 2024 14:59:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuNKhDM3kRgZ; Wed, 17 Jul 2024 14:59:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1C4F607AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1C4F607AF;
	Wed, 17 Jul 2024 14:59:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C4B51BF20D
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4626B40544
 for <buildroot@lists.busybox.net>; Wed, 17 Jul 2024 14:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-C9gTYchOvx for <buildroot@lists.busybox.net>;
 Wed, 17 Jul 2024 14:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 59A9A40493
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59A9A40493
 for <buildroot@buildroot.org>; Wed, 17 Jul 2024 14:59:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4777D86BB8; Wed, 17 Jul 2024 14:59:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Jul 2024 16:58:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a22f17881cce09c285067be096a683c523620826
X-Git-Newrev: f30386f50868be278fe50f07dcce255851d84d08
X-Patchwork-Hint: ignore
Message-Id: <20240717145903.4777D86BB8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crun: drop libgcrypt dependency
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f30386f50868be278fe50f07dcce255851d84d08
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 4d5fd84496 (package/crun: add libgcrypt optional
dependency, 2022-12-30).

Since bump to 1.15, libgcrypt is not an optional dependency anymore as
it has been droped in 1.14 with
https://github.com/containers/crun/commit/8d96f0884b46765693b6d86125216c895e095ed6

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crun/crun.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/crun/crun.mk b/package/crun/crun.mk
index b48f15304b..be5897dbc2 100644
--- a/package/crun/crun.mk
+++ b/package/crun/crun.mk
@@ -26,10 +26,6 @@ else
 CRUN_CONF_OPTS += --disable-caps
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
-CRUN_DEPENDENCIES += libgcrypt
-endif
-
 ifeq ($(BR2_PACKAGE_LIBSECCOMP),y)
 CRUN_DEPENDENCIES += libseccomp
 CRUN_CONF_OPTS += --enable-seccomp
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
