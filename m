Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E4FECD6EA
	for <buildroot@archiver.kernel.org>; Wed, 11 Feb 2026 20:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E64F180D2D;
	Wed, 11 Feb 2026 20:49:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwnY8bJFeXrD; Wed, 11 Feb 2026 20:49:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2C580BB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770842975;
	bh=xDJTKLEuoMyOqK0pC/BWXw/8bYkteOZOD+jt49ytdNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r1hSZm4lFFjCRz42rOuHsRG6TQpIWko1Gq/d2rBkSFCkyZfMqJKdS8+Rzs9GAHmJN
	 d90NOLcaDWYui1jS0jCkXuaMeCDADrsc+hA/mnpBRwtibl+k9aCNFISXINIA3HfRKE
	 yy7bPeUyzNVv7XUDfRvHahy50Jcez6VYx7WIaXrRALGzHzrxe7UvUKM2SvFW19hb8m
	 p/H28d3SGSgsPT2qC4OQ4y80AIh97fzCzfyTaUSomhbRT0yBd1B5h7FSyoeBVgoDmf
	 x8ZxRlzFP9wZXtR2EvThaItt0KNvxR2Ve4noHog2ifcNXZ9LGtCx+lzRyKM7kGDUo5
	 g2FUhwrfW2c1g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2C580BB8;
	Wed, 11 Feb 2026 20:49:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C7D81F6
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7DBBB80B9A
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tKS6TvmIWbyO for <buildroot@buildroot.org>;
 Wed, 11 Feb 2026 20:49:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD8AE80AC1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD8AE80AC1
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:49:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BC74E86C06; Wed, 11 Feb 2026 20:49:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Feb 2026 21:38:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fc9a75807967e684c87cbcafead045ba0b62cc94
X-Git-Newrev: bf832ca167da934e411c90ca95fb5c6245b59861
X-Patchwork-Hint: ignore
Message-Id: <20260211204932.BC74E86C06@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: bump to version
 2026-02-10
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bf832ca167da934e411c90ca95fb5c6245b59861
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This version builds up to Linux version 6.19.

Fixes:
still not happened

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index c6b027f1a3..0c0de10dac 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bbfd78d3342fe8bdef5e37659740f69818aa1b3be3a75e5bb085223d87a2a1d4  mali-driver-ef3da788030833289040e4396bff010edcc2289b.tar.gz
+sha256  cafcf9af1c8ce5045dc0f077c51b87d204ddad6cf7e5db22bbf6a3d4356be972  mali-driver-5c13ca89d83dec3e51ed1880dff726838bfdecd3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 40ae03a1df..77ef8963a5 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = ef3da788030833289040e4396bff010edcc2289b
+MALI_DRIVER_VERSION = 5c13ca89d83dec3e51ed1880dff726838bfdecd3
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
