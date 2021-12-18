Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C96C433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 20:20:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B014223B;
	Sat, 18 Dec 2021 20:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBZLL1Lnzvg3; Sat, 18 Dec 2021 20:20:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E6EE41FF3;
	Sat, 18 Dec 2021 20:20:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 734531BF3D5
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 20:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E46340022
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 20:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FH-VkNcl_Uqk for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 20:20:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF5E84000B
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1639858832;
 bh=6v9g5cpQxVZttcNYRvbV4v8wxX87sGtpaJiTeSyyd7w=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=dWCzwsb1jKOzmbkXzpve0LM//er4X50vNE2sZNUelD3e6Xi4R2cygBPmf2r6xhAY6
 Kk+x9qPdaLi7Dmd7BM8LVmmTW7WjffQN2/4+fvyTu+d1PJv4ZX6LG3IlQEFicy3hSZ
 wPutc5ADPEFyhnS7aj+zgr8ftEhmDLnVDJU6nCWA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from NCC-5001D.lan ([83.130.83.196]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1MoO24-1mAHQ81ewK-00oqx9 for
 <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:20:32 +0100
From: Dagg Stompler <daggs@gmx.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 22:20:30 +0200
Message-Id: <20211218202030.24838-1-daggs@gmx.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:FX9Doc58XJLebPHrY9E4gJa/tspRLVHJ+qHFBLQmSshtbcFflUf
 /X9KXykW8gh09/T5CVbFDZ9kZusw7Uv4tc4GKf/XqxByodcTVzeG9KgYv82mOvRj68wTkk1
 yRccuGkzGsZNKh9ytGAj5Kjxjk2h2RaFBf60rgN98e4AWXTK2ElaCgzKuuJghJlvjzHuhhh
 Mj0xV0aG4/7yMTv7r27Zg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CM/MhqxV83c=:9xDB999/g9qTfIeJkfNnOO
 USOoWpyNIPvqHdkdZLTbOyDdYnjblnfIcyiyq5lvQfLuPToWqxN+M/kVha51AQd0TBoiSpkKp
 oaMusk0SJTL97XmZRnCBi34V4X/LP9bIZzk/F1lJkQ17nfPKY6CA2K7LGJam6m+T78t5XDV3j
 +ny2+/OlXS8D9Yx4QqeGahc0dx7SM6L9Kmn+9bpap4+o3XGMteF8gLgT9KoLXMOd1XRwhqjmF
 KndiQX8d7dyrZdHvgt29JhX69ao75q37fS/ukHgA4k1z2HWFqoRTF5PNekgx2gjCThRNC0g63
 dKqObWeyS+TEqCBMZ2xa1SPbDu4c+o9wPbtz2dJ5nBVJ4nIC+PzopcP7mA8fOlBWqserE8lmY
 W/IEaBPCcx0EZy+mr92GTcpphsNb9+Q6hXP97FSFhU88y8hPcoYBGBSCr6fw0f6T/HLb+Vvit
 hQZJMOPaEVrxg+fie1y5Dpu3th8hwFqmri4oHlX0KUfCr7fROpMRlOliUgfnXkMAbbGarBc/V
 h4616ztLE9L5VvHiygCx8KH5qJZZD5tDejYY0MRifnME0uhiqyyl3C8Qqb0+Dnqkd/eNh84yO
 f1wgLsJiczjmvhmN+GDDXZNXp+IPAIjG5R0eXvCd+9CljQHh5ejxUb4GAzh6ZCJa460VK+AG6
 +x3n20c9Iiv4rBrXVn3+GBbBgcNpidqerD21WcIOfyGnseN9fL8GAXNyPjlwqu6IIR3buPu0I
 R1ARJd5eNbrYyE6h9VSntH0o7CX0IWoEdG7KxLHjMKy+rUbl+sjbVv4ygW2kk9jyiVJ05GX1M
 2Q25bOl/BEzfMwkk4j8/2yy7uAMXbcEPxYHRqj+xThJV5d0oU37GEDfPFfiV8/FUhwdnw9bjU
 A7bTbHyyT4mKZO2eUk6gPv/6x67840jEgpnXmyibWsaKtp9Ht+MkHT4ZTaYWztkNr+F5MvPvh
 OLhMDD8G0H1bYFI7zajWLvfz7XDk2tW610bA41cOJ28KMUZmWP2rkU38jEgvthlmsBOZvJfMq
 k4nBTuKHtds1ZTsrMdVd6ssisnSkK/hubrlwJdHJKZKmjFrF8oOf423BVWfDNHNYWile5quq0
 UvtlRBDi7HeP/U=
Subject: [Buildroot] [PATCH] boards/odroidc2: fix genimage execution
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix the following error:
ERROR: hdimage(sdcard.img): partition [MBR] (offset 0x1b8, size 0x48) overlaps previous partition bl1 (offset 0x0, size 0xc200)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

which started at the genimage version bump to 15 commit.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935217
Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 board/hardkernel/odroidc2/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
index c283b514d6..f31867a591 100644
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ b/board/hardkernel/odroidc2/genimage.cfg
@@ -18,6 +18,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "bl1.bin.hardkernel"
 		offset = 0
+		holes = {"(440; 512)"}
 	}

 	partition u-boot {
--
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
