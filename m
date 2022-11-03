Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D95CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BEBC60B0C;
	Thu,  3 Nov 2022 13:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BEBC60B0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dNFQ32n91tlj; Thu,  3 Nov 2022 13:48:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9DB606E7;
	Thu,  3 Nov 2022 13:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9DB606E7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 827DF1BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE7680C63
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE7680C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLGOonoNhcUU for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:48:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D51480C57
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:48:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D51480C57
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D48087B77; Thu,  3 Nov 2022 13:48:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 14:40:25 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 27978fbbc5e7dc78750259cfb77003d18fa92fbe
X-Git-Newrev: dd83eed9b83bffc31db3af792d1f594d557a3751
X-Patchwork-Hint: ignore
Message-Id: <20221103134820.8D48087B77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/gpsd: drop legacy
 cleanup
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

commit: https://git.buildroot.net/buildroot/commit/?id=dd83eed9b83bffc31db3af792d1f594d557a3751
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Since gpsd-3.22, the systemd service files no longer contain hard-coded
paths to /usr/local/, but use @SBINDIR@ which is replaced appropriately
at build time, and contains the correct path.

Drop the legacy fixup now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b3b962c93579f02775fbf057f317bcd58772131e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/gpsd.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4388b7e24d..281224dc95 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -225,14 +225,6 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-# systemd unit files are installed automatically, but need to update the
-# /usr/local path references in the provided files to /usr.
-define GPSD_INSTALL_INIT_SYSTEMD
-	$(SED) 's%/usr/local%/usr%' \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl@.service
-endef
-
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
