Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B6BEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 21:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D837410BA;
	Sun, 25 Jun 2023 21:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D837410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3dVoCjrawMLf; Sun, 25 Jun 2023 21:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838CA410BC;
	Sun, 25 Jun 2023 21:49:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 838CA410BC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8F7D21BF292
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 21:49:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7603D60BF2
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 21:49:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7603D60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bOnbwXXLKWPz for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 21:49:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4A7560B74
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4A7560B74
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 21:49:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b71b.dip0.t-ipconnect.de [84.161.183.27])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9021BA4C05AA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 23:49:19 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34302)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qDXbj-00039f-0p
 for buildroot@buildroot.org; Sun, 25 Jun 2023 23:49:19 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 25 Jun 2023 23:49:19 +0200
Message-Id: <20230625214919.588809-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1687729759;
 bh=J51Dy+kEk5nh3AeHHyVuBnU8tJ7fKbgAayh4MW+CeYI=;
 h=From:To:Subject:Date:From;
 b=jbQE5ZDjWMUpMk/+t5Q0qFNQZiEFxAB5CCa1UEQyWchi/HL75SZOs8fcu4vs/97Fp
 hzMZ4wAbmby+SBzPKlO0sB+CS7F4W3vybKBjN/xJWr4LftBunXgQacIIYINcYEAQaW
 TsPUWwY9QgBotYLU81MFOxt8VsR2cPI8vcHMLLCOJ3lswQONejLBOwlDBey28jPYUo
 vdwyPmumWJhzcbTRK5PiwZJqOJQFpr+Ogth7j2aVMLMRbsWy8CnWz2YPTb9c6fNG1t
 oEnkYnmxQFwbeoPwTKqQxmCJYSIdg6qODPau1cKLWr06mQpN0w8p2f0JK7+N/uRFx6
 5yVl1j+3J56+Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=jbQE5ZDj
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-zattoo: bump version to
 20.3.10-Nexus
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
v2: squashed with previous patch which was not yet applied (Arnout)

 package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash | 2 +-
 package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
index 1af86d4de0..9939c6f73b 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c75ba4710d7e85cf516005ee3eca6d677e2fc018abaf490c881bc6552eb32929  kodi-pvr-zattoo-20.3.7-Nexus.tar.gz
+sha256  68aa0a3af4f10396c866b0da225928033d0bbf980b8884c944dd1829e013435d  kodi-pvr-zattoo-20.3.10-Nexus.tar.gz
 sha256  310782e1abd43c4de6217c513e328bddf999d39302d67c6e05b10a59959827af  LICENSE.md
diff --git a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
index fa5e116fa0..53153f8f59 100644
--- a/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
+++ b/package/kodi-pvr-zattoo/kodi-pvr-zattoo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_PVR_ZATTOO_VERSION = 20.3.7-Nexus
+KODI_PVR_ZATTOO_VERSION = 20.3.10-Nexus
 KODI_PVR_ZATTOO_SITE = $(call github,rbuehlma,pvr.zattoo,$(KODI_PVR_ZATTOO_VERSION))
 KODI_PVR_ZATTOO_LICENSE = GPL-2.0+
 KODI_PVR_ZATTOO_LICENSE_FILES = LICENSE.md
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
