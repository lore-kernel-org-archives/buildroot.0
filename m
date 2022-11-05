Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8110C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 860BB60C24;
	Mon,  5 Dec 2022 11:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 860BB60C24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhErQt-GI0c1; Mon,  5 Dec 2022 11:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B946C60BC9;
	Mon,  5 Dec 2022 11:54:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B946C60BC9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F2751BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E51B441688
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E51B441688
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b7lUX8R2Ni7x for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF95041679
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF95041679
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DF44F85BBE; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 19:23:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 54fd5f74f19d1e83d7c4571fc1b766c733072b94
X-Git-Newrev: 8c8a463a71c6ebaa34c339b1efc3e33c9306f450
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.DF44F85BBE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ssdp-responder: minor update of
 help text
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

commit: https://git.buildroot.net/buildroot/commit/?id=8c8a463a71c6ebaa34c339b1efc3e33c9306f450
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ssdp-responder/Config.in | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/ssdp-responder/Config.in b/package/ssdp-responder/Config.in
index df57546eed..8b5dfe67a6 100644
--- a/package/ssdp-responder/Config.in
+++ b/package/ssdp-responder/Config.in
@@ -7,14 +7,16 @@ config BR2_PACKAGE_SSDP_RESPONDER
 	  targeted more at embedded systems that need to announce
 	  themselves to Windows systems.
 
-	  ssdpd is a stand-alone UNIX, no external dependencies but the
-	  standard C library.  It has a built-in web server for serving
-	  the UPnP XML description which Windows use to present the
-	  icon, by default an InternetGatewayDevice is announced.
+	  The project consists of ssdpd and ssdp-scan.  The former is a
+	  stand-alone UNIX daemon, it has no dependencies but a standard
+	  C library.  It comes with built-in web server for serving the
+	  UPnP XML description on port 1901, the XML is used by Windows
+	  to present the icon, by default an InternetGatewayDevice is
+	  announced.
 
-	  Also included is ssdp-scan, a tool similar to mdns-scan, which
-	  continuously scans for SSDP capable hosts on the network.
-	  Take care only to use for debugging since it scans the network
-	  quite aggressively.
+	  ssdp-scan is a tool, similar to mdns-scan, to find other SSDP
+	  capable hosts on the network.  Take care to only use it for
+	  debugging, or quicker device discovery operations, since it
+	  scans the network quite aggressively.
 
 	  https://github.com/troglobit/ssdp-responder/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
