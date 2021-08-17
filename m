Return-Path: <SRS0=/l1z=NI=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391CFC432BE
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 056E760FBF
	for <buildroot@archiver.kernel.org>; Tue, 17 Aug 2021 08:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 056E760FBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D36E5404D2;
	Tue, 17 Aug 2021 08:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xSSrOSrq0zLv; Tue, 17 Aug 2021 08:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6010A404C8;
	Tue, 17 Aug 2021 08:40:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4CCDD1BF2AE
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32633401EF
 for <buildroot@lists.busybox.net>; Tue, 17 Aug 2021 08:39:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t3Pzb0c8oHW5 for <buildroot@lists.busybox.net>;
 Tue, 17 Aug 2021 08:39:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 692CF40181
 for <buildroot@buildroot.org>; Tue, 17 Aug 2021 08:39:49 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPA id 054E41BF205;
 Tue, 17 Aug 2021 08:39:46 +0000 (UTC)
From: Herve Codina <herve.codina@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 17 Aug 2021 10:39:18 +0200
Message-Id: <20210817083930.3718711-5-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817083930.3718711-1-herve.codina@bootlin.com>
References: <20210817083930.3718711-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 04/16] package/owfs: remove Python
 sysconfigdata fixup
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

This fixup is done at pkg-generic level for all packages.
So, it is no more needed in owfs package.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
Changes v1 to v2:
 - Added 'Reviewed-by: Yann E. MORIN'

Changes v2 to v3:
None

 package/owfs/owfs.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index ffc0b3098d..10543d3698 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -88,15 +88,6 @@ OWFS_DEPENDENCIES += python host-swig
 # override the PYSITEDIR variable in make.
 OWFS_EXTRA_MAKE_OPTS += PYSITEDIR=/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages
 
-ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
-define OWFS_FIXUP_PYTHON_SYSCONFIGDATA
-	find $(HOST_DIR)/lib/python* $(STAGING_DIR)/usr/lib/python* \
-		-name "_sysconfigdata*.py" | xargs --no-run-if-empty \
-		$(SED) "s:$(PER_PACKAGE_DIR)/[^/]\+/:$(PER_PACKAGE_DIR)/owfs/:g"
-endef
-OWFS_PRE_CONFIGURE_HOOKS += OWFS_FIXUP_PYTHON_SYSCONFIGDATA
-endif
-
 else
 OWFS_CONF_OPTS += --disable-owpython --without-python
 endif
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
