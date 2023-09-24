Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F4FCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13878417B2;
	Sun, 24 Sep 2023 21:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13878417B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1-b5SKRef3wC; Sun, 24 Sep 2023 21:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 014E341811;
	Sun, 24 Sep 2023 21:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 014E341811
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F2CC1BF909
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A3B4600C9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A3B4600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uvedEARFEiC5 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB74D60E1D
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB74D60E1D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA38F87607; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:05:47 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bb4093b45d6e921ae4bee80b264fb801ba58dc0b
X-Git-Newrev: 6fcde06ef1aa9c79e9efdc48c483d977f7cc2b25
X-Patchwork-Hint: ignore
Message-Id: <20230924212039.BA38F87607@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/xserver_xorg-server: fix init script conflicts
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

commit: https://git.buildroot.net/buildroot/commit/?id=6fcde06ef1aa9c79e9efdc48c483d977f7cc2b25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

xdm package also installs a init script that utimately starts X server

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
[yann.morin.1998@free.fr:
  - don't use $(or ...)
  - slightly reword comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f9cd15446744c45cf35792d4560e1c1da448502b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 593bbd4276..e520cefee7 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -181,8 +181,9 @@ define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
 
-# init script conflicts with S90nodm
-ifneq ($(BR2_PACKAGE_NODM),y)
+# Install the init script only when neither nodm nor xdm are enabled, as
+# they would be responsible for starting the server.
+ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/x11r7/xserver_xorg-server/S40xorg \
 		$(TARGET_DIR)/etc/init.d/S40xorg
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
