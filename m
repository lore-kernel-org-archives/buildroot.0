Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC9AEF4EC4
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 08:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD3E6608C7;
	Mon,  6 Apr 2026 08:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oreRJeCpbVnM; Mon,  6 Apr 2026 08:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D6226080C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775463965;
	bh=x6U53OTJBgmc27Fm9pR+GciECYYKW+F4hqz5yycrFuk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VKlPLvVwChIvqsy5XeD/vOR/hA6GkJmGMBdFQ0jZY9FFT9zCGAGrW6TqMcy53Vad3
	 b5GIeemrf6FkukR6e6JNOlvcO1YQ7DwALYg/NUFOyeo3mLFvm7SvLnwl1djXmdAdXI
	 uwrL+zXKW3gG7VieXZ/jzn9B+ngcZl9jQni35emUkXJHS9SGEfVVU5E/LqwbJRjWMg
	 MPO0RPdCzXUA9F0LBF2NvhQw6wk5OWleRn9jmgcIWjx+CNdbQStOkDHPv7Ljxlknec
	 fhZ/pVdbn6HqBLaMEsq1ZSpYSkMoDBRDyryUOfMCPl/++eyEFSpJzoC+JMi+XhvoHx
	 8b2inkMespwNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6226080C;
	Mon,  6 Apr 2026 08:26:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB7A8219
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CCD88402D1
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwL1bflyquuT for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 08:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB7CA400E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB7CA400E7
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 08:26:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 585808045C; Mon,  6 Apr 2026 08:26:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Apr 2026 10:04:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aad52c6f2da2fbc1658d6a1c69534c427380174d
X-Git-Newrev: 03f4edcdf84149437f847fd314e42bdd2d1c39b3
X-Patchwork-Hint: ignore
Message-Id: <20260406082602.585808045C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mali-driver: bump to version
 2026-04-03
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/03f4edcdf84149437f847fd314e42bdd2d1c39b3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixed build with Linux 7.0

Fixes:
still not occured

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mali-driver/mali-driver.hash | 2 +-
 package/mali-driver/mali-driver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mali-driver/mali-driver.hash b/package/mali-driver/mali-driver.hash
index 9929788a4d..38fe03f459 100644
--- a/package/mali-driver/mali-driver.hash
+++ b/package/mali-driver/mali-driver.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  438bf34c19974a4e53f60cd95c38e5f6d94089284df7d60e773e7e4e9372a716  mali-driver-5731d558a34b82290eaad22a579a1bd8588d26e8.tar.gz
+sha256  12623376da6c8a92c5bbbf5e71d8a61f5b88a0c68a17a0dfda26fb64af2fe00e  mali-driver-fd0865346db356f08295df49f96ce0df47ccdd2f.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mali-driver/mali-driver.mk b/package/mali-driver/mali-driver.mk
index 90aeb9384a..9fde901bbd 100644
--- a/package/mali-driver/mali-driver.mk
+++ b/package/mali-driver/mali-driver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MALI_DRIVER_VERSION = 5731d558a34b82290eaad22a579a1bd8588d26e8
+MALI_DRIVER_VERSION = fd0865346db356f08295df49f96ce0df47ccdd2f
 MALI_DRIVER_SITE = $(call github,bootlin,mali-driver,$(MALI_DRIVER_VERSION))
 MALI_DRIVER_DEPENDENCIES = linux
 MALI_DRIVER_LICENSE = GPL-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
