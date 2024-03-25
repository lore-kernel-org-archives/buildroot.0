Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EF0FC54E64
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 08:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A2418148E;
	Mon, 25 Mar 2024 08:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZtkJLEA6k0V; Mon, 25 Mar 2024 08:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35B5181276
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B5181276;
	Mon, 25 Mar 2024 08:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1C9A51BF20B
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16BAA60845
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 07:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9s86zfe5exAd for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 595BE606E7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 595BE606E7
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4466C83D30; Mon, 25 Mar 2024 07:59:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 25 Mar 2024 08:54:35 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: a7b1d7d2b49b95ddd7095e67c2ea67ebf5e1333d
X-Git-Newrev: 192d6bc5b20408afedab49f80a18498d20e379da
X-Patchwork-Hint: ignore
Message-Id: <20240325075958.4466C83D30@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/owfs: add missing
 slash after the OWFS_PKGDIR variable
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

commit: https://git.buildroot.net/buildroot/commit/?id=192d6bc5b20408afedab49f80a18498d20e379da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 94636d39ca324cb48ca83b329e4ecac166c24a10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/owfs/owfs.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 986dca921a..6b22282486 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -28,7 +28,7 @@ OWFS_CONF_OPTS += \
 	--with-fuseinclude=$(STAGING_DIR)/usr/include \
 	--with-fuselib=$(STAGING_DIR)/usr/lib
 define OWFS_INSTALL_FUSE_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S60owfs \
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S60owfs \
 		$(TARGET_DIR)/etc/init.d/S60owfs
 endef
 define OWFS_CREATE_MOUNTPOINT
@@ -78,7 +78,7 @@ endif
 OWFS_MAKE = $(MAKE) $(OWFS_EXTRA_MAKE_OPTS)
 
 define OWFS_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)S55owserver \
+	$(INSTALL) -D -m 0755 $(OWFS_PKGDIR)/S55owserver \
 		$(TARGET_DIR)/etc/init.d/S55owserver
 	$(OWFS_INSTALL_FUSE_INIT_SYSV)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
