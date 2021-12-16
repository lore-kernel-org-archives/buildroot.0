Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEDAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450E66104C;
	Thu, 16 Dec 2021 18:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bz70jAZX_aVI; Thu, 16 Dec 2021 18:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CF6B61041;
	Thu, 16 Dec 2021 18:26:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CC43F1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A3911417A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:24:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQe-rAIQVuqR for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35DC4417AA
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:24:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CC6A4818E5; Thu, 16 Dec 2021 18:19:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 19:17:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a28d25d0c61dfd040362c8af0896e73b4eaa71d
X-Git-Newrev: edc46a56f6da78a3f001758d4571695d88f28ffb
X-Patchwork-Hint: ignore
Message-Id: <20211216181916.CC6A4818E5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/connman: remove iptables as a
 mandatory dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=edc46a56f6da78a3f001758d4571695d88f28ffb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

connman might depend on iptables or nftables, and those dependencies
are already selected later in this file as required.

Config.in already only selects iptables if BR2_PACKAGE_CONNMAN_IPTABLES.

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/connman/connman.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/connman.mk b/package/connman/connman.mk
index 0355426e92..e5e596c973 100644
--- a/package/connman/connman.mk
+++ b/package/connman/connman.mk
@@ -7,7 +7,7 @@
 CONNMAN_VERSION = 1.40
 CONNMAN_SOURCE = connman-$(CONNMAN_VERSION).tar.xz
 CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman
-CONNMAN_DEPENDENCIES = libglib2 dbus iptables
+CONNMAN_DEPENDENCIES = libglib2 dbus
 CONNMAN_INSTALL_STAGING = YES
 CONNMAN_LICENSE = GPL-2.0
 CONNMAN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
