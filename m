Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E8EC3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 16:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 534D560651;
	Tue, 23 Jul 2024 16:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I5kdn4cgapVw; Tue, 23 Jul 2024 16:29:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73BB96069C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 73BB96069C;
	Tue, 23 Jul 2024 16:29:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D4E261BF2FD
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:29:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB90A404F8
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 16:29:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQO0ETw7PGzv for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 16:29:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7888402AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7888402AA
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7888402AA
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 16:29:01 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 3F7D8440271;
 Tue, 23 Jul 2024 19:27:49 +0300 (IDT)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 19:28:15 +0300
Message-ID: <ec9291a6fb5bf49751b1abd089f14f0b99a160e6.1721752095.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1721752069;
 bh=v3mntHSm6PR9rcxR+WS4YovzHk/lXcw7PpOoko0U1ZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=c6YgEpgoc3G3EfY3z35n6vnNL6m3ZEvEXe158UHAqkdfJUSn9ILe7Ltb9WOWHwHs6
 eSW+iONWLdlvKCXFP82p3ft1PJumS8h67NPKLbcyMBkYJzffURUpWCdgfxvHu1Oxii
 Fo+xhsPNxa6d5Wa10Jb+mtM+zJ81+sIZ77lkQhQKs2ELQ5i+p2iYZeA9SHGRnuM3Lb
 nMy3ToRYr7Er4beErEM+W0iytPcs1odCaDWte2eSSpL6R2ZmUUEMQhCjKd3SMfzJsy
 NuMW7qd+uSOq8M6NtBdeMIwZEA6mVYM6H0CIgQD85+KBpdsH2l0mlmQAynYlVL4nsY
 eqzkp5zquW8SQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=c6YgEpgo
Subject: [Buildroot] [PATCH] package/uuu: update upstream link
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

NXP repositories moved to a new location. The old URL redirects to the
new one.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/uuu/Config.in.host | 2 +-
 package/uuu/uuu.mk         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uuu/Config.in.host b/package/uuu/Config.in.host
index 0ed064feb6ea..99f20ee0709b 100644
--- a/package/uuu/Config.in.host
+++ b/package/uuu/Config.in.host
@@ -12,7 +12,7 @@ config BR2_PACKAGE_HOST_UUU
 	    sudo sh -c "uuu -udev >> /etc/udev/rules.d/70-uuu.rules"
 	    sudo udevadm control --reload
 
-	  https://github.com/NXPmicro/mfgtools
+	  https://github.com/nxp-imx/mfgtools
 
 comment "host uuu needs a toolchain w/ host gcc >= 4.9"
 	depends on !BR2_HOST_GCC_AT_LEAST_4_9
diff --git a/package/uuu/uuu.mk b/package/uuu/uuu.mk
index 63556b9938a8..e57828a0ca6e 100644
--- a/package/uuu/uuu.mk
+++ b/package/uuu/uuu.mk
@@ -6,7 +6,7 @@
 
 UUU_VERSION = 1.5.182
 UUU_SOURCE = uuu_source-uuu_$(UUU_VERSION).tar.gz
-UUU_SITE = https://github.com/NXPmicro/mfgtools/releases/download/uuu_$(UUU_VERSION)
+UUU_SITE = https://github.com/nxp-imx/mfgtools/releases/download/uuu_$(UUU_VERSION)
 UUU_LICENSE = BSD 3-Clause "New" or "Revised" License
 UUU_LICENSE_FILES = LICENSE
 HOST_UUU_DEPENDENCIES = \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
