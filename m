Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41917C3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 17:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CF7D40680;
	Fri, 16 May 2025 17:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEntLySblWuj; Fri, 16 May 2025 17:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D59640742
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D59640742;
	Fri, 16 May 2025 17:59:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E5882185
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E24DD6121C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MZPZ3jUu--fr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C4660C14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 31C4660C14
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EA8D86CF7; Fri, 16 May 2025 17:59:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 19:57:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6541717ef963bd4e7cf5b902d2ba4781217e99dc
X-Git-Newrev: 10720c036eba57bf6bc6b78b4a8dc5d9f1d6f22e
X-Patchwork-Hint: ignore
Message-Id: <20250516175915.1EA8D86CF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: bump to version 0.10.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=10720c036eba57bf6bc6b78b4a8dc5d9f1d6f22e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On top of a few small features, this release has a few build system
improvements, and in particular improves checking for libatomic and
libucontext.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.10.0/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index d6fba67f32..fa6ff292a3 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.1.sha256sum
-sha256  955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0  libdex-0.8.1.tar.xz
+# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.0.sha256sum
+sha256  98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1  libdex-0.10.0.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 381c605b16..e400757c2a 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # The middle number is even for stable releases, odd for development ones.
-LIBDEX_VERSION_MAJOR = 0.8
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
+LIBDEX_VERSION_MAJOR = 0.10
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
