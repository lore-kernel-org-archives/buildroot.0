Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCB0C369B2
	for <buildroot@archiver.kernel.org>; Thu, 17 Apr 2025 11:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B854F82028;
	Thu, 17 Apr 2025 11:23:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xl0oyYAlNckK; Thu, 17 Apr 2025 11:23:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E274383F7C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E274383F7C;
	Thu, 17 Apr 2025 11:23:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCF2411B
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 11:23:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2F0F83F89
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 11:23:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onvD2TkKUqg7 for <buildroot@buildroot.org>;
 Thu, 17 Apr 2025 11:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.5;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21B0481C26
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B0481C26
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by smtp1.osuosl.org (Postfix) with ESMTP id 21B0481C26
 for <buildroot@buildroot.org>; Thu, 17 Apr 2025 11:23:17 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [])
 by gzsmtp2 (Coremail) with SMTP id PSgvCgCnNpSY5ABo1XINAw--.47941S2;
 Thu, 17 Apr 2025 19:23:05 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Thu, 17 Apr 2025 04:22:43 -0700
Message-ID: <20250417112243.4161-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250414150721.4300-1-tianyuanhao3@163.com>
References: <20250414150721.4300-1-tianyuanhao3@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PSgvCgCnNpSY5ABo1XINAw--.47941S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Kr43tr4DArWDGF18XrWUJwb_yoW8Gw17pw
 n5Gws8urWxtr13Ary3WFy7Kw15uaykXry5AwnFv34jqrnrA34v9ayqgryUurs0v3yIy3y8
 Zr4vy3y5uw1DA3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR1SoLUUUUU=
X-Originating-IP: [223.102.85.242]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/1tbiXRgyjWgApBQFAwACsm
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=laQl/
 b48l0Zl3JUQHsxg1oH4Jp1uw44tjCoAy7URWx4=; b=ARvGOwkVOY3NK9mvRRVxK
 t8m/E4/qdjQLQF70xwzHwSR2e7SDKScbThJnqeBXG7AzM60Z7t5iRqaOONwttolJ
 eiY4Q7l1yqia8YLFM8/bb0p5zcJrAn48U7D6GIlJhVDMzxLvKJUoYVJkPshrIcHw
 oC7cMt9/udzOL+Zr40MVcE=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ARvGOwkV
Subject: [Buildroot] [PATCH v3 1/1] package/tailscale: install systemd
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
Changes v2 -> v3:
  - Create symlink in /sbin  (suggested by Yann)

Changes v1 -> v2:
  - Remove untested TAILSCALE_INSTALL_INIT_OPENRC
  - Change default service files to use /bin instead of /sbin
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
-- 
2.46.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
