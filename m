Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F6AC4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 18:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5036860ABE;
	Sat,  5 Nov 2022 18:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5036860ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUaQOyfyQVqi; Sat,  5 Nov 2022 18:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B59060B20;
	Sat,  5 Nov 2022 18:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B59060B20
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 463B71BF870
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D99E4023C
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 18:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D99E4023C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9g_O20gWm-vS for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 18:25:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16D04401FF
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 18:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16D04401FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE40787DB5; Sat,  5 Nov 2022 18:25:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 19:23:49 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 738500c296c8b1206f20e94ca3e7c5932a6a0486
X-Git-Newrev: 54fd5f74f19d1e83d7c4571fc1b766c733072b94
X-Patchwork-Hint: ignore
Message-Id: <20221105182504.EE40787DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ssdp-responder: bump
 to version 1.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=54fd5f74f19d1e83d7c4571fc1b766c733072b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Changes:
 - New command line options to ssdp-scan
 - Update copyright years (affects LICENSE file hash)

Fixes:
 - Workaround for OpenVPN /32 default server setup
 - Time-of-check vs time-of-use issue with caching of UUID,
   found by Coverity Scan, fixed by Raul Porancea

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ssdp-responder/ssdp-responder.hash | 4 ++--
 package/ssdp-responder/ssdp-responder.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ssdp-responder/ssdp-responder.hash b/package/ssdp-responder/ssdp-responder.hash
index e8cbbb4a1f..425ad86e08 100644
--- a/package/ssdp-responder/ssdp-responder.hash
+++ b/package/ssdp-responder/ssdp-responder.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  7ae49229e7c7a55fed9e36598b12e2173eecef0fffe0a386b6a10fad30f3c79f  ssdp-responder-1.8.tar.gz
-sha256  e17dc0bc91bf499d8cca5e016c22c6d2a4770e3cc1a43756a7973375a83ddb90  LICENSE
+sha256  974c244abd4ba8c87532867a84756182a1460c99072ffb1eb91c5a1f73311d89  ssdp-responder-1.9.tar.gz
+sha256  68d6fdc22e337f725fe719bf9ae6d92b1d8d0ca4cff8219b303ab76706670a8d  LICENSE
diff --git a/package/ssdp-responder/ssdp-responder.mk b/package/ssdp-responder/ssdp-responder.mk
index 3fee4c2006..fd7b1ea44b 100644
--- a/package/ssdp-responder/ssdp-responder.mk
+++ b/package/ssdp-responder/ssdp-responder.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSDP_RESPONDER_VERSION = 1.8
+SSDP_RESPONDER_VERSION = 1.9
 SSDP_RESPONDER_SITE = https://github.com/troglobit/ssdp-responder/releases/download/v$(SSDP_RESPONDER_VERSION)
 SSDP_RESPONDER_LICENSE = ISC
 SSDP_RESPONDER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
