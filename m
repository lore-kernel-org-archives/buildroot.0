Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143F0C4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:17:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8280419C5;
	Mon,  4 Dec 2023 21:17:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8280419C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTMsLrIxgCYn; Mon,  4 Dec 2023 21:17:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B303A419CF;
	Mon,  4 Dec 2023 21:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B303A419CF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24B0B1BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F012C41769
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F012C41769
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H6-wW3fMOkqW for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:17:01 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01ED8417C2
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:17:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01ED8417C2
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 92855A4C042A;
 Mon,  4 Dec 2023 22:16:52 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:32950)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGJA-0007CX-13;
 Mon, 04 Dec 2023 22:16:52 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:16:52 +0100
Message-Id: <20231204211652.12706-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724612;
 bh=usEorsTq1ZxhpdrsWootK+8l2ZIVXTfke2eC+ie2ykM=;
 h=From:To:Cc:Subject:Date:From;
 b=tEPgKmqLb9eeL825iALPL0LRzFhr5QqlFqm7ySa9ktpOGVzJhaEY8wNrdgqzKpkGy
 8rlrJzbHif328dm2dIzWDBSU1tAZo778JgozTuuft3dVJFT5uiNoYdmqSTkuwAFbtX
 O6Y9fwwpT5TM1y2FfTVQWS31eDft/h6tAc3gXcRiY3ehRK66V2hUcya0092YYzdMz6
 4N8M4WlrM25bQGCg91sflzY6R2GnRt2gupG4deChDXzh7tKGbblV93/Xb1yGAXN9uN
 xi6TryQWNTuZR9nbRPRiDevQVuOa+mVXoh9QwbtXI0tVKWXGYqwvwKu2D8FbAFKCll
 AyJ55E3sBQrrA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=tEPgKmqL
Subject: [Buildroot] [PATCH 1/1] package/sofia-sip: bump version to 1.13.17
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
Cc: Gregory Dymarek <gregd72002@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/sofia-sip/sofia-sip.hash | 2 +-
 package/sofia-sip/sofia-sip.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sofia-sip/sofia-sip.hash b/package/sofia-sip/sofia-sip.hash
index 6799a941be..f4ce8d832d 100644
--- a/package/sofia-sip/sofia-sip.hash
+++ b/package/sofia-sip/sofia-sip.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  125a9653bea1fc1cb275e4aec3445aa2deadf1fe3f1adffae9559d2349bfab36  sofia-sip-1.13.16.tar.gz
+sha256  daca3d961b6aa2974ad5d3be69ed011726c3e4d511b2a0d4cb6d878821a2de7a  sofia-sip-1.13.17.tar.gz
 sha256  e1c0890440efe31b6cd2ee2abf895eb917c787799f079133f5809414d90d5d60  COPYING
 sha256  b402ae58cf355b33be8fa023f704a039e3d41ecaccd2bbcda43ca31d703e4556  COPYRIGHTS
diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
index c829625cb0..a64716483f 100644
--- a/package/sofia-sip/sofia-sip.mk
+++ b/package/sofia-sip/sofia-sip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOFIA_SIP_VERSION = 1.13.16
+SOFIA_SIP_VERSION = 1.13.17
 SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
 SOFIA_SIP_INSTALL_STAGING = YES
 # Fetched from github, no pre-generated configure script provided
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
