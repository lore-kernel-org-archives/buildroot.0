Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16CC6FD005C
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 11:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAFD740B9A;
	Sun,  1 Mar 2026 11:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O0oJvGp-e3nh; Sun,  1 Mar 2026 11:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D44F040BA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772363522;
	bh=UkP/RuK8nybLGhn++vIU5AfENS8lh6zrzH9wgRb5Ma8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qt8YwVfH6dz/f6b0p8+Jvk3T2ghXDq+3v4EEnVkMUciNdU2spvQLFHfalzvEXZGQO
	 25qHuMtNnSxaNBNjDZozDTAuo+xW4Ib9BmhLhy3sGW/dD1oT3Cq1mTmHUV814ABt28
	 zBU5R3yFTekiuXha/0X9PuKonsz9mPKlZVR+4IIMDHG9GQrIwlLPfl1FfNBs2j8bVd
	 eFQ/e4T7i+0dyioxD3mX6Geep1N3NG3GTxG6W2wn9FCiVJfbiaEu857sW6dU+VM8K3
	 2HP7JtOcrRiDdWM7imHyGDs+vBQSHpCf/vQ20gWyx+F1iOY5yjwgbguziQbkz2onTp
	 w/H9Zo/Lojf0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D44F040BA4;
	Sun,  1 Mar 2026 11:12:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A849231
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3CC4A40BA4
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZT8R-6AQ7OGH for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 11:12:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85C4A40B9A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 85C4A40B9A
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 11:12:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7970783DDA; Sun,  1 Mar 2026 11:12:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Mar 2026 11:52:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 76135019544058a282ceed87e10e5d5e03ca5558
X-Git-Newrev: 7da7f82307801ecc2c4b972244e9bfab71d54f59
X-Patchwork-Hint: ignore
Message-Id: <20260301111200.7970783DDA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/samba4: bump version to 4.23.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7da7f82307801ecc2c4b972244e9bfab71d54f59
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes of this bugfix release:
https://www.samba.org/samba/history/samba-4.23.6.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index cc07b2527b..84ada82bfd 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.23.5.tar.asc
-sha256  593a43ddd0d57902237dfa76888f7b02cb7fc7747111369cb31e126db4836b9f  samba-4.23.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.23.6.tar.asc
+sha256  e3dabd8b5e42dc97669fa0faef032510a94e496b58f7067082e5036d88f0e702  samba-4.23.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 5d9eacef90..2631f2dcad 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.23.5
+SAMBA4_VERSION = 4.23.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
