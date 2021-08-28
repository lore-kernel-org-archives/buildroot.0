Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BF0C432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F35F60725
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 14:46:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F35F60725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8CD40019;
	Sat, 28 Aug 2021 14:46:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nCVm22F8XIK1; Sat, 28 Aug 2021 14:46:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434F340106;
	Sat, 28 Aug 2021 14:46:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6C26B1BF37B
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438F640106
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWNukoV5YtiU for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7A274012B
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 14:45:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 15F6E840AF; Sat, 28 Aug 2021 14:44:54 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 28 Aug 2021 16:44:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6c1d9995b5c418080db2b18208a9823b9826aa0f
X-Git-Newrev: 2f910229ef0c6a94b97db73f3fd22e878a64dcdd
X-Patchwork-Hint: ignore
Message-Id: <20210828144454.15F6E840AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/owfs: remove Python
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2f910229ef0c6a94b97db73f3fd22e878a64dcdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This fixup is done at pkg-generic level for all packages.
So, it is no more needed in owfs package.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
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
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
