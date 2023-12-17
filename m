Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 438F2C3DA6E
	for <buildroot@archiver.kernel.org>; Sun, 17 Dec 2023 17:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC9041498;
	Sun, 17 Dec 2023 17:25:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC9041498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7ImhSCHiDbzA; Sun, 17 Dec 2023 17:25:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D7CE41365;
	Sun, 17 Dec 2023 17:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D7CE41365
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B6FC31BF3C9
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B9DB60A98
 for <buildroot@lists.busybox.net>; Sun, 17 Dec 2023 17:25:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B9DB60A98
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AAsN5sLLpKAl for <buildroot@lists.busybox.net>;
 Sun, 17 Dec 2023 17:25:16 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8A8E260A94
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 17:25:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A8E260A94
Received: from fli4l.lan.fli4l (p5b3a0598.dip0.t-ipconnect.de [91.58.5.152])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9252CA4C00A5
 for <buildroot@buildroot.org>; Sun, 17 Dec 2023 18:25:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40478)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rEut8-0006U8-1C
 for buildroot@buildroot.org; Sun, 17 Dec 2023 18:25:14 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 17 Dec 2023 18:25:14 +0100
Message-Id: <20231217172514.1897244-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1702833914;
 bh=8EGBCxIZapH2OygnAImg+tsJvWaf/JzH4/Bgpk6K4p4=;
 h=From:To:Subject:Date:From;
 b=T1uvluyBYp/GbOGC1WwH058U3vVZQjslbdpmmkdS8IoWew3zWsFgEByS8gfir0/rK
 1ZfrNZ9kzscTKRFJxFrGXcKPRgzw+Rrg50Y4IoRvU9gUHpeS0T8XpUWn0/41gTCy4k
 cOs28sJS/S3+1P1SBWMC4whFfMhmKejVhfhMcqoyIJitz55sqNEl8fNvCZkRwuVE0E
 6bgWpcFW0B+UnuEiIb9XaVW3IKbYq56tYRcJIPi/UNDho5smCsmdhrYhN5Pt2PK/ZI
 YEaLIDIsH4YVWtHdVnvaOfsgWmhXl3Pw9d6FX+7gHpsSKnTU5acBgvnRKnddGQOQgY
 YqL/Ns5H41D5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=T1uvluyB
Subject: [Buildroot] [PATCH 1/1] package/transmission: bump version to 4.0.5
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
https://github.com/transmission/transmission/releases/tag/4.0.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 74b3a654b5..ed600c7699 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  15f7b4318fdfbffb19aa8d9a6b0fd89348e6ef1e86baa21a0806ffd1893bd5a6  transmission-4.0.4.tar.xz
+sha256  fd68ff114a479200043c30c7e69dba4c1932f7af36ca4c5b5d2edcb5866e6357  transmission-4.0.5.tar.xz
 # Locally calculated
 sha256  f56732960a61ecf3b9637404eef1a39221d2006336a98792b7b65a79f155449c  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index efb46c0feb..f1130aeadd 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.0.4
+TRANSMISSION_VERSION = 4.0.5
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
