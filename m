Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC495C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78E0D40D76;
	Sun,  5 Jun 2022 19:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id npu0RYO48xCx; Sun,  5 Jun 2022 19:44:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 98BE540D24;
	Sun,  5 Jun 2022 19:44:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7F38A1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DC8040D33
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a5Hcbjm17MP0 for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:43:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DD6740D24
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:43:18 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 63DCD240003;
 Sun,  5 Jun 2022 19:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1654458196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uKPhpe7qy46wYgv/5hyV74bKOoU6SJDvoKyIto1Jiso=;
 b=UUczF2WlNVHfEQOx/89nQfWrzRG34nhcSwi6wEb0BMWGaXLKtE4ytjWxZXongXmBP63T/q
 cN5aBsxRiP0wW+2kD5XnFgKLX155mOK5EeH3eHJ6H+lxaK2SbK4+YqyPQkKEiyXtyGDtze
 tyElPAJSvWbxUmV8BDCQfJmYiDbNVd1C00g/byNtT794ssJAUWiL8cxzGOJ/uS5QXr0e9y
 KXTLXo9Hsp3ytHVaElfg8wzPoUQdjwzt3dZaCod1MeAukxGptY9vJj64hmUOFGjKpjSZRe
 O6Grvtdm+aBSt0tf6D+FFjimqDYGEzCir+KaNFMbwzVb/CBDLv/opf7oKTUEVA==
To: Buildroot List <buildroot@buildroot.org>,
 "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Date: Sun,  5 Jun 2022 21:42:57 +0200
Message-Id: <20220605194259.2928568-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
References: <20220605194259.2928568-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/7] arch/Config.in.powerpc: disable some
 variants on ppc64le
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Cyril Bur <cyrilbur@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following commit
e59b3acc3603e55fbaec25406258ec9ca9623564 ("toolchain/glibc: Restrict
ppc64le support to power8"), when selecting ppc64le as the
architecture, it is possible to end up with a selection for which no C
library is provided.

Indeed:

 - glibc only supports Power8
 - uclibc has no support for ppc64le at all
 - musl only supports ppc64le processors that have Altivec support

Therefore, this commit adds "depends on !BR2_powerpc64le" to those
PowerPC architecture variants for which no C library support exists.

Fixes:

  http://autobuild.buildroot.net/results/3f6fb1c2d5648e78f7856bdea3171b5a89dfa2f9/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.powerpc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/Config.in.powerpc b/arch/Config.in.powerpc
index 272f66f4e7..c48edd3bb4 100644
--- a/arch/Config.in.powerpc
+++ b/arch/Config.in.powerpc
@@ -14,6 +14,8 @@ choice
 	  Specific CPU variant to use
 config BR2_generic_powerpc
 	bool "generic"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_401
 	bool "401"
 	depends on !BR2_ARCH_IS_64
@@ -64,8 +66,12 @@ config BR2_powerpc_604e
 	depends on !BR2_ARCH_IS_64
 config BR2_powerpc_620
 	bool "620"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_630
 	bool "630"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_740
 	bool "740"
 	depends on !BR2_ARCH_IS_64
@@ -118,8 +124,12 @@ config BR2_powerpc_e6500
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
 config BR2_powerpc_power4
 	bool "power4"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_power5
 	bool "power5"
+	# No C library supports this variant on ppc64le
+	depends on !BR2_powerpc64le
 config BR2_powerpc_power6
 	bool "power6"
 	select BR2_POWERPC_CPU_HAS_ALTIVEC
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
