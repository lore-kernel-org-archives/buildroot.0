Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 556E6C0218B
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 09:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0154F846E6;
	Sat, 14 Sep 2024 09:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLIJMBpBWQIk; Sat, 14 Sep 2024 09:23:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C70C846EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C70C846EA;
	Sat, 14 Sep 2024 09:23:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0921BF86C
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80938409B
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 09:22:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1UvQwCaouDkb for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 09:22:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F06CC84095
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F06CC84095
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A67658706C; Sat, 14 Sep 2024 09:22:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 11:22:40 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a862fe17656ff3c2564506c0e8ac4a128d9ef69d
X-Git-Newrev: be2582070d49bf6a11b07bd418a2ce0e663707c4
X-Patchwork-Hint: ignore
Message-Id: <20240914092253.A67658706C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk4: bump to version 4.14.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=be2582070d49bf6a11b07bd418a2ce0e663707c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgtk4/libgtk4.hash | 4 ++--
 package/libgtk4/libgtk4.mk   | 5 ++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libgtk4/libgtk4.hash b/package/libgtk4/libgtk4.hash
index efb944f2ae..636b675d15 100644
--- a/package/libgtk4/libgtk4.hash
+++ b/package/libgtk4/libgtk4.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk/4.12/gtk-4.12.4.sha256sum
-sha256  ba67c6498e5599f928edafb9e08a320adfaa50ab2f0da6fc6ab2252fc2d57520  gtk-4.12.4.tar.xz
+# From https://download.gnome.org/sources/gtk/4.14/gtk-4.14.5.sha256sum
+sha256  5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d  gtk-4.14.5.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk4/libgtk4.mk b/package/libgtk4/libgtk4.mk
index 48bfc80c00..b00a2facad 100644
--- a/package/libgtk4/libgtk4.mk
+++ b/package/libgtk4/libgtk4.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGTK4_VERSION_MAJOR = 4.12
-LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).4
+LIBGTK4_VERSION_MAJOR = 4.14
+LIBGTK4_VERSION = $(LIBGTK4_VERSION_MAJOR).5
 LIBGTK4_SOURCE = gtk-$(LIBGTK4_VERSION).tar.xz
 LIBGTK4_SITE = https://download.gnome.org/sources/gtk/$(LIBGTK4_VERSION_MAJOR)
 LIBGTK4_LICENSE = LGPL-2.0+
@@ -27,7 +27,6 @@ LIBGTK4_DEPENDENCIES = \
 LIBGTK4_CONF_OPTS = \
 	-Dbuild-tests=false \
 	-Dbuild-testsuite=false \
-	-Dmedia-ffmpeg=disabled \
 	-Dprint-cpdb=disabled \
 	-Dvulkan=disabled \
 	-Dcloudproviders=disabled \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
