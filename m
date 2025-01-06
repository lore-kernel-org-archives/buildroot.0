Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5BEE77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 16:20:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D725240569;
	Mon,  6 Jan 2025 16:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQy9M77nk5_5; Mon,  6 Jan 2025 16:20:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1CBF405AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1CBF405AD;
	Mon,  6 Jan 2025 16:20:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 134666B
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:20:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 042B880CFC
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:20:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PlNQ19FkeqmY for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 16:20:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC15F80CFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC15F80CFD
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 16:20:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B8A8C83BB4; Mon,  6 Jan 2025 16:20:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Jan 2025 17:07:53 +0100
X-Git-Refname: refs/heads/2024.11.x
X-Git-Oldrev: c0b9d4ecdf2be1b3110e85585a1ab2877d8b9e3a
X-Git-Newrev: 0b0db49fd3a7d99d90c4214a3ea5b1330d4a973b
X-Patchwork-Hint: ignore
Message-Id: <20250106162040.B8A8C83BB4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.11.x] package/bluez5_utils: fix
 dbusconfdir
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b0db49fd3a7d99d90c4214a3ea5b1330d4a973b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.11.x

Since D-Bus 1.14.0 installing default policies into sysconfdir (/etc)
is deprecated, they should go into datadir (/usr/share) instead
[1]. Follow that policy.

[1] https://gitlab.freedesktop.org/dbus/dbus/-/blob/8f1e00427f7048f8b24c3a1cfca8903254fe00d4/NEWS#L274-283

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 99b473c94868163ac40311dc488a6d8491568429)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/bluez5_utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 1695aeb210..7725fb94bf 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -28,7 +28,7 @@ BLUEZ5_UTILS_CONF_OPTS = \
 	--disable-lsan \
 	--disable-ubsan \
 	--disable-pie \
-	--with-dbusconfdir=/etc
+	--with-dbusconfdir=/usr/share
 
 ifeq ($(BR2_PACKAGE_BLUEZ5_UTILS_OBEX),y)
 BLUEZ5_UTILS_CONF_OPTS += --enable-obex
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
