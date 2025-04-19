Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967ABC369BD
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 14:33:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F1C0818A2;
	Sat, 19 Apr 2025 14:33:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxqeU4QjBIDA; Sat, 19 Apr 2025 14:33:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C9C4818B5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C9C4818B5;
	Sat, 19 Apr 2025 14:33:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E0D5B230
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD7D76076F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T0y7x3i9WVgd for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 352AB6071E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 352AB6071E
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 22C5E84001; Sat, 19 Apr 2025 14:33:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 16:33:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0ba6de8a0c9763b8f37490ebccd539e024859f90
X-Git-Newrev: f027e7c5b3b84ab920f0ded6f3e2f298b7ad4f55
X-Patchwork-Hint: ignore
Message-Id: <20250419143339.22C5E84001@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tailscale: install systemd service
 files
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f027e7c5b3b84ab920f0ded6f3e2f298b7ad4f55
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tailscale/tailscale.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 55f8ac4ab9..7019b9afc9 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -15,6 +15,18 @@ TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
 
+define TAILSCALE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.defaults \
+		$(TARGET_DIR)/etc/default/tailscaled
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
+endef
+
+define TAILSCALE_INSTALL_SYMLINK
+	ln -f -s ../bin/tailscaled $(TARGET_DIR)/usr/sbin/tailscaled
+endef
+TAILSCALE_POST_INSTALL_TARGET_HOOKS += TAILSCALE_INSTALL_SYMLINK
+
 define TAILSCALE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
