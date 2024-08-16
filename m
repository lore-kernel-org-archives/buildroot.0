Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5405C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 16 Aug 2024 14:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C97B400D3;
	Fri, 16 Aug 2024 14:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FH1DU0w0DgLZ; Fri, 16 Aug 2024 14:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBC884042D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBC884042D;
	Fri, 16 Aug 2024 14:13:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 688FC1BF420
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 14:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 639CF605F7
 for <buildroot@lists.busybox.net>; Fri, 16 Aug 2024 14:13:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PfQtjRPxw8Cb for <buildroot@lists.busybox.net>;
 Fri, 16 Aug 2024 14:13:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=117.135.210.3;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E3FA5605B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E3FA5605B7
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3FA5605B7
 for <buildroot@buildroot.org>; Fri, 16 Aug 2024 14:13:36 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [223.102.86.225])
 by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wDX7xmKXr9mRdkWHw--.5481S2; 
 Fri, 16 Aug 2024 22:13:32 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 16 Aug 2024 07:12:55 -0700
Message-ID: <20240816141255.4630-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDX7xmKXr9mRdkWHw--.5481S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFy3Aw4DurW7WFWfCryUZFb_yoW8Xw4xpF
 4kZw4DGrWaq3ykJr93Ga4vkFyYqrykZrWUCry7Gw1Fvr1Yvw1xXFsF9F9xGas8Z3y0yayU
 uF4DJw4UW348ArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR_HUhUUUUU=
X-Originating-IP: [223.102.86.225]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBhBs9jWV4H6t4wAABs-
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=qq+RO
 UesRy+gIyGP5War0q76C8BlXzfJspRlV3LBGec=; b=Z3V43fLHJStznGX5OYgiI
 ZpTyl2c/bHJKEqAA1zQ/yVh64XtqJrywIEcmqnN/62OLVfsNNZMFzJ0CS/EqT1Ci
 QWEae5U11dWqmtjWt04gziL48qUWEEzSd2/LilAlZAtTEW318VF6tspTwd+8XJH3
 acG8f1K6ASvnfwkBcXAJlM=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=Z3V43fLH
Subject: [Buildroot] [PATCH 1/1] Revert "linux: install dtc (device tree
 compiler) as host tool if selected"
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>, Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This reverts commit 707d44d0a28906ebda49584dd5f55985406f0bde.

Now that we have a proper host-dtc package, it is no longer needed for
the linux package to install the host dtc compiler.

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Peter Seiderer <ps.report@gmx.net>

---

I tried to make the upstream Linux use the host dtc, but failed. [1]

[1]: https://patchwork.kernel.org/comment/25979556/
---
 linux/linux.mk | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 16d9f19470..165751577a 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -536,14 +536,6 @@ define LINUX_INSTALL_KERNEL_IMAGE_TO_TARGET
 endef
 endif
 
-define LINUX_INSTALL_HOST_TOOLS
-	# Installing dtc (device tree compiler) as host tool, if selected
-	if grep -q "CONFIG_DTC=y" $(@D)/.config; then \
-		$(INSTALL) -D -m 0755 $(@D)/scripts/dtc/dtc $(HOST_DIR)/bin/linux-dtc ; \
-		$(if $(BR2_PACKAGE_HOST_DTC),,ln -sf linux-dtc $(HOST_DIR)/bin/dtc;) \
-	fi
-endef
-
 define LINUX_INSTALL_IMAGES_CMDS
 	$(call LINUX_INSTALL_IMAGE,$(BINARIES_DIR))
 	$(call LINUX_INSTALL_DTB,$(BINARIES_DIR))
@@ -562,7 +554,6 @@ define LINUX_INSTALL_TARGET_CMDS
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/build ; \
 		rm -f $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/source ; \
 	fi
-	$(LINUX_INSTALL_HOST_TOOLS)
 endef
 
 # Run depmod in a target-finalize hook, to encompass modules installed by

base-commit: 2a8c58b5849ed2c9908cf08b596f370454c251b6
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
