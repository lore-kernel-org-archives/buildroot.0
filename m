Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E6D9C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B31AD41626;
	Sun,  7 Aug 2022 12:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B31AD41626
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PP9RuARTFVs3; Sun,  7 Aug 2022 12:50:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D04C414C4;
	Sun,  7 Aug 2022 12:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D04C414C4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C14C1BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:50:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8435D60ADF
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8435D60ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nqK0CtiWEGAa for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:50:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C252F60AC1
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:50:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C252F60AC1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8876586F1A; Sun,  7 Aug 2022 12:36:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:45:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bf8aed70c12aa785294f4b6d767873a5f4b38a9
X-Git-Newrev: 7674400360b0c9cdf195e3cf2478c30756559014
X-Patchwork-Hint: ignore
Message-Id: <20220807123613.8876586F1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: bump to version
 3.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7674400360b0c9cdf195e3cf2478c30756559014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/FreeRADIUS/freeradius-server/releases/tag/release_3_2_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.hash | 4 ++--
 package/freeradius-server/freeradius-server.mk   | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/freeradius-server/freeradius-server.hash b/package/freeradius-server/freeradius-server.hash
index cd0281c478..33ec09e7b0 100644
--- a/package/freeradius-server/freeradius-server.hash
+++ b/package/freeradius-server/freeradius-server.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking
-# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.0.25.tar.gz.sig
-sha256  4883a68bb3cee46025359a97c1691ce655e8babfd6dc3c021d00e109a2ff4c10  freeradius-server-3.0.25.tar.gz
+# ftp://ftp.freeradius.org/pub/freeradius/freeradius-server-3.2.0.tar.bz2.sig
+sha256  a3071cd78ffcb4706217561d822ee4c760daeb277a63f36a9f11d412c3c39e56  freeradius-server-3.2.0.tar.bz2
 sha256  0a0e46014fc2efd5144a30359c0e6e1ea9fa3dd407d3318204150efd7b4caf6a  COPYRIGHT
diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 4c526d2342..65a72ab532 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -4,7 +4,9 @@
 #
 ################################################################################
 
-FREERADIUS_SERVER_VERSION = 3.0.25
+FREERADIUS_SERVER_VERSION = 3.2.0
+FREERADIUS_SERVER_SOURCE = \
+	freeradius-server-$(FREERADIUS_SERVER_VERSION).tar.bz2
 FREERADIUS_SERVER_SITE = ftp://ftp.freeradius.org/pub/freeradius
 FREERADIUS_SERVER_LICENSE = GPL-2.0
 FREERADIUS_SERVER_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
