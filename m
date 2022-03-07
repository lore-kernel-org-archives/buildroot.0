Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BCB4C433EF
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 15:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9849240629;
	Mon,  7 Mar 2022 15:43:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N5SMy0b-z6e0; Mon,  7 Mar 2022 15:43:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5602E40610;
	Mon,  7 Mar 2022 15:43:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DA531BF313
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 15:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDA1240200
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 15:43:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NS1q636Sqbey for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 15:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.41])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3797B40915
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 15:43:18 +0000 (UTC)
Received: from opfedar02.francetelecom.fr (unknown [xx.xx.xx.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar20.francetelecom.fr (ESMTP service) with ESMTPS id 4KC2mM6v2Vz8spg; 
 Mon,  7 Mar 2022 16:43:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1646667796;
 bh=uTWXKmcHoqEhxRvMt8SIj6bCy93PHTIPbV8cuSh2q6E=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=uIhhb8IXE567IM0TX9JAGDgSJmBDuQabKnZYs3r2jLkEKY3v+6GL7Kfn5bKlkNIBq
 3esuTO0LuxHCaTjh6WExAXwmAN9T6V629QkWdk0EKQo/NNCLQFKXVdgbp8Sw0TQSIu
 9NFR/zqKaZ4a0XwxyR4Xg/AqH1+P4DKIq3v6QNcdR5fKg2E/rb9oST7rG5iZHS09Bo
 AzVd+a1G4Cdw3mNsk7qGW2GK9R2E06WNI7lS0eILE7eyMWuRN1OrdDx7dj7gJ/kUjb
 lt/09Ui/wgIywOnkJ1ueYZtDOlg6QOc+c46usYvOFSc1eQODK495fNRefdPWTVlJQB
 0ZSGjtl9FDV1A==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Mon, 07 Mar 2022 16:43:13 +0100
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Mon, 7 Mar 2022 16:43:13 +0100
Message-ID: <22645_1646667795_62262813_22645_170_3_aabbdb8dc24868de9188190a6e1e7e1f1b6b12bc.1646667793.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.27.51]
X-ClientProxiedBy: OPE16NORMBX606.corporate.adroot.infra.ftgroup
 (10.115.27.30) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: [Buildroot] [PATCH] package/pkg-golang: don't export unused BR_GOMOD
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>, Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

BR_GOMOD is a remnant from a previous iteration of the golang download
infrastructure; it is currently used nowhere.

Do not set it.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Anisse Astier <anisse@astier.eu>
Cc: Christian Stewart <christian@paral.in>
---
 package/pkg-golang.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index f1c5cfd350..0cb2ed73cc 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -87,8 +87,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
-	BR_GOMOD=$$($(2)_GOMOD)
+	GOPROXY=direct
 
 # Due to vendoring, it is pretty likely that not all licenses are
 # listed in <pkg>_LICENSE.
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
