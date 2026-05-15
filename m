Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83CB3CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 10:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9087F6152C;
	Fri, 15 May 2026 10:47:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p8SWSPWw9TXe; Fri, 15 May 2026 10:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8675B61522
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778842021;
	bh=eqxEhbLnaSWT6aePu8D0G2u7uNSVuCG7qzjQHzzZVTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IjM93aUJKHt86VCl1K/TMeoQutU3q1jBu0lG3sL9VexHpshL/TguzolgpP1kUbq7I
	 UgoXr4ROZku4pCSgHTs6fah11l5xWSii7UkbnrtTsbw1qK3t6NGvohXze3fdIyW0Zf
	 KaXHJizJxWw2mlHr6b3I0jCRWcrEvBKsVk/vYb+ieVE8f1f7jGlhy7zT/HLhUqnNuR
	 oyGd8DIU/DFYyYLk1vHIjt2ZbwtMN9WY38Ew/HoLzFven1Du42PhzJfuOlysUD/KjX
	 QNxmRCzpzAEsg9VwT9gLStVqzq3HJQttLBnNiHJyiyo9EdvJtN/PYR6O6CCnCMmsWJ
	 fxN4dMV/C+K7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8675B61522;
	Fri, 15 May 2026 10:47:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 43F5A36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26D3A61522
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:47:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cLSNOkrB2DK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 10:46:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B73D61520
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B73D61520
 for <buildroot@buildroot.org>; Fri, 15 May 2026 10:46:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAF8686339; Fri, 15 May 2026 10:46:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 12:39:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb496bd63ef4a4466f9482fa4b3226e20cfb7f7b
X-Git-Newrev: 0a9836fcbe9b7a423a1b5bbdae75a97f52eb74e6
X-Patchwork-Hint: ignore
Message-Id: <20260515104653.BAF8686339@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a9836fcbe9b7a423a1b5bbdae75a97f52eb74e6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 0.24.10 change log:

* input
  - cache: fix deadlock bug
* decoder
  - sidplay: support millisecond-precision time stamps
  - sidplay: support libsidplayfp version 3
* database
  - upnp: allow building with libupnp 1.14.30 which has fixed the API breakage
* Windows
  - work around build failure due to zlib bug

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index 9cbe7fcf0b..e3e2cde023 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  f3d28b29bbe675970ef205b3d9b835e5691423fed6a89d713dbcbf7839ea92f3  mpd-0.24.9.tar.xz
+sha256  867f10fd83cde20c240617222b38fbf6885f902015d0da424a28fbafc675e1dd  mpd-0.24.10.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index ce7c44a9a8..eb40f0ccc3 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).9
+MPD_VERSION = $(MPD_VERSION_MAJOR).10
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
