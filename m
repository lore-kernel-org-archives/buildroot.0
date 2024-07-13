Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0582C3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 11:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 962F1606D3;
	Sat, 13 Jul 2024 11:08:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJfYHkBPHuwJ; Sat, 13 Jul 2024 11:08:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A76D2606C8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A76D2606C8;
	Sat, 13 Jul 2024 11:08:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 646DD1BF2FA
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D89606C8
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 11:08:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvCLmDSDoqye for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 11:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2715D60605
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2715D60605
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2715D60605
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 11:08:01 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:8213:2270:4a8d:a1d5])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 65372B00565;
 Sat, 13 Jul 2024 13:07:58 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 13:07:53 +0200
Message-ID: <20240713110753.220955-1-ju.o@free.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1720868879;
 bh=muryMPPV4ooeWoC33R0hdWgxhTU88ZIFm7bueMmI6Zs=;
 h=From:To:Cc:Subject:Date:From;
 b=AT6N5GXwx+YyxkYISP8JzXzBEANyVT6fmAFGLKC4S2h63hNtcmp3UEMPhTCtfwWim
 /VNna5gtsrek+veYnrDLK1EqDrMR+uQGJK7VlanpTinkNji0ieq4GZHLoUivkOQKSh
 kWoy5BFSL838TllB3hPGP3RyRNKdkxhIK0dBVzEOgXn49IoOCfTUWk+2o0x62PZeh1
 B9oZCqzbhV4bHt5qF0DQ4/9JyJjZiOj+EG97uYVXvOcoEQ12ZNqSiDEE+uev2Lwjhr
 IBwH5Gwyg8ty4jMGF4s1vaJU/TGkqXX8qXgP0Myp74sTt5W6txoDUojENQWKQqVPg2
 hSMVBXGTh+35A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AT6N5GXw
Subject: [Buildroot] [PATCH 1/1] board/spike/riscv64/readme.txt: update
 riscv-openocd URL
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The URL https://github.com/riscv/riscv-openocd is now redirecting to:
https://github.com/riscv-collab/riscv-openocd

This commit updates the URL to this new location.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/spike/riscv64/readme.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/spike/riscv64/readme.txt b/board/spike/riscv64/readme.txt
index 34db625aad..465fb06b39 100644
--- a/board/spike/riscv64/readme.txt
+++ b/board/spike/riscv64/readme.txt
@@ -28,4 +28,4 @@ https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#simulating-a-new
 https://github.com/riscv-software-src/riscv-isa-sim/tree/v1.1.0#debugging-with-gdb
 
 [3].
-https://github.com/riscv/riscv-openocd
+https://github.com/riscv-collab/riscv-openocd
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
