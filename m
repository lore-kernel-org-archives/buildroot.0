Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BA5C83F10
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 11:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DC4560ACC;
	Sat, 12 Jul 2025 11:38:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xkdm-0ntHbOS; Sat, 12 Jul 2025 11:38:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFE8160899
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFE8160899;
	Sat, 12 Jul 2025 11:38:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92BD31CC
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7906581098
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:38:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ah_ywlDwasCz for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 11:38:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0B3A8108F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0B3A8108F
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 11:38:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B9E198632D; Sat, 12 Jul 2025 11:38:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Jul 2025 13:36:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b0bb896404d90ac7b0f1d78d9ff74163c90d419
X-Git-Newrev: 8f427b78a922b32d2b81d3a28b66ef27933fe417
X-Patchwork-Hint: ignore
Message-Id: <20250712113812.B9E198632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdex: bump to version 0.10.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8f427b78a922b32d2b81d3a28b66ef27933fe417
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is a bugfix release which includes a few improvements and fixes
leaks of Unix signal futures. Release notes:

  https://gitlab.gnome.org/GNOME/libdex/-/blob/0.10.1/NEWS

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdex/libdex.hash | 4 ++--
 package/libdex/libdex.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdex/libdex.hash b/package/libdex/libdex.hash
index fa6ff292a3..6d78b0842a 100644
--- a/package/libdex/libdex.hash
+++ b/package/libdex/libdex.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.0.sha256sum
-sha256  98a69626aa7646ad455bea7a7f92d2a1ffa47e4559a154a1bfe98c16fa711ee1  libdex-0.10.0.tar.xz
+# From https://download.gnome.org/sources/libdex/0.10/libdex-0.10.1.sha256sum
+sha256  7472e88090db2b228307505edeba4483e872681340cb0404ae64ac3da5bed0a6  libdex-0.10.1.tar.xz
 
 # License files
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libdex/libdex.mk b/package/libdex/libdex.mk
index e400757c2a..aea4c60ab7 100644
--- a/package/libdex/libdex.mk
+++ b/package/libdex/libdex.mk
@@ -6,7 +6,7 @@
 
 # The middle number is even for stable releases, odd for development ones.
 LIBDEX_VERSION_MAJOR = 0.10
-LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).0
+LIBDEX_VERSION = $(LIBDEX_VERSION_MAJOR).1
 LIBDEX_SOURCE = libdex-$(LIBDEX_VERSION).tar.xz
 LIBDEX_SITE = https://download.gnome.org/sources/libdex/$(LIBDEX_VERSION_MAJOR)
 LIBDEX_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
