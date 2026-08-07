Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E3EEC5AC9E
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8A4E60902;
	Fri,  7 Aug 2026 09:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h4V21BeIGCZO; Fri,  7 Aug 2026 09:35:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D73246090C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095347;
	bh=Ju4WzSZsFa6FAXpC6hSpzEph9y7RsLfYNfgtIa0KEWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vx/tLnGgnHWhuALeZU7JOfK/HCe+aj0XHhZDe6eGogpKtz2/Ml51vzT+DpLENCH1q
	 kKiBU7mv6xU9K6rI9aEcrjRNjeKDHwXyGxTVv2oslTUFglpofGV6FcX1eqWdVjYzui
	 eiwlfic+dWuzPuP82WXd+Johvo2lDR7ZK/OVR1i0FopnCAaOfRR2jtz/e8RKyugTDC
	 O7Rl4dwbgDP+9xIncNbaWh5JE6nmoVsBrjTQfp598rhMjDppwYFZjP3VOKGaP9ETAm
	 aXsyQ7FywASqaYk1O6fZuDoTxdXR+7qg9+m4YnCSDayK4puE9AfhdM1C72BZxwBSc3
	 lDGitgwA5kh0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D73246090C;
	Fri,  7 Aug 2026 09:35:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 35DBA397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C51A409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rao0FanRp3ES for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C9F40A1E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C9F40A1E
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 887B98CA43; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8410c94db50d6d9781cf17272c5244753fd50cef
X-Git-Newrev: faaa3a4b31754ba0b65e7769b0fdb0cceb1a135f
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.887B98CA43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/php: remove
 CFLAGS for OPcache extension
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/faaa3a4b31754ba0b65e7769b0fdb0cceb1a135f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit aedf131da66d2f2ebce64788deab07be17ce33eb bumped the
package to 8.5.0 which made opcache a mandatory dependency but kept the
CFLAGS added in 2015 with buildroot commit
e05476491720f96fcbeb926b4599d111efb598a6.

As it turns out we need to remove the CFLAGS to fix the build with the
bootlin-aarch64-glibc-old defconfig as detected by the Gitlab pipelines:

ext/opcache/shared_alloc_posix.o: In function `create_segments':
shared_alloc_posix.c:(.text+0xcc): undefined reference to `shm_open'
shared_alloc_posix.c:(.text+0x11c): undefined reference to `shm_unlink'
shared_alloc_posix.c:(.text+0x19c): undefined reference to `shm_unlink'
shared_alloc_posix.c:(.text+0x1b8): undefined reference to `shm_unlink'

as they seem to disturb the detection of librt.

It is unclear which upstream commits added since 2015 fixed the original
problem so a backport to LTS branches is not advised.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 623ed7c8c7a01f493427164c98bcc731d035f45a)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/php/php.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index ec69ef18c7..05eb4b9092 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -78,15 +78,6 @@ PHP_CONFIG_SCRIPTS = php-config
 PHP_CFLAGS = $(TARGET_CFLAGS)
 PHP_CXXFLAGS = $(TARGET_CXXFLAGS)
 
-# The OPcache extension isn't cross-compile friendly
-# Throw some defines here to avoid patching heavily
-PHP_CFLAGS += \
-	-DHAVE_SHM_IPC \
-	-DHAVE_SHM_MMAP_ANON \
-	-DHAVE_SHM_MMAP_ZERO \
-	-DHAVE_SHM_MMAP_POSIX \
-	-DHAVE_SHM_MMAP_FILE
-
 # We need to force dl "detection"
 ifeq ($(BR2_STATIC_LIBS),)
 PHP_CONF_ENV += ac_cv_func_dlopen=yes ac_cv_lib_dl_dlopen=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
