Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E56C48292
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:23:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 976D840438;
	Mon,  5 Feb 2024 17:23:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 976D840438
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJpkwttKMaZ2; Mon,  5 Feb 2024 17:23:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2B43419E2;
	Mon,  5 Feb 2024 17:23:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2B43419E2
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C02271BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6CC160E96
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:23:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6CC160E96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pDBhx_r4xckA for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:23:31 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75D5560EA1
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75D5560EA1
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id X2gqr2Ms4l81fX2gqrWG8P; Mon, 05 Feb 2024 18:23:28 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  5 Feb 2024 18:23:26 +0100
Message-Id: <20240205172327.2537523-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKnvDMa2gyqiIlETH3FmAgozwrmlPJRSK7zzcepJxJVK3wOaA7c7Ey5Oc8TiuaQELkRkUT0350jmpu+V2oWBkUqwNjgogMb3IvldyLBCCGgkIZJBCEiZ
 ag/ki0G1b9SYIjevkEEBi8PdTZZjbBItNa0d4vGtQwKYD3XnIro4NX7jLXLUqblvr50Wv/SR4M410GamF7kWZcy3gt8YHbtM/x3J38vFeyjv5TBK1HB08KI7
 Z027V8dWVpP46MTAnyXfQgzufu2ESDbZ4hf3Qiks/8yECmN71gSVGt9ocOGOoz95pNLTiAXT41dzC4ghr3v6I6DCvFXkFAie7AMYaY9UQ+x3+o9DFZRkR7hX
 B/XWWXHvAvrJtnfANb76Do6c5QhqCKq3KCvDVOr3s8F6NhaTGTI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707153808; bh=69/B1wPR+EnbqSvzL2ABcQerO9E8XiYHWBJWkNWoYhQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=gEv6ObVNPZE7/Javnh8fUTCEYkseP3egkzzNK+SLx94LeliOw8zOExwAlMwPdj2Nq
 xb6aPQpnBuOJTx9DXMfTy7aGk9Radzavyg+GIObYhAYKCeOTaNZXaLiWTLehJjQXjR
 y41sK5RNBGjRloneCn60sP7tTu22HvEFe14BDeGnOo9gu+K8tQkjgkFvgK8hhs/ywy
 AJpm+tkwA659Uk1mXLGW7kKpgoC5c05tm/6tdRQ2BUaJD6kEk09Wc1m4848y98a8iK
 viUBxWaarHu7f/OPiMgKdTWZPqUzBgc53BN4OY28sJKTb+jL6f44uh8NbD119h881c
 hwdsXLFrckOzQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gEv6ObVN
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_109809
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

htop package fails to build for the RISCV64 architecture with optimization
enabled with gcc = 13.2.0 and it's still present in gcc = 14.x as reported
upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109809

So let's introduce BR2_TOOLCHAIN_HAS_GCC_BUG_109809 to handle packages
affected by it like htop.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 34e0ae2c5f..64084dffe3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -250,6 +250,14 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_OPTIMIZE_0
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=109809
+# ICE: in dwarf2out_frame_debug_cfa_offset
+# Shows up starting from Gcc 13.2.0 and still has to be fixed
+config BR2_TOOLCHAIN_HAS_GCC_BUG_109809
+	bool
+	default y if BR2_RISCV_64
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_13
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110934
 # ICE: on M68K: in change_address_1, at emit-rtl.cc:2287
 # This bug exists in gcc = 12.3.0 and gcc = 13.2.0
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
