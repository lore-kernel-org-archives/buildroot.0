Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A605C36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 12:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB089605EE;
	Fri, 11 Apr 2025 12:23:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7VUusY_WArL; Fri, 11 Apr 2025 12:23:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 143EB60849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 143EB60849;
	Fri, 11 Apr 2025 12:23:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5C61108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 12:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B498A402E2
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 12:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mX-47jaJLvkM for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 12:23:29 +0000 (UTC)
X-Greylist: delayed 2726 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 11 Apr 2025 12:23:27 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 069404022B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 069404022B
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp2.osuosl.org (Postfix) with ESMTP id 069404022B
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 12:23:27 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [])
 by gzsmtp3 (Coremail) with SMTP id PigvCgC3ktQQ__hnRYoyAA--.6680S2;
 Fri, 11 Apr 2025 19:37:54 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 11 Apr 2025 04:37:31 -0700
Message-ID: <20250411113731.4804-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: PigvCgC3ktQQ__hnRYoyAA--.6680S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tF47ArWfJryktrWDtFyrWFg_yoW8WryDpw
 4kG3y5WrW8tr13ArW3Way7KF15GFWkXrW5AwsFvw4jqrn7Aryv9a1qgryUuF4jv3y0y3y8
 Zr4ktw45Ww1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUgyCdUUUUU=
X-Originating-IP: [223.102.85.242]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBYx4sjWf47TqD6wADs-
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=afRsm
 2ofP6sUiGUmZGrchd4R6w6IUqPpG59TVawS3zY=; b=jbATcanTWJ2bFUxNkSyRa
 NN7hAS3BgjpYZo859kmJnHgjyG5XkNk+E1mx7OpqiG1cvJfL9uMVcNVNAGPQoVqC
 eIv84q4e5KxQiCkycNoEMh4Xzdq93ysnm2dg+srw9TUhp9Ut78246erJGp0p5Gkh
 ARaup3dHYO05fBa56viIac=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=jbATcanT
Subject: [Buildroot] [PATCH 1/1] package/tailscale: install service files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Install tailscaled to /usr/sbin, as the service file references that
location.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
---
 package/tailscale/tailscale.mk | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 55f8ac4ab9..c974c0fd6b 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -15,6 +15,27 @@ TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
 
+define TAILSCALE_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/bin/tailscale \
+		$(TARGET_DIR)/usr/bin/tailscale
+	$(INSTALL) -D -m 0755 $(@D)/bin/tailscaled \
+		$(TARGET_DIR)/usr/sbin/tailscaled
+endef
+
+define TAILSCALE_INSTALL_INIT_OPENRC
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.defaults \
+		$(TARGET_DIR)/etc/default/tailscaled
+	$(INSTALL) -D -m 0755 $(@D)/cmd/tailscaled/tailscaled.openrc \
+		$(TARGET_DIR)/etc/init.d/S60tailscaled
+endef
+
+define TAILSCALE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.defaults \
+		$(TARGET_DIR)/etc/default/tailscaled
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
+endef
+
 define TAILSCALE_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_TUN)
 endef
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
