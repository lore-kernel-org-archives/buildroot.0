Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D312CCA47C
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 19:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DDBF841610;
	Tue,  7 Jun 2022 19:33:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id amH3eBlCSxEE; Tue,  7 Jun 2022 19:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9CD04077D;
	Tue,  7 Jun 2022 19:33:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BABF1BF475
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8676540FE7
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 19:16:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wTjVklBsDyLW for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8EB3A40B30
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 19:16:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 8029386E22; Tue,  7 Jun 2022 19:04:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jun 2022 16:01:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5cc1bb317d558893e0bc188530222d46e9478ad6
X-Git-Newrev: da643b87eb75d115d32311bf562acc5b21053452
X-Patchwork-Hint: ignore
Message-Id: <20220607190458.8029386E22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/seatd: bump to version 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=da643b87eb75d115d32311bf562acc5b21053452
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Update seatd to version 0.7.0, which includes a flurry of small fixes
and removes usage of the SEATD_SOCK and SEATD_LOGLEVEL environment
variables (the latter replaced by a command line switch).

Release notes: https://git.sr.ht/~kennylevinsen/seatd/refs/0.7.0

The -Dlibseat-logind= option now needs the "systemd" value when the
logind backend is systemd-logind, this patch adapts usage of the build
option accordingly.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/seatd/seatd.hash | 2 +-
 package/seatd/seatd.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/seatd/seatd.hash b/package/seatd/seatd.hash
index 88793b6dd5..7500036e5b 100644
--- a/package/seatd/seatd.hash
+++ b/package/seatd/seatd.hash
@@ -1,5 +1,5 @@
 # Calculated locally
-sha256  3d4ac288114219ba7721239cafee7bfbeb7cf8e1e7fd653602a369e4ad050bd8  0.6.4.tar.gz
+sha256  210ddf8efa1149cde4dd35908bef8e9e63c2edaa0cdb5435f2e6db277fafff3c  0.7.0.tar.gz
 
 # License files
 sha256  282a494803d666616bd726e0279636b5f6a31387ae19a707459074050f2600d3  LICENSE
diff --git a/package/seatd/seatd.mk b/package/seatd/seatd.mk
index 5382cad39b..96caf63b30 100644
--- a/package/seatd/seatd.mk
+++ b/package/seatd/seatd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SEATD_VERSION = 0.6.4
+SEATD_VERSION = 0.7.0
 SEATD_SOURCE = $(SEATD_VERSION).tar.gz
 SEATD_SITE = https://git.sr.ht/~kennylevinsen/seatd/archive
 SEATD_LICENSE = MIT
@@ -17,7 +17,7 @@ SEATD_CONF_OPTS += \
 	-Dwerror=false
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_LOGIND),y)
-SEATD_CONF_OPTS += -Dlibseat-logind=enabled
+SEATD_CONF_OPTS += -Dlibseat-logind=systemd
 SEATD_DEPENDENCIES += systemd
 else
 SEATD_CONF_OPTS += -Dlibseat-logind=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
