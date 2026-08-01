Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28544C55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 12:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121C240830;
	Sat,  1 Aug 2026 12:48:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XkaA3Rut4MKH; Sat,  1 Aug 2026 12:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD65740825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785588514;
	bh=6NYqHIgDGEvYOALz6FO/aDCmkP76gXzmsZFv8QBDvSw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UCtLCbK6vk/zsscDNhgCcgEVNEZk+3GElmrw+SHgh5AyXRTn7Mf872VtKWwquSC/2
	 s09P5LdB4zPglZYCLX2OQREjjJVrgAW9N6bsRS0FXKRsoxkEAFtWG6FTnMUuDcEG8s
	 8j1bvugbUpeWU3N78cXMBiVouog2X4gCZyK8y5mpfP0wb6LeMfLtVXxjvVHc0dHTNS
	 U+KBJZqSY9bmTdDEwfKvkIcVn9feFDVHqJRJa4Tb2qoiaq8PO0MnhIDwTISIfvHlhV
	 DqnzadwRww2JxIakmIYjK6O3Z8lR1ZE3KMtDbVuPg33/4KWlQnpL8Yc1EArsJTmyl6
	 k55ADgydoSIRg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD65740825;
	Sat,  1 Aug 2026 12:48:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADAECFE3
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FEA240868
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sbbrdYkfPIBh for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 12:48:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA84440802
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EA84440802
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 12:48:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A06986FE2; Sat,  1 Aug 2026 12:47:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 14:09:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 43e87a583f0761ec12860a3f9a68df7e9a9c0e04
X-Git-Newrev: 623ed7c8c7a01f493427164c98bcc731d035f45a
X-Patchwork-Hint: ignore
Message-Id: <20260801124749.5A06986FE2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php: remove CFLAGS for OPcache
 extension
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/623ed7c8c7a01f493427164c98bcc731d035f45a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 package/php/php.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index 56d66e40d7..0e9e68a5a9 100644
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
