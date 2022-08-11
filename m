Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB811C19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 09:40:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C27440239;
	Thu, 11 Aug 2022 09:40:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C27440239
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id flD-D2Q8acKi; Thu, 11 Aug 2022 09:40:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F4AB40201;
	Thu, 11 Aug 2022 09:40:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F4AB40201
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EEEC51BF414
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5D5F41820
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 09:40:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5D5F41820
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gqxCqiT4TSYO for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 09:40:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC0FA4181D
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EC0FA4181D
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 09:40:54 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,228,1654531200"; d="scan'208";a="320529066"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2022 17:40:54 +0800
IronPort-SDR: FDlXGeT1V4VK0D27DtE+Oc7HhMZ8D9EugRu/7cXwt12OQFZsK4uihi2Bk039Lwek0+1gkvySQL
 OC4pNz5gZPEED9xcruc5jpSFCf/P6EQ+5yk0z7OTZMOr3S+4XnzSPeRsWQBrlaYNqwwQbzfTsj
 dmX06wMo3NjLsy7lm5I1DR2Zbo5tEP97Jvqj0JdKygBx62pWWv0/9g2zzdhqxS9cCK1zZkcUn9
 lAFWiOXPkSEGGb3I3ii8WCIs5+eIJ4p4boWjQy6SksPrnurfPXCQHGyHAZJ6UIw2bmN1aRPUSw
 mkdharmMyzHSLaq6k2u/JkN8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Aug 2022 01:56:28 -0700
IronPort-SDR: p+tmHjqfE4bPbsqpP7KBa+kPk1PWhtw5J9NQIlJ9UMetC6rN6/d/jWmqp+gAKSLEhsa8uB9o8J
 KXyKDndhPx71+yK6wEOLod1RQvkWJUTxZnZHa6jZ9YBO5lF4vwkNcqbrDsDgs4bClHFkKbLD6f
 3h3x48R7y8J8LlOtvElbTCDnvyZ3/RBthYcrSQq0sAd/eBgkQ9E6EXc341il7lQeFihmiek21k
 2NOfLqBQiu+VuAXCE3KfaeuO9QAUMksrP98LT9e91oh02PwoOJifBopB0juaJ6/zSYdUWIS/KZ
 rZo=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.89])
 by uls-op-cesaip02.wdc.com with ESMTP; 11 Aug 2022 02:40:51 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Aug 2022 11:40:47 +0200
Message-Id: <20220811094049.798010-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660210854; x=1691746854;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=G7FWB2PbIx1lmKMycp0UioYRWbkOCsKyTUcCBf+BQ40=;
 b=SKONeIH6RrI5DT/WWaY+sg9yOYsStpMkmsBJxCBfHUwydZMoLrSNXqLa
 EXIrq2x1UQ4uzgljsqFlhrDpvYutQHDcHE0JdPQj4+8YWaJUk2+f6n0Mz
 B99ZcMVARHLjfXWdXhfcF90cO3K6YCnEUtjSq+dhZ87lLHwSvD/FDlbRS
 m2Ei3Mf1eY/g06JwfiJl5Ki2ce5WaB7ZB/60A7fy33yPq+voOSSDGnC4q
 EAu7BCtV1xy413cxj4X6HP6JEQYr7MVfI/fVnLENwU96ZsYE90Gd7cHB4
 JjGkHEcZXwkH580AXjvuJGxbWbdPEfoxUEt4inoimxapaZbs61VtBkSY5
 A==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=SKONeIH6
Subject: [Buildroot] [PATCH v2 0/2] fix elf2flt on m68k, xtensa, riscv
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, damien.lemoal@opensource.wdc.com,
 alistair@alistair23.me, geert@linux-m68k.org, buildroot@buildroot.org,
 romain.naour@smile.fr, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello buildroot folks,

This series fixes a fatal error at link time on m68k, xtensa,
and riscv64, caused by a bad upstream elf2flt commit.

With this series, m68k and riscv64 boots to login prompt.

xtensa crashes when loading init, the same behavior as when
reverting the bad upstream elf2flt commit completely.

Changes since v2:
-Added xtensa to the list of archs that require different
 handling from ARM.


Kind regards,
Niklas

Niklas Cassel (2):
  package/elf2flt: remove broken patch
  package/elf2flt: fix fatal error regression on m68k, xtensa, riscv64

 ...3-elf2flt-add-riscv-64-bits-support.patch} |  0
 ...f2flt-fix-.eh_frame-section-handling.patch | 73 ------------------
 ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
 ...l-error-regression-on-m68k-xtensa-ri.patch | 73 ++++++++++++++++++
 4 files changed, 149 insertions(+), 73 deletions(-)
 rename package/elf2flt/{0004-elf2flt-add-riscv-64-bits-support.patch => 0003-elf2flt-add-riscv-64-bits-support.patch} (100%)
 delete mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
 create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
