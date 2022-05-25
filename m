Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A66C433F5
	for <buildroot@archiver.kernel.org>; Wed, 25 May 2022 13:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91131415A0;
	Wed, 25 May 2022 13:59:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QE8-O7ToSFQI; Wed, 25 May 2022 13:59:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537B641582;
	Wed, 25 May 2022 13:59:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 355CE1BF2F5
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24485841E2
 for <buildroot@lists.busybox.net>; Wed, 25 May 2022 13:59:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 83VnWQOFomiu for <buildroot@lists.busybox.net>;
 Wed, 25 May 2022 13:59:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41D3883443
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=asX9rbTE133cagK+4Kyktm5PuUIrwCQx9R6n3u3sGrQ=; b=UtpQpkYsNqr3+aWEze0ige55y/
 utyLZACCp078pUFUsw/7spU12easLcMxyO+yucF5j89aSbPK17AypJxE7AQiDoKQXSQZgZlZpcRVY
 P5M/DYWE/Hqf+K5RJNlJC5xNvXD05U6Vw+Ty9Ek+gB78U2hm0hPN5NmjvXMT4m/7h/VTjnmorSIyt
 tWiNs13svwEOw+a5EYHZ3ro/oHALIK81AhDe83KqKaWpi6S0NEJp2q/jVMIH3WCK+l1t6B6gPH2IA
 SW/OGrU8Ef14aJmgaaeFwV1q4E4jmKzhqN6mv/XKEWl75FLtzYO66bMDXZ4Ppm1qnLeAG4/UtAe5+
 z55s2EnA==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ntrXp-0010LM-9T
 for <buildroot@buildroot.org>; Wed, 25 May 2022 15:59:25 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 080c57b0
 for <buildroot@buildroot.org>; Wed, 25 May 2022 13:59:13 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Date: Wed, 25 May 2022 16:59:13 +0300
Message-Id: <20220525135913.1615308-1-aperez@igalia.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/seatd: bump to version 0.7.0
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

Update seatd to version 0.7.0, which includes a flurry of small fixes
and removes usage of the SEATD_SOCK and SEATD_LOGLEVEL environment
variables (the latter replaced by a command line switch).

Release notes: https://git.sr.ht/~kennylevinsen/seatd/refs/0.7.0

The -Dlibseat-logind= option now needs the "systemd" value when the
logind backend is systemd-logind, this patch adapts usage of the build
option accordingly.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
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
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
