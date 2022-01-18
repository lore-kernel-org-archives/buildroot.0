Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA6DC433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1EDD2405FE;
	Tue, 18 Jan 2022 10:51:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h2w4JGsd_iFM; Tue, 18 Jan 2022 10:51:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05E03405FA;
	Tue, 18 Jan 2022 10:51:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 010F21BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEC1F400C6
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:50:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n3o06EuAl1nX for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:50:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10106.aruba.it (smtpcmd10106.aruba.it [62.149.156.106])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965DD405F1
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:50:39 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9m1Vna7L1; Tue, 18 Jan 2022 11:47:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502859; bh=UdaYX3xLX3JJMYnw9BdqpL6zP+mcL9Wr9DQDF+RN5WQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=dDhWjfzA4MSCkQM0LZnsWPN7cNV5f7hfhqeZ99NR97udYp4IFKVYRvU8FrsgGWzrU
 /49QNRpFp3NK0SWwNPPcs1foRSi9qx91RrRE/XWZMB0y4cJGrzJHxbcDlI7RFWP4pj
 uUzuED9lmv6BdJV40M6L41BuAR65o/8JlqsAKLOcIyWZUMYDjb9s6ocH0WJpAR9G2Q
 3XjMY5MSa4UekhSkXzN1SlZ2KmGD56sn7zZgE7AJuGLbt1j0v05rCsAJ7Ogs133tP1
 xxa75isJE4VJ4+gfOxCssePOeHcz6ptZ0sA7TJg9eu86U4aDmMoKEvBY2+pAz0Qiy1
 vZOSprg9yiEVQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:27 +0100
Message-Id: <20220118104338.2081259-18-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfP2v1JKC7iJ5hmvpyUtQgn/afNroNapiRDj677TNITMxXXOePSNMxv8V4VhnBwyvq/+SVIdSw2SlJNH3+wgLxTbAWcr5SuZUphYCeW6XzZYPf7HsT+Xw
 Zc2KMfDl33874e3s5aetsocb7gdGP1Cb3GN7S/VenF0nKQc+65lOCAsL6fQkyBC15Np0cZuGiLqWPfEe0okIoC79l4dj8qpZ1/JFnDezfU/qgKztL92FNixW
 QAHEzacOdj1zTzStVrErfrUMVXiCoOBhIB8QDUNHcgpW3UNurgPX5bCkSTs2JKCFxQFNo/Jl8ZC95wnxyZ1XdWLHrUEo65wKik64PB+ffLSzGrcDHbFTdLhk
 g0ZnaecaK0wLvEZ5n5Uj6wv5VSzwSDudKNZfmQbjb+HVPupPJvfuNPYXy8DhBvFv91Q+/Rdl6GU4TpqawG3mXbFP141sy77LGGROgvfwIxiT9wXHatNbjfRz
 udqLIlXnsBVWxWtJdJu12+qTVbWGssjyYQG24NP5me38+ZFA47q2Er5NCAJZSNVF5TVx7bMaPJKZZ8plBOi6IImeyUeFmAy6F/2MIt5XZk7yaAETfvjouipP
 806v5nQJcCxi/2OgwhcvqFeKmmHdBLmrAqYF83ae7jr0OlCMDpK7ukw2Iln+oWIrh2in8TtH/4nYr9YGD8Qf9VlqlC2jArAPS4qcKLNpNBVSntwgIqX8cdH3
 qjsSqWxBvQlFFNyQljZwGws132DsXtYTyEhOa3fko1DD4lcUUOr5szGl/DrFnGcg4dSuO8QBsZy9OpP+45ZZgus1Ycsq9EdJVUh4Hlgn+0px46duFgwtyOej
 LiQaULTZpKybM12LrWCxiw/ptlyw//G21aC38qbkjPefHNtAAvy6+vslQ4+1LQ==
Subject: [Buildroot] [PATCH 17/28]
 configs/microchip_sama5d2_icp_mmc_defconfig: enable NEON/VFPV4 FPU strategy
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>, Simon Doppler <dopsi@dopsi.ch>,
 Edgar Bonet <bonet@grenoble.cnrs.fr>, Jan Kraval <jan.kraval@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Davide Viti <zinosat@gmail.com>, Mike Harmony <mike.harmony@snapav.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Biagio Montaruli <biagio.hkr@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As pointed by SAMA5D2 Datasheet[1]:
```
The Cortex-A5 NEON Media Processing Engine (MPE) extends the Cortex-A5
functionality to provide support for the ARM v7 Advanced SIMD v2 and
Vector Floating-Point v4 (VFPv4) instruction sets.
```

So let's enable VFPV4/NEON FPU strategy instead of the default VFPV4-D16.

[1]: https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAMA5D2-Series-Data-sheet-ds60001476G.pdf

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 configs/microchip_sama5d2_icp_mmc_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/microchip_sama5d2_icp_mmc_defconfig b/configs/microchip_sama5d2_icp_mmc_defconfig
index 4bb3625f83..658d8c18b6 100644
--- a/configs/microchip_sama5d2_icp_mmc_defconfig
+++ b/configs/microchip_sama5d2_icp_mmc_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
