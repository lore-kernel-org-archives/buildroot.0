Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A91C5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 21:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D2F84182D;
	Mon, 17 Oct 2022 21:12:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D2F84182D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qZXRUxv0JYPO; Mon, 17 Oct 2022 21:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E6224184D;
	Mon, 17 Oct 2022 21:12:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E6224184D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29BD91BF291
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 21:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A9C4417B8
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 21:12:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A9C4417B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wvVdSwEvpaeg for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 21:12:42 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64B5041702
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64B5041702
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 21:12:41 +0000 (UTC)
Received: from localhost.localdomain ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kXPboF09oJpY4kXPcoLn5G; Mon, 17 Oct 2022 23:12:40 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 17 Oct 2022 23:12:39 +0200
Message-Id: <20221017211239.1751923-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
References: <f66ff517-4b50-95f4-b330-d4cb5963553a@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfG4f6y5xANhuHcRgsXYqri8qCIXz0CErMuA15Tcx4jiA5irYV6dmcEokn4v/WfLDYEjdDJN9dXFrN+EmOmeTtsZw4VP+Htac47q2U41mr8GUYcS0Fwa9
 DBSfSZziHODef67UkR1hLvivDjWX9pVLDKo2u7kwlb+BsEvSYHNZjpqUFHyrU9zRPYtdwj91gW+5qAyGal7gb6faYcdjl2aFoxnKVl/sN+XhkHdij5QhPBmu
 KSBvXmlaMpIuHyRZihHLfO3XhS3tXaJLlJ3np27edO47tjwuh6wh0+DAjtcVHg5NPLfwAdw6IVJ+fc6hNhzgVuFmoEJxaHj1k9NcJQELWHU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666041160; bh=Ozr9I0z9LPSYKjnD/SVaMPy0TFkLcU/82svsPRdpLlk=;
 h=From:To:Subject:Date:MIME-Version;
 b=Op8Tkukl0Z69Ug5P0YcVXWC0DCFaOaDJ4tg/qbga+sCf9MRreDzwACPRkriSxwbU6
 KC+HixxNJtFGiJkDuPtv3yivC7pA51PWlNEM2CYs8I4BID3WzdHt4ngMe1148vFT7o
 aRUmQRaBXIbWwcnfC6EofUyNbASHah0/BsNgxaP2JSkd6CAe88jNxoeupwokciMAod
 /PEvyD+rgbJnR6huPl4Q6EiCT8VLi9RRZPdl0+noc7yLE8uIStsSft2rD1HifqJtcz
 GzHWjkJIZg8Q5tRnEtNi7dcEztokXABGY9bqzBOaN11NGSn9bSKPWbi/UMC+sH1fM/
 YO14XLTMmvdAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Op8Tkukl
Subject: [Buildroot] [PATCH v2] package/rtl8188eu: bump version to fix build
 failure with linux >= 6.0.0
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
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* use specific upstream commit SHA1 since the latest is buggy
---
 package/rtl8188eu/rtl8188eu.hash | 2 +-
 package/rtl8188eu/rtl8188eu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8188eu/rtl8188eu.hash b/package/rtl8188eu/rtl8188eu.hash
index 9c7f2de4b6..ff8c0a3418 100644
--- a/package/rtl8188eu/rtl8188eu.hash
+++ b/package/rtl8188eu/rtl8188eu.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  6bc46a13b20a2ed121844e51fd690216b2ab3b1faa1af8d9501090026ca9bd22  rtl8188eu-903b6fcb821465fe9c63e83416080df70c1c3c90.tar.gz
+sha256  e6106521139cc463eaa74d1491e212437b2106c3aa0005b1b7b93f1d8a090237  rtl8188eu-7a7c5e0c0bc168ec5083a707e300e298dd4811fa.tar.gz
 sha256  af8067302947c01fd9eee72befa54c7e3ef8a48fecde7fd71277f2290b2bf0f7  COPYING
diff --git a/package/rtl8188eu/rtl8188eu.mk b/package/rtl8188eu/rtl8188eu.mk
index ebce4617ac..99f8248c05 100644
--- a/package/rtl8188eu/rtl8188eu.mk
+++ b/package/rtl8188eu/rtl8188eu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8188EU_VERSION = 903b6fcb821465fe9c63e83416080df70c1c3c90
+RTL8188EU_VERSION = 7a7c5e0c0bc168ec5083a707e300e298dd4811fa
 RTL8188EU_SITE = $(call github,lwfinger,rtl8188eu,$(RTL8188EU_VERSION))
 RTL8188EU_LICENSE = GPL-2.0, proprietary (rtl8188eufw.bin firmware blob)
 RTL8188EU_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
