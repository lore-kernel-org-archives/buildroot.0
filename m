Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC07C433EF
	for <buildroot@archiver.kernel.org>; Tue, 18 Jan 2022 10:44:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23371819D6;
	Tue, 18 Jan 2022 10:44:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b5QVHGW-2tmD; Tue, 18 Jan 2022 10:44:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B97A818D4;
	Tue, 18 Jan 2022 10:44:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABCED1BF28D
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96DCA405EC
 for <buildroot@lists.busybox.net>; Tue, 18 Jan 2022 10:44:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sdvwVkZnsaTx for <buildroot@lists.busybox.net>;
 Tue, 18 Jan 2022 10:44:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10102.aruba.it (smtpcmd10102.aruba.it [62.149.156.102])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45474400C6
 for <buildroot@buildroot.org>; Tue, 18 Jan 2022 10:44:22 +0000 (UTC)
Received: from localhost.localdomain ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 9lxknDlmTDzPJ9lyAna3kV; Tue, 18 Jan 2022 11:44:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642502661; bh=Ah4ZYGA2WAml/ufrZ7lUdTxJrCx2yig73inoRgR38Lo=;
 h=From:To:Subject:Date:MIME-Version;
 b=RbgYsBdG0ObAKjUzSwQM5wwaL8FqBzcUb70eg3a6KPeGKfqAS6p4nq84Je4YXseMK
 2wCmOPndweOp0e2gCsEm+mipaIm5aZtz6aGQEf69vCrrGcXC86juV7BOTY92h/cyMX
 J3X92NXGZPmzklXaUCQLfP88/cco/K5Abohd6JTZ5ILl9NfwpudcfxomjqeiI7bf5n
 ZZAJnMhu61FVJ6688kJVT0hfpIrENAok15xDLLs+wD4MtUzgqoWR35bfhk/OA10mcL
 42o2SCuvJiUb49MygBwejjSzYihG5iKv41JUOfV3Gy9HSOpnsiR4pQG051qEreIBRu
 skzgfSO5hFg+g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 18 Jan 2022 11:43:12 +0100
Message-Id: <20220118104338.2081259-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHLMDY212TW6aiiYnm4WX5tCnEUEsx1gSEjq56DRmPVt/om4sSqoAFJA82qtFCJBxTrlLEjXiuQ135mqTXfQWvnQ0OYpJHfH7aKukIs6fnmYKfDXFnC1
 2pt88bDl7ueni6PcJBQOeRXf/zRT+KRw4m7Vl8eDFgW7Lhtr4CRXeqIpLMu3TQlM7w+VwJb6fJqzOmAN4JqYfzDkyk+xat1W5ixyB8xOsF8zA0KmJtRGWUMH
 PPd9l/dUMYW26Dn0S88qHug8Yu/HGbjk2vbh30cpfFhwSDKJfKpnCi9XqVMvU2FWM2F2R9C1yB47OA8y7ypaskaQkA0zFN/2ZQb4b+h6MVEiBgqvOTW0DRQZ
 zsE+9QJCPzBaYBlJ/Ybi/6T/E+Z5ltUTLPi3XXfCTM03c12ZqLz/O8uE4OgLtH7h97Q90g0xkokBmXLKil14c1DazdrTp0rjp9mlWewqnfYSN0JuCdaF7xBi
 g+A8Hhu1cwm3GnD3ZnfodOMSdAEhqQMfLOyI4rSjIIK0jVrqcC3+j9dNdKSaY18sYqP4ON9UjVu1Ljlhb+L/LEXQu3ov7I6rKUPxqe9lVSEV/eB+snKVswpy
 bCjSkeh3vqP6TmAToDjb7MkgsyvfdaCX54qEaf242kqPoeNQcqvbjCaZRcKBtWPFg6puQ1NT3Xlmbfan/nQbmqf5mvM0Q/H8DkSSeknmXU5oyLFZ+Iqwdwgp
 z+FokY2qTek3pKwDaEgc6j1tvBNzUMAio7qcUZpSYg9Dhqznl16Nur3Jy20uvVPy8kLV+GYROvDNLzrBo3mZst9AjxZQ4OffXX/0/RLsHtt5nrKGVfLlOJ38
 o7vwpI/SoGFhAukddScgd2AOfy68xhpLlfT1mHEUq/Z3TUUy7v+DkqltH6uK/g==
Subject: [Buildroot] [PATCH 02/28]
 configs/acmesystems_acqua_a5_512mb_defconfig: enable NEON/VFPV4 FPU
 strategy
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
 configs/acmesystems_acqua_a5_512mb_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index e399d4a9ff..56885ea5a1 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON_VFPV4=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
 BR2_SYSTEM_DHCP="eth0"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
