Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 189D9C433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29EB60B75;
	Sun,  6 Feb 2022 20:12:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id New89dBg7Xcv; Sun,  6 Feb 2022 20:12:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB89C60B04;
	Sun,  6 Feb 2022 20:12:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EE881BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3ACC660B04
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NFcM8QQWr2J for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48BCF607D1
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn0nXO9G; Sun, 06 Feb 2022 21:05:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177938; bh=C3GDeg/Jq/TmMz9M77j/blgzQ6spG9zW42Z/C+V9KRo=;
 h=From:To:Subject:Date:MIME-Version;
 b=UYpGxEIDbje51GlZkKKDugLXGVPU1ZWWd4Axmv0u+K/KjUFPsPw7IPK4H1EtwdFNY
 Op91TNiwswG5CSR3M8J7mYE/kWQQrfyfk93V3JasrZNV6RPsKolLAt8M7zDcoYGFMU
 3M9jzrqccWGDGM1kTIxRexZ7s2RAsLI67NBXmj5iVoVB/ZONXyjH6i/K2raNFN2klf
 SvfYNLSZ7yy41lt7gFG4BL/5UdoPLyMp6Cd8IZagPbLhUaGDow8uYYtr7EDZAbD70K
 LuFdYBDM9BgrtreeZ0SaVKGGb4aATGNM0r5HcrGquzfoT4H8/ilk/OjsvH1GH31i0o
 z00Kqw20XtCMw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:24 +0100
Message-Id: <20220206200532.2758493-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAT5XGrMxEsFiz00hqqXkBeiLhOojjyT+MAOsG+ZnCeD9VR61VwpC99O+pLSLWlvo8gNC3hZhh83W/Cwo16x/nx5F27SaEL9sO8QKNZKA79I201Tgrx2
 3lBW5fdPWzJbCBlpBxnYRTGiN7j1ldFILBsnylCmdZCjQ8MG71gZGF9f8Bawuzg7tsl6o0mI3nC33KRjoWRLDftck7AmT1Iv3WeBKJGcRfnqgKL4v5Kyq7k/
 1kN74rBOPkfHsFbb0SOgxx+Yh1/zcA4dRDA5kkJtSU4Yt7OK8T/XJPIEzySLL2VfuIxsg28egjRTC1YftD6jlNQyk5wGzW1JcrFM+OyAc1ftN4uj6eNhNleZ
 /RuiVE/jtJs2y0hxINfOPGl3kKRNkufsUqWDiP9gaqDePvzCdGRlJCY1RGNp/FbGuMLkUk8v+frd+O+CX93DfE6dZ7pDkw7FNdYQ8ibBPje+xtl2LIFzMHa7
 3DE08NqhFLJR4dQVvnuytElCBCDnjBJvhN6uZ5YC7s490Uso4MXRwWZyD1GFl8PzNb56uFt1oXCveWZjew5rXSmS+QfA06FUsDYKSxH53lzoNGOfUFg4od2d
 qJEXUSRPwJbWV4wQkjzAfS76
Subject: [Buildroot] [PATCH 08/16] board/pc/genimage-efi: convert
 partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pc/genimage-efi.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/pc/genimage-efi.cfg b/board/pc/genimage-efi.cfg
index 035a077a78..9626a5f2e7 100644
--- a/board/pc/genimage-efi.cfg
+++ b/board/pc/genimage-efi.cfg
@@ -19,13 +19,13 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = 44479540-f297-41b2-9af7-d131d5f0458a
+		partition-type-uuid = L
 		partition-uuid = UUID_TMP
 		image = "rootfs.ext2"
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
