Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CACBC74A4B
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F0ED41676;
	Sun, 12 Mar 2023 22:08:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F0ED41676
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X7aGaz-kryst; Sun, 12 Mar 2023 22:08:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34C7B402BA;
	Sun, 12 Mar 2023 22:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34C7B402BA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0F0771BF334
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE205405F4
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 22:08:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE205405F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZioLeASE9pX for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 22:08:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A1FA405D9
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0A1FA405D9
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 22:08:42 +0000 (UTC)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
 by mailout05.t-online.de (Postfix) with SMTP id 6C85AE260;
 Sun, 12 Mar 2023 23:08:40 +0100 (CET)
Received: from fli4l.lan.fli4l ([79.214.204.131]) by fwd78.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pbTrr-1L6LNR0; Sun, 12 Mar 2023 23:08:39 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:46874)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pbTrq-0006rN-3C;
 Sun, 12 Mar 2023 23:08:39 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 23:08:37 +0100
Message-Id: <20230312220838.288338-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678658919-DD34B4E4-9186564F/0/0 CLEAN NORMAL
X-TOI-MSGID: 69ba77da-7b4b-4832-bc01-26df2c3cc142
Subject: [Buildroot] [PATCH 1/2] package/libutp: bump version
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
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Needed for bumping transmission to version 4.0.1.

Added configure option to fix build error with gcc-12.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libutp/libutp.hash | 2 +-
 package/libutp/libutp.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libutp/libutp.hash b/package/libutp/libutp.hash
index f347dc3f2c..0312f42612 100644
--- a/package/libutp/libutp.hash
+++ b/package/libutp/libutp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  484f802d044f774fa5f669476ecdd9cb6110c383781c39adc03bbf6575090771  libutp-059c9449a104e440e4f913756a5f560dd4ae76a9.tar.gz
+sha256  d856fde68828d52eb39df40e15ad5dc4efaa9a51d4121bcbfbe47fed2163d20a  libutp-c95738b1a6644b919e5b64d3ea9736cfc5894e0b.tar.gz
 sha256  73b400bf61dde52223dae1642205ca187f1a6b24a508dcce52bf386c27a0e58c  LICENSE
diff --git a/package/libutp/libutp.mk b/package/libutp/libutp.mk
index 394c1e9cb9..df0617555d 100644
--- a/package/libutp/libutp.mk
+++ b/package/libutp/libutp.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LIBUTP_VERSION = 059c9449a104e440e4f913756a5f560dd4ae76a9
+LIBUTP_VERSION = c95738b1a6644b919e5b64d3ea9736cfc5894e0b
 LIBUTP_SITE = $(call github,transmission,libutp,$(LIBUTP_VERSION))
 LIBUTP_LICENSE = MIT
 LIBUTP_LICENSE_FILES = LICENSE
 LIBUTP_INSTALL_STAGING = YES
+LIBUTP_CONF_OPTS = -DLIBUTP_ENABLE_WERROR=OFF
 
 $(eval $(cmake-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
