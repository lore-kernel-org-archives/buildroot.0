Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67F1C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:52:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B18614C8
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 22:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 64B18614C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2368340327;
	Mon,  8 Nov 2021 22:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2z_9_dJShFu; Mon,  8 Nov 2021 22:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4E1FB402ED;
	Mon,  8 Nov 2021 22:52:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7AF1BF865
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A3A240404
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 22:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KfeNPbGf-oVH for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 22:52:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0012C40400
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 22:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636411949;
 bh=5zRYULYZbk6jqi5y8sbAVqdgaepdo2MOiFSOBz8Jjzg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=MPTGv2sb1xcHEAPY3rnI5KRtedKU2H0UOWxqmHfAh+wuWreNULiMDR4QWzGdI8xd3
 Ik4SrkyNTDEsKfvSSeihXlaEXgsNhsbL8eP0Y89pUbLV6tiqzrZPghpga6KwbDb+LH
 LuBXhm3R/b211zAqbBLG36slwh9OcftLXFOrBkCI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.202]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MfpOT-1mCoh20xdx-00gIi2 for <buildroot@buildroot.org>; Mon, 08 Nov 2021
 23:52:29 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 23:52:28 +0100
Message-Id: <20211108225228.2982-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:Lm/8Nqykw4k9hWjrzO+e/oqVjDXyCLttcREkqpgG9ijfNzxb1R/
 Y8xwAA6GZghLdZ0ZuPrPpDDd2TlcRAMug7LhCA+nyvxq4sIUNDYuWIRZsda9zEh1QypNkJP
 mYHQnPqt3Ph/U4boQSR0uN+L73DDyEdcYZGGjOykr24gPbplGNRmeZnBiV7hpckBIADB+7Y
 wlladLYatg+doqXwCGB2A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gnY3x26bLcY=:9XguqDFrmxAdckHMV4Cy+C
 Dxt5ucfyXZfKvshgYHWl2h6PamijzK6xJWcF697Iqj+4DJ7w3VnUmuKry+NpJGyRIwDvKbJh7
 p7FOpKFNL1TD/6tnqoXH7BGSOyO45VgStR+DDpwAsAMfJU/xtU3vhOEdG9pWb3WADJkaJJvz5
 hcZ84H/z6MGv+3xU9HClomk1L+yUpeOYbl1PV0Bf8d9dRDpd5gX8roJyCZTeADTaPOAii753u
 0vbJHaYNMDAItM944M0nH1T3XLMZbZkW+DvGH0RdGi2/W0OIrpEyhtaODkl1mTbMK5yieZuTJ
 MYRGrHj9cWw12xLSrLGReesNEBQekXgc/2IhOCzOOLo/8rVysrCwM0zwU8W5ZUPjw6nXhPViM
 UPm9e93Dvhcf+BLXl2oF4OA01bL4Pz3JKpCpa8ZoSlVM9PBTeh6DWVZiuhDeUILbq10TPd/8R
 rykh5iORaTqVZEvuF9aYluB2+yw2HJNiKmNi1duJ3N0kPZqhCGzSaL2oJEkq6O6+DX4B5xcXu
 62iE85AvbPhZZWDKj1LQhQLOacsdRtnpbzzSpFHxFKVgLfmtIrZdUcQRA9urZ7nlmmtuffjNn
 cYIFCgBV6DU5eQJuD9X4w/kDTN2baUNbECYHfWZeWskxa4EN0ucWmGqUMBiFIe51VIrynGtC8
 kKFFcGV/YwzCCT7sXTRCfTGOFDGyU60adp4WJf86SScWQZbzz1g0EU1HkC5LvHkb9HJ6fk6z4
 1MdMH+m1KOoer83hKH3lgc4YXvet1QdkcwK3TKXWqmuxLXO/lBL4IKkWsDUuDImM/gKvE1qyn
 83l7m0TEFf4CmCZxWRL93bZJib65+tPuPgRDaMvZ/ru4R/XfGNymJ9j22VTTbhvtSF1Cfjv/c
 xYQ9jUBDtjab7xkG85OLTMPhLqQIgpVunNR+bUUlKXwtRh0oknTgvlp4tCxIHuG2Jm5VLRkUD
 5uH24zdkBbupOS0nIaTrzsHRvyQHB3W/f9W5v7LDgHryVrWsjL6lAFZiiZ0vcf5sFPOxZrTWd
 NrG3DRZoulr9yNfuvcm2qVy0t/ofT53+QO8mFsUO8tTXJS9YwKoFkKSso8rz8qTIulZlsT0k5
 x5WBa4I3EoSIh8=
Subject: [Buildroot] [PATCH v1] package/hwdata: bump version to 0.353
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

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/hwdata/hwdata.hash | 2 +-
 package/hwdata/hwdata.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
index be8576d8d2..8479e94339 100644
--- a/package/hwdata/hwdata.hash
+++ b/package/hwdata/hwdata.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  fafcc97421ba766e08a2714ccc3eebb0daabc99e67d53c2d682721dd01ccf7a7  hwdata-0.345.tar.gz
+sha256  14d120ae58f71da18d7731f44e65a818e4209d621b41fba6f0cd03278a002c1d  hwdata-0.353.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
index 0485603f16..8341757a11 100644
--- a/package/hwdata/hwdata.mk
+++ b/package/hwdata/hwdata.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HWDATA_VERSION = 0.345
+HWDATA_VERSION = 0.353
 HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
 HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
 HWDATA_LICENSE_FILES = COPYING LICENSE
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
