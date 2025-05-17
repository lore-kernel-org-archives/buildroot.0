Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E19CC2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9234283DB8;
	Sat, 17 May 2025 09:30:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdE1GCuTd3rk; Sat, 17 May 2025 09:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7742483D8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7742483D8D;
	Sat, 17 May 2025 09:30:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B4B821DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9AB9E60C2A
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:30:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Q5IUOcsga9h for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D620560A89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D620560A89
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:30:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C73FA86E16; Sat, 17 May 2025 09:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 11:30:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eeb49a1f1f970fcd06c120c183315688be2629ea
X-Git-Newrev: 3502bfe7a5d6b56748bdce5d440d8f2419f07c0c
X-Patchwork-Hint: ignore
Message-Id: <20250517093039.C73FA86E16@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: bump to version 2.4.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3502bfe7a5d6b56748bdce5d440d8f2419f07c0c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is needed following the bump of libyang (3.12.2),
sysrepo (3.6.11) and libnetconf2 (3.7.1), as netopeer2 2.4.1 is the
version designed to work with those other components.

See https://github.com/CESNET/netopeer2/releases for the changes.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 6a278fbbaf..3a70b15539 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2b1daac037f18c303e0c0dc3318ba30196459472e4c59f2f8547ee74d4cdf31d  netopeer2-2.1.49.tar.gz
+sha256  86d77efcb65f0bb2c3bc0f2128a320113ce7125f39882fe7d8334c168ed9567d  netopeer2-2.4.1.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 4853e5d176..71f2c50640 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.1.49
+NETOPEER2_VERSION = 2.4.1
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
