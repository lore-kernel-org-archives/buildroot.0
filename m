Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D6AD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6741C60FC1;
	Tue, 13 Jan 2026 21:00:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeB6oVu1pK44; Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 773CC60FC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338002;
	bh=CHaUOSmutUUrNZx0z5GV1zZMhTFGN8qV2Gp3h/9qKKo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aWXEZka3eQwIqzMeNjWG5Yho0bA+3VTXWoyBmYKu7SGMsTPHVbToSev7I1IhEkM9k
	 gBb0oRmFRcekRTowQf8XXDJE9p7LTsHE7uVXt7IN8G+D6W8ee1scC0Dyu5J1QjQvyt
	 t8aiVj8+OjicMzXTrbjNmv0D22n5GXej37nD8uFRQJtJ+6nGEAasda7nxQzdDzITQn
	 jqpsW8f9Z+OdqfbMpkvki4O5oMjuLFA/85qEeqDVjWmFaxrSB/gkqISShRhUP3jqsx
	 eoqrjCWt2/IaH6gOcnyU7lLY5d4zGOamnP4H4CNv9cmCsyz/w3H+RDWPOTYt3llmT9
	 PgJ2mmCrOwDXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 773CC60FC2;
	Tue, 13 Jan 2026 21:00:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C779231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2E634077F
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ya088GWVZfU8 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EFB940794
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EFB940794
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2D45C7FCC5; Tue, 13 Jan 2026 20:58:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 82c681bcc81589643d022ba64368d25306af29aa
X-Git-Newrev: b27bb473243d64806be420226f16143e6464366d
X-Patchwork-Hint: ignore
Message-Id: <20260113205849.2D45C7FCC5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_xload: bump version to
 1.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b27bb473243d64806be420226f16143e6464366d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-March/003485.html

Updated license hash due to upstream commit:
https://gitlab.freedesktop.org/xorg/app/xload/-/commit/ef450fb99630a406c4638d8ba251eac45e434411

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_xload/xapp_xload.hash | 8 ++++----
 package/x11r7/xapp_xload/xapp_xload.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/xapp_xload/xapp_xload.hash b/package/x11r7/xapp_xload/xapp_xload.hash
index 9716fe1500..29a729a70d 100644
--- a/package/x11r7/xapp_xload/xapp_xload.hash
+++ b/package/x11r7/xapp_xload/xapp_xload.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003150.html
-sha256  8346b99120db24e0f42920f7f12e23e9b1b407d3a66ce419990387b608373031  xload-1.1.4.tar.xz
-sha512  114babe4e5a60f4713f9e4627ee0a1bbb2f1f238cb46f24c38aecff67f25e6b0f58cbd554c71095ddc2b01398adbfa379550a34c23c413db52157648028554f2  xload-1.1.4.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-March/003485.html
+sha256  2c0fe6d624e1a25c1707e2d56407b979d6a78d64271df9ea0a89d99b81b59a80  xload-1.2.0.tar.xz
+sha512  b6143f796f7d24bb204e29f341f59c27a0eba00ae58e42bde0d1471e3e9357a0ce5e9e23de119d2540c9f5c71d28eb1e85dd766b6b28a7f066805b5f386aa716  xload-1.2.0.tar.xz
 # Locally computed
-sha256  a09b31d26e4d2781eef1e71f39789f86cad6d81153e72064f45875910fa6258f  COPYING
+sha256  c5fa9a1ea9032b1422d423b73fac9710a3e54c2d11d9c810ea5fc5585a53977c  COPYING
diff --git a/package/x11r7/xapp_xload/xapp_xload.mk b/package/x11r7/xapp_xload/xapp_xload.mk
index f219359447..4ef86dbb51 100644
--- a/package/x11r7/xapp_xload/xapp_xload.mk
+++ b/package/x11r7/xapp_xload/xapp_xload.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_XLOAD_VERSION = 1.1.4
+XAPP_XLOAD_VERSION = 1.2.0
 XAPP_XLOAD_SOURCE = xload-$(XAPP_XLOAD_VERSION).tar.xz
-XAPP_XLOAD_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_XLOAD_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XLOAD_LICENSE = MIT
 XAPP_XLOAD_LICENSE_FILES = COPYING
 XAPP_XLOAD_DEPENDENCIES = xlib_libXaw $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
