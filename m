Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103D6C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C8C982E22;
	Wed,  9 Feb 2022 16:57:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TgNc0tYa2diy; Wed,  9 Feb 2022 16:57:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E05CF82D75;
	Wed,  9 Feb 2022 16:57:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3BB191BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30FFC4151A
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YUVCdcUwsx7x for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6E9EE409B1
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:41 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2BEF3240008;
 Wed,  9 Feb 2022 16:52:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCq-0001Gv-Og; Wed, 09 Feb 2022 17:52:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:55 +0100
Message-Id: <20220209165213.4498-30-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 029/107] package/networkd-dispatcher: drop
 reference to python2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/networkd-dispatcher/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/networkd-dispatcher/Config.in b/package/networkd-dispatcher/Config.in
index ab8c473951..54b48e4ca8 100644
--- a/package/networkd-dispatcher/Config.in
+++ b/package/networkd-dispatcher/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_NETWORKD_DISPATCHER
 	depends on BR2_HOST_GCC_AT_LEAST_8 # python-gobject -> gobject-introspection -> host-qemu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # python-gobject -> gobject-introspection
 	depends on BR2_TOOLCHAIN_USES_GLIBC # python-gobject -> gobject-introspection
-	depends on !BR2_PACKAGE_PYTHON # python3
 	depends on BR2_PACKAGE_SYSTEMD # runtime
 	select BR2_PACKAGE_DBUS # dbus-python
 	select BR2_PACKAGE_DBUS_PYTHON # runtime
@@ -23,7 +22,6 @@ config BR2_PACKAGE_NETWORKD_DISPATCHER
 comment "networkd-dispatcher needs a glibc toolchain, gcc >= 4.9, host gcc >= 8"
 	depends on BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_SYSTEMD
-	depends on !BR2_PACKAGE_PYTHON
 	depends on !BR2_HOST_GCC_AT_LEAST_8 || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
