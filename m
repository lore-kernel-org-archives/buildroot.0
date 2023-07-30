Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6574CC001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 10:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B4F46068F;
	Sun, 30 Jul 2023 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B4F46068F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T7Zb5pxduz4q; Sun, 30 Jul 2023 10:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C88B60BBC;
	Sun, 30 Jul 2023 10:39:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C88B60BBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9271BF41B
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5175B410C2
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 10:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5175B410C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YYBXkPiRNq3 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 648D34091A
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 648D34091A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E8A383BD5; Sun, 30 Jul 2023 10:39:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 12:37:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5a32daed296aa19813588438a732c50565960b26
X-Git-Newrev: 268db827a23cde6870edaa067955c0acc82a7686
X-Patchwork-Hint: ignore
Message-Id: <20230730103918.4E8A383BD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mrouted: bump for v4.5 release
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=268db827a23cde6870edaa067955c0acc82a7686
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream ChangeLog:

 - Ignore IGMP proxy querys (src ip: 0.0.0.0), they must never win a
   querier election
 - Fix compat read location and new location for mrouted.genid
 - Fix "non-decreasing" generation id, must increment on each restart
 - Add support for configurable IGMP query response interval
 - Add support for configurable IGMP querier timeout
 - New 'join-group <group>' phyint option for cases where an IGMP
   snooping switch blocks flooding of multicast to the port where
   mrouted is connected
 - On startup and reconf, log why we skip disabled interfaces
 - Change to always log when assuming the IGMP querier role

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mrouted/mrouted.hash | 4 ++--
 package/mrouted/mrouted.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mrouted/mrouted.hash b/package/mrouted/mrouted.hash
index affb323b4b..7516a1329c 100644
--- a/package/mrouted/mrouted.hash
+++ b/package/mrouted/mrouted.hash
@@ -1,5 +1,5 @@
-# From https://github.com/troglobit/mrouted/releases/download/4.4/mrouted-4.4.tar.gz.sha256
-sha256  095439e544d69c91ed64fa87db7e35bc2155eef48b7f268281d80946d2c6b953  mrouted-4.4.tar.gz
+# From https://github.com/troglobit/mrouted/releases/
+sha256  99e1a1ca45e4e6c05b3cf379fd59a239aeabd9512656114528ad5e172d3c8ba8  mrouted-4.5.tar.gz
 
 # Locally calculated
 sha256  834f45ed282fd010f354ecc0a50538af519a1cfcc4d2866de3be06982fa9ed29  LICENSE
diff --git a/package/mrouted/mrouted.mk b/package/mrouted/mrouted.mk
index 4014b8f896..3e2f49dc10 100644
--- a/package/mrouted/mrouted.mk
+++ b/package/mrouted/mrouted.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MROUTED_VERSION = 4.4
+MROUTED_VERSION = 4.5
 MROUTED_SITE = \
 	https://github.com/troglobit/mrouted/releases/download/$(MROUTED_VERSION)
 MROUTED_DEPENDENCIES = host-bison
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
