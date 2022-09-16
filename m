Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA2C8ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 13:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D30C41C90;
	Fri, 16 Sep 2022 13:06:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D30C41C90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxXegj0Ekjfn; Fri, 16 Sep 2022 13:06:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A22BF41BEE;
	Fri, 16 Sep 2022 13:06:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22BF41BEE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F2511BF2C0
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 349E1842F6
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 13:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 349E1842F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xFH2b88E-GUT for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 13:06:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87976842D1
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 87976842D1
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 13:06:21 +0000 (UTC)
Received: from opfedar01.francetelecom.fr (unknown [xx.xx.xx.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar21.francetelecom.fr (ESMTP service) with ESMTPS id 4MTZ8C1wttz7tq3; 
 Fri, 16 Sep 2022 15:06:19 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 16 Sep 2022 15:06:17 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 16 Sep 2022 15:06:15 +0200
Message-ID: <10723_1663333579_632474CB_10723_500_30_a3b3a73905917c76ad928862912b96e167b7d876.1663333493.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX608.corporate.adroot.infra.ftgroup
 (10.115.27.32) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1663333579;
 bh=ZBbMqfEiu9w76nHgB1j7ibKVzwkKrqYdT7MCoFSNmak=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=gb01Yky71hN3LS7m5drx+SLifrxiBGU3uBRJW0mkv4FwOGlJQxYLOMgFHulO//GNq
 brWt/Ep5Exussxu/0ud06y6KPaK7ZV9hSFxKS/+OuxyDULcihZKlPfFpb47C7Wczba
 3msrFHleLTrNGmdIQt2KIU8LHvozBwVWVyw/MMCwz9HJhFipB0bkq3CV/d8xu9iada
 hxo6WAIKLexfsJMfkaLm1BPAFb9K8spY5Dif/zco3prrN0LeUk1U0ETRAhiZmC46MR
 1m/DnJJUe26T0+SBu6LmeDC3WG13fmM07PYKFE4Dyl2QlqUDoLWlohBlljJwlHSLKR
 uobgU2mVwTGYA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=gb01Yky7
Subject: [Buildroot] [PATCH v2 1/3] package/gpsd: remove obsolete config
 option
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

The oldstyle option has been removed a while ago now:
    2015-02-22 a5a123b4f3b0 Feature removal - delete last remnants of
                            old pre-JSON protocol from libgps.

Drop it from Buildroot now.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in.legacy       | 6 ++++++
 package/gpsd/Config.in | 3 ---
 package/gpsd/gpsd.mk   | 3 ---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 3a7c49e339..631b31689b 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.11"
 
+config BR2_PACKAGE_GPSD_OLDSTYLE
+	bool "gpsd oldstyle removed"
+	select BR2_LEGACY
+	help
+	  gpsd oldstyle option has been removed by upstream in 2015.
+
 config BR2_GDB_VERSION_9_2
 	bool "gdb 9.2 removed"
 	help
diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index b66d0952dd..126a907aa2 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -31,9 +31,6 @@ comment "Features"
 config BR2_PACKAGE_GPSD_CLIENT_DEBUG
 	bool "client debugging support"
 
-config BR2_PACKAGE_GPSD_OLDSTYLE
-	bool "oldstyle (pre-JSON) protocol support"
-
 config BR2_PACKAGE_GPSD_PROFILING
 	bool "profiling support"
 	depends on BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 4388b7e24d..dec2371f68 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -168,9 +168,6 @@ endif
 ifeq ($(BR2_PACKAGE_GPSD_SQUELCH),y)
 GPSD_SCONS_OPTS += squelch=yes
 endif
-ifneq ($(BR2_PACKAGE_GPSD_OLDSTYLE),y)
-GPSD_SCONS_OPTS += oldstyle=no
-endif
 ifeq ($(BR2_PACKAGE_GPSD_PROFILING),y)
 GPSD_SCONS_OPTS += profiling=yes
 endif
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
