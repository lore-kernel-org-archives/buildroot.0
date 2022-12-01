Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA95C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 485B481E0A;
	Mon,  5 Dec 2022 12:20:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 485B481E0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bMWq3P3NiSf1; Mon,  5 Dec 2022 12:20:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6820781E51;
	Mon,  5 Dec 2022 12:20:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6820781E51
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 702B91BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 277014055D
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 277014055D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JpN23l5th8jF for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38F00405B5
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F00405B5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3692A85B9B; Mon,  5 Dec 2022 11:26:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 1 Dec 2022 22:09:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c45b2f2b9da5109e40a18ffdef379f5112aa7224
X-Git-Newrev: 0d3c376bd8418ada72bda68818efff1d942db61b
X-Patchwork-Hint: ignore
Message-Id: <20221205112612.3692A85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgtk3: bump to version 3.24.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=0d3c376bd8418ada72bda68818efff1d942db61b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libgtk3/0002-fix-introspection-check.patch | 2 +-
 package/libgtk3/0003-disable-atk-bridge.patch      | 2 +-
 package/libgtk3/libgtk3.hash                       | 4 ++--
 package/libgtk3/libgtk3.mk                         | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libgtk3/0002-fix-introspection-check.patch b/package/libgtk3/0002-fix-introspection-check.patch
index b12e1a4fca..7edf7db71f 100644
--- a/package/libgtk3/0002-fix-introspection-check.patch
+++ b/package/libgtk3/0002-fix-introspection-check.patch
@@ -14,7 +14,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1679,7 +1679,10 @@
+@@ -1690,7 +1690,10 @@
  # GObject introspection
  ##################################################
 
diff --git a/package/libgtk3/0003-disable-atk-bridge.patch b/package/libgtk3/0003-disable-atk-bridge.patch
index 09ede96613..390fc012fa 100644
--- a/package/libgtk3/0003-disable-atk-bridge.patch
+++ b/package/libgtk3/0003-disable-atk-bridge.patch
@@ -7,7 +7,7 @@ Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1375,11 +1375,7 @@
+@@ -1386,11 +1386,7 @@
  # Check for Accessibility Toolkit flags
  ########################################
 
diff --git a/package/libgtk3/libgtk3.hash b/package/libgtk3/libgtk3.hash
index c68c6e90f6..1715b94e73 100644
--- a/package/libgtk3/libgtk3.hash
+++ b/package/libgtk3/libgtk3.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.34.sha256sum
-sha256  dbc69f90ddc821b8d1441f00374dc1da4323a2eafa9078e61edbe5eeefa852ec  gtk+-3.24.34.tar.xz
+# From https://download.gnome.org/sources/gtk+/3.24/gtk+-3.24.35.sha256sum
+sha256  ec10fe6d712ef0b3c63b5f932639c9d1ae99fce94f500f6f06965629fef60bd1  gtk+-3.24.35.tar.xz
 
 # Hash for license file:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/libgtk3/libgtk3.mk b/package/libgtk3/libgtk3.mk
index 53d7f6898a..f277fce2ed 100644
--- a/package/libgtk3/libgtk3.mk
+++ b/package/libgtk3/libgtk3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBGTK3_VERSION_MAJOR = 3.24
-LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).34
+LIBGTK3_VERSION = $(LIBGTK3_VERSION_MAJOR).35
 LIBGTK3_SOURCE = gtk+-$(LIBGTK3_VERSION).tar.xz
 LIBGTK3_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK3_VERSION_MAJOR)
 LIBGTK3_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
