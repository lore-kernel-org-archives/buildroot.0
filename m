Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580AFC6FA9D
	for <buildroot@archiver.kernel.org>; Wed,  1 Mar 2023 16:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1AB81959;
	Wed,  1 Mar 2023 16:05:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD1AB81959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m6tPjPebOajZ; Wed,  1 Mar 2023 16:05:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 223CF81E6F;
	Wed,  1 Mar 2023 16:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 223CF81E6F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 71F361BF599
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BBE461051
 for <buildroot@lists.busybox.net>; Wed,  1 Mar 2023 16:05:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BBE461051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TV_bY_R8ANVQ for <buildroot@lists.busybox.net>;
 Wed,  1 Mar 2023 16:05:22 +0000 (UTC)
X-Greylist: delayed 00:07:06 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1D5060FEA
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A1D5060FEA
 for <buildroot@buildroot.org>; Wed,  1 Mar 2023 16:05:22 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,225,1673884800"; d="scan'208";a="336518253"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Mar 2023 23:58:15 +0800
IronPort-SDR: BL5p2oLkmn43lz0HODEMpNGiTVUnrcOF33HgMx9iyNh4mTC+d4PI70s326fCDHl6flaqOc+wV6
 TJ0q8lrrqnWuz3s3Tf30Q5BpmOSKXIYpEQiCC0XP98ThFMUa4bD/n8bvqoHsKtoXkiFkltzLGX
 3Jt0VO8RgnYHXM3KcHcsWD6z11dZYkcgdARzKbH1nctrlj+ovLpQI0A8nW/j1nwCiE/+nQr+87
 BYJxUUaj5nnhZrQzBQi+wnSw1sPak1+keRFaAC7HnxcFyIraxI5VB2IImILW0p3j9cWJZscKHi
 LTg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Mar 2023 07:09:20 -0800
IronPort-SDR: QBWQtgTQPKcsU5kkrCqkoq4DrZ9RqGPDd3tAtWvNVvmF03QZqkg+mBvoQosLAipsBGafXbA+xK
 pC8sdr3U0vz42blB1MsO1z42cqjn0A5tAXb6qPzdkR73e1jzezdqgXVUBHDq5n6T616wZuBiZf
 qUPkozLUM4IoboydSVh6bLs0QIftlx+bVVvqWkCPS2dERGgp57ezgQiV8Jvd4ITIB8ZYV9vE/F
 sMULO3+ebWgms5eyKnFj5PzSdZshYNFo6o4hXxG2hStIbo9XGmsPM5SyFH5VG6xUtVoPfTziSf
 Luc=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 01 Mar 2023 07:58:14 -0800
To: buildroot@buildroot.org
Date: Wed,  1 Mar 2023 16:58:07 +0100
Message-Id: <20230301155810.3222459-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677686722; x=1709222722;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=k0XUhOtwkK96Nj3UOigVyIAdTE5+olX/ZruEnHJwxjw=;
 b=MM8UVemDLpl3e9f0oJi6YR1E9Jvb374s8Lmx2+z11f6V67ziu9zAU22h
 3H8bEUP85PnC6/A/RlnTwIgfzX9Oqgu1lOhQkNjB/3l6xZ+WnkNjducuO
 91Jp0BoaEas6RcZCYMveN22fdWnv7pjsmvbt3k5muy35aiVikwKv7E2AJ
 chBfIzepUXk0xpBbDMxlqIoRspc0Jc+GORi5mL6xTwqSXZJD/FFxa0+hj
 vd4vL1DA+MfJlrPqkYdo0WRHpOC//Z5szjmwulJnnSMQY0aRNIlfk8uAT
 /TrjUPaP6iPRa5t1FwKJru+OQElOhispgpgL0vsFRMgZemmAjUkzYBxy7
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=MM8UVemD
Subject: [Buildroot] [PATCH 0/3] misc aarch64-sbsa cleanups
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
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Here come some small aarch64-sbsa cleanups.
Please consider for inclusion.


Kind regards,
Niklas


Niklas Cassel (3):
  board/qemu/aarch64-sbsa: use PARTLABEL to specify root
  board/qemu/aarch64-sbsa: use the default console specified by ACPI
  board/qemu/aarch64-sbsa: drop unused kernel config file

 board/qemu/aarch64-sbsa/grub.cfg     |  2 +-
 board/qemu/aarch64-sbsa/linux.config | 68 ----------------------------
 2 files changed, 1 insertion(+), 69 deletions(-)
 delete mode 100644 board/qemu/aarch64-sbsa/linux.config

-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
