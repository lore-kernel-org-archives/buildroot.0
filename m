Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D19CC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 21:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD77A60E46;
	Sun,  6 Aug 2023 21:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD77A60E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d4IP-DDZcmJ3; Sun,  6 Aug 2023 21:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4EF960E9D;
	Sun,  6 Aug 2023 21:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4EF960E9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 710231BF966
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92FCA60F9A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 21:51:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92FCA60F9A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WMrWp3jBeEmj for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 21:51:33 +0000 (UTC)
Received: from smtpcmd14173.aruba.it (smtpcmd14173.aruba.it [62.149.156.173])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7537660F01
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 21:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7537660F01
Received: from localhost.localdomain ([217.14.215.226])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Slepq85luXI7ySleqqHa7J; Sun, 06 Aug 2023 23:51:29 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 23:51:26 +0200
Message-Id: <20230806215127.283714-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfOQ7uuAUomdt/TJ1Ys1HRvVkCrhNtqZJCILixw+TUP1ms1c12nbAkSSUjvAA1CgMe96JmTaz7QXVsR9cgOTitEiqJb4j2RIEesh82bNS/KXIygwPt9FU
 jq8hDAkplCHQVYBOHX0r/5te3/28DlaZ0tUUbJ2xV8HQxAN8GEBM6IFNqMS3Yt5eBifM7sQq8h6H3RwiEbcn/LcKD+DuUMBQ7KCqtoeTfX3gJngHLGbcs+hN
 DMlKfEk/TFu2r8RLTY8gtHlBx0zFJ/+dGZSIRNrPuArkRQCeYEvy7Rih4rwH0gVarxbPsm2sH06pniDsk4+B+J0HjazTsO0dzYZxWLI+gmrDeyxQaonjDKxg
 9QLE25xRKowpJcrAv9kHlebRriaDiMAUF0U9v+5FUUEKTT9xQGZCcPJqiF/9ZID6xOsJrsmRM+5cYbDlJxBrXgZ7c7BEAQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1691358689; bh=Zk/tVnRR11Klx3DNiQjFJSvuj3c2Dddfs5gvH4UpOfs=;
 h=From:To:Subject:Date:MIME-Version;
 b=AoKRuN+G69ZyXXraPLs+UNFddg+T7SWEDDg/7Gw+qlySfDBaF16vMY0i/p+PRehol
 yG7RnIWCbkEYSpUGnHbRSga5NtV3Vfix11vw9ZlYZ5epqmYiQGYqjokl4ast3Z7WA2
 8o6IikLnHXW+shb/ze8jNmJdsEdpFC3IygztR1DmIPJtuJuXP8XvbUwksVJMs6jCUW
 B/f29YyspQaOL0xc4un0uX7GP6S/KBaXvN2w+nMi5Cz7NCQXaD9HH1EEHUZFzdkUlC
 11B8YOePag+GQvCWMe2X4BwHZE1SyqqvMdy+gzXNBqniloVZ7OwhlYiylHramNW26d
 lxwumuylOc0Xg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=AoKRuN+G
Subject: [Buildroot] [PATCH 1/2] toolchain: introduce
 BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libheif package fails to build for the M68K architecture due to a binutils
bug that leads to:
Internal error in emit_expr_encoded at dw2gencfi.c:215

Let's add binutils bug to avoid to deal with architectures in packages
when a binutils bug arises. Let's instead deal directly with binutils
bug number.

It's been reported upstream:
https://sourceware.org/bugzilla/show_bug.cgi?id=30730

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 328cd023d1..7c5b52720d 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -77,6 +77,12 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
 	bool
 	default y if BR2_nios2
 
+# https://sourceware.org/bugzilla/show_bug.cgi?id=30730
+# Affect toolchains built with binutils 2.40, still not fixed.
+config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
+	bool
+	default y if BR2_m68k_cf
+
 # Atomic types can be:
 #  - never lock-free
 #  - sometimes lock-free
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
