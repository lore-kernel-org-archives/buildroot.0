Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93558C7EE22
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 18:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2611982052;
	Mon,  8 May 2023 18:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2611982052
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id isslrbYlLtCH; Mon,  8 May 2023 18:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61F7782047;
	Mon,  8 May 2023 18:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F7782047
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 79CE31BF342
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52E3F82039
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 18:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E3F82039
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KBWICcQzJPWN for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 18:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825B282047
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 825B282047
 for <buildroot@buildroot.org>; Mon,  8 May 2023 18:19:11 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.150.105])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 84BBC780508;
 Mon,  8 May 2023 20:19:05 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  8 May 2023 20:18:50 +0200
Message-Id: <20230508181850.21256-1-ju.o@free.fr>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683569948;
 bh=nD6HF7iYn94DsokhgiU6UIv4bsPqUxGgE+CsxMaiqEI=;
 h=From:To:Cc:Subject:Date:From;
 b=T/gmAVCD2W0ju3uDR7fdYajMK5hyqWftIWSQrnUdMXo92ejqKtx1yeujG65UvZct3
 l9Y50i2D515766EqgPQZgr+fgLymHf76Vo15cOlMRNEEMLufd5dmvs61+8gsxv+HjS
 dTk2LsuHb5EywAdfF8y592wGCzDHYf9P1y5naWJRcx3l0wi3XFa2DqKI1vFgqCMPOg
 6wmLKkffJG0MU2iISnl6fUHJKs0wpFRhGxt0xEX1z/aDFswaIt8lta2NomfWmyJzKz
 byI7qb0N2BEVVPOns81xu9Z5KIiWGw30I4McqMpm3Zsnj0TbA63vAymOnofc2H7FMM
 vV1Ys/phVujNQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=T/gmAVCD
Subject: [Buildroot] [PATCH 1/1] DEVELOPERS: remove entry for optee-benchmark
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
Cc: Julien Olivain <ju.o@free.fr>,
 Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

optee-benchmark package was removed in commit cf39b596e7
("package/optee-benchmark: remove deprecated package") but forgot to
remove the associated DEVELOPERS file entry.

Using the get-developers script on any file generates a warning,
for example:

    utils/get-developers DEVELOPERS
    WARNING: 'package/optee-benchmark/' doesn't match any file, line 865
    git send-email --to buildroot@buildroot.org

This commit fixes the issue by removing the entry.

Cc: Etienne Carriere <etienne.carriere@linaro.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5658dfa14b..efb2907d1b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -862,7 +862,6 @@ F:	package/python-kiwisolver/
 
 N:	Etienne Carriere <etienne.carriere@linaro.org>
 F:	boot/optee-os/
-F:	package/optee-benchmark/
 F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
