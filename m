Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D4BC61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:34:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D87B883ED1;
	Mon, 20 Feb 2023 23:34:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D87B883ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VXn936YL1KCL; Mon, 20 Feb 2023 23:34:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 158BB83EDC;
	Mon, 20 Feb 2023 23:34:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 158BB83EDC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8AC1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8211941760
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8211941760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b-8__da_TAgo for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF2B141741
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF2B141741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBD34828C8; Mon, 20 Feb 2023 20:52:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Jan 2023 13:58:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9d4d3a930e14b2b81524711288e7092a562f5ed1
X-Git-Newrev: 1d7e304648ffa8f4d88bfd540176e492fcafb015
X-Patchwork-Hint: ignore
Message-Id: <20230220205238.BBD34828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libgtk2: switch to
 https download
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1d7e304648ffa8f4d88bfd540176e492fcafb015
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libgtk2/libgtk2.hash | 2 +-
 package/libgtk2/libgtk2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgtk2/libgtk2.hash b/package/libgtk2/libgtk2.hash
index 9b10a1f0ce..7b9a46b697 100644
--- a/package/libgtk2/libgtk2.hash
+++ b/package/libgtk2/libgtk2.hash
@@ -1,4 +1,4 @@
-# From http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
+# From https://download.gnome.org/sources/gtk+/2.24/gtk+-2.24.33.sha256sum
 sha256  ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da  gtk+-2.24.33.tar.xz
 
 # Hash for license file:
diff --git a/package/libgtk2/libgtk2.mk b/package/libgtk2/libgtk2.mk
index d30e1d9d43..859925e8d3 100644
--- a/package/libgtk2/libgtk2.mk
+++ b/package/libgtk2/libgtk2.mk
@@ -7,7 +7,7 @@
 LIBGTK2_VERSION_MAJOR = 2.24
 LIBGTK2_VERSION = $(LIBGTK2_VERSION_MAJOR).33
 LIBGTK2_SOURCE = gtk+-$(LIBGTK2_VERSION).tar.xz
-LIBGTK2_SITE = http://ftp.gnome.org/pub/gnome/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
+LIBGTK2_SITE = https://download.gnome.org/sources/gtk+/$(LIBGTK2_VERSION_MAJOR)
 LIBGTK2_INSTALL_STAGING = YES
 LIBGTK2_LICENSE = LGPL-2.0+
 LIBGTK2_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
