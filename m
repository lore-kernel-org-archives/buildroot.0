Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D3C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:17:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB8C760F39
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DB8C760F39
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5EA8403A2;
	Wed,  3 Nov 2021 21:17:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKEGE3F4Kd5o; Wed,  3 Nov 2021 21:17:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D393C40398;
	Wed,  3 Nov 2021 21:17:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7251BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79DAB60730
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:17:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ruFKVenuB9Im for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:17:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE38B606B3
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:17:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 31C648A475; Wed,  3 Nov 2021 21:13:34 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:15:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b49417ebc623d24cb63cdd2242d478d325712b75
X-Git-Newrev: 349f5bcfb0ce6cb28f5c678db8a99fee0da5dd63
X-Patchwork-Hint: ignore
Message-Id: <20211103211334.31C648A475@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mender: install
 io.mender.UpdateManager.conf dbus file
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

commit: https://git.buildroot.net/buildroot/commit/?id=349f5bcfb0ce6cb28f5c678db8a99fee0da5dd63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This file adds a DBus endpoint for the UpdateControlMap, which allows a user
to set the ID and Priority of a given update process

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index ec48a716ed..f1366a9deb 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -92,6 +92,9 @@ MENDER_DEPENDENCIES += libglib2
 define MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.AuthenticationManager.conf \
 		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.AuthenticationManager.conf
+
+	$(INSTALL) -D -m 0755 $(@D)/support/dbus/io.mender.UpdateManager.conf \
+		      $(TARGET_DIR)/etc/dbus-1/system.d/io.mender.UpdateManager.conf
 endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_DBUS_AUTHENTICATION_MANAGER_CONF
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
