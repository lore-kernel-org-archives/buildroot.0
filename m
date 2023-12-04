Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78811C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 07:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 257C68148E;
	Mon,  4 Dec 2023 07:31:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 257C68148E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M99wfCqpmLcD; Mon,  4 Dec 2023 07:31:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66A6A8131A;
	Mon,  4 Dec 2023 07:31:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A6A8131A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 138751BF33C
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E023860A6B
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 07:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E023860A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYLOUc9LJalT for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 07:31:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1008660807
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 07:31:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1008660807
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6499387952; Mon,  4 Dec 2023 07:31:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Dec 2023 08:30:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df812ace329b2ba78df11b42be33f618dc61f5c8
X-Git-Newrev: 6517a7f4bcccab6f75e0df4e0e1bec03ffc273c4
X-Patchwork-Hint: ignore
Message-Id: <20231204073134.6499387952@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lttng-modules: bump to version
 2.13.10
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
Content-Type: multipart/mixed; boundary="===============7619148772359504709=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7619148772359504709==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=6517a7f4bcccab6f75e0df4e0e1bec03ffc273c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failures with kernel >= 6.3.0
thanks to
https://github.com/lttng/lttng-modules/commit/f3559e5b06b24ad0336211950792fa97398c5e9a
and
https://github.com/lttng/lttng-modules/commit/939200ef160c95c8a9d71fd80c99f42a1de0a9f0:

In file included from /home/buildroot/autobuild/instance-1/output-1/build/lttng-modules-2.13.7/./src/lttng-ring-buffer-client.h:16,
                 from /home/buildroot/autobuild/instance-1/output-1/build/lttng-modules-2.13.7/./src/lttng-ring-buffer-client-discard.c:16:
/home/buildroot/autobuild/instance-1/output-1/build/lttng-modules-2.13.7/./src/../include/lttng/events-internal.h:292:9: error: unknown type name ‘uuid_le’
  292 |         uuid_le uuid;                   /* Trace session unique ID (copy) */
      |         ^~~~~~~

[...]

/home/thomas/autobuild/instance-3/output-1/build/lttng-modules-2.13.7/./src/lib/ringbuffer/ring_buffer_mmap.c: In function ‘lib_ring_buffer_mmap_buf’:
/home/thomas/autobuild/instance-3/output-1/build/lttng-modules-2.13.7/./src/lib/ringbuffer/ring_buffer_mmap.c:116:23: error: assignment of read-only member ‘vm_flags’
  116 |         vma->vm_flags |= VM_DONTEXPAND;
      |                       ^~

https://github.com/lttng/lttng-modules/blob/v2.13.10/ChangeLog

Fixes:
 - http://autobuild.buildroot.org/results/7b8f57262a02cd9aaa953a9d8666646bae1cc655

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index e685cc3367..b14b488837 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.7.tar.bz2.sha256
-sha256  5a99679df7903160cbde3918fee5af90ffafc90fc96ccdefaa57cf230492b234  lttng-modules-2.13.7.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.13.10.tar.bz2.sha256
+sha256  13abfb1ac870711f0d0adfa88e53b17deb2e3052173715a260a6ef14aa45b0a7  lttng-modules-2.13.10.tar.bz2
 
 # Hash for license files
 sha256  d72921266bc8452a8789f8a04a82755373990d00b7e0b0f1a8edb8f854e94d1c  LICENSES/LGPL-2.1
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index 416833f4ef..d6f1e4114d 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.13.7
+LTTNG_MODULES_VERSION = 2.13.10
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)

--===============7619148772359504709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7619148772359504709==--
