Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E86C00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 07:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF3846F937;
	Fri,  5 Aug 2022 07:23:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF3846F937
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UUso7KiPFUtg; Fri,  5 Aug 2022 07:23:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B1F760E08;
	Fri,  5 Aug 2022 07:23:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B1F760E08
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 855BF1BF869
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60C5A60B93
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60C5A60B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YlB-ro_c_Y6H for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 07:23:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8A4660B8F
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.70.35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8A4660B8F
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 07:23:44 +0000 (UTC)
Received: from opfednr00.francetelecom.fr (unknown [xx.xx.xx.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfednr21.francetelecom.fr (ESMTP service) with ESMTPS id 4LzcXG2rQ9z5vx8
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 09:23:42 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 09:23:40 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 5 Aug 2022 09:23:37 +0200
Message-ID: <2785_1659684222_62ECC57E_2785_486_1_310870c5ee2407ccbb8926d2a37897df5f90c30c.1659683862.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
References: <89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX201.corporate.adroot.infra.ftgroup (10.115.26.6)
 To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1659684222;
 bh=xSsArvGly0oCNNijeBncNooVIBpQVnJ53RYlOz7NlRk=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=ePW/76f0Vf/aMtad8LrSgbdxGvJ9fQVURV3lZHPmebvVg8qcKUckU4iXTHyjB6Euh
 1S7Fd2HcikTyP9QYEVfWrRqmZ4puNLrPbtAZO06tDGJpxhbu8L72tDDEeeaOsf9mKl
 7DrMS2AUU52bdmjxIOtZz/hzy+ve+CAmwID443EFWlum70gdAkaF9TKUdylLqk3qit
 3X3QEz72e4NqmNbEG60MTsgTgmVmW9KxFnf3UINuXMn55lRlkm8m+U1g+sPxpx4muf
 45kNWI8PXYdi70+3cXkZeIyZPLLkocdD5TkO4nlqwUm9GKX/Sio6yBcl6V+IFkCum1
 8L17C3obPLekQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=ePW/76f0
Subject: [Buildroot] [PATCH 2/3] package/lshw: reformat
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

lshw was introduced in early 2012, and since then our coding standards
have evolved substancially, and so lshw is lagging way behind nowadays.

Reformat it with the current styles:
  - mandatory dependencies go before build variables
  - one item per line in multi-line assignments
  - space after the last item in a multi-line assignment
  - don't hard-code the build target 'all' in the common make opts
  - split long command lines
  - format build and install command lines similarly for ease of
    comparison

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/lshw/lshw.mk | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/package/lshw/lshw.mk b/package/lshw/lshw.mk
index 9f1ff8938a..45b22e88e3 100644
--- a/package/lshw/lshw.mk
+++ b/package/lshw/lshw.mk
@@ -10,20 +10,29 @@ LSHW_SOURCE = lshw-B.$(LSHW_VERSION).tar.gz
 LSHW_LICENSE = GPL-2.0
 LSHW_LICENSE_FILES = COPYING
 
-LSHW_MAKE_OPTS = CC="$(TARGET_CC)" CXX="$(TARGET_CXX)" AR="$(TARGET_AR)" \
-	RPM_OPT_FLAGS="$(TARGET_CFLAGS)" all
+LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+
+LSHW_MAKE_OPTS = \
+	CC="$(TARGET_CC)" \
+	CXX="$(TARGET_CXX)" \
+	AR="$(TARGET_AR)" \
+	RPM_OPT_FLAGS="$(TARGET_CFLAGS)"
+
 LSHW_MAKE_ENV = \
 	$(TARGET_MAKE_ENV) \
 	LIBS=$(TARGET_NLS_LIBS)
-LSHW_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 
 define LSHW_BUILD_CMDS
-	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src $(LSHW_MAKE_OPTS)
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
+		$(LSHW_MAKE_OPTS) \
+		all
 endef
 
 define LSHW_INSTALL_TARGET_CMDS
-	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src DESTDIR=$(TARGET_DIR) \
-		$(LSHW_MAKE_OPTS) install
+	$(LSHW_MAKE_ENV) $(MAKE) -C $(@D)/src \
+		$(LSHW_MAKE_OPTS) \
+		DESTDIR=$(TARGET_DIR) \
+		install
 	$(RM) -rf $(TARGET_DIR)/usr/share/lshw
 endef
 
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
