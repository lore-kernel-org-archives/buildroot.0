Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE24C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 08:55:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD15E80A49;
	Wed, 26 Oct 2022 08:55:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD15E80A49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5HlSSx4t1YSK; Wed, 26 Oct 2022 08:55:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9A8180BD2;
	Wed, 26 Oct 2022 08:55:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9A8180BD2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 562C41BF8B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 323F280BD2
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 08:54:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 323F280BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vAMQhnpRcvN9 for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48BFE80BC2
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48BFE80BC2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 37545870E5; Wed, 26 Oct 2022 08:54:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 10:52:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6c9a95a34eec997168780d9049560f26cfaeb60
X-Git-Newrev: c5b1a0b34a02759ab4ac3a28b01fe50c1b9d2ff2
X-Patchwork-Hint: ignore
Message-Id: <20221026085456.37545870E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/imagemagick: security bump to
 version 7.1.0-51
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5b1a0b34a02759ab4ac3a28b01fe50c1b9d2ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2022-3213: A heap buffer overflow issue was found in
ImageMagick. When an application processes a malformed TIFF file, it
could lead to undefined behavior or a crash causing a denial of
service.

https://github.com/ImageMagick/Website/blob/main/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/imagemagick/imagemagick.hash | 2 +-
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index ff0f3e26c6..8988dad5da 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  3df6ca6dff15a4e8a20b4593c60285a59e38890440494d91a344e5c0e2bb3eec  imagemagick-7.1.0-45.tar.gz
+sha256  4333ef2fe63f2510988af82b726f5b1919ebd54037ea6674566c69fcceb67e11  imagemagick-7.1.0-51.tar.gz
 sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 893606ff01..6bdf24c1e8 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.0-45
+IMAGEMAGICK_VERSION = 7.1.0-51
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
