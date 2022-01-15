Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB758C433F5
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 15:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82ED860ACB;
	Sat, 15 Jan 2022 15:39:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MWP2bLRSQJBP; Sat, 15 Jan 2022 15:39:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF6A560B9E;
	Sat, 15 Jan 2022 15:39:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F00211BF4E7
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7276940502
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 15:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0VBX7d5xeho3 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 15:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD1B840463
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 15:37:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B04882B6F; Sat, 15 Jan 2022 15:31:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 16:24:32 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 8339a5b58390032521577ef6fa4be4653fb1dfc2
X-Git-Newrev: 9c9e151b19e2b4cb147e44bdeec44814a63a41ad
X-Patchwork-Hint: ignore
Message-Id: <20220115153110.5B04882B6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/connman: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c9e151b19e2b4cb147e44bdeec44814a63a41ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

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
