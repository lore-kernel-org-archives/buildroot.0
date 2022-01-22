Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE8C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 13:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E404E40360;
	Sat, 22 Jan 2022 13:52:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0z7gBKvYlIxG; Sat, 22 Jan 2022 13:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C0E44032D;
	Sat, 22 Jan 2022 13:52:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D57C91BF3D5
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D28374032D
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 13:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vBKUJQ15xZiG for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 13:52:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2190E4025C
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 13:52:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 433EF8291D; Sat, 22 Jan 2022 13:45:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 14:52:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 61ef0ff827754d07cd006f3107d4772ba1d2d1fc
X-Git-Newrev: 2ecc4379d1b310184c721dd4c9be0a12269f6234
X-Patchwork-Hint: ignore
Message-Id: <20220122134552.433EF8291D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vte: install to staging
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ecc4379d1b310184c721dd4c9be0a12269f6234
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vte also provides libvte, a library that can be linked to by other
programs, so install it in staging.

Signed-off-by: Rainer Jonsson <rainbox2k12@msgsafe.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vte/vte.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/vte/vte.mk b/package/vte/vte.mk
index 07e813685e..ceb2f09d67 100644
--- a/package/vte/vte.mk
+++ b/package/vte/vte.mk
@@ -11,6 +11,7 @@ VTE_SITE = http://ftp.gnome.org/pub/gnome/sources/vte/$(VTE_VERSION_MAJOR)
 VTE_DEPENDENCIES = host-pkgconf libgtk3 pcre2 $(TARGET_NLS_DEPENDENCIES)
 VTE_LICENSE = LGPL-3.0+
 VTE_LICENSE_FILES = COPYING.LGPL3
+VTE_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_ICU),y)
 VTE_CONF_OPTS += -Dicu=true
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
