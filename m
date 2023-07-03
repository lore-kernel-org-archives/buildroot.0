Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC5BC001B0
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ED9381DD8;
	Mon,  3 Jul 2023 19:16:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4ED9381DD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GsZLB0tjYLBi; Mon,  3 Jul 2023 19:16:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC3F81DAB;
	Mon,  3 Jul 2023 19:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EC3F81DAB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 306751BF34B
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1715E40C94
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1715E40C94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HnEb3gwimGD8 for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:16:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BE6B40C2A
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BE6B40C2A
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:16:21 +0000 (UTC)
Received: from localhost.localdomain ([146.241.103.145])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GP22qXlySDAUdGP23qwwhR; Mon, 03 Jul 2023 21:16:19 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jul 2023 21:16:17 +0200
Message-Id: <20230703191617.1338283-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
References: <20230703191617.1338283-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMIfhXRklOmqRoVjl386vc2kHf5TmsYTDvZh4+7MIritEe2E6+cTAClNcINdsUbzJX3iuTtp+wfKQ7XaOeI7giVOJoBTWhuMcL3gqc+u4kRH1tpKbaXg
 PuEgYmcy79AAt6fxixCtq7vEPgPUjCyEIA+jNr/vA4ajdMn5O6sR+pzlhcDhRGoabESMVOCiIsLc7Ty75YKyWcPlRbnlKYAc9Y1tNufpipcCQ89kKGCTgauS
 z6jMmit4DOUJuDJ+h03IODvpZsFGS6CVPb36V4wMnGuTI3IzELvkFIpAAky3UKwtm/bmd54pGLkLMs0Krz3ziLN4oZLUTeqEDGL8FEHq5pnD08NPB9lxhHEz
 Jk7dUykK
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1688411779; bh=egWIXdGXKNI18DwrjMKOQMK4nQBw1O/eAbYAsX/yX3M=;
 h=From:To:Subject:Date:MIME-Version;
 b=M8anpoaxQ2cX5ZM2l+BtQcWF9YB6RThAszAmZfuNm15l/FW0kMG8/+5iYZQDMEQQ0
 xN+uGeYNPNoRPFVOTrZEcDaRaeqGI9dYz9gVS7GLZc/74fy09mLUJqehqrwWXXzRCu
 WwKT29OmIDQyrD9ypsPqsOdG9okVQqUXqxcZkkM/vpH4qYf/Eci1bDCx5w0TXVkJop
 Ov0mcKsMFqM4BbnLzlAbdr4YOIweuosNiefCXDTar3cm+IixHqldKN8/V+R2bFdwM1
 fWHr1H6VTv4d34aKNTNoA7LvcqHqw93rDrk0WbiUIyvhfJoWo1AMWf4hGjG8I8W1l/
 5NRnOgmDcoSsw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=M8anpoax
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2023-06-24
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.4.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index 45460d6d12..84c724c044 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32589c3ac3ffde6de3ecaca83570ab07a2b92a66e3265294b0469375b007a480  rtl8821cu-80781de376007ecd778dfb2bef05533e3a6cc7c6.tar.gz
+sha256  78a8e730ad1ec05b10c4ee97b5cf0a8f5bcd1654b2c5332533c5cf4bd77078d8  rtl8821cu-dc9ee6c6a8b47d0e365fcf1977439c7243da71d5.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 953da1f01c..2a42a0f28e 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 80781de376007ecd778dfb2bef05533e3a6cc7c6
+RTL8821CU_VERSION = dc9ee6c6a8b47d0e365fcf1977439c7243da71d5
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
