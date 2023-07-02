Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB14EB64D9
	for <buildroot@archiver.kernel.org>; Sun,  2 Jul 2023 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25CE04098D;
	Sun,  2 Jul 2023 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 25CE04098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hHnq_bmZ_vel; Sun,  2 Jul 2023 16:40:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1556F4098E;
	Sun,  2 Jul 2023 16:40:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1556F4098E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 34F411BF280
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0D1DB4098E
 for <buildroot@lists.busybox.net>; Sun,  2 Jul 2023 16:40:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D1DB4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2r4f7hN4y5Xc for <buildroot@lists.busybox.net>;
 Sun,  2 Jul 2023 16:40:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86EDF4098D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86EDF4098D
 for <buildroot@buildroot.org>; Sun,  2 Jul 2023 16:40:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB053A4C01AB;
 Sun,  2 Jul 2023 18:40:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44050)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qG07e-00053w-1n;
 Sun, 02 Jul 2023 18:40:26 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  2 Jul 2023 18:40:25 +0200
Message-Id: <20230702164026.3466342-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1688316026;
 bh=fUQvcXRGPYRxaeWIZ1u10UhVtouB8Ga5KdSGJdvv8rY=;
 h=From:To:Cc:Subject:Date:From;
 b=OjQ+zVWKP7P9hN4TcgJT9MGFigz2dVkJSQXsxB4Il2vFFVtfIuOYTd7hAQJlO9kJ1
 kjuKRr8diKfjXNeGK1E6ue/1BRqWeAiRyXVboqwPj2z9Dki0l3qFfJaXcemVS+2Rw7
 raMVnm2Ga2gza9IEEorHveoIhllesBBH+PpPu4PG/RYD4KwCTpDHZkGqDappSkZLYz
 AmKFVrjQ9Oohu9CyRtf7MhntKbNOCk/q0qT4bGNxSxC1eq7eU4NoKG+q5vremJzUxO
 gVbRsOtB91GHlXMgFB/K/Sl1X95GZvVuVOUhmhTD2D0vWkcmyyiYmS1HCXDZcEsgt4
 wLunPHXg4No4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=OjQ+zVWK
Subject: [Buildroot] [PATCH 1/2] package/bluez-alsa: bump version to 4.1.1
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
Cc: Grzegorz Blach <grzegorz@blach.pl>, Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/arkq/bluez-alsa/blob/master/NEWS

Updated license hash due to copyright year bump:
https://github.com/arkq/bluez-alsa/commit/165e15bce4f9c8dd6238ee8d105ab9fa857c63a1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bluez-alsa/bluez-alsa.hash | 4 ++--
 package/bluez-alsa/bluez-alsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index ad7fe62708..5513865603 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  ce5e060e61669d61d44f5f9bad34a7b88378376e9d49d31482406a68127a6b29  bluez-alsa-4.0.0.tar.gz
-sha256  aaebd0cca73b0f361cb7f1bffa40418b2485fc10bfae7a47c193679c7e26d2e3  LICENSE
+sha256  b69a3e6dd69315194403ee930ac1553aed3fb9a3988e502ae5c24a8bfef70f9f  bluez-alsa-4.1.1.tar.gz
+sha256  956564dcf06ba65cd7a5eb6cdfd695e2ab0f09ea9684e4eaf079f5d533bd206d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 649810b0ad..38682c2755 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 4.0.0
+BLUEZ_ALSA_VERSION = 4.1.1
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
