Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DACEC2BB3F
	for <buildroot@archiver.kernel.org>; Wed, 15 Nov 2023 20:31:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5437460BED;
	Wed, 15 Nov 2023 20:31:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5437460BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ev2-Gw6Ytnwh; Wed, 15 Nov 2023 20:31:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D36614FD;
	Wed, 15 Nov 2023 20:31:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2D36614FD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EF8841BF599
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 20:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C40304013F
 for <buildroot@lists.busybox.net>; Wed, 15 Nov 2023 20:31:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C40304013F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7w4vG7nh-skV for <buildroot@lists.busybox.net>;
 Wed, 15 Nov 2023 20:31:24 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A9AD401C2
 for <buildroot@buildroot.org>; Wed, 15 Nov 2023 20:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A9AD401C2
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3MXfrCWcVHntA3MXfrgeMn; Wed, 15 Nov 2023 21:31:19 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Nov 2023 21:31:17 +0100
Message-Id: <20231115203118.3578238-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL5GHaTJ1iSbeZg1BZbqjHprpyuuomCq/HYJvirPPy7jwexEcUZKqQke08FNPQ5Rks0FV+MCcZRTAtjKwl4+ECyY/s27MamLlDeIo8goanyt3iHTKyDa
 SBDUqI21rY6HSJxp5jwAl8/m/exq8V8aN8xDlY/GoDmvujXIQBtKVgyoutTkNkiy+Co/ghyXjkoc3zUZmVFeLQ03KG5u062+cfLnbUtYNBlThx+90CtrBB5J
 dUv9luxzu6895U5Jl3HQJ7kVjJEjaTkdbFddBMDQw2QgD2LKiQvf2ibNshSX2YFDn79MJNq2L7Pn16DDp1UmeDS2T3qr3sp212pHwbORIXIJ519oW1sJ1eAO
 dKIsfh8+
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700080279; bh=FVVmepGAF6FAhEIJitMXowExUf/sAhb9ad2uYjBdIhc=;
 h=From:To:Subject:Date:MIME-Version;
 b=P49dSCTFYUdFA/4FtFM0OOvEMGvubxH5cgPhcT7Lhh+fWdvo9psnxFWLOk2Ofxf8a
 jitoxat2A2t462BoUIoIKIRZJI7u5kKsPoxcmd6RrVeRQWwrIT2rV/GqWdKdvdB3BL
 RNIPdL5r//Fo17fTQMQHx861svaXRbC3cfTu0oEo5RMicc9h3Wt2dT6L2lysHpj7Ec
 pZ0xEnH10TS8VZpgkpOSm9rAgnXO0x5xISWaCF0t3hebrlD6sRkJq+bauc1TZxvM9u
 zN9hV2EdXr5mypuKHPx3sEG+d43yIliWTUA9fOrRVCruYx3jnN+luXMEyKShZxkcKq
 iwom4+uk2uW4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P49dSCTF
Subject: [Buildroot] [PATCH] package/rtl8192eu: bump to version 2023-11-13
 on branch 5.11.2.1
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It supports up to Linux 6.7.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8192eu/rtl8192eu.hash | 2 +-
 package/rtl8192eu/rtl8192eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8192eu/rtl8192eu.hash b/package/rtl8192eu/rtl8192eu.hash
index 8528689670..e27acba124 100644
--- a/package/rtl8192eu/rtl8192eu.hash
+++ b/package/rtl8192eu/rtl8192eu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  665a8f857b3881554edd6d5e5e6c8f058b8ecfecf921817993e861d48e214d36  rtl8192eu-ac8517206e14f70babbeed68e136ee23c85cba3d.tar.gz
+sha256  2326902c27aee022bd1f6e49e8dbf789b08613e660385c23ded8038074d7929b  rtl8192eu-a928f08c1dd4f9a1e84d85811a543e974551bc4f.tar.gz
diff --git a/package/rtl8192eu/rtl8192eu.mk b/package/rtl8192eu/rtl8192eu.mk
index 9ae29d9940..a2fde6fef0 100644
--- a/package/rtl8192eu/rtl8192eu.mk
+++ b/package/rtl8192eu/rtl8192eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8192EU_VERSION = ac8517206e14f70babbeed68e136ee23c85cba3d
+RTL8192EU_VERSION = a928f08c1dd4f9a1e84d85811a543e974551bc4f
 RTL8192EU_SITE = $(call github,clnhub,rtl8192eu-linux,$(RTL8192EU_VERSION))
 RTL8192EU_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
