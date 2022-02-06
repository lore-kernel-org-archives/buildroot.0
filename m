Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38094C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:05:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BEBBB401C2;
	Sun,  6 Feb 2022 20:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hki8LQHp43DQ; Sun,  6 Feb 2022 20:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0C6D401D6;
	Sun,  6 Feb 2022 20:05:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 566B11BF360
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4442A402B3
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BzI7oOClqWQP for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A8714027D
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:05:37 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnmxnXO6s; Sun, 06 Feb 2022 21:05:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177935; bh=Uyf4YP3urYPIWUKu0PQxb4rZtwhvFZ34ZEojQsm5Y+M=;
 h=From:To:Subject:Date:MIME-Version;
 b=ABIHo+sbsYRXO9nTFAnHFIyhT1e5uCD+LzdrHN2L8rgZcDQY0v8xRIBKbUJkaIW47
 QfFfuoh54iRuhgSiRl4V+XWti8mNTdO8Szo4OsH3FomPAtRDZLjYpVU6Ehptwt2F/F
 EYqBLrtON2uwvKFlZZcwU4jmLm1iSArIpdmp0ZsqbKh2XUnWNJrrSVzNkBVJ5ewLfa
 vXYPkQU+4enWWMKwu4/Vfa+Rxj+TPWH5hdUXpI73VQlziHRZ2TxJsB5+DQV6050xU4
 AZfEDBZJ7WxEEUIk9+P4oC4dVwF5Ki/HugbRFdyz6xoyVhgy7i1lqLZKj2dW/axxPg
 M/5xkOvU8EeEw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:17 +0100
Message-Id: <20220206200532.2758493-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNp+MXm4w6Kaqg7fRKrtNjU/C/vhndri20i347aj3/LOo6O7bOGKPCYzWMHdygI92/MILhmW7buwfCZ7hGrczobVkBeg0LfY8nPeitydCdIhZJOUDlAv
 9Xvd3s8Db8N2V8BHlvm0U93pq7Y437gTcl8Usv0FKMKYC3r8KIwdERm7MPVZzP6RlAOM+/Lv1wSFPwD15KDY2F05WAD/owC9jadgIF9cohyXWJHZzPOanQtV
 B3bWj0T5HJH12vu8uglP6JAJ0E1HoVXeA8KDmriYepqBjZA2lNzhD07BBOwUPtRn32/vCWGpekbLKRSFwkThFxYY2R4rCC/+iivKJNM29GIFz+HVSbnz9cWR
 fa6Kb5u3L35PtNTBOjWXTHX6tHCLS+9JLB23wTDdP1mlEIv+ndGNv+AdxK23tLGT67CbzCfWVBAfxoUFnNAhJEjyM5dpZJn1FBJiIup2gcVw+Bfw25hXXtzd
 KUILvp0UBpk/JS0TMLH0vyL5OIfnhDh+pvi1AJ2bIjAmlxXY1Ba2WZYX42SYILEu2UEwF7wWVaL+YUN/BzF+8ssLM1HY5uGynMWO+iBPU1Hh4YILlpdbGfaN
 iJQ7dkQzBEIhKE36WSEwVQSH
Subject: [Buildroot] [PATCH 01/16] board/aarch64-efi/genimage-efi: convert
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
 board/aarch64-efi/genimage-efi.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 87e85816bc..7fbe13d390 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -18,13 +18,13 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext2"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
