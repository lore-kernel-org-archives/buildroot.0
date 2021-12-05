Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB029C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:45:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6384E404BB;
	Mon,  6 Dec 2021 18:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RgthVwL6mfh7; Mon,  6 Dec 2021 18:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 555D4400C8;
	Mon,  6 Dec 2021 18:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10D561BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87EAF41C54
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KbA2Pu_Ife6W for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04CE241C59
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 92D3881468; Mon,  6 Dec 2021 18:07:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 5 Dec 2021 11:01:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 066b9a232fdd76c9761fbe128d059796af6c7522
X-Git-Newrev: f4d2d927fddb59e0648442b03ccac234742f1d42
X-Patchwork-Hint: ignore
Message-Id: <20211206180743.92D3881468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/network-manager: add optional
 polkit support
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

commit: https://git.buildroot.net/buildroot/commit/?id=f4d2d927fddb59e0648442b03ccac234742f1d42
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 91bc6479b8..7213b69e15 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -105,6 +105,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-modem-manager-1
 endif
 
+ifeq ($(BR2_PACKAGE_POLKIT),y)
+NETWORK_MANAGER_DEPENDENCIES += polkit
+NETWORK_MANAGER_CONF_OPTS += --enable-polkit
+else
+NETWORK_MANAGER_CONF_OPTS += --disable-polkit
+endif
+
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 NETWORK_MANAGER_CONF_OPTS += --with-dhclient=/sbin/dhclient
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
