Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D10E67480
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38354043B;
	Sat, 20 Dec 2025 19:11:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THhCWjMPvC2E; Sat, 20 Dec 2025 19:11:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F12C140418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766257865;
	bh=JmTRPcwq4srKo8YIg9CjlFgnjqDzkDOeBgvowo69rVE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Jvb3vTf4Qg1WVrzuUWo1cyDr/WLoMtsmGkEnqupo+cJTQjw/voFMH4vByYYX+UiFb
	 JGAaMjVPF7Gufr5TOqbpZ9xsNpYwdOXL552CxT5dWVE9gRuFdBRv1vpJ7W3zauVD+P
	 aX7G+mcRUXYsM5LrvLnIV553yjbjnA6wx7oDo+nX5O0S2/vcP3t91K97KTagqB5ACZ
	 BLtUAlXmZrQZL032xRBh3UWamjQgqeXoQfoPStw1ldKAbeX2eLH7UGYyl6iH1V9mMz
	 hQhUsIl0llHLUnFl5KSeo7WM8ryVqFBY42pWTHP5jljtYc+kgIV4OQQk5mspoJ7m5W
	 Ej35ZO5Le48Iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F12C140418;
	Sat, 20 Dec 2025 19:11:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D76B119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E841606A2
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LWsnwt5Vag49 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:11:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93438605F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93438605F1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:11:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 823748753F; Sat, 20 Dec 2025 19:11:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 20:10:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89b94252603ba10872e2ff65124caf7fb95dcf60
X-Git-Newrev: 45a8ed1ef92cb7bd4f8533765bc33f96c1bb4fb0
X-Patchwork-Hint: ignore
Message-Id: <20251220191102.823748753F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglib2: bump version to 2.86.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=45a8ed1ef92cb7bd4f8533765bc33f96c1bb4fb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release Notes: https://gitlab.gnome.org/GNOME/glib/-/releases/2.86.2

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libglib2/libglib2.hash | 4 ++--
 package/libglib2/libglib2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index e4b9a7c5ae..6698db8389 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.86/glib-2.86.1.sha256sum
-sha256  119d1708ca022556d6d2989ee90ad1b82bd9c0d1667e066944a6d0020e2d5e57  glib-2.86.1.tar.xz
+# https://download.gnome.org/sources/glib/2.86/glib-2.86.2.sha256sum
+sha256  8a724e970855357ea8101e27727202392a0ffd5410a98336aed54ec59113e611  glib-2.86.2.tar.xz
 # License files, locally calculated
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index 0957d946bc..1c5109f4ec 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGLIB2_VERSION_MAJOR = 2.86
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).2
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = https://download.gnome.org/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
