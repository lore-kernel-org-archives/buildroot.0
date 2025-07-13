Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B96FC83F17
	for <buildroot@archiver.kernel.org>; Sun, 13 Jul 2025 12:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 383B060BB9;
	Sun, 13 Jul 2025 12:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tL0LwDL5E4Fd; Sun, 13 Jul 2025 12:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51EB060ADA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51EB060ADA;
	Sun, 13 Jul 2025 12:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FC82DF
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 561E34015E
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPMpprxTS5n0 for <buildroot@buildroot.org>;
 Sun, 13 Jul 2025 12:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8544740112
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8544740112
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8544740112
 for <buildroot@buildroot.org>; Sun, 13 Jul 2025 12:55:33 +0000 (UTC)
Received: from eos.home.n621.de (localhost [127.0.0.1])
 by nyx.n621.de (Postfix) with ESMTP id CBA45E001D0;
 Sun, 13 Jul 2025 14:55:30 +0200 (CEST)
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>,
 Florian Larysch <fl@n621.de>
Date: Sun, 13 Jul 2025 14:55:19 +0200
Message-ID: <20250713125521.18543-1-fl@n621.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=n621.de; s=dkim; t=1752411331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=qhfujBsyNNuGCAQN+BSWIWpiCDJtOhfm8gQYRxSfwAQ=;
 b=nSAq4Sc7WT3Vq0tB5S4b0XjDl/K7KfzjnKTebnAc55uPCn7JZsVwoTtv+3rsjee76qB81h
 Qqw6MYvP204N7hu3E6S4qTeqzzMFjP5Z31Jqm67J73DC7KcF7AY17WW2nnJ2GnC/x2qbje
 4/GfCNMTbhIT7xDBH9b3DYoFVm1dNsI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=n621.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=nSAq4Sc7
Subject: [Buildroot] [PATCH 1/1] fs: erofs: reword "all-fragments" Kconfig
 text
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

Currently, both BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS and
BR2_TARGET_ROOTFS_EROFS_FRAGMENTS have the same Kconfig prompt, making
them hard to distinguish.

Reword the one for -Eall-fragments to be distinct.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 fs/erofs/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/Config.in b/fs/erofs/Config.in
index 00f27faeeb..93c069f2c0 100644
--- a/fs/erofs/Config.in
+++ b/fs/erofs/Config.in
@@ -109,7 +109,7 @@ config BR2_TARGET_ROOTFS_EROFS_FRAGMENTS
 	  Introduced in Linux 6.1.
 
 config BR2_TARGET_ROOTFS_EROFS_ALL_FRAGMENTS
-	bool "enable fragments packing"
+	bool "enable all-fragments packing"
 	help
 	  Forcely record the whole files into a special inode for better
 	  compression. Introduced in Linux 6.1.
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
