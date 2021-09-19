Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5712C433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:35:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6AD60FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 07:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E6AD60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 006BE80F62;
	Sun, 19 Sep 2021 07:35:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MvH9Vmlk6mK3; Sun, 19 Sep 2021 07:35:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587CC80F5D;
	Sun, 19 Sep 2021 07:35:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7758E1BF314
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:35:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66685605A4
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 07:35:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyOLpcvaDRsc for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 07:35:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD8A360599
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 07:35:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id B320C8B709; Sun, 19 Sep 2021 07:33:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 09:35:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8862c71837a2827e0f20409107ffe52072d4074a
X-Git-Newrev: 7ccb46b1fe31203d5be29780b4dc1d3f4e336494
X-Patchwork-Hint: ignore
Message-Id: <20210919073350.B320C8B709@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: use $(SWUPDATE_PKGDIR)
 for pkgdir path
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ccb46b1fe31203d5be29780b4dc1d3f4e336494
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/swupdate/swupdate.mk | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index c49af7ebf7..e191ab384a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -238,30 +238,30 @@ endif
 define SWUPDATE_INSTALL_COMMON
 	mkdir -p $(TARGET_DIR)/etc/swupdate/conf.d \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
-	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
+	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/swupdate.sh \
 		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
 	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
-		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
+		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/10-mongoose-args \
 			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
 endef
 define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
-	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
-	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate.socket \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
-	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
-	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
-	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
 define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
-	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
+	$(INSTALL) -D -m 755 $(SWUPDATE_PKGDIR)/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
-	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
+	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/90-start-progress \
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
 endef
 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
