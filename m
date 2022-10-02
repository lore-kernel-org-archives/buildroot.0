Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC08C433FE
	for <buildroot@archiver.kernel.org>; Sun,  2 Oct 2022 14:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06F954047C;
	Sun,  2 Oct 2022 14:47:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06F954047C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rd1cRhRkpQt1; Sun,  2 Oct 2022 14:47:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F1C4403AC;
	Sun,  2 Oct 2022 14:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1C4403AC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 10A991BF41B
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC2F9403C2
 for <buildroot@lists.busybox.net>; Sun,  2 Oct 2022 14:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC2F9403C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0V7YgxhGS_Wx for <buildroot@lists.busybox.net>;
 Sun,  2 Oct 2022 14:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5093B40121
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5093B40121
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 14:46:43 +0000 (UTC)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
 by mailout12.t-online.de (Postfix) with SMTP id E372B1263B
 for <buildroot@buildroot.org>; Sun,  2 Oct 2022 16:46:35 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.204.166]) by fwd86.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1of0Eg-1ZEiFF0; Sun, 2 Oct 2022 16:46:30 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:60770)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1of0Ef-00053Q-33
 for buildroot@buildroot.org; Sun, 02 Oct 2022 16:46:29 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun,  2 Oct 2022 16:46:28 +0200
Message-Id: <20221002144629.2105385-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1664721990-D8A4C9D3-1AAC7908/0/0 CLEAN NORMAL
X-TOI-MSGID: 801f4770-dc65-4000-ba5f-d783ff0ae898
Subject: [Buildroot] [PATCH 1/2] package/kodi: add comment to display udev
 dependency for gbm when wayland/x11 are disabled
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without this additional comment only the comment

  kodi needs an OpenGL EGL backend with OpenGL or GLES support

is displayed which is not enough to guide users.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 90710683db..7bd8bc2943 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,6 +27,9 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
+comment "kodi needs udev support for gbm"
+	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
 	default y
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
