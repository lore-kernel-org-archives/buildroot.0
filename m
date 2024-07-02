Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C79C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 12:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C007841682;
	Tue,  2 Jul 2024 12:36:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YI462o79IxHf; Tue,  2 Jul 2024 12:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AF2E401B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AF2E401B0;
	Tue,  2 Jul 2024 12:36:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0EBD61BF30D
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF8564148A
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 12:36:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N6YzIU9qNqwx for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 12:36:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=23.88.6.31;
 helo=mail.niyawe.de; envelope-from=niyawe@niyawe.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6B1774148B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B1774148B
Received: from mail.niyawe.de (niyawe.de [23.88.6.31])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B1774148B
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 12:36:47 +0000 (UTC)
From: Niklas Yann Wettengel <niyawe@niyawe.de>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 14:36:16 +0200
Message-ID: <20240702123615.1028278-2-niyawe@niyawe.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=niyawe.de; s=default; t=1719923804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=IlP9DCLLE7PBf4j71fWDBzPPY5+qEReXyLOh+NYlxww=;
 b=o1ohJcZUuY/goL0FR9zVBbITj0BClbMACPiSXNxvxDiqDLlC+ZRZnIpdaUh8kl1CpLZf6L
 DUIfBD7Hi/238AmoVOo6QjWxyfVFURkdNGrVAOMoQGpS62ggE+ublQqvwJyA6ZK2w8Qm5+
 kBIV3DVXUXhuSrOdy21eQ2y90lO2Ceo=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=niyawe.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=niyawe.de header.i=@niyawe.de header.a=rsa-sha256
 header.s=default header.b=o1ohJcZU
Subject: [Buildroot] [PATCH 1/1] packages/openssh: install sshd-session
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
Cc: Niklas Yann Wettengel <niyawe@niyawe.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In OpenSSH 9.8 the server is split into two processes: sshd and
sshd-session which results in the following error, when trying
to start sshd:

Starting sshd: /usr/libexec/sshd-session does not exist or is not executable

This patch installs the sshd-session binary

Signed-off-by: Niklas Yann Wettengel <niyawe@niyawe.de>
---
 package/openssh/openssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 6d846f64df..7065c3ae4f 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -117,6 +117,7 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSH_SERVER),y)
 define OPENSSH_INSTALL_SERVER_PROGRAMS
 	$(INSTALL) -D -m 0755 $(@D)/sshd $(TARGET_DIR)/usr/sbin/sshd
+	$(INSTALL) -D -m 0755 $(@D)/sshd-session $(TARGET_DIR)/usr/libexec/sshd-session
 	$(INSTALL) -D -m 0755 $(@D)/sftp-server $(TARGET_DIR)/usr/libexec/sftp-server
 endef
 OPENSSH_POST_INSTALL_TARGET_HOOKS += OPENSSH_INSTALL_SERVER_PROGRAMS
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
