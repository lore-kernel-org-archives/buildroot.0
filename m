Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD29FA3743
	for <buildroot@archiver.kernel.org>; Fri, 28 Oct 2022 19:24:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69BD660BA4;
	Fri, 28 Oct 2022 19:24:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69BD660BA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VECDZ-fKwsOO; Fri, 28 Oct 2022 19:24:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92EFA606F9;
	Fri, 28 Oct 2022 19:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92EFA606F9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E54851BF859
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:24:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C115C817A9
 for <buildroot@lists.busybox.net>; Fri, 28 Oct 2022 19:24:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C115C817A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m_eNGiXJMMsX for <buildroot@lists.busybox.net>;
 Fri, 28 Oct 2022 19:24:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A89B4817A8
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A89B4817A8
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 19:24:14 +0000 (UTC)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
 by mailout09.t-online.de (Postfix) with SMTP id 215C7E80F
 for <buildroot@buildroot.org>; Fri, 28 Oct 2022 21:24:12 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.199.226]) by fwd80.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1ooUxd-1UySFF0; Fri, 28 Oct 2022 21:24:09 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:45664)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1ooUxd-0004lZ-0v
 for buildroot@buildroot.org; Fri, 28 Oct 2022 21:24:09 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Fri, 28 Oct 2022 21:24:09 +0200
Message-Id: <20221028192409.132447-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666985049-C13271D1-2C9EB8CF/0/0 CLEAN NORMAL
X-TOI-MSGID: 5fb56cdd-4dcc-4213-bda3-815da5bf0b79
Subject: [Buildroot] [PATCH 1/1] package/rsync: bump version to 3.2.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes: https://download.samba.org/pub/rsync/NEWS

Switched _SITE and package URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/rsync/Config.in  | 2 +-
 package/rsync/rsync.hash | 4 ++--
 package/rsync/rsync.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/rsync/Config.in b/package/rsync/Config.in
index b952974efb..b572c701ec 100644
--- a/package/rsync/Config.in
+++ b/package/rsync/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_RSYNC
 	help
 	  File transfer program to keep remote files in sync.
 
-	  http://rsync.samba.org/
+	  https://rsync.samba.org/
diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
index f0ba4d321d..842b5c099f 100644
--- a/package/rsync/rsync.hash
+++ b/package/rsync/rsync.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/rsync/src/rsync-3.2.5.tar.gz.asc
-sha256  2ac4d21635cdf791867bc377c35ca6dda7f50d919a58be45057fd51600c69aba  rsync-3.2.5.tar.gz
+# https://rsync.samba.org/ftp/rsync/src/rsync-3.2.7.tar.gz.asc
+sha256  4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb  rsync-3.2.7.tar.gz
 # Locally calculated
 sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index e288033b98..81ad4b9291 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-RSYNC_VERSION = 3.2.5
-RSYNC_SITE = http://rsync.samba.org/ftp/rsync/src
+RSYNC_VERSION = 3.2.7
+RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
 RSYNC_LICENSE = GPL-3.0+ with exceptions
 RSYNC_LICENSE_FILES = COPYING
 RSYNC_CPE_ID_VENDOR = samba
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
