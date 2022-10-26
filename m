Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BAD7C38A2D
	for <buildroot@archiver.kernel.org>; Wed, 26 Oct 2022 13:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D19940304;
	Wed, 26 Oct 2022 13:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D19940304
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H9AULB-UX5pE; Wed, 26 Oct 2022 13:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 414EB402EA;
	Wed, 26 Oct 2022 13:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 414EB402EA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30CFC1BF5B4
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 032D4402EA
 for <buildroot@lists.busybox.net>; Wed, 26 Oct 2022 13:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032D4402EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YnMKimC4N-Mm for <buildroot@lists.busybox.net>;
 Wed, 26 Oct 2022 13:26:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D5A1402E7
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D5A1402E7
 for <buildroot@buildroot.org>; Wed, 26 Oct 2022 13:26:39 +0000 (UTC)
Received: from localhost.localdomain ([146.241.83.94])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ngQVojcL4uz2mngQWoqm3h; Wed, 26 Oct 2022 15:26:37 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 15:26:27 +0200
Message-Id: <20221026132634.999254-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKq2n83k1FlZIG+y9HFvFnJTc6KrUnkOtdglrc7FMoQkHzAHwwUKimKD1UR0y/xrbAmwwTXrSm60ZwNDQkWAZ3jCCW9BZxEZoPPuw4J26DPWri+p9q5q
 GcNoVNjoMmkLnr8KPLAfHNy33/oMBHhObcxIoneQf21COBc/SwyuCGK0ABGHpbIRqhozgI6HdK4Gp6qA+D/lBfrbUgD9nPE2GCssFj22HzRe75dLpCIw8/oM
 aNzjVbzyi3BKIpzNcu2BFyjZUo4MRK5cz1j/taj676i3iDftlDwAyUsYva7mL2pHcfca1kqPQthCG5Oe4YC2HUeuN7CvccCoInnSUUlM8IddhZU+TVGpMEUm
 JlQ0i7/WtvhKR58SgvQNJONV0X7+2XiKNvZgakY1Arov3ZGyhIugF++RD3naWIdycSA+qdgM/fYnSkvTY/YeZ0rNZTFYJM5a177BLd82CJQ2HZa3Wy0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666790797; bh=wqE8r8xI2hVPrpnpttjmPtF7UHk7vUsUI5B6crP5ucM=;
 h=From:To:Subject:Date:MIME-Version;
 b=Fykbzw/mZ9r7Sk7tXX7UOJKJzSRHOYIl6rospuSo4m+3yqPebZ1d0ePGZ0nv1G/lf
 6wgbW0vSj/J7fiAcox0klHKGia/jQqQ9iJ4xY7grDQrlmT9RKSMl2M4xwCsJq457vq
 2l4O3NpkFni9SkBSUgIKeCKFDJstIqW0IhRhiW03g1/qB6j00mIhEEgDn633H5SkE2
 ZC2uS6uLD/dbt4nEqIBN6H8BM60OGAE/8/cG9B1thn+l3BrSsh4Uu+ImyyEGO6bxQM
 Nr3bvkE8vsTVNL8X4QQMB8TGLmr8MZUHJRGdS6ZMgFclD15+V45diKp3f9Aaotj0b0
 7ufx9nDnAG7Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Fykbzw/m
Subject: [Buildroot] [PATCH 0/7] Disable packages with CONFIG_WIRELESS on
 s390x
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Kris Bahnsen <kris@embeddedTS.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Linux s390x doesn't support CONFIG_WIRELESS so this patchset disable
all packages with Linux CONFIG_WIRELESS for s390x architecture.

Giulio Benetti (7):
  package/rtl8189es: disable package for s390x architecture
  package/rtl8189fs: disable package for s390x architecture
  package/rtl8723bu: disable package for s390x architecture
  package/rtl8723ds: disable package for s390x architecture
  package/rtl8812au-aircrack-ng: disable package for s390x architecture
  package/rtl8821au: disable package for s390x architecture
  package/wilc-driver: disable package for s390x architecture

 package/rtl8189es/Config.in             | 2 ++
 package/rtl8189fs/Config.in             | 2 ++
 package/rtl8723bu/Config.in             | 2 ++
 package/rtl8723ds/Config.in             | 2 ++
 package/rtl8812au-aircrack-ng/Config.in | 2 ++
 package/rtl8821au/Config.in             | 2 ++
 package/wilc-driver/Config.in           | 2 ++
 7 files changed, 14 insertions(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
