Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B944AC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 18:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C68C409A2;
	Sun,  6 Aug 2023 18:39:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C68C409A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYt1CMyT8jMz; Sun,  6 Aug 2023 18:39:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A6C840126;
	Sun,  6 Aug 2023 18:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A6C840126
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 569721BF909
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:38:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B1E714011C
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 18:37:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1E714011C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JoDVtfCEJ6Qd for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 18:37:44 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8A1124054E
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 18:37:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A1124054E
Received: from localhost.localdomain ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id SidIq6MgRXI7ySidIqGfY8; Sun, 06 Aug 2023 20:37:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 20:37:38 +0200
Message-Id: <20230806183738.257006-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCWLpmsbYYmmQVc9pk5kqdVTTK0BC3NkWjrP2wtwpPTeTtjI5CFRkySjI8g+/QbBihVktgT6IrBLSeo0B+k7WiMnQxIC0+WjVp44qvqTsXK+HeshbSpt
 4JAwXQnY6EDiD5CgZ5hn5lMNWYQqxHlgd+G5ZiHkIOPL9+BdK6PdxvJQRV1DhoqNnrS0CrVWVvTBhQbqXAdxB4ly6l0Ll8UjPFVrcuNj+I6YTpxHAtPYHwEe
 FHDEubxSoAnf2eQPkqTqIUdrMvnrMVodeVz4mLXriiSc7NSe4aLuKk8z7mlcdCyoseaBorYbQ9SA3mRRngH0CrKrWbsptXOK6YYy68HdcNUWOQWlBtzaILHg
 UTV4hIxOM4MvpF3f54O+l73ga9n4JrASQg7Boc154ac1mG6LJjs0sBM1yESzSns8VH4mUxSv
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691347061; bh=/k8Ob33BHwWiivZAtD3sq2oa3fMT9KDT9zBEE41hZhQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=R3WrtWkzRWXcAdhbcej1WAOY4JNhgloE8Zak22jnrOgHPMvTnA1DXAZluyx1DeFsl
 aTjMu6+L/KnwDVSKV62iPzhgDNclNbbLpYhnO48CaH0ms1iVAsHIjfrTIL0aUhuZdG
 XFsqkHhh+EBRyp0dP3lZfB2dorCzTcADOMlA1UGc+tTvShwPqYRyOKckHU8MBSHXZB
 Ht+JQ6YMBgSa/8Wn5YTWJHz6pMopcDvgQizwnl/25dWUmI/2WgW2sgs2OrufLkz54L
 u6QaN1iGE1U151zXfjs//3tbgV+gT46sJPg7dJueUgH8uQEL56ACkv9cNpEI2eVyv0
 T3JWfezNVZkCQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=R3WrtWkz
Subject: [Buildroot] [PATCH] toolchain: introduce
 BR2_TOOLCHAIN_HAS_GCC_BUG_80786
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openssh package fails to build for the M68K architecture with optimization
enabled with gcc = 12.3.0 and it's still present in gcc = 13.2.0:
http://autobuild.buildroot.net/results/d29/d29c662e41d8969e6a8aa24870e728bcc7050563/

It's been reported upstream:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80786

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index a142d27231..328cd023d1 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -141,6 +141,13 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_68485
 	bool
 	default y if BR2_microblaze
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80786.
+# ICE: in change_address_1, at emit-rtl.c:2275
+# This bug still exists in gcc 12.x
+config BR2_TOOLCHAIN_HAS_GCC_BUG_80786
+	bool
+	default y if BR2_m68k
+
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81426
 config BR2_TOOLCHAIN_HAS_GCC_BUG_81426
 	bool
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
