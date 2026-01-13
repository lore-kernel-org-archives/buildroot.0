Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB1BD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A627E60DE6;
	Tue, 13 Jan 2026 20:59:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTr-qN2bilQH; Tue, 13 Jan 2026 20:59:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B84B360DE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337951;
	bh=9cR9WEdYm6bAhga33onTalouzqo0gyTAnlSKKUypVeI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O/6DqBJGaa4QWnIrVXyiblSzyAr/kpBkO2eDOY6bFzCw6B/eCnK/rqAV+nt3bHNOu
	 YvdxYELPUmts3lqVO5FytA1OrUfOG/PrE/S+COGBg+u7oA/xsLQdIzt8vNzJUambJD
	 LS5lJyKJaY1Srys9LxYDovdXKwy7KNs1Jbn2gpz97ufz57rJvtpP7cIRztpZ6z3Ctf
	 LcJsZRYU2SJpDB5S5gKn5qXVkQznmbAv1Sode/TKNbnTQ0a+fEfvEU/IgRaomCLFVy
	 UFsNmtEAeTPsocW7qtIl1Tfi3HLwzjd9IpRmC1LO4oM5FCzHdifP2/trh6VON+XC15
	 8IcA7hfhxS/hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B84B360DE2;
	Tue, 13 Jan 2026 20:59:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 026C41CC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F381B811AF
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kYpB1zKiRMLh for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0DF811BA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC0DF811BA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CA85868C5; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b66fb7264ef4a1413c4b5dc90cc9970069b54d94
X-Git-Newrev: 0193daf7a53f5e2724aa648d5f3de145081747b2
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.9CA85868C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 package/x11r7/xfont_font-adobe-utopia-75dpi: bump version to 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=0193daf7a53f5e2724aa648d5f3de145081747b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2023-February/003344.html

Used tarball hashes provided by upstream.

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../xfont_font-adobe-utopia-75dpi.hash                              | 4 +++-
 .../xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk  | 6 +++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
index 0b6e1af638..00bd9131f8 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.hash
@@ -1,3 +1,5 @@
+# From https://lists.x.org/archives/xorg-announce/2023-February/003344.html
+sha256  a726245932d0724fa0c538c992811d63d597e5f53928f4048e9caf5623797760  font-adobe-utopia-75dpi-1.0.5.tar.xz
+sha512  9608698288fca47bf61cff911b8f081593807eed9f138ea22f05a7b6c26c481ec5144d79665cf509ba889df35ef5406e0de71710362bcf6de6b602c12158e22a  font-adobe-utopia-75dpi-1.0.5.tar.xz
 # locally computed
-sha256  8732719c61f3661c8bad63804ebfd54fc7de21ab848e9a26a19b1778ef8b5c94  font-adobe-utopia-75dpi-1.0.4.tar.bz2
 sha256  234c2a8109afa8034c787dbf69696a9bdd374914aadf937d2a103831d95c1867  COPYING
diff --git a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
index ac3bf2e230..fed78362f7 100644
--- a/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
+++ b/package/x11r7/xfont_font-adobe-utopia-75dpi/xfont_font-adobe-utopia-75dpi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.4
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.bz2
-XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = http://xorg.freedesktop.org/releases/individual/font
+XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION = 1.0.5
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SOURCE = font-adobe-utopia-75dpi-$(XFONT_FONT_ADOBE_UTOPIA_75DPI_VERSION).tar.xz
+XFONT_FONT_ADOBE_UTOPIA_75DPI_SITE = https://xorg.freedesktop.org/archive/individual/font
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE = Adobe License (no modification allowed)
 XFONT_FONT_ADOBE_UTOPIA_75DPI_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
