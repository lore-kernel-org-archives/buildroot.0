Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAFD2EE4997
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 17:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 741CD60A99;
	Tue, 30 Dec 2025 17:59:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3fFYqu6bCbeJ; Tue, 30 Dec 2025 17:59:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EEFD608B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767117543;
	bh=BBz17aZLPh5vlA6N6QfKAL7nE4IJ530pPEnehQb22a8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UfpsFww9UewvxbXq+VrXQB+dd4Ov9u0flaj6mAyJPszlWvfmi6ZjtOA64KbvY5Sgu
	 nOsYXUtCVHZQyEKtXUQAvRWpqh2jbDohhYIUToho1LFGJIzWIBoXVOgurZbUsWX56S
	 a50qOJO0qrucRY46zFjSXh9QGeSGu1zshqVe6QW4t6mxxJ9NBW4yugl1gHaL8OL61Q
	 +pFSN3pwWDwxDp1KQbnrVP0nmtX1P4aBcu5Z0k4cSzofrKfeMzYGwgCSs1579lAYSE
	 JoMok9YoviGrUst3IV0e0z+HDZ9Wk80m0C7t5+bVrS8pP9uSQzH+06s/BLzb+8dHqB
	 08YUmpNe9xwwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EEFD608B3;
	Tue, 30 Dec 2025 17:59:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 119AA277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB361608B3
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:59:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hRGszdSBtaX2 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 17:58:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B9B608A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11B9B608A0
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 17:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CCA387C3C; Tue, 30 Dec 2025 17:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 18:56:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4668eded3d8087600f3aa67c2d354edfa7ce97e
X-Git-Newrev: f1e3a29a5b11ea373aef3260afcd0d1203fa2c99
X-Patchwork-Hint: ignore
Message-Id: <20251230175858.0CCA387C3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtraceevent: bump to version
 1.8.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1e3a29a5b11ea373aef3260afcd0d1203fa2c99
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/tag/?h=libtraceevent-1.8.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libtraceevent/libtraceevent.hash | 2 +-
 package/libtraceevent/libtraceevent.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libtraceevent/libtraceevent.hash b/package/libtraceevent/libtraceevent.hash
index a974f326e0..890e1294e6 100644
--- a/package/libtraceevent/libtraceevent.hash
+++ b/package/libtraceevent/libtraceevent.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  812547d2f7b248485c183be2799b7041038ee44183000705609754b128c84c6f  libtraceevent-1.8.6.tar.gz
+sha256  cec7167e885d2f022bc5a2b0f2c0c58110fa0575e5dba49d7b694f0a6fd7fa0c  libtraceevent-1.8.7.tar.gz
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSES/LGPL-2.1
diff --git a/package/libtraceevent/libtraceevent.mk b/package/libtraceevent/libtraceevent.mk
index cc0190f84a..d0de336de0 100644
--- a/package/libtraceevent/libtraceevent.mk
+++ b/package/libtraceevent/libtraceevent.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTRACEEVENT_VERSION = 1.8.6
+LIBTRACEEVENT_VERSION = 1.8.7
 LIBTRACEEVENT_SITE = https://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git/snapshot
 LIBTRACEEVENT_LICENSE = GPL-2.0, LGPL-2.1
 LIBTRACEEVENT_LICENSE_FILES = LICENSES/GPL-2.0 LICENSES/LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
