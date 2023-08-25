Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E3C3DA66
	for <buildroot@archiver.kernel.org>; Fri, 25 Aug 2023 21:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8382883B0F;
	Fri, 25 Aug 2023 21:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8382883B0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qyr6AByttF_r; Fri, 25 Aug 2023 21:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5E5A83D3F;
	Fri, 25 Aug 2023 21:04:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5E5A83D3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5D90E1BF995
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37CE9820F6
 for <buildroot@lists.busybox.net>; Fri, 25 Aug 2023 21:03:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37CE9820F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Pvp3v-5eTOC for <buildroot@lists.busybox.net>;
 Fri, 25 Aug 2023 21:03:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 561D681470
 for <buildroot@buildroot.org>; Fri, 25 Aug 2023 21:03:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 561D681470
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44BF5863BD; Fri, 25 Aug 2023 21:03:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Aug 2023 23:03:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 47ac12bd4ee4025e94e82a5484c2a2a60cb59281
X-Git-Newrev: c11950fe4a2817c4bd1fa6d9c9e3cd3783b3f96f
X-Patchwork-Hint: ignore
Message-Id: <20230825210356.44BF5863BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mosquitto: bump to version 2.0.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=c11950fe4a2817c4bd1fa6d9c9e3cd3783b3f96f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bugfix release, fixing a number of regressions in 2.0.16

From the changelog
(https://github.com/eclipse/mosquitto/blob/master/ChangeLog.txt)

2.0.17 - 2023-08-22
===================

Broker:
- Fix `max_queued_messages 0` stopping clients from receiving messages.
  Closes #2879.
- Fix `max_inflight_messages` not being set correctly. Closes #2876.

Apps:
- Fix `mosquitto_passwd -U` backup file creation. Closes #2873.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mosquitto/mosquitto.hash | 4 ++--
 package/mosquitto/mosquitto.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mosquitto/mosquitto.hash b/package/mosquitto/mosquitto.hash
index cbe54d6d1a..df0a51df3a 100644
--- a/package/mosquitto/mosquitto.hash
+++ b/package/mosquitto/mosquitto.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking gpg signature
-# from https://mosquitto.org/files/source/mosquitto-2.0.16.tar.gz.asc
-sha256  638db9e43e89d243ea98d10d66e76ff376131217780decd01abaffacc66d8035  mosquitto-2.0.16.tar.gz
+# from https://mosquitto.org/files/source/mosquitto-2.0.17.tar.gz.asc
+sha256  3be7a911236567c1a9fbe25baf3e3167004ba4a0c151a448ef1f7fc077dba52f  mosquitto-2.0.17.tar.gz
 
 # License files
 sha256  d3c4ccace4e5d3cc89d34cf2a0bc85b8596bfc0a32b815d0d77f9b7c41b5350c  LICENSE.txt
diff --git a/package/mosquitto/mosquitto.mk b/package/mosquitto/mosquitto.mk
index f146a86d0a..0b85246f39 100644
--- a/package/mosquitto/mosquitto.mk
+++ b/package/mosquitto/mosquitto.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MOSQUITTO_VERSION = 2.0.16
+MOSQUITTO_VERSION = 2.0.17
 MOSQUITTO_SITE = https://mosquitto.org/files/source
 MOSQUITTO_LICENSE = EPL-2.0 or EDLv1.0
 MOSQUITTO_LICENSE_FILES = LICENSE.txt epl-v20 edl-v10
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
