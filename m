Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9648AC25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A92A60F76;
	Mon, 15 Aug 2022 09:23:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A92A60F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MrzrPdlxRTDY; Mon, 15 Aug 2022 09:23:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD99A60F54;
	Mon, 15 Aug 2022 09:23:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD99A60F54
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 14FDB1BF990
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A33044167B
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:17:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A33044167B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gp1OAefosR8n for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6622341655
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6622341655
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 6EC20875A8; Mon, 15 Aug 2022 09:02:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 11:03:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ce2dd77d0076d0ef9a788fb3de38403fe39ac8b3
X-Git-Newrev: 9c26ee1e58e17f6d64c2f150d7ba5b070a376ec8
X-Patchwork-Hint: ignore
Message-Id: <20220815090238.6EC20875A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: fix typo on
 BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c26ee1e58e17f6d64c2f150d7ba5b070a376ec8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Typo was added in 2021 by commit
148e695e37 package/kodi: bump version to 19.0-Matrix

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/kodi/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 4c6e01745c..90710683db 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -250,7 +250,7 @@ config BR2_PACKAGE_KODI_LIBUSB
 
 config BR2_PACKAGE_KODI_LIBVDPAU
 	bool "vdpau"
-	depends on BR2_PACKAGE_KODI_PLATFORM_X11 && \
+	depends on BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_X11 && \
 		BR2_PACKAGE_KODI_RENDER_SYSTEM_GL
 	select BR2_PACKAGE_LIBVDPAU
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
