Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F9DD3B7E2
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:13:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7407640249;
	Sun,  7 Dec 2025 17:13:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c76xWQKTGJ8R; Sun,  7 Dec 2025 17:13:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5D2C404E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765127623;
	bh=OC5s7LKXcqhFlfyDxHccH2QSP3NowfUf5hCWI16FYFI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JnPQkWeZfAhNtPe0QEIebNxlt37R2sd/jqFGcBz6o6WOPDZUoxPKJW13RGoZcvG8z
	 R1fQk6HGdYQ5aYAAtHjmvA1kXMrmb0vKXM6K5F8Q65fCou0QDb1Mw5FE9gUpYzXdt3
	 cVkO/Sx8I51tpB67X5KXjNgec9PCHVSEWdk/xh3GbRKCsoHYyV9JXCPSv5USAHEaRy
	 vi0iUmydBW3dbgKFiBVft3S100IdMC4gLFxi28C0BVuBoMTTNnzX/DN5Tj/aMRrG80
	 Jla9HXlqPZbHhTUedRFTvbgF0Uaqb3sGtw7AlxcU1HIauy51KmfDgbZ6klkcz6CJed
	 GuUeDYtVeFnJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5D2C404E8;
	Sun,  7 Dec 2025 17:13:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CA8982CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E11640423
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYwyc8YU4rUh for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2FC840449
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2FC840449
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2B80867FB; Sun,  7 Dec 2025 17:13:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 7 Dec 2025 18:09:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd2b3607940123a3aa1ab870e55021f454d19fec
X-Git-Newrev: 442622055d02040a467d19e5573a478a063f0526
X-Patchwork-Hint: ignore
Message-Id: <20251207171336.B2B80867FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xkbutils: bump version
 to 1.0.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=442622055d02040a467d19e5573a478a063f0526
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2024-February/003448.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xkbutils/-/commit/6dbcbb55951efb25af2e38034bdd86fa095aa9e5

Fixes:
https://autobuild.buildroot.net/results/eb7/eb7d32e65eece403538032a9006ea2f573ea10f8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xapp_xkbutils/xapp_xkbutils.hash | 8 ++++----
 package/x11r7/xapp_xkbutils/xapp_xkbutils.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
index 95287956a8..8174781e01 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-July/003186.html
-sha256  f6a4a8e9c54582beb3787b1faa8168caab125c1fee0ca9cfa5b6c9c1df25eea4  xkbutils-1.0.5.tar.xz
-sha512  0d8d460f5e015e9034292688437511068dab61216c2493f2981cfb63aaa012976ac9435c1586a22c0940fbfcb779b48dce9b85832303fe2b854aa945b814ac77  xkbutils-1.0.5.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-February/003448.html
+sha256  31a2bbee1e09ccba01de92897b8f540b545de812f318d31de07bd3a5a75ee25e  xkbutils-1.0.6.tar.xz
+sha512  78fb7ab4ef6642040992529444944080aca7a2ec4118f9a64c45dacc37e4041181df7bcd1f4270e11b9fbc8bd60a131b4702d2aa95741d89c54582ff8a8f896e  xkbutils-1.0.6.tar.xz
 # Locally computed
-sha256  3d67b53c085de6d475705b60855b9277afac5d4c4ec531d0ffd1ef0d00571594  COPYING
+sha256  4e86cc10a286bd6ce91c37143c399b1426058f5a13252a3d4677d58c990cd6df  COPYING
diff --git a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
index 90501908e6..cf63d4bb71 100644
--- a/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
+++ b/package/x11r7/xapp_xkbutils/xapp_xkbutils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XKBUTILS_VERSION = 1.0.5
+XAPP_XKBUTILS_VERSION = 1.0.6
 XAPP_XKBUTILS_SOURCE = xkbutils-$(XAPP_XKBUTILS_VERSION).tar.xz
 XAPP_XKBUTILS_SITE = https://xorg.freedesktop.org/releases/individual/app
 XAPP_XKBUTILS_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
