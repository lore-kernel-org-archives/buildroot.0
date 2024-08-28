Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5731C54757
	for <buildroot@archiver.kernel.org>; Wed, 28 Aug 2024 09:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E5C840B3A;
	Wed, 28 Aug 2024 09:20:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKQZzoZSZ6iv; Wed, 28 Aug 2024 09:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B0540B57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B0540B57;
	Wed, 28 Aug 2024 09:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55C391BF3F9
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD9DD400D2
 for <buildroot@lists.busybox.net>; Wed, 28 Aug 2024 09:20:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRB3jRdgGut8 for <buildroot@lists.busybox.net>;
 Wed, 28 Aug 2024 09:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6658240B1F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6658240B1F
 for <buildroot@buildroot.org>; Wed, 28 Aug 2024 09:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C69B0865D3; Wed, 28 Aug 2024 09:20:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Aug 2024 11:10:16 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 4b00891da14eb67f5390a5650c0cf96e7f84cb07
X-Git-Newrev: e3b8078432404c0d4312e5b84788d1dd6502a008
X-Patchwork-Hint: ignore
Message-Id: <20240828092014.C69B0865D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/libgtk3: security
 bump to version 3.24.43
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

commit: https://git.buildroot.net/buildroot/commit/?id=e3b8078432404c0d4312e5b84788d1dd6502a008
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

fix CVE-2024-6655 (Library injection from CWD)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c51f9881d6737ba63ae4ce6f1ea436eeec364e09)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/libgtk3.hash | 4 ++--
 package/libgtk3/libgtk3.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index a1d8b1694d..6a682a7412 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.42.sha256sum
-sha256  50f89f615092d4dd01bbd759719f8bd380e5f149f6fd78a94725e2de112377e2  gtk+-3.24.42.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.43.sha256sum
+sha256  7e04f0648515034b806b74ae5d774d87cffb1a2a96c468cb5be476d51bf2f3c7  gtk+-3.24.43.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 547fd194a5..d6d7c64a54 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).42
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).43
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
