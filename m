Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DB5C369A2
	for <buildroot@archiver.kernel.org>; Mon, 14 Apr 2025 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BB8E82061;
	Mon, 14 Apr 2025 15:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pO6PbUDH79F1; Mon, 14 Apr 2025 15:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 595BE820AD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 595BE820AD;
	Mon, 14 Apr 2025 15:08:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 88530DE
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81B68820DF
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bvPK3JcJuiq for <buildroot@buildroot.org>;
 Mon, 14 Apr 2025 15:08:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 178008209E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 178008209E
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp1.osuosl.org (Postfix) with ESMTP id 178008209E
 for <buildroot@buildroot.org>; Mon, 14 Apr 2025 15:08:14 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgDHsTPUJP1ngAqdAQ--.44747S2;
 Mon, 14 Apr 2025 23:08:05 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Mon, 14 Apr 2025 08:07:21 -0700
Message-ID: <20250414150721.4300-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250411113731.4804-1-tianyuanhao3@163.com>
References: <20250411113731.4804-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgDHsTPUJP1ngAqdAQ--.44747S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43tr4DArWDGF1UKFyDKFg_yoW8JFykpw
 1kGw1DWrWxtr13Ary7WFy7Kr15WFWkXry5AwsFvw1jqrnrA34q9ayqgryY9r4Yv3yjy3y8
 Zr48tw45Ww1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR1SoLUUUUU=
X-Originating-IP: [223.102.85.242]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRsvjWf9HUH0dAAAsi
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=JAY/D
 vOEQHWIq3z9TAOpdPvv8QXCh76jIs3EMe4WO8M=; b=LsimrSkDpDvYZJ68GWtwo
 DxavDNTUiQbVBpfVv/Y8qh51s+DEl0q/J6YNrA5fbPMwbF7pQ0iAbe5DhSGXqDxU
 qs8jF0M2B0Zt33flyVKrMGbejk6R/RM3jWar1rn+QRDkvyy0elw3xPkS08B/Oqj2
 yx829uo4nJ6pfu5DZH8E9Y=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=LsimrSkD
Subject: [Buildroot] [PATCH v2 1/1] package/tailscale: install systemd
 service files
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

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yann E. MORIN <yann.morin@orange.com>

---
Changes v1 -> v2:
  - Remove untested TAILSCALE_INSTALL_INIT_OPENRC
  - Change default service files to use /bin instead of /sbin
---
 package/tailscale/tailscale.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 55f8ac4ab9..6345b2c0cc 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -15,6 +15,15 @@ TAILSCALE_LDFLAGS = \
 	-X tailscale.com/version.longStamp=$(TAILSCALE_VERSION) \
 	-X tailscale.com/version.shortStamp=$(TAILSCALE_VERSION)
 
+define TAILSCALE_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.defaults \
+		$(TARGET_DIR)/etc/default/tailscaled
+	$(INSTALL) -D -m 0644 $(@D)/cmd/tailscaled/tailscaled.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/tailscaled.service
+	$(SED) 's,/sbin/tailscaled ,/bin/tailscaled ,' \
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
