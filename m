Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DDBACE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 21:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B829F417DC;
	Sun, 24 Sep 2023 21:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B829F417DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19HbwAUWp7Fk; Sun, 24 Sep 2023 21:21:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A876F41740;
	Sun, 24 Sep 2023 21:21:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A876F41740
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12BDE1BF947
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0EB060E7A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 21:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EB060E7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gfhjJyzfy0aI for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D31F760E5C
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D31F760E5C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C22C487608; Sun, 24 Sep 2023 21:20:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 23:07:22 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 6fcde06ef1aa9c79e9efdc48c483d977f7cc2b25
X-Git-Newrev: 25bd28150ea4515bc7523f497461179ac8753bd7
X-Patchwork-Hint: ignore
Message-Id: <20230924212039.C22C487608@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 package/xserver_xorg-server: add condition in xserver_xorg-server.mk
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

commit: https://git.buildroot.net/buildroot/commit/?id=25bd28150ea4515bc7523f497461179ac8753bd7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Does not install systemd unit if nodm or xdm is enabled.

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
[yann.morin.1998@free.fr:
  - don't use $(or ...)
  - slightly reword comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6898ca03a25c4577c1848d6217c7d7a99354c031)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index e520cefee7..ede03d024c 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -176,10 +176,14 @@ XSERVER_XORG_SERVER_CONF_OPTS += --with-sha1=libsha1
 XSERVER_XORG_SERVER_DEPENDENCIES += libsha1
 endif
 
+# Install the systemd unit only when nodm nor xdm aren't enabled, as
+# they would be responsible for starting the server.
+ifeq ($(BR2_PACKAGE_NODM)$(BR2_PACKAGE_XAPP_XDM),)
 define XSERVER_XORG_SERVER_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 package/x11r7/xserver_xorg-server/xorg.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/xorg.service
 endef
+endif
 
 # Install the init script only when neither nodm nor xdm are enabled, as
 # they would be responsible for starting the server.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
