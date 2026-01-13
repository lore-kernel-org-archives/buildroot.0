Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F4CD30CC3
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89E2A40C95;
	Tue, 13 Jan 2026 21:00:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gStqrvKBIPwB; Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E45540CB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338024;
	bh=l/4HnN3Q5DCH6vuR+iDb2/MGnqnjy7eKS6+rXwRyEhk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WdWbZseEG9Cmh2F66lt0e3JHvbOepq8MgNOq0bykJ21iEeyHbqG+7RrJ5k0OeV7tp
	 Wjj/pZwAX2yeY3ghKVPlIvk+sHh2n7cK2aqEkHdHNnO9ESDbzHTX92qN7LssfZlqoo
	 26I2tehfuZk/gb07mwPDkaP/UhmIU8mc3274j4KF1LctBO918+pb+igwdW5fBsSntn
	 eeQX2Ku/Ck6cXo/umN1jitORXVK/q3L2Tmesh1/R49pyZLmuiB2OjZVkVePHthjw7K
	 ka4rPryPrg8+GJfH9XfgZ/1v/RTJRcqa7f70O47I326jr2XzTMJUoRjJ4s0ijoXcU1
	 RNQ+Zlnx8EBuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E45540CB0;
	Tue, 13 Jan 2026 21:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 13E64231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B08F540795
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ry925TC3T41p for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08897407CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08897407CD
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07241868C5; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff31dba5f781a4550fb2c32c5d696dfb628af00a
X-Git-Newrev: 2dd99a016349a9085825e30e7eb9d6365a849f2c
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.07241868C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xfont_encodings: bump
 version to 1.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dd99a016349a9085825e30e7eb9d6365a849f2c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003466.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xfont_encodings/xfont_encodings.hash | 6 +++---
 package/x11r7/xfont_encodings/xfont_encodings.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_encodings/xfont_encodings.hash b/package/x11r7/xfont_encodings/xfont_encodings.hash
index 80d4a48c40..e2c100ebc7 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.hash
+++ b/package/x11r7/xfont_encodings/xfont_encodings.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2023-February/003355.html
-sha256  3a39a9f43b16521cdbd9f810090952af4f109b44fa7a865cd555f8febcea70a4  encodings-1.0.7.tar.xz
-sha512  dc72982b14e5d89fe1eff1ab11f308796c89255a06337d8cd6bf65757f11dd0a5478b41d844793213db8fe9638389734f148abe9df9fb05027ea563dacde6ba8  encodings-1.0.7.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003466.html
+sha256  9ff13c621756cfa12e95f32ba48a5b23839e8f577d0048beda66c67dab4de975  encodings-1.1.0.tar.xz
+sha512  ae912e120847954f5756193cc8860f50ada6c79bb3ba44f7f0cd1913b13aeed7885e140282cb47989a93fae0a0e8cedebe9a2420f65b1936b40192dc7d208427  encodings-1.1.0.tar.xz
 # Locally computed
 sha256  13b4a0f9431f0fdd6ee36ed386e0b7d1eb429c5cb88df73353896078cbb5a137  COPYING
diff --git a/package/x11r7/xfont_encodings/xfont_encodings.mk b/package/x11r7/xfont_encodings/xfont_encodings.mk
index 7825f4117e..f9ebea2d17 100644
--- a/package/x11r7/xfont_encodings/xfont_encodings.mk
+++ b/package/x11r7/xfont_encodings/xfont_encodings.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XFONT_ENCODINGS_VERSION = 1.0.7
+XFONT_ENCODINGS_VERSION = 1.1.0
 XFONT_ENCODINGS_SOURCE = encodings-$(XFONT_ENCODINGS_VERSION).tar.xz
 XFONT_ENCODINGS_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_ENCODINGS_LICENSE = Public Domain
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
