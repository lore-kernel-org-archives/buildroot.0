Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74379C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 16 Feb 2023 18:36:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2133F6139B;
	Thu, 16 Feb 2023 18:36:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2133F6139B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GOEPFcZ-_BOe; Thu, 16 Feb 2023 18:36:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E13B6120B;
	Thu, 16 Feb 2023 18:36:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E13B6120B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AF49A1BF963
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89B0A60687
 for <buildroot@lists.busybox.net>; Thu, 16 Feb 2023 18:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89B0A60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mPdhaSL3NOqY for <buildroot@lists.busybox.net>;
 Thu, 16 Feb 2023 18:36:04 +0000 (UTC)
X-Greylist: delayed 00:08:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C55760008
Received: from mailout10.t-online.de (unknown [194.25.134.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7C55760008
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 18:36:04 +0000 (UTC)
Received: from fwd77.dcpf.telekom.de (fwd77.aul.t-online.de [10.223.144.103])
 by mailout10.t-online.de (Postfix) with SMTP id EC7D71A2EB
 for <buildroot@buildroot.org>; Thu, 16 Feb 2023 19:28:00 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.190.165]) by fwd77.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1pSizA-0VJNHl0; Thu, 16 Feb 2023 19:28:00 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:33982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pSizA-0005Wa-0X
 for buildroot@buildroot.org; Thu, 16 Feb 2023 19:28:00 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Thu, 16 Feb 2023 19:28:00 +0100
Message-Id: <20230216182800.254043-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676572080-E955437F-73BD6470/0/0 CLEAN NORMAL
X-TOI-MSGID: e062328f-fa7a-4175-bb41-b5f3a64fd1d4
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 0.103.8
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

Release notes:
https://blog.clamav.net/2023/02/clamav-01038-01052-and-101-patch.html

Fixes CVE-2023-20032 & CVE-2023-20052.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 60439400ee..27f9b16a39 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  1e34c31f600cb3b5bd1bf76690590cdeebe9409b330959b1c0f77d421bb17e50  clamav-0.103.7.tar.gz
+sha256  6f49da6ee927936de13d359e559d3944248e3a257d40b80b6c99ebe6fe8c8c3f  clamav-0.103.8.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index dfdc416601..0f0491bf0d 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 0.103.7
+CLAMAV_VERSION = 0.103.8
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = COPYING COPYING.bzip2 COPYING.file COPYING.getopt \
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
