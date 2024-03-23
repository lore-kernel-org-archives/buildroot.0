Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA8BC54E67
	for <buildroot@archiver.kernel.org>; Sat, 23 Mar 2024 20:29:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33A40606DB;
	Sat, 23 Mar 2024 20:29:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7uwHftZko75r; Sat, 23 Mar 2024 20:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37282606EB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37282606EB;
	Sat, 23 Mar 2024 20:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 44E991BF852
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3DA4E40544
 for <buildroot@lists.busybox.net>; Sat, 23 Mar 2024 20:29:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJL55HPal7JH for <buildroot@lists.busybox.net>;
 Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70DD740109
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70DD740109
 for <buildroot@buildroot.org>; Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5BA0E83964; Sat, 23 Mar 2024 20:29:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Mar 2024 21:23:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 012b6cc874e944fb098136c697fc0f71bcc264ef
X-Git-Newrev: 94636d39ca324cb48ca83b329e4ecac166c24a10
X-Patchwork-Hint: ignore
Message-Id: <20240323202919.5BA0E83964@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/owfs: add missing slash after the
 OWFS_PKGDIR variable
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94636d39ca324cb48ca83b329e4ecac166c24a10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Scott Fan <fancp2007@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
