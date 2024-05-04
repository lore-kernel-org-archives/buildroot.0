Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374C2C4345F
	for <buildroot@archiver.kernel.org>; Sat,  4 May 2024 19:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3EB583750;
	Sat,  4 May 2024 19:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7g9iLDaUmAX; Sat,  4 May 2024 19:54:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C39DA83705
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C39DA83705;
	Sat,  4 May 2024 19:54:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EBF3D1BF836
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5CDE407A5
 for <buildroot@lists.busybox.net>; Sat,  4 May 2024 19:54:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v7NMR4NuTFW5 for <buildroot@lists.busybox.net>;
 Sat,  4 May 2024 19:54:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=contact@artur-rojek.eu;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E3BF840674
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3BF840674
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E3BF840674
 for <buildroot@buildroot.org>; Sat,  4 May 2024 19:54:39 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1CCC72000A;
 Sat,  4 May 2024 19:54:36 +0000 (UTC)
From: Artur Rojek <contact@artur-rojek.eu>
To: buildroot@buildroot.org
Date: Sat,  4 May 2024 21:54:07 +0200
Message-ID: <20240504195407.1409466-5-contact@artur-rojek.eu>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240504195407.1409466-1-contact@artur-rojek.eu>
References: <20240504195407.1409466-1-contact@artur-rojek.eu>
MIME-Version: 1.0
X-GND-Sasl: contact@artur-rojek.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=artur-rojek.eu
Subject: [Buildroot] [PATCH 4/4] package/kexec: reintroduce sh3 support
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
Cc: Artur Rojek <contact@artur-rojek.eu>, Paul Cercueil <paul@crapouillou.net>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow kexec to build with sh3 variant of the SuperH ISA.

Signed-off-by: Artur Rojek <contact@artur-rojek.eu>
---
 package/kexec/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/kexec/Config.in b/package/kexec/Config.in
index 707f8663a45b..ede91b113058 100644
--- a/package/kexec/Config.in
+++ b/package/kexec/Config.in
@@ -4,7 +4,8 @@ config BR2_PACKAGE_KEXEC_ARCH_SUPPORTS
 	depends on BR2_i386 || BR2_x86_64 || BR2_arm || BR2_armeb || \
 		BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el || \
 		BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || \
-		BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || BR2_m68k
+		BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_aarch64 || BR2_s390x || \
+		BR2_m68k
 
 config BR2_PACKAGE_KEXEC
 	bool "kexec"
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
