Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48510D3F09A
	for <buildroot@archiver.kernel.org>; Wed, 28 Jan 2026 17:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBD5D40A17;
	Wed, 28 Jan 2026 17:21:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TNDk5wIhb7tg; Wed, 28 Jan 2026 17:21:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A52740910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769620915;
	bh=aiIP0BMtMn67BYoy942QGxHV/nsnfdDyGr/LxDe7qGk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EabOcGsLe657rLeqSv+jvmZngo7wMbnx5dKwJ4NryetFOtzgHaMdAWhYWHGzYq5DB
	 Wj6Z4Tmn0RdZzN5OaxcBj36UuFB5Q28JzTwo1N/OLJc55mRFUJ6cdtRaJePQd9Hteq
	 idSoit+Qh70pO/Cmp2hBYH26iXW7K7pLowPrm84lGG3JILvaKfFGVheH2y6/OYXJ4l
	 FHEYbxfHdec36F2PxeuCfOAA5r8Q/IQwIeNJz1I8tA0Y4/WUPbVFw8AOag1eS+sdj5
	 SjiniHfKZT9A7f8V1xUDN210GW3+/LGa7h51HhVVK8HHnnNknWXqihu1zF4vDX3oWM
	 o3F78wpYvETlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A52740910;
	Wed, 28 Jan 2026 17:21:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0DD63B7
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 980076078D
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AXct_ZpblW06 for <buildroot@buildroot.org>;
 Wed, 28 Jan 2026 17:21:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A872560781
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A872560781
 for <buildroot@buildroot.org>; Wed, 28 Jan 2026 17:21:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C28D86080; Wed, 28 Jan 2026 17:21:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Jan 2026 15:38:21 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a307c24c28fa570a3c0a2146ba6e7018336d40c7
X-Git-Newrev: 101bfc10f00bdfab89ba392863b823bc6b513b81
X-Patchwork-Hint: ignore
Message-Id: <20260128172151.9C28D86080@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/libpng: security
 bump version to 1.6.54
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=101bfc10f00bdfab89ba392863b823bc6b513b81
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Release notes:
https://raw.githubusercontent.com/pnggroup/libpng/v1.6.54/ANNOUNCE

* Fixed CVE-2026-22695 (medium severity):
  Heap buffer over-read in `png_image_read_direct_scaled.
  (Reported and fixed by Petr Simecek.)
* Fixed CVE-2026-22801 (medium severity):
  Integer truncation causing heap buffer over-read in `png_image_write_*`

Updated license hash due to copyright year bump:
https://github.com/pnggroup/libpng/commit/9e4e247afbe809bac24bf70f531b23427e3f20ec

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 85fa070335cd536793255d8c90fe915e11c3bee8)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 8 ++++----
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 1e57e1dc33..4cf8718cc6 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.53/
-sha1  90672f16e545e4931abd50d372edef50596a1d46  libpng-1.6.53.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.54/
+sha1  3dcffaeb58daa7b754bebe93cb008342964d9f39  libpng-1.6.54.tar.xz
 # Locally computed:
-sha256  1d3fb8ccc2932d04aa3663e22ef5ef490244370f4e568d7850165068778d98d4  libpng-1.6.53.tar.xz
-sha256  16d9daaafbf63a31a5bdc91d4600972548fef5aaa1244202393288dbd079c49a  LICENSE
+sha256  01c9d8a303c941ec2c511c14312a3b1d36cedb41e2f5168ccdaa85d53b887805  libpng-1.6.54.tar.xz
+sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 7b66f17bbf..d052fa7862 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.53
+LIBPNG_VERSION = 1.6.54
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = https://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
