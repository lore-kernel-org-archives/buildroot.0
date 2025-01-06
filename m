Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70F5CE77198
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 19:34:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F35A64035A;
	Mon,  6 Jan 2025 19:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JgaZJi2toXk; Mon,  6 Jan 2025 19:34:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0CBE40339
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0CBE40339;
	Mon,  6 Jan 2025 19:34:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BCA5F1E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 19:34:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34C3980C52
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 19:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T5b37Eed7zwj for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 19:34:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=173.249.15.149;
 helo=mail.netcube.li; envelope-from=lukas.schmid@netcube.li;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F26A080C34
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F26A080C34
Received: from mail.netcube.li (mail.netcube.li [173.249.15.149])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F26A080C34
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 19:34:40 +0000 (UTC)
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at
 [212.241.70.231]) by mail.netcube.li with ESMTPA
 ; Mon, 6 Jan 2025 20:34:38 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: buildroot@buildroot.org
Cc: Lukas Schmid <lukas.schmid@netcube.li>
Date: Mon,  6 Jan 2025 19:31:17 +0000
Message-Id: <20250106193118.4131-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
 c=relaxed/relaxed; q=dns/txt;
 h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding; 
 bh=Ssbrpm25GHqbJGbtJPPfisi33ivQj4YD0TUzNAQNla8=;
 b=UvIDdlgHbGuJULg/Fm/sjBDJiZ/l1AXihn+V8lCtoIg3CTnEq5QVGVzAX0ESnj2P5+av7KgqdTSXh+IbJLZvAMItnNQFFw3fUtGjFPdHsZ3Xbco7Ps68/cmfziIZujyMKa6EvlAjh+5BWnhDPB+0hazL2a7P8jW4BRW31iX65rg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=netcube.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=netcube.li header.i=@netcube.li header.a=rsa-sha256
 header.s=s1 header.b=UvIDdlgH
Subject: [Buildroot] [PATCH v2 0/1] Add support for NetCube Systems Kumquat
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

Changes in v2:
  Rename some files to match those of other boards
  Add a post-build script to generate a partition uuid
    for the rootfs partition and add it to the extlinux.conf
  Switch to linux 6.8.7 which has been tested thoroughly on
    the board
  Fix typo in DEVELOPERS file

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
Lukas Schmid (1):
  configs/netcube_kumquat_defconfig: new defconfig

 DEVELOPERS                                    |    4 +
 board/netcube/kumquat/extlinux.conf           |    4 +
 board/netcube/kumquat/genimage.cfg            |   40 +
 .../linux-dts/sun8i-v3s-netcube-kumquat.dts   |  279 ++++
 board/netcube/kumquat/linux.config            |  155 ++
 ...init-Try-to-load-macaddr-from-eeprom.patch |  114 ++
 board/netcube/kumquat/post-build.sh           |    7 +
 board/netcube/kumquat/readme.txt              |   71 +
 .../kumquat/rootfs_overlay/etc/fw_env.config  |   11 +
 .../rootfs_overlay/etc/init.d/S35esphosted    |   71 +
 .../uboot-dts/sun8i-v3s-netcube-kumquat.dts   |  279 ++++
 board/netcube/kumquat/uboot.config            |   56 +
 configs/netcube_kumquat_defconfig             |   41 +
 ...cube_kumquat_defconfig-new-defconfig.patch | 1268 +++++++++++++++++
 14 files changed, 2400 insertions(+)
 create mode 100644 board/netcube/kumquat/extlinux.conf
 create mode 100644 board/netcube/kumquat/genimage.cfg
 create mode 100644 board/netcube/kumquat/linux-dts/sun8i-v3s-netcube-kumquat.dts
 create mode 100644 board/netcube/kumquat/linux.config
 create mode 100644 board/netcube/kumquat/patches/uboot/2024.10/0001-eth-sunxi-board-init-Try-to-load-macaddr-from-eeprom.patch
 create mode 100755 board/netcube/kumquat/post-build.sh
 create mode 100644 board/netcube/kumquat/readme.txt
 create mode 100644 board/netcube/kumquat/rootfs_overlay/etc/fw_env.config
 create mode 100755 board/netcube/kumquat/rootfs_overlay/etc/init.d/S35esphosted
 create mode 100644 board/netcube/kumquat/uboot-dts/sun8i-v3s-netcube-kumquat.dts
 create mode 100644 board/netcube/kumquat/uboot.config
 create mode 100644 configs/netcube_kumquat_defconfig
 create mode 100644 outgoing/0001-configs-netcube_kumquat_defconfig-new-defconfig.patch

-- 
2.47.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
