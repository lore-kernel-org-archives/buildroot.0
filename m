Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC97C433EF
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 20:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05A9540143;
	Tue, 17 May 2022 20:16:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jawhpMfyfCJo; Tue, 17 May 2022 20:16:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D35C840133;
	Tue, 17 May 2022 20:16:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B82AA1BF83C
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A1041A57
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXmwmbrL_4jD for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2630541959
 for <buildroot@buildroot.org>; Tue, 17 May 2022 20:15:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E8C8F85F50; Tue, 17 May 2022 20:04:42 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 22:15:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0cbd53ac4a054e94bc7f055bd4087f21a317f5e
X-Git-Newrev: fbd93825978e749f081d2c0bb3b3d6fb7c5324bc
X-Patchwork-Hint: ignore
Message-Id: <20220517200442.E8C8F85F50@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libite: bump version to v2.5.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=fbd93825978e749f081d2c0bb3b3d6fb7c5324bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
 - Add printf format attribute hint to all vararg functions. This will
   help users of these functions by telling CC what to look for

Fixes:
 - Fix fisdir() segfault on GNU/Hurd
 - Fix touch() on Debian/kFreeBSD, use creat() instead of mknod()

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libite/libite.hash | 2 +-
 package/libite/libite.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 1dec65bd6b..8b622d87a9 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Upstream .sha256 from GitHub
-sha256  5278fa0ca933727c78f4e05082cea58256d9302afac30bad0c3760cf2a18ef8f  libite-2.5.1.tar.xz
+sha256  baa9bf9931427ef5e9ddfc5b72139981047a8d0d3c03a534d9716de38cf18bb5  libite-2.5.2.tar.xz
 
 # Locally calculated
 sha256  20db0601195f708d68ff7907907b3cd3b25808efa8332e064b11f00c839a5d2f  LICENSE
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 185ffe77de..66a8253c62 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBITE_VERSION = 2.5.1
+LIBITE_VERSION = 2.5.2
 LIBITE_SOURCE = libite-$(LIBITE_VERSION).tar.xz
 LIBITE_SITE = https://github.com/troglobit/libite/releases/download/v$(LIBITE_VERSION)
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
