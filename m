Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FDA9C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:13:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CC6C6101A
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:13:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6CC6C6101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3505E40457;
	Sat, 11 Sep 2021 14:13:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yAdP3M4Fadts; Sat, 11 Sep 2021 14:13:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B95A4042F;
	Sat, 11 Sep 2021 14:13:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 51E271BF834
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CFCA683434
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qKYs0_3G-ur7 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:12:23 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE9998336D
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:12:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id B55F988FE5; Sat, 11 Sep 2021 14:10:45 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:11:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: daa46718e0642a92c59edb166ced1ff1911b0043
X-Git-Newrev: 0e94459ad52e87033c170522610e83215a444242
X-Patchwork-Hint: ignore
Message-Id: <20210911141045.B55F988FE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/swupdate: add progress/usb services
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e94459ad52e87033c170522610e83215a444242
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install progress/usb services for swupdate based on meta-swupdate
configs.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/swupdate/90-start-progress         |  1 +
 package/swupdate/swupdate-progress.service |  9 +++++++++
 package/swupdate/swupdate-usb@.service     |  8 ++++++++
 package/swupdate/swupdate.mk               |  8 ++++++++
 package/swupdate/swupdate.socket           | 11 +++++++++++
 5 files changed, 37 insertions(+)

diff --git a/package/swupdate/90-start-progress b/package/swupdate/90-start-progress
new file mode 100644
index 0000000000..3b0eb5e7d7
--- /dev/null
+++ b/package/swupdate/90-start-progress
@@ -0,0 +1 @@
+exec /usr/bin/swupdate-progress -w -r &
diff --git a/package/swupdate/swupdate-progress.service b/package/swupdate/swupdate-progress.service
new file mode 100644
index 0000000000..0d464bb420
--- /dev/null
+++ b/package/swupdate/swupdate-progress.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=swupdate progress service
+After=swupdate.service
+
+[Service]
+ExecStart=/usr/bin/swupdate-progress -r -w
+
+[Install]
+WantedBy=swupdate.service
diff --git a/package/swupdate/swupdate-usb@.service b/package/swupdate/swupdate-usb@.service
new file mode 100644
index 0000000000..eda9d1539c
--- /dev/null
+++ b/package/swupdate/swupdate-usb@.service
@@ -0,0 +1,8 @@
+[Unit]
+Description=usb media swupdate service
+Requires=swupdate-progress.service
+
+[Service]
+ExecStartPre=/bin/mount /dev/%I /mnt
+ExecStart=/bin/sh -c "swupdate-client -v /mnt/*.swu"
+ExecStopPost=/bin/umount /mnt
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 4bcdb96602..c49af7ebf7 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -248,6 +248,12 @@ define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 644 package/swupdate/swupdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate.socket \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate.socket
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-usb@.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-usb@.service
+	$(INSTALL) -D -m 644 package/swupdate/swupdate-progress.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/swupdate-progress.service
 	$(INSTALL) -D -m 644 package/swupdate/tmpfiles-swupdate.conf \
 		$(TARGET_DIR)/usr/lib/tmpfiles.d/tmpfiles-swupdate.conf
 endef
@@ -255,6 +261,8 @@ define SWUPDATE_INSTALL_INIT_SYSV
 	$(SWUPDATE_INSTALL_COMMON)
 	$(INSTALL) -D -m 755 package/swupdate/S80swupdate \
 		$(TARGET_DIR)/etc/init.d/S80swupdate
+	$(INSTALL) -D -m 644 package/swupdate/90-start-progress \
+		$(TARGET_DIR)/usr/lib/swupdate/conf.d/90-start-progress
 endef
 
 $(eval $(kconfig-package))
diff --git a/package/swupdate/swupdate.socket b/package/swupdate/swupdate.socket
new file mode 100644
index 0000000000..2b756714c5
--- /dev/null
+++ b/package/swupdate/swupdate.socket
@@ -0,0 +1,11 @@
+[Unit]
+Description=SWUpdate socket listener
+Documentation=https://github.com/sbabic/swupdate
+Documentation=https://sbabic.github.io/swupdate
+
+[Socket]
+ListenStream=/tmp/sockinstctrl
+ListenStream=/tmp/swupdateprog
+
+[Install]
+WantedBy=sockets.target
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
