Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A974DC001E0
	for <buildroot@archiver.kernel.org>; Thu,  3 Aug 2023 07:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0A9C24159C;
	Thu,  3 Aug 2023 07:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A9C24159C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w2rsDI8IoIjC; Thu,  3 Aug 2023 07:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42C654158B;
	Thu,  3 Aug 2023 07:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42C654158B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D4421BF3E8
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 07:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E60C741DDD
 for <buildroot@lists.busybox.net>; Thu,  3 Aug 2023 07:37:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E60C741DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dg5LfFoFmTTP for <buildroot@lists.busybox.net>;
 Thu,  3 Aug 2023 07:37:21 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4674741DBE
 for <buildroot@buildroot.org>; Thu,  3 Aug 2023 07:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4674741DBE
Received: by mail.gandi.net (Postfix) with ESMTPA id AFA2524000C;
 Thu,  3 Aug 2023 07:37:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu,  3 Aug 2023 09:37:03 +0200
Message-Id: <20230803073704.1379495-1-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691048238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=TkNw68w6bNFmaghN26um3mdePmWJjSe5OT6uYCIpjro=;
 b=oabKO93YKs75oHcq0Ejd6VIhOjRlsEPWY06pircZYeeEK63dJpWcwQLRND610oXvfSv//D
 yNF5P1aNbV5x4wNjC90onaIJHPKmsIIftOV8Kd9Zir4tiC4Rjik7/0jNqsz92qrqO2pvz6
 MR+iMFmSRVxXncrpBhS289jZ9U3IQ0R3FC0t9wTlleEFdJT5yLnoRINWnNerqm+sGRv9Ii
 1Tb6T8nCxHDIS57ObOEKhXDzCcL03wOPTE5t6czMAZgFOf85Cc8+XypEmItk5r1avo4RDo
 xp5/O85Jo67D5AN66u8oM4D9vscS0nSJWA42+HewGI6lNKzH7mr5lrq7JQejLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=oabKO93Y
Subject: [Buildroot] [PATCH 1/2] package/systemd: fix typos in comments
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Norbert Lange <nolange79@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 package/systemd/systemd.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0aa1da3fb80c..86b1715076a9 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -661,9 +661,9 @@ SYSTEMD_TARGET_FINALIZE_HOOKS += \
 	SYSTEMD_INSTALL_RESOLVCONF_HOOK
 
 ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
-# systemd provides multiple units to autospawn getty as neede
+# systemd provides multiple units to autospawn getty as needed
 # * getty@.service to start a getty on normal TTY
-# * sertial-getty@.service to start a getty on serial lines
+# * serial-getty@.service to start a getty on serial lines
 # * console-getty.service for generic /dev/console
 # * container-getty@.service for a getty on /dev/pts/*
 #
@@ -671,7 +671,7 @@ ifneq ($(call qstrip,$(BR2_TARGET_GENERIC_GETTY_PORT)),)
 # * read the console= kernel command line parameter
 # * enable one of the above units depending on what it finds
 #
-# Systemd defaults to enablinb getty@tty1.service
+# Systemd defaults to enabling getty@tty1.service
 #
 # What we want to do
 # * Enable a getty on $BR2_TARGET_GENERIC_TTY_PATH
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
