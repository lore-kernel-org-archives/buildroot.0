Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01336C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 11:45:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC6A681762;
	Sun, 13 Feb 2022 11:45:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWaqnsvb3Ad2; Sun, 13 Feb 2022 11:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F33F981656;
	Sun, 13 Feb 2022 11:45:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3F561BF964
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEE3F60687
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3MYjr1R4lao3 for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1484160671
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 11:44:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id EC60F82578; Sun, 13 Feb 2022 11:36:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 12:43:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4284eea7c9f66b22a7f87a4edd827692f88afed4
X-Git-Newrev: af54104cbb38a2d8843f1a55e3f4283cc9a5aca9
X-Patchwork-Hint: ignore
Message-Id: <20220213113628.EC60F82578@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/webp: explicitly disable SDL
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=af54104cbb38a2d8843f1a55e3f4283cc9a5aca9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Webp has optional SDL support. Explicitly disable it for now.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webp/webp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/webp/webp.mk b/package/webp/webp.mk
index d725b44438..f23e1c92e1 100644
--- a/package/webp/webp.mk
+++ b/package/webp/webp.mk
@@ -13,6 +13,9 @@ WEBP_CPE_ID_VENDOR = webmproject
 WEBP_CPE_ID_PRODUCT = libwebp
 WEBP_INSTALL_STAGING = YES
 
+WEBP_CONF_OPTS += \
+	--disable-sdl
+
 HOST_WEBP_CONF_OPTS += \
 	--enable-libwebpdemux \
 	--enable-libwebpmux \
@@ -20,6 +23,7 @@ HOST_WEBP_CONF_OPTS += \
 	--disable-gl \
 	--disable-jpeg \
 	--disable-png \
+	--disable-sdl \
 	--disable-tiff
 
 ifeq ($(BR2_PACKAGE_WEBP_DEMUX),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
