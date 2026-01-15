Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66473D4662F
	for <buildroot@archiver.kernel.org>; Thu, 15 Jan 2026 22:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0835F4193E;
	Thu, 15 Jan 2026 22:25:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NU4hL7o0_UQ4; Thu, 15 Jan 2026 22:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 092764192E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768515909;
	bh=Cs6n/tBFTf9xG+TSAsYMgSnC+css+/WMigyYNKKfrCE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KcznlBFu65sSrXuRDNOBiG7e4xdZwveUW+OOo1viiwH30sfptbatgQiMAFbaA6TG2
	 gCzSmVFMVe0TODKU9PUhktV14XsgshrJeCTwrnzP6FJkAFwAF+KXSOh5nzYZjWZ53H
	 TIqwGmZXU4vYWP2BfIgUmqPmZTfzE1S0a0uA+osl+31OtHt89SyITGZEThQhFTn6RW
	 3NuzH57bYSSllSzuFBUh5ms9RAuNZ0sf9dg9qla+T0b7SHtfoAzmy5PJktU1Dsoh6b
	 fVxSi4gFGGPTYULmvJscBzlBsWLOC/koMQcHyu0nk6bC0fC84YPe+CqylCJvYJbF9m
	 S0b+Dee9/MFaQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 092764192E;
	Thu, 15 Jan 2026 22:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45096223
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A8984192E
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aT8JmiY_RPl9 for <buildroot@buildroot.org>;
 Thu, 15 Jan 2026 22:25:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B9F741929
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B9F741929
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:25:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93F2C885DC; Thu, 15 Jan 2026 22:25:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Jan 2026 23:13:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f594f86f9d6f6a3b8dcd03d486b0c30a1381e7bd
X-Git-Newrev: 85fa070335cd536793255d8c90fe915e11c3bee8
X-Patchwork-Hint: ignore
Message-Id: <20260115222505.93F2C885DC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libpng: security bump version to
 1.6.54
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

commit: https://git.buildroot.net/buildroot/commit/?id=85fa070335cd536793255d8c90fe915e11c3bee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
