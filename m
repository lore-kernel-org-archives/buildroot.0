Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469C6C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12BE84C2C;
	Sat, 23 Jul 2022 19:22:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12BE84C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cj18yJp63yQ4; Sat, 23 Jul 2022 19:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1AC084C26;
	Sat, 23 Jul 2022 19:22:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1AC084C26
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F1E11BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:22:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A93784C26
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6A93784C26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0za2ym1cST69 for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:22:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5482E84BEA
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:22:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5482E84BEA
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D45D884C6B; Sat, 23 Jul 2022 19:09:06 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:21:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1f6ab13194867272d4ec67d8e847c2a9e60d29f4
X-Git-Newrev: 90a6572e102d72ce01eaae6ab12065148f6a1a36
X-Patchwork-Hint: ignore
Message-Id: <20220723190906.D45D884C6B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xserver_xorg-server: fix
 xephyr build with kdrive
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

commit: https://git.buildroot.net/buildroot/commit/?id=90a6572e102d72ce01eaae6ab12065148f6a1a36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following xephyr build failure with kdrive raised since commit
eedbd6f97d51a0049ec512de26541465403ab06f:

checking for XEPHYR... no
configure: error: Package requirements (xau xdmcp xcb xcb-shape xcb-render xcb-renderutil xcb-aux xcb-image xcb-icccm xcb-shm >= 1.9.3 xcb-keysyms xcb-randr xcb-xkb xcb-xv) were not met:

Package 'xcb-renderutil', required by 'virtual:world', not found
Package 'xcb-aux', required by 'virtual:world', not found
Package 'xcb-image', required by 'virtual:world', not found
Package 'xcb-icccm', required by 'virtual:world', not found
Package 'xcb-keysyms', required by 'virtual:world', not found

Fixes:
 - http://autobuild.buildroot.org/results/baba218c879b67bfbadc9c25d34313abc76397bc
 - http://autobuild.buildroot.org/results/9471b77db9aefa2fd0e5be61ea84709183511623

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/x11r7/xserver_xorg-server/Config.in              | 4 ++++
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 7 +++++++
 2 files changed, 11 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/Config.in b/package/x11r7/xserver_xorg-server/Config.in
index 4fb03051dd..daf4d81702 100644
--- a/package/x11r7/xserver_xorg-server/Config.in
+++ b/package/x11r7/xserver_xorg-server/Config.in
@@ -85,6 +85,10 @@ config BR2_PACKAGE_XSERVER_XORG_SERVER_XVFB
 
 config BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR
 	bool "Xephyr server"
+	select BR2_PACKAGE_XCB_UTIL_IMAGE if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_KEYSYMS if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
+	select BR2_PACKAGE_XCB_UTIL_WM if BR2_PACKAGE_XSERVER_XORG_SERVER_KDRIVE
 	help
 	  Xephyr nested X server; successor to Xnest.
 
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0f1779dcab..fa5d2a802d 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -84,6 +84,13 @@ XSERVER_XORG_SERVER_CONF_OPTS += \
 	--disable-glx \
 	--disable-dri
 
+ifeq ($(BR2_PACKAGE_XSERVER_XORG_SERVER_XEPHYR),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += \
+	xcb-util-image \
+	xcb-util-keysyms \
+	xcb-util-renderutil \
+	xcb-util-wm
+endif
 else # modular
 XSERVER_XORG_SERVER_CONF_OPTS += --disable-kdrive
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
