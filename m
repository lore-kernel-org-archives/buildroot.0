Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE0EC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 09:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39FC341523;
	Sat, 14 Jan 2023 09:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39FC341523
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PMM8x5zT1kP5; Sat, 14 Jan 2023 09:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03077410DB;
	Sat, 14 Jan 2023 09:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03077410DB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA2C61BF285
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 09:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92A288216A
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 09:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92A288216A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o6taF7QZYCaz for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 09:09:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5114381F29
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5114381F29
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 09:09:43 +0000 (UTC)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
 by mailout04.t-online.de (Postfix) with SMTP id D9F48F772
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 10:09:07 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd71.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1pGcXD-4H74RF0; Sat, 14 Jan 2023 10:09:07 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45846)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1pGcXD-0003xU-1L
 for buildroot@buildroot.org; Sat, 14 Jan 2023 10:09:07 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 10:09:07 +0100
Message-Id: <20230114090907.25641-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673687347-01604ECF-BD5B4F63/0/0 CLEAN NORMAL
X-TOI-MSGID: 21b3714d-d8c9-4233-a38a-7cb4800cbc45
Subject: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.7.13
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

Changelog:
https://gitlab.torproject.org/tpo/core/tor/-/blob/main/ChangeLog?expanded=true&viewer=simple

Fixes CVE-2023-23589 aka TROVE-2022-002:
https://gitlab.torproject.org/tpo/core/tor/-/issues/40730

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/tor/tor.hash | 4 ++--
 package/tor/tor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/tor/tor.hash b/package/tor/tor.hash
index 2a2953dc29..51892f15c3 100644
--- a/package/tor/tor.hash
+++ b/package/tor/tor.hash
@@ -1,4 +1,4 @@
-# From https://dist.torproject.org/tor-0.4.7.12.tar.gz.sha256sum
-sha256  3b5d969712c467851bd028f314343ef15a97ea457191e93ffa97310b05b9e395  tor-0.4.7.12.tar.gz
+# From https://dist.torproject.org/tor-0.4.7.13.tar.gz.sha256sum
+sha256  2079172cce034556f110048e26083ce9bea751f3154b0ad2809751815b11ea9d  tor-0.4.7.13.tar.gz
 # Locally computed
 sha256  47b54ed17e8fdcab3c44729a1789a09b208f9a63a845a7e50def9df729eebad0  LICENSE
diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index 6812005618..03bd998708 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOR_VERSION = 0.4.7.12
+TOR_VERSION = 0.4.7.13
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
