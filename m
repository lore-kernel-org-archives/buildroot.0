Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9747FC0015E
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 14:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47486415DB;
	Sun,  6 Aug 2023 14:07:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47486415DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cr9kcBK2DypV; Sun,  6 Aug 2023 14:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEBD2415CE;
	Sun,  6 Aug 2023 14:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEBD2415CE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 978891BF340
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D7DE813BD
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 14:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D7DE813BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ffEwSLWNwCYo for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 14:06:49 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5725B8140F
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 14:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5725B8140F
Received: from fli4l.lan.fli4l (p4fd6c649.dip0.t-ipconnect.de [79.214.198.73])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6C3A8A4C00C6
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 16:06:47 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56790)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qSeP9-0000uM-0U
 for buildroot@buildroot.org; Sun, 06 Aug 2023 16:06:47 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 16:06:46 +0200
Message-Id: <20230806140646.4158881-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1691330807;
 bh=rUlO/4SqP8ci7PvomXuY7F8VZVu/mJRjP+MtjhfVAz8=;
 h=From:To:Subject:Date:From;
 b=dDg4nwj3RSx1kytPKyVWk1cyWOdRksehVKA8kZj1DegcAvVnVNCGJDLk1u2f0v7Ch
 GUG9/WlsBVCe0x7UIJXSU/mis9fQbQFl/MiiH0IdIDXjcHSZ4TynLG/1ov0O5Gkx9t
 xIf3TrEza4q35WkCQdV+LhhqCzPPgyPOELiJE/ZCvE3PNm4RrK4/sT2pDNdoBPsUmO
 y23F76GkP91nu+NYBQMn5/DGAoa+sp976LX5M6pXY9liRp89cyXxiUFHW1BFik3Drs
 WNZw+v4cgZudR+WrrYD8gPkoJuyaYuYmCz7tTqbe0hiVXLGiuwvOSqdiZiI3apjMA6
 DdkAi9zSytWyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=dDg4nwj3
Subject: [Buildroot] [PATCH/next 1/1] package/kodi-pvr-zattoo: bump version
 to 20.3.14-Nexus
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

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index e14491f192..86410df72a 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a2fa7655b3c62912341f453a98df81fa47e53c3c54a4e9bea47a4a85f4d2a20  kodi-pvr-zattoo-20.3.13-Nexus.tar.gz
+sha256  b6f5205caede6aaf57c1eab8206c5a5b3aaa6b5d8bda862d983ca53150cdf14a  kodi-pvr-zattoo-20.3.14-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index 94cc9f2a05..d97d940bdc 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 20.3.13-Nexus
+KODI_PVR_ZATTOO_VERSION = 20.3.14-Nexus
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
