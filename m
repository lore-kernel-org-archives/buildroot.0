Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82EACC00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 13:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A928041600;
	Tue, 26 Jul 2022 13:44:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A928041600
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b2xMeAw3rJbT; Tue, 26 Jul 2022 13:44:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F844415C6;
	Tue, 26 Jul 2022 13:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F844415C6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 497441BF2B4
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0AD7E61092
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 13:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0AD7E61092
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YeD4e_IBbZvl for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 13:44:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3CF360EFE
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D3CF360EFE
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 13:44:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 2F847240003;
 Tue, 26 Jul 2022 13:44:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 15:44:35 +0200
Message-Id: <20220726134436.2014032-1-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658843078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=/YhvMSH3jxv3GdVJ/3IgOPdM8zGoiVIbaS1jWUm7TtQ=;
 b=GuBwaf75rz9zGpfMwizUiLqGvo6lvgVnzc/pBWWoKpTTjlFnH8MOzLZTlePTlG0WyfZXMj
 IjWI8lIrpPZ5es/d8jXuPRUqgi911SNu1jvscBqnwhijUNNp6wfypeLtHKs5M3+//NILiR
 jNsRE0UgcIn/EebvpGrXqdnzMleQALBar9ppNTV3iU61H7FGPrFXZRSwMQC5fKTe1exI3V
 ch9v+ejVqgIpT91HyQDDfH6UioPMTKXj6pIXytYHoWo6qvPjAok9qdY3ahutaLdaEjSKKZ
 VCiGISD9km+0V9tK1SKG0TPJpU//15i047+hD3tTWxNyQMnxeAPq7RIXe6ZW1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GuBwaf75
Subject: [Buildroot] [PATCH] toolchain/toolchain-buildroot,
 package/glibc: sync glibc dependency comments
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In commit fd839aeb7f40596e60bc53a96b7a65892924cc26 ("package/glibc:
introduce and use BR2_PACKAGE_GLIBC_ARCH_SUPPORTS and
BR2_PACKAGE_GLIBC_SUPPORTS") we moved the Config.in logic about glibc
dependencies from toolchain/toolchain-buildroot/Config.in into
package/glibc/Config.in.

Unfortunately, it is not possible to move the Config.in comments that
tell the user, within the choice..endchoice for the C library why
glibc is not currently selectable, so we had to keep them in
toolchain/toolchain-buildroot/Config.in.

Turns out that the comments were out of sync with the dependencies,
and two comments were missing. This commit adds the missing ones, and
adds a comment in package/glibc/Config.in explaining that we need to
be careful about updating toolchain/toolchain-buildroot/Config.in as
well.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/Config.in                 | 3 +++
 toolchain/toolchain-buildroot/Config.in | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index f535f9f6eb..2c6dc40139 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -30,6 +30,9 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	bool
 	default y if BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
+	# Make sure to keep these dependencies in sync with the
+	# Config.in comments in
+	# toolchain/toolchain-buildroot/Config.in
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 56343daee7..c8f522a8da 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -64,6 +64,14 @@ comment "glibc on MIPS w/ NAN2008 needs a toolchain w/ headers >= 4.5"
 	depends on BR2_MIPS_NAN_2008
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5
 
+comment "glibc on RISC-V 64-bit needs a toolchain w/ headers >= 5.0"
+	depends on BR2_RISCV_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
+comment "glibc on ARC needs a toolchain w/ headers >= 5.1"
+	depends on BR2_arc
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
+
 config BR2_TOOLCHAIN_BUILDROOT_MUSL
 	bool "musl"
 	depends on BR2_PACKAGE_MUSL_SUPPORTS
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
