Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370E5ECAAD8
	for <buildroot@archiver.kernel.org>; Tue, 20 Sep 2022 12:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9FC8281C93;
	Tue, 20 Sep 2022 12:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FC8281C93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id suF8Onk-vYDe; Tue, 20 Sep 2022 12:45:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD8E2813AB;
	Tue, 20 Sep 2022 12:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD8E2813AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 582631BF35B
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 12:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 336F660EC6
 for <buildroot@lists.busybox.net>; Tue, 20 Sep 2022 12:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336F660EC6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dduPicy7xjDZ for <buildroot@lists.busybox.net>;
 Tue, 20 Sep 2022 12:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E212B60E76
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E212B60E76
 for <buildroot@buildroot.org>; Tue, 20 Sep 2022 12:45:05 +0000 (UTC)
Received: from opfednr05.francetelecom.fr (unknown [xx.xx.xx.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr26.francetelecom.fr (ESMTP service) with ESMTPS id 4MX1Tq2Srgz10Cm; 
 Tue, 20 Sep 2022 14:45:03 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Tue, 20 Sep 2022 14:45:01 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Tue, 20 Sep 2022 14:45:00 +0200
Message-ID: <27279_1663677903_6329B5CF_27279_384_1_a0ff8f4ff44501c533f2779965524fc93294a825.1663677504.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.52]
X-ClientProxiedBy: OPE16NORMBX203.corporate.adroot.infra.ftgroup (10.115.26.8)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663677903;
 bh=JCDmrqtcs7Bcrsvg7aprGQVu74Ck8Js5JcGBPk5Ipmc=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=uZvBEnXLbmLjFLQogQ6gurz2SugaqR/2oxABiZ753mbd2e4Aj/QmPzteZhts55zhN
 LARuB9iM9zjzpOVUWifK4+KHcD3Ab0F049HrG0ECTMmVgfzfiVaPztnPXsG/12Ye32
 lsnY8rzTCAweZP9jqa6nqPFm9X4qxRG8wTkzGmbVK4ZD8S0ayNZfUMvrwivHzjv3VI
 zqAktEvDo/Di6S0YDGbBa5oq0Q9q4AkMPL4A+yDRcgjIspGQQF+JWAaDJoWdKgA2uO
 vogPZ/rTLthfcKB4A8lL8zMh0400v0VrZNXSSgBer4Io7VNT0F1yd9EFHLivDvWMgf
 cCLjSw8vqITtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=uZvBEnXL
Subject: [Buildroot] [PATCH 1/2] package/gpsd: drop legacy cleanup
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Since gpsd-3.22, the systemd service files no longer contain hard-coded
paths to /usr/local/, but use @SBINDIR@ which is replaced appropriately
at build time, and contains the correct path.

Drop the legacy fixup now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/gpsd/gpsd.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 0c7018f26d..b8526c0260 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -213,14 +213,6 @@ define GPSD_INSTALL_INIT_SYSV
 	$(SED) 's,^DEVICES=.*,DEVICES=$(BR2_PACKAGE_GPSD_DEVICES),' $(TARGET_DIR)/etc/init.d/S50gpsd
 endef
 
-# systemd unit files are installed automatically, but need to update the
-# /usr/local path references in the provided files to /usr.
-define GPSD_INSTALL_INIT_SYSTEMD
-	$(SED) 's%/usr/local%/usr%' \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsd.service \
-		$(TARGET_DIR)/usr/lib/systemd/system/gpsdctl@.service
-endef
-
 define GPSD_INSTALL_STAGING_CMDS
 	(cd $(@D); \
 		$(GPSD_SCONS_ENV) \
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
