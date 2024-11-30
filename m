Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DB6E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF8A81F4C;
	Sun,  8 Dec 2024 13:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CMRJz68j-ASR; Sun,  8 Dec 2024 13:09:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98D1581EF8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98D1581EF8;
	Sun,  8 Dec 2024 13:09:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0397D979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7AFD60892
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2gS_3odlgsb for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3EC607C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3EC607C0
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A8B9186B73; Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 30 Nov 2024 23:29:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5b808454f8e11555483dc465098b6d0b2cd677c4
X-Git-Newrev: c47e0483a5835aa609d099f07a7d874d13c6fd33
X-Patchwork-Hint: ignore
Message-Id: <20241208130653.A8B9186B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: bump to version 0.8.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=c47e0483a5835aa609d099f07a7d874d13c6fd33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release has a fix to properly disable assertions in release
builds.

https://gitlab.gnome.org/GNOME/libdex/-/blob/0.8.1/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index 7e08676fe4..d6fba67f32 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.0.sha256sum
-sha256  659ab5d0eb7f10bd36af0cde08055158987690b9714e7f5b001c788ec1d01a25  libdex-0.8.0.tar.xz
+# From https://download.gnome.org/sources/libdex/0.8/libdex-0.8.1.sha256sum
+sha256  955475ad3e43aabd6f6f70435264b5ee77bd265bd95545211fee026b08d378a0  libdex-0.8.1.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index 0d27b35675..381c605b16 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -6,7 +6,7 @@
 
 # The middle number is even for stable releases, odd for development ones.
 LIBDEX_VERSION_MAJOR = 0.8
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
