Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B702EA7197
	for <buildroot@archiver.kernel.org>; Sun, 19 Apr 2026 19:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE7B540D78;
	Sun, 19 Apr 2026 19:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWXVKAPTyG7k; Sun, 19 Apr 2026 19:16:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0021140D45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776626186;
	bh=fA89staEp6Xe7laYidkHaYgt5V+QDtKyb3sntsTL1WQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NoeGQNkRl7wOMsLhOUngWf97pfkC5Hfb3VlELHVp1VHlXJh3UxNr1Zc/+Yw9a3Ytl
	 vCGZIxqD9sdq4Je8OHhOlMxzaXlvJ13OOMMayu9KdB/7EYwRo5Jl0R/Q3bRo9hobKU
	 1KGc6sxVcEsOewxvUjRtcKLi9g84puB6FtCLIsb+Q5MTc//6v/iwUXXb8u/ElLv7C2
	 pA1qkrfsz/K/jwizsPeJhutDya2vvbXnIrKBMR9xhMU6i9fEeEu8NVQZDhErxsnoyb
	 w8TfyC55IuAIVEZOeHV+tgfW4hZRl6p+I1EA6JO5cINsGrkfn9Yd9D0zc5Qdg1Atr9
	 VBO3nOo7BEEfA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0021140D45;
	Sun, 19 Apr 2026 19:16:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DDC024D
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 439EE40448
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id af8jWToqfxmA for <buildroot@buildroot.org>;
 Sun, 19 Apr 2026 19:16:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859B840426
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 859B840426
 for <buildroot@buildroot.org>; Sun, 19 Apr 2026 19:16:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E98881F7B; Sun, 19 Apr 2026 19:16:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Apr 2026 21:11:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b30035e832bf7afbc4506806255d75d8f92cd4df
X-Git-Newrev: f1fcca3a79790c5a1bcb412d25b857385a5ecdce
X-Patchwork-Hint: ignore
Message-Id: <20260419191624.2E98881F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/proftpd: bump version to 1.3.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1fcca3a79790c5a1bcb412d25b857385a5ecdce
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/proftpd/proftpd/tree/1.3.9/RELEASE_NOTES

Removed fix for gcc 15.x added by buildroot commit
c53f5e78fcd0c6af9174c76d381a44aa48fb4f24.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/proftpd/proftpd.hash |  2 +-
 package/proftpd/proftpd.mk   | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 88b5906945..482534fb1c 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  42ba40d8d5a5a9f28c9dcd7f15aa6b5368fe5efceaacb999041311b170f076d5  proftpd-1.3.8d.tar.gz
+sha256  4a5f13b666226813b4da0ade34535d325e204ab16cf8008c7353b1b5a972f74b  proftpd-1.3.9.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d450489cb0..a30c46ee27 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.8d
+PROFTPD_VERSION = 1.3.9
 PROFTPD_SITE = https://github.com/proftpd/proftpd/archive/v$(PROFTPD_VERSION)
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
@@ -27,14 +27,6 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
-# source code contains a number of variables named 'bool', which
-# conflicts with the C23 keyword. Fixed upstream in 1.3.9 with
-# https://github.com/proftpd/proftpd/commit/61be7eb14f200b97804a3cfa85fed51661067c62
-# so can be dropped when bumping to that
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_15),y)
-PROFTPD_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu18"
-endif
-
 ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
