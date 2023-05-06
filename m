Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D428DC77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BECA41F4B;
	Sat,  6 May 2023 16:05:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BECA41F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k4ZiEQPf-u_r; Sat,  6 May 2023 16:05:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5767D418CD;
	Sat,  6 May 2023 16:05:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5767D418CD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E4801BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:05:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F9B83B17
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F9B83B17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dFN2NwSQu83e for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:05:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2899A83AFF
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2899A83AFF
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:05:29 +0000 (UTC)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
 by mailout08.t-online.de (Postfix) with SMTP id 6EDCC2895;
 Sat,  6 May 2023 18:05:27 +0200 (CEST)
Received: from fli4l.lan.fli4l ([79.214.192.80]) by fwd82.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pvKPV-27wAtd0; Sat, 6 May 2023 18:05:25 +0200
Received: from bruckner.lan.fli4l ([192.168.1.1]:43450)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pvKPU-0005HU-2c;
 Sat, 06 May 2023 18:05:24 +0200
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat,  6 May 2023 18:05:23 +0200
Message-Id: <20230506160524.2231307-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1683389125-79869C36-4692DF77/0/0 CLEAN NORMAL
X-TOI-MSGID: 685aac57-a1b5-416c-a704-3b6cf9406288
Subject: [Buildroot] [PATCH v2 1/2] package/libutp: bump version
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
v2: No changes

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
