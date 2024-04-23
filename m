Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24F74C4345F
	for <buildroot@archiver.kernel.org>; Tue, 23 Apr 2024 19:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80F75817ED;
	Tue, 23 Apr 2024 19:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJi6StSguNR3; Tue, 23 Apr 2024 19:17:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E0ED81815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E0ED81815;
	Tue, 23 Apr 2024 19:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 47A031BF27A
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 19:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3415E40506
 for <buildroot@lists.busybox.net>; Tue, 23 Apr 2024 19:17:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9NMU5IsFk36B for <buildroot@lists.busybox.net>;
 Tue, 23 Apr 2024 19:17:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E8839404D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8839404D5
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8839404D5
 for <buildroot@buildroot.org>; Tue, 23 Apr 2024 19:17:22 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 432DCB00583;
 Tue, 23 Apr 2024 21:17:18 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Apr 2024 21:17:12 +0200
Message-ID: <20240423191712.16218-1-ju.o@free.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1713899839;
 bh=zKAkFKp4YJiaXyagjxj/AoutKuqEFciZMkZ84uhCj24=;
 h=From:To:Cc:Subject:Date:From;
 b=MK7BuD8bF6IHM3sudXJs8BoGuCOpZ+14xkZeCk/AzXbqQWKok/FmHYoHfSBuXy/l0
 qoaVO8eK6/oGFodEmPM4PUW5Q8jdnlRk5aSTqQp6MEjgSnXt7Sinuvb3e1xHTkI35p
 gyp4UA5DeXmRNPOomVXJ2uwKgT4RA3ekyAZuOChgVlWPAXCfEjCUpWFWHcqvP9qert
 y2NdXf9crJIzDhnFPgFWlTgDk5jUbvO2RPwG9s6LwBmwkUiAqYfim9jz7m2/4umzGp
 /BdRm7nLHczrhL0khl2i4bjCEdym5BT/JU+4638bctIwY6/KHyCayT3iFWf6HoSM+F
 6rQWausTP+3RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MK7BuD8b
Subject: [Buildroot] [PATCH 1/1] package/imagemagick: bump to version
 7.1.1-31
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see [1].

License hash file changed, due to the addition of an URL. See [2].

Fixes: [3]

Some 32 bit architectures were failing at runtime with the message:

    FATAL: time limit exceeded 'file.png' @ fatal/cache.c/GetImagePixelCache/1702

The fix is included in 7.1.1-23.

[1] https://github.com/ImageMagick/Website/blob/main/ChangeLog.md
[2] https://github.com/ImageMagick/ImageMagick/commit/2c87d7da1b1db4573a37bd7933dfbf772ac3eecf
[3] https://github.com/ImageMagick/ImageMagick/issues/6891

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/imagemagick/imagemagick.hash | 4 ++--
 package/imagemagick/imagemagick.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/imagemagick/imagemagick.hash b/package/imagemagick/imagemagick.hash
index fd80316ec57..30a12220dd6 100644
--- a/package/imagemagick/imagemagick.hash
+++ b/package/imagemagick/imagemagick.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  09402e5f17c6575ef9f010bb2e21ae1710f1f3426f115ad4317ee9129c32608e  imagemagick-7.1.1-21.tar.gz
-sha256  8cceeb67d4e783cb63075c7311fdb990fa0369ee80fbd0f481064cd02386ca2d  LICENSE
+sha256  c82210ea3fdbd044b656ba3d5b42df1da9a18e78fc0e500169bad70d3b0d9ba3  imagemagick-7.1.1-31.tar.gz
+sha256  a556c5292c87c9a6ac795c80669b0c3660f9f729de8c476bf2b10f83ab1b34ec  LICENSE
diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 53cf02abf43..b2d3e755a62 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMAGEMAGICK_VERSION = 7.1.1-21
+IMAGEMAGICK_VERSION = 7.1.1-31
 IMAGEMAGICK_SITE = $(call github,ImageMagick,ImageMagick,$(IMAGEMAGICK_VERSION))
 IMAGEMAGICK_LICENSE = Apache-2.0
 IMAGEMAGICK_LICENSE_FILES = LICENSE
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
