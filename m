Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78169C25B76
	for <buildroot@archiver.kernel.org>; Mon,  3 Jun 2024 17:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4213C40944;
	Mon,  3 Jun 2024 17:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b2ne6_t-JbhC; Mon,  3 Jun 2024 17:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F3B740945
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F3B740945;
	Mon,  3 Jun 2024 17:34:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B38051BF232
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F742607CC
 for <buildroot@lists.busybox.net>; Mon,  3 Jun 2024 17:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3oP-0w59BI9J for <buildroot@lists.busybox.net>;
 Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9E4860791
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9E4860791
 for <buildroot@buildroot.org>; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B0B43812D3; Mon,  3 Jun 2024 17:34:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 3 Jun 2024 18:06:18 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 5dcf2d88497cbdafd7b224ab58616eb8b9d7ab27
X-Git-Newrev: fe189deeed96779f9fb8c9006a85b50034322365
X-Patchwork-Hint: ignore
Message-Id: <20240603173429.B0B43812D3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/zbar: add the
 optional imagemagick dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe189deeed96779f9fb8c9006a85b50034322365
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When ImageMagick is selected, the "zbarimg" program is compiled and
installed on target. It allows to decode a QR code from an image file.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 84ad5c22d00b1cf7f2c9d9632f5e3a04efe9cddc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zbar/zbar.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/zbar/zbar.mk b/package/zbar/zbar.mk
index 0e79004bb3..86f33796a2 100644
--- a/package/zbar/zbar.mk
+++ b/package/zbar/zbar.mk
@@ -18,7 +18,6 @@ ZBAR_CONF_ENV = \
 	LIBS=$(TARGET_NLS_LIBS)
 ZBAR_CONF_OPTS = \
 	--disable-doc \
-	--without-imagemagick \
 	--without-qt \
 	--without-qt5 \
 	--without-gtk \
@@ -32,6 +31,13 @@ else
 ZBAR_CONF_OPTS += --without-dbus
 endif
 
+ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
+ZBAR_DEPENDENCIES += imagemagick
+ZBAR_CONF_OPTS += --with-imagemagick
+else
+ZBAR_CONF_OPTS += --without-imagemagick
+endif
+
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
 ZBAR_DEPENDENCIES += host-python3 python3
 ZBAR_CONF_OPTS += --with-python=python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
