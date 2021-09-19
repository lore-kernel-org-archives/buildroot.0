Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E93C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDCE610A8
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 09:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEDCE610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5277F60684;
	Sun, 19 Sep 2021 09:30:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EZCtnHvW9LOM; Sun, 19 Sep 2021 09:30:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C5DD60648;
	Sun, 19 Sep 2021 09:30:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C78531BF5E6
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B75ED404BB
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 09:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qHG2Yk8cW6oM for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 09:30:31 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 12FA140445
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 09:30:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id D3AF78B768; Sun, 19 Sep 2021 09:28:34 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 19 Sep 2021 11:30:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7a888a71c315970808c541aaba163bb528be616c
X-Git-Newrev: 536e209ccaec94b4289d09060e2c8e05696bd0fe
X-Patchwork-Hint: ignore
Message-Id: <20210919092834.D3AF78B768@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: add option to enable USB
 install
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

commit: https://git.buildroot.net/buildroot/commit/?id=536e209ccaec94b4289d09060e2c8e05696bd0fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr:
  - do not default to 'y'
  - add comment
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/swupdate/Config.in          | 9 +++++++++
 package/swupdate/swupdate-usb.rules | 1 +
 package/swupdate/swupdate.mk        | 3 +++
 3 files changed, 13 insertions(+)

diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index 6b832cfcbf..7d9fc90e10 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,6 +60,15 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_USB
+	bool "swupdate usb"
+	depends on BR2_PACKAGE_SYSTEMD
+	help
+	  Enable update from USB disk.
+
+comment "swupdate usb needs systemd"
+	depends on !BR2_PACKAGE_SYSTEMD
+
 config BR2_PACKAGE_SWUPDATE_WEBSERVER
 	bool "swupdate webserver"
 	default y
diff --git a/package/swupdate/swupdate-usb.rules b/package/swupdate/swupdate-usb.rules
new file mode 100644
index 0000000000..72e003d74d
--- /dev/null
+++ b/package/swupdate/swupdate-usb.rules
@@ -0,0 +1 @@
+ACTION=="add", KERNEL=="sd*", SUBSYSTEM=="block", ENV{ID_BUS}=="usb", ENV{ID_FS_USAGE}=="filesystem", TAG+="systemd", ENV{SYSTEMD_WANTS}+="swupdate-usb@%k.service"
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index e191ab384a..5ed2ca55d2 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -252,6 +252,9 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb@.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(if $(BR2_PACKAGE_SWUPDATE_USB), \
+		$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-usb.rules \
+			$(TARGET_DIR)/lib/udev/rules.d/swupdate-usb.rules)
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/swupdate-progress.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
 	$(INSTALL) -D -m 644 $(SWUPDATE_PKGDIR)/tmpfiles-swupdate.conf \
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
