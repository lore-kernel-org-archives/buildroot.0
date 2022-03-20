Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB5FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 12:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DD1240918;
	Sun, 20 Mar 2022 12:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kGl1RAJmwzlJ; Sun, 20 Mar 2022 12:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9095408FB;
	Sun, 20 Mar 2022 12:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A3021BF591
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:17:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 167CC60BD7
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 12:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1-lJ6-FWkOaU for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 12:17:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2564160BB5
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 12:17:14 +0000 (UTC)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
 by mailout11.t-online.de (Postfix) with SMTP id 825E119F79
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 13:17:11 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.197.211]) by fwd85.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1nVuUe-3gfGW90; Sun, 20 Mar 2022 13:17:08 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:56740)
 by fli4l.lan.fli4l with esmtp (Exim 4.95)
 (envelope-from <bernd.kuhls@t-online.de>) id 1nVuUe-0006k9-6D
 for buildroot@buildroot.org; Sun, 20 Mar 2022 13:17:08 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 13:17:08 +0100
Message-Id: <20220320121708.3679262-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647778628-00014AB5-B331F2D2/0/0 CLEAN NORMAL
X-TOI-MSGID: 7c5004de-cf76-4394-bae1-86606f3a03c1
Subject: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.15.6
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

Release notes: https://www.samba.org/samba/history/samba-4.15.6.html

Added new answer to samba4-cache.txt needed due to upstream commit:
https://gitlab.com/samba-team/samba/-/commit/f7e31127e7f8beb12294c5187cca9e191589ddcc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4-cache.txt | 1 +
 package/samba4/samba4.hash      | 4 ++--
 package/samba4/samba4.mk        | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4-cache.txt b/package/samba4/samba4-cache.txt
index ba849b7c6e..d95776a03e 100644
--- a/package/samba4/samba4-cache.txt
+++ b/package/samba4/samba4-cache.txt
@@ -44,3 +44,4 @@ Checking value of GNUTLS_CIPHER_AES_128_CFB8: 29
 Checking value of GNUTLS_MAC_AES_CMAC_128: 203
 Checking whether fcntl supports flags to send direct I/O availability signals: OK
 Checking for gnutls fips mode support: NO
+Checking for readlink breakage: NO
diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 503ec2ce37..20e5f00b21 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.15.5.tar.asc
-sha256  69115e33831937ba5151be0247943147765aece658ba743f44741672ad68d17f  samba-4.15.5.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.15.6.tar.asc
+sha256  0575b999a9048445820428dc540ba8a9527ce596fa66af02ea2ba1ea9578bcb4  samba-4.15.6.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index 0ad3c2f742..688aaac3eb 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.15.5
+SAMBA4_VERSION = 4.15.6
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
