Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D163C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3E246F738;
	Thu, 11 Jan 2024 20:07:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3E246F738
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wiFKgMKS-B4E; Thu, 11 Jan 2024 20:07:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4966C6F7D7;
	Thu, 11 Jan 2024 20:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4966C6F7D7
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AD2531BF966
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:07:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 838246F703
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 838246F703
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MqgnGdhByAQG for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9435C60594
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9435C60594
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8301185ED3; Thu, 11 Jan 2024 20:07:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 21:06:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c07aafa087927ac6f10591bc13e30b7ecd5c7b7f
X-Git-Newrev: 9024e18665232dc4047203edb6d012021baeedfa
X-Patchwork-Hint: ignore
Message-Id: <20240111200704.8301185ED3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/micropython: drop GIT_DIR=.
 workaround
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

commit: https://git.buildroot.net/buildroot/commit/?id=9024e18665232dc4047203edb6d012021baeedfa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it is handled globally in TARGET_MAKE_ENV.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/micropython/micropython.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index e6eb536ea5..3d356c51d8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -14,11 +14,6 @@ MICROPYTHON_LICENSE = MIT, BSD-1-Clause, BSD-3-Clause, Zlib
 MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-pkgconf libffi host-python3
 
-# Set GIT_DIR so package won't use buildroot's version number
-MICROPYTHON_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	GIT_DIR=.
-
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
