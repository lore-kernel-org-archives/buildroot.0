Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C4BCD3430
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF69361557;
	Mon,  4 May 2026 14:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VVfTxKkPNPNL; Mon,  4 May 2026 14:47:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DCF261541
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906033;
	bh=7tU5V9KJkAQAyfWrMMzdo1TtcdRyHzoDrLjgL6kSVyE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CLSzZrMvaj69lWDP0A3tZYBQF9MtHkyVNbGc4X2jrbUV3c7Lk8YlntilHy6H91CQ2
	 O7B/6cKZY8BfI/fNP3g5Lz+eh75w7eMmhiVENSAd2ZomIlgR0LDcogyQMsBCXMFn6I
	 Tl/y1LCOx2RN6RZQyd4t0TL5UWEiOw+JL0kw+lgSFLcbEwLYeJtJJGVCfbczRy0trv
	 VArttEa3v0Ck5/eWukGd5ahmQYOP0lSVM+tWHnH1kJKhPNXLuTNBhSepvHfGAbO9tD
	 ZFQS/R7xJrp+frhyUS8jgid9yT6RAxj2IaCu57ZAFk2J8Z205puMGJosB4eN5s6tP+
	 seiDCOZkkHY2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DCF261541;
	Mon,  4 May 2026 14:47:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E5EA25D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 821C4844AF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zgrwm13eZDAE for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5850F845B1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5850F845B1
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C06384258; Mon,  4 May 2026 14:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:10:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 83093fc1dcee80fe989c2e6201194b9c3bda58d6
X-Git-Newrev: 88f383a0989dc77e31f111a855a3dbd3734d6f41
X-Patchwork-Hint: ignore
Message-Id: <20260504144644.3C06384258@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libpng: bump to
 version 1.6.58
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/88f383a0989dc77e31f111a855a3dbd3734d6f41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/pnggroup/libpng/blob/v1.6.58/ANNOUNCE
"Fixed a regression introduced in version 1.6.56 [...]"

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bc73ca37ef42ee9576ce89b301d4d138646e2878)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libpng/libpng.hash | 6 +++---
 package/libpng/libpng.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index 977f8fcca4..c387ffbf02 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,5 +1,5 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.57/
-sha1  866fb81e3355088bb885bb4ded39093ef80eb686  libpng-1.6.57.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.58/
+sha1  6263409a6907d180e7b990827ca84ee944c6cc17  libpng-1.6.58.tar.xz
 # Locally computed:
-sha256  d10c20d7171569804cae8dfc13ba6dcd0662c41ed39d43d4d429314aafb10a80  libpng-1.6.57.tar.xz
+sha256  28eb403f51f0f7405249132cecfe82ea5c0ef97f1b32c5a65828814ae0d34775  libpng-1.6.58.tar.xz
 sha256  bdb0a645ea18c60507d0368379b1ac5474b92255fcc2d115e07486a7672ba526  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index a315f7bf71..4ab571132f 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.57
+LIBPNG_VERSION = 1.6.58
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
