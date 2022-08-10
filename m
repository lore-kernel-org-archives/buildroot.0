Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57F9C00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 10:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 532EE40BC9;
	Wed, 10 Aug 2022 10:17:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 532EE40BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DfJDHKp5WQk9; Wed, 10 Aug 2022 10:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DFF540BC3;
	Wed, 10 Aug 2022 10:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DFF540BC3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64A1D1BF48C
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CBC360E67
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 10:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CBC360E67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EbzZGF3HmvWI for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 10:17:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0316104A
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE0316104A
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 10:17:15 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.93,227,1654531200"; d="scan'208";a="208330205"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Aug 2022 18:10:06 +0800
IronPort-SDR: HvKI1ngc1DFOSbQQQn7cLS710YAKc7rnGLWRgREm8IbZLNt9Or8zccn12cSovwjNYFTbGw/g0J
 ffOmaSSj1lc9bYSWvAi6lXsD53qdGSooterAlrEWHcCQjDckoSZdVvcHpArNyKliVtksCNe9f1
 TntoHfPCkyKonoD3w1Fz5dFt+99gFwrHXHEi5TaU76nIn4N4QPOTjmcwnGvp9DigUhCEl9lmSK
 xocg1VYBQmRBeAC2N2WFdHDRb92LAYo0tzbnhkKDj0y9qxx0b+ooY0m9Q21c65ysgIZ/CXWrNU
 REfhTtFRbPddP/UKXbz85Wz8
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 10 Aug 2022 02:25:42 -0700
IronPort-SDR: DLkFLbZ6oBuDFcbfSE3ROmfJT2V9av0d44UXcThp2Dmxraiy6V6RafdtIqajiSObULGMGlGBxg
 FXNZx3KL8wCYKK8XZtWHJVoTvfXslPu+hE92ygPWnacqShT2TCROB7sp2W83CoUnvRN5Lb8lc2
 4dyefhSnM3V5qwtYYbtL3PhPpLiCg5JwSVuOlr4HLFyKbzEHagnlolvyqreZlS9PqYSRHCMD07
 uitjfgVIjR7F2kL2O2rrl1tx0cU1Y1lAO//fi0231WneMC0s+onCyqbODwJaazLd6afvCgpNHR
 U50=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.86])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Aug 2022 03:10:05 -0700
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Aug 2022 12:09:57 +0200
Message-Id: <20220810100959.3160670-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1660126635; x=1691662635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AX6eFCcugk6224FX8C2E3GnyRBb9rSc2PjnzrNZDdM0=;
 b=N0gcEcxdhuijrNqg9LkXZ1p9eIHqaGuuw1NnefcTb0Mq5MV2l2s7mUIS
 GXZZSjWMarUNtCBvlyz/X5wlwiOhQh8zy/19YviOi89d7dJE3Y9KPWHlE
 qCv3J6Zd8I1YuDfJcQ1M1l0gOayne8zT5KfZ4JqOaJ+jdk85X5KPuG/d5
 lms8h1ek9XH/VRLm+MbebSVb85R+WP/0iDXYZxc1TJjV9Juay/+s5VVZ4
 PTfQ72mOIQZ6nT0TJmy9vrcH4yV9f3WkVz1BgGiB4Xx2GuOYsKWtq8n1n
 07G3vwJtV9ATsQ+nIejqBQRVGSHcEjDeV3CI1I+lMOXHBr2X6vecY2REs
 w==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=N0gcEcxd
Subject: [Buildroot] [PATCH 0/2] fix elf2flt on m68k
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello buildroot folks,

This series fixes a segfault at link time on m68k.

With this series, we have bootable m68k and riscv64.

(riscv64 was booting with the previous patch, but we
were simply lucky that we didn't observe the same
segfault there as well.)


Kind regards,
Niklas

Niklas Cassel (2):
  package/elf2flt: remove broken patch
  package/elf2flt: add another .eh_frame section handling patch

 ...3-elf2flt-add-riscv-64-bits-support.patch} |  0
 ...f2flt-fix-.eh_frame-section-handling.patch | 73 ------------------
 ...2flt-create-a-common-helper-function.patch | 76 +++++++++++++++++++
 ...l-error-regression-on-m68k-and-riscv.patch | 72 ++++++++++++++++++
 4 files changed, 148 insertions(+), 73 deletions(-)
 rename package/elf2flt/{0004-elf2flt-add-riscv-64-bits-support.patch => 0003-elf2flt-add-riscv-64-bits-support.patch} (100%)
 delete mode 100644 package/elf2flt/0003-elf2flt-fix-.eh_frame-section-handling.patch
 create mode 100644 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
 create mode 100644 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-and-riscv.patch

-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
