Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02883C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 14:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAE33405F2;
	Wed, 27 Jul 2022 14:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE33405F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MTAJNw2pHybg; Wed, 27 Jul 2022 14:48:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C131B405CF;
	Wed, 27 Jul 2022 14:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C131B405CF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 30C8E1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E04FB60C09
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E04FB60C09
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBsWZw9rprMa for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 14:46:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BC6260D74
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 14:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BC6260D74
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C5BF486697; Wed, 27 Jul 2022 14:32:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 16:44:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ddd20eef875ac05c11b1132625b8ef0c991fc75
X-Git-Newrev: 786b7fb110f45d5d766fecd41151497e6e7000ab
X-Patchwork-Hint: ignore
Message-Id: <20220727143225.C5BF486697@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/minizip: use minizip-ng new
 upstream location
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

commit: https://git.buildroot.net/buildroot/commit/?id=786b7fb110f45d5d766fecd41151497e6e7000ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/nmoinvaz/minizip is a symlink to
https://github.com/zlib-ng/minizip-ng

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/minizip/Config.in  | 2 +-
 package/minizip/minizip.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/minizip/Config.in b/package/minizip/Config.in
index e4d185d9d7..98eb4dec16 100644
--- a/package/minizip/Config.in
+++ b/package/minizip/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_MINIZIP
 	  It is compatible with PKZip 2.04g, WinZip, InfoZip,
 	  MimarSinan Codex Suite 2002 tools, and compatible sofware.
 
-	  https://github.com/nmoinvaz/minizip
+	  https://github.com/zlib-ng/minizip-ng
 
 config BR2_PACKAGE_MINIZIP_DEMOS
 	bool "minizip"
diff --git a/package/minizip/minizip.mk b/package/minizip/minizip.mk
index 61936e0568..5adee7c494 100644
--- a/package/minizip/minizip.mk
+++ b/package/minizip/minizip.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MINIZIP_VERSION = 3.0.6
-MINIZIP_SITE = $(call github,nmoinvaz,minizip,$(MINIZIP_VERSION))
+MINIZIP_SITE = $(call github,zlib-ng,minizip-ng,$(MINIZIP_VERSION))
 MINIZIP_DEPENDENCIES = host-pkgconf
 MINIZIP_INSTALL_STAGING = YES
 MINIZIP_CONF_OPTS = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
