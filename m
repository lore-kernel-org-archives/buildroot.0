Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E08FED9EC
	for <buildroot@archiver.kernel.org>; Tue, 17 Mar 2026 16:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2317881FD2;
	Tue, 17 Mar 2026 16:26:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSOfGbg2c03X; Tue, 17 Mar 2026 16:26:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47E3481BBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773764817;
	bh=QPeANFyfPkvHpSsSpRHPo4bqRUK5Prnj7eAcdsRNo8Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KlGvCvMsgaJ2J4Qw+s9VxtUuIyMrWHHphlCI9PXfFl8yLgnYCIjbflmWOQrfZwza9
	 uuczUgd4X4sXybz9tPKv80PzAskqaxhVFEDSA9O7Puj8d6TUHRJdgtZJ9afNJKNqqt
	 FXPkIsKJ5yq8JIcYK/Xt+78HP47ZPmGGFi0DfY+I8kjxg+z6hOtEFSVw9Q64jpgPPD
	 fAvk/waSfSL4Ul8p62k7uTsOqDzAoODkla1jRAdkLlTiD0k/yHZ5S0ozUTjdhyBDR2
	 +i6dQd6FgGgxCs1YXSezQM89Y9a6zoPHOpi2hydkJb6ZVQFhAsvVI3vrV8V2WGA6ta
	 cBzqYlR76PuhA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47E3481BBD;
	Tue, 17 Mar 2026 16:26:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id 2F03BD3
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with UTF8SMTP id 150BC40836
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id y0cAeiFqOPRc for <buildroot@buildroot.org>;
 Tue, 17 Mar 2026 16:26:55 +0000 (UTC)
X-Greylist: delayed 367 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 17 Mar 2026 16:26:53 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E402A4085A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E402A4085A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=162.62.57.49;
 helo=out162-62-57-49.mail.qq.com; envelope-from=wangdong115@foxmail.com;
 receiver=<UNKNOWN> 
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com
 [162.62.57.49])
 by smtp4.osuosl.org (Postfix) with UTF8SMTPS id E402A4085A
 for <buildroot@buildroot.org>; Tue, 17 Mar 2026 16:26:53 +0000 (UTC)
Received: from DW-MiBook.lan ([240e:305:188b:e000:8bad:9e8a:6182:9856])
 by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
 id 4D9122CF; Wed, 18 Mar 2026 00:19:25 +0800
X-QQ-mid: xmsmtpt1773764365torjas8d3
Message-ID: <tencent_1C27644EECA6DB46108381AA97109E001B06@qq.com>
X-QQ-XMAILINFO: MJf32pulH481F7qmJY2Mc2kWomRQbvTOXbjLvb54bw6hRxNzQmiNxQz8VHu43m
 SigshFFJkvxk0KAfBfBLrtQFnz4ln8jG+F1fjFtZXS+t6wk6yMuvbWn/LbCIBI0Hb+U3x7xaFHus
 DwDcMkyzwcw81B9gft3cxnFqsJqB3A9xGFWQaRweNe/mEoky4kCmYaqH3rAkgtVbfBCRw1gU4VbB
 pINE9W00+vSuXndmgOa+OUhjv90ey6qzNViJG1KyXGhkDS2I1/EA0NX3t4xPbgSaZYcePSIR1TtS
 QmgbJenODIjuZOIoKFnylo//SMnECZx6QY7csjpBQTu1+JvlCPjMRp0uly8q3sQUK7uHvs1im8j6
 TVpSDECzRuaGFEMyrnXyK9+oUEQGmJW/uBvST/ApNUg8MMOR313RIdhjENWRVIECqeGPPKiAEWuh
 dc8Or8SJcrA2NXKy3VdV9UAhKIUIzUdw6xz76m+U4zLn1MJv1QKMjuoNQmQ3wUWXWSvf6k1Eong4
 JCX6FPSWc2nIvuUEsa+vG86m3+lBw4xSLQ1lNfeogIEhWESkzgOi5H92bXMGe5rqBFDt9O6QimQn
 6aYpCQUddIUUJWjzmyPJEhy58Coba/lYdzbxUv3Z7MYa+O9edcXY0j8XGOLSwdY/ls1e2qGm/sau
 06/a/c0kXZjDpQXBpYBGXROM58W+tXOoaBVhu3HSQ2w6n59/XZrWTKn/icdHN4TpFy7pd7WzKBAE
 yYomP2KKH0TYOy5awL6GYe7/BkRUEXQK7kClM+6usOiR6Bd+gNmCmC+1vo7QwpzPSNTSU8JEdRSX
 8HZe0ue1g4ZiPFssqp1n0kYWjqxO484FddLKE77IuRKN4n7VCaE6aDvbqzz0GsKeZihnU4IKKizE
 YeqP8lVDTkatuQeh72SszahdoYK6F3ULeA6JVTihR4Q8NumIieJTT2KvR4/McVdYOnVglqA/8NxM
 sOsdpskFgvyAdGw0alsp2fT1ViF0eTh3/0fdjYAvOE8ew0m5Aqi1LPloYqZMDYpnrd2dGNvyzqmm
 e2Z4cOo4ZY42BVHvuP7rDTzY+V5MSF0N4jTvFqPWnYj8oEM3X0QibEgUGGOr9ZNbySc2nNq7oopN
 hxSWBH
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: Dong Wang <wangdong115@foxmail.com>
To: buildroot@buildroot.org
Cc: Dong Wang <wangdong115@foxmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Mar 2026 00:17:57 +0800
X-OQ-MSGID: <20260317161759.36050-1-wangdong115@foxmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=foxmail.com; s=s201512; t=1773764810;
 bh=xt3w0acQ/l4a3a9E8qNWwgCU6g2qNpVeJlaBmjlZUtY=;
 h=From:To:Cc:Subject:Date;
 b=U5Qo19S7XPGxO2eDceY6SHO7mq8sGtd5Yu15CoCo4zFGGjU244rseshPrR1xOu4sd
 f9jzjDrYfoaNnMtpCOwQwObnnWyG5ks2h2zrXyYMqktwI+jkpb4LZSs60d6jYrYsus
 0qKG0WGXMj40vl8yHOZnCl/Bu99p3uRkY0K8ALWU=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=foxmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=foxmail.com header.i=@foxmail.com header.a=rsa-sha256
 header.s=s201512 header.b=U5Qo19S7
Subject: [Buildroot] [PATCH 0/2] configs/friendlyarm_nanopi_{neo,
 r2s}: bump kernel and uboot versions
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

This patch series bumps two FriendlyARM boards (NanoPi Neo and NanoPi R2S)
to more recent stable versions of Linux and U-Boot, switches both to
Bootlin stable glibc external toolchains, and fixes recent CI build failures
caused by deprecated 'pkg_resources' usage in older U-Boot versions.

Both boards have been run-tested on the board.

Dong Wang (2):
  configs/friendlyarm_nanopi_neo: bump to kernel 6.18.18 and U-Boot
    2026.01
  configs/friendlyarm_nanopi_r2s: bump to kernel 6.18.18 and U-Boot
    2026.01

 .../patches/linux-headers/linux-headers.hash         |  1 -
 .../friendlyarm/nanopi-neo/patches/linux/linux.hash  |  4 ++--
 .../friendlyarm/nanopi-neo/patches/uboot/uboot.hash  |  2 +-
 .../friendlyarm/nanopi-r2s/patches/linux/linux.hash  |  2 ++
 board/friendlyarm/nanopi-r2s/patches/uboot.hash      |  2 ++
 configs/friendlyarm_nanopi_neo_defconfig             |  8 +++++---
 configs/friendlyarm_nanopi_r2s_defconfig             | 12 ++++++++----
 7 files changed, 20 insertions(+), 11 deletions(-)
 delete mode 120000 board/friendlyarm/nanopi-neo/patches/linux-headers/linux-headers.hash
 create mode 100644 board/friendlyarm/nanopi-r2s/patches/linux/linux.hash
 create mode 100644 board/friendlyarm/nanopi-r2s/patches/uboot.hash

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
