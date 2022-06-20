Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D20C43334
	for <buildroot@archiver.kernel.org>; Mon, 20 Jun 2022 18:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40535418C7;
	Mon, 20 Jun 2022 18:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40535418C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IuBlglrRV0X5; Mon, 20 Jun 2022 18:50:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D42FA418BB;
	Mon, 20 Jun 2022 18:50:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D42FA418BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 982D21BF28A
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E77740AFD
 for <buildroot@lists.busybox.net>; Mon, 20 Jun 2022 18:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E77740AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsaoH-xfl6MF for <buildroot@lists.busybox.net>;
 Mon, 20 Jun 2022 18:49:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B1F74056E
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B1F74056E
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 18:49:59 +0000 (UTC)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
 by mailout10.t-online.de (Postfix) with SMTP id A68D515F2B
 for <buildroot@buildroot.org>; Mon, 20 Jun 2022 20:49:28 +0200 (CEST)
Received: from fli4l.lan.fli4l ([91.58.3.84]) by fwd76.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1o3MSj-2guxd30; Mon, 20 Jun 2022 20:49:25 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:52962)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1o3MSj-0003cZ-Ev
 for buildroot@buildroot.org; Mon, 20 Jun 2022 20:49:25 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 20 Jun 2022 20:49:25 +0200
Message-Id: <20220620184925.538342-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1655750965-014331F7-0FA2EB84/0/0 CLEAN NORMAL
X-TOI-MSGID: 6e8f51b4-03c6-4064-af58-8270bac01b19
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 kdrive build
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

Fixes:
http://autobuild.buildroot.net/results/bab/baba218c879b67bfbadc9c25d34313abc76397bc/
http://autobuild.buildroot.net/results/fef/fef3e93f9d3262854181dfef622c92c63a7ee760/
http://autobuild.buildroot.net/results/947/9471b77db9aefa2fd0e5be61ea84709183511623/

Configure complains about missing packages:

Package 'xcb-renderutil', required by 'virtual:world', not found
Package 'xcb-aux', required by 'virtual:world', not found
Package 'xcb-image', required by 'virtual:world', not found
Package 'xcb-icccm', required by 'virtual:world', not found
Package 'xcb-keysyms', required by 'virtual:world', not found

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/Config.in              | 5 +++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4fb03051dd..6f73676885 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -67,6 +67,11 @@ comment "Modular X.org needs a toolchain w/ C++"
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	bool "KDrive / TinyX"
+	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_XCB_UTIL_IMAGE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
+	select BR2_PACKAGE_XCB_UTIL_WM
 	help
 	  This variant of the X.org server is a lightweight version
 	  intended for embedded systems. The drivers (for input and
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0f1779dcab..fd2fdeccc4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -83,7 +83,12 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--enable-kdrive \
 	--disable-glx \
 	--disable-dri
-
+XSERVER_XORG_SERVER_DEPENDENCIES += \
+	libxcb \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xcb-util-wm
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
 endif
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
