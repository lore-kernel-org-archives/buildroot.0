Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0192FC43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85ED04061D;
	Sat, 16 Jul 2022 22:22:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85ED04061D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdX_7BCbpEGv; Sat, 16 Jul 2022 22:22:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 96D51404F6;
	Sat, 16 Jul 2022 22:22:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96D51404F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 11AF31BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDDE660D53
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDDE660D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VsU3u1UL0zSL for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:22:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22729605E8
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:22:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22729605E8
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 51B4C8397E; Sat, 16 Jul 2022 22:08:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Jul 2022 00:21:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c74332c780019da16e373c4fde2bb52068e96b99
X-Git-Newrev: 33677fb46e5d2f50e750b5aaf36da0d756ebd0b2
X-Patchwork-Hint: ignore
Message-Id: <20220716220838.51B4C8397E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wpa_supplicant: fix
 ifupdown-scripts build
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

commit: https://git.buildroot.net/buildroot/commit/?id=33677fb46e5d2f50e750b5aaf36da0d756ebd0b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with ifupdown-scripts and
BR2_PER_PACKAGE_DIRECTORIES raised since commit
eed183e67e02a35e98fbf6baead9c9ee559b493e:

ln -sf ../if-up.d/wpasupplicant /nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant
ln: failed to create symbolic link '/nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/fb35c29a966e21a29df5923e6d27ca372a4b4909

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index afcd6502e3..e5e3938be1 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -260,7 +260,9 @@ ifeq ($(BR2_PACKAGE_IFUPDOWN_SCRIPTS),y)
 define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
 	$(INSTALL) -m 0755 -D package/wpa_supplicant/ifupdown.sh \
 		$(TARGET_DIR)/etc/network/if-up.d/wpasupplicant
-	ln -sf ../if-up.d/wpasupplicant $(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
+	mkdir -p $(TARGET_DIR)/etc/network/if-down.d
+	ln -sf ../if-up.d/wpasupplicant \
+		$(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
 endef
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
