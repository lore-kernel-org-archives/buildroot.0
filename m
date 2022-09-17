Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900AAC54EE9
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 13:44:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 203C461122;
	Sat, 17 Sep 2022 13:44:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 203C461122
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8Q5VJ5oiHxl; Sat, 17 Sep 2022 13:44:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4920B6111E;
	Sat, 17 Sep 2022 13:44:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4920B6111E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 310281BF405
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CE926111E
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 13:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CE926111E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NG6auyPfTiIT for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1482161113
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1482161113
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 0152F84333; Sat, 17 Sep 2022 13:44:15 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 15:41:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d814c2bb6c52c93c51315ac2e90c0820ec9fd312
X-Git-Newrev: ac4d85b467e39fc675de5cb66ed0ed84a24baa09
X-Patchwork-Hint: ignore
Message-Id: <20220917134415.0152F84333@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nftables: bump to version 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac4d85b467e39fc675de5cb66ed0ed84a24baa09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bumps nftables to its 1.0.5 version. This will allow us to enable
the libedit cli implementation in a later commit thanks to a fix in
version 1.0.2, commit 3847fccf0045 ("cli: remove #include
<editline/history.h>").

Cc: Quentin Schulz <foss+buildroot@0leil.net>
Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index 53878abba9..5e5134b61d 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423  nftables-1.0.1.tar.bz2
+sha256  8d1b4b18393af43698d10baa25d2b9b6397969beecac7816c35dd0714e4de50a  nftables-1.0.5.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index e42108e159..56cef56524 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.1
+NFTABLES_VERSION = 1.0.5
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
