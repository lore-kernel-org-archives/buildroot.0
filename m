Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE1CCE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6E5417A8;
	Sun, 24 Sep 2023 21:22:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A6E5417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3I7t6VCoM1_r; Sun, 24 Sep 2023 21:22:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 283F341803;
	Sun, 24 Sep 2023 21:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 283F341803
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 397881BF2CC
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12EBC81D0C
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:21:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12EBC81D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exPnS6o_13wc for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AA2881839
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AA2881839
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2E6D587643; Sun, 24 Sep 2023 21:21:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:05:53 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: e6140d2955fee8fbe622a6c2ddd299059509d672
X-Git-Newrev: 6192cbb061e631b27036ebe299813cee177599e0
X-Patchwork-Hint: ignore
Message-Id: <20230924212149.2E6D587643@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x]
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

commit: https://git.buildroot.net/buildroot/commit/?id=6192cbb061e631b27036ebe299813cee177599e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
