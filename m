Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CF2C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F056360B87;
	Sat, 15 Jan 2022 15:37:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Q5o9e57asom; Sat, 15 Jan 2022 15:37:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B0A360AC5;
	Sat, 15 Jan 2022 15:37:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 876ED1BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2D4660A8D
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eTfBxTL2lGZV for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 246B460A87
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C5F1D82B5A; Sat, 15 Jan 2022 15:30:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:23:58 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 26b2c756e7eb8ac383d505497627e180007c8b1c
X-Git-Newrev: e7f987493c49d56474682ac45b16be1b55cf1c32
X-Patchwork-Hint: ignore
Message-Id: <20220115153049.C5F1D82B5A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/connman: remove
 iptables as a mandatory dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7f987493c49d56474682ac45b16be1b55cf1c32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

connman might depend on iptables or nftables, and those dependencies
are already selected later in this file as required.

Config.in already only selects iptables if BR2_PACKAGE_CONNMAN_IPTABLES.

Signed-off-by: Nuno Goncalves <nunojpg@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit edc46a56f6da78a3f001758d4571695d88f28ffb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
