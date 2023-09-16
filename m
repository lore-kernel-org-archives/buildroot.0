Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CD4FCD37BB
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 13:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D86FE40B3B;
	Sat, 16 Sep 2023 13:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D86FE40B3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9hCbnfwcZFBY; Sat, 16 Sep 2023 13:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E83740B5E;
	Sat, 16 Sep 2023 13:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E83740B5E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5DB01BF861
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:17:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8023E60B88
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 13:17:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8023E60B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uoXCsXEEk1Zq for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 13:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C79E960B69
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 13:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C79E960B69
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6CE0870DD; Sat, 16 Sep 2023 13:17:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Sep 2023 15:17:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9cd15446744c45cf35792d4560e1c1da448502b
X-Git-Newrev: 6898ca03a25c4577c1848d6217c7d7a99354c031
X-Patchwork-Hint: ignore
Message-Id: <20230916131738.B6CE0870DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xserver_xorg-server: add condition
 in xserver_xorg-server.mk
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

commit: https://git.buildroot.net/buildroot/commit/?id=6898ca03a25c4577c1848d6217c7d7a99354c031
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Does not install systemd unit if nodm or xdm is enabled.

Signed-off-by: Yanghao Cheng <yanghao.cheng@aioi-atg.com>
[yann.morin.1998@free.fr:
  - don't use $(or ...)
  - slightly reword comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
