Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853C5C02181
	for <buildroot@archiver.kernel.org>; Mon, 20 Jan 2025 14:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F24E80C94;
	Mon, 20 Jan 2025 14:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4MzqKzUUWYjZ; Mon, 20 Jan 2025 14:14:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86CF8831E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86CF8831E7;
	Mon, 20 Jan 2025 14:14:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58804959
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 14:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45DDE83748
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 14:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYsIH1-ph3r4 for <buildroot@buildroot.org>;
 Mon, 20 Jan 2025 14:14:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3995C831E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3995C831E7
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3995C831E7
 for <buildroot@buildroot.org>; Mon, 20 Jan 2025 14:14:27 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E15072C80189;
 Mon, 20 Jan 2025 15:14:24 +0100 (CET)
Message-ID: <ab07fbc5-a0ed-4583-8d85-1c3269f0faa6@bubu1.eu>
Date: Mon, 20 Jan 2025 15:14:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Akhilesh Nema <nemaakhilesh@gmail.com>, buildroot@buildroot.org
References: <20250120052252.3702-1-nemaakhilesh@gmail.com>
Content-Language: en-US
In-Reply-To: <20250120052252.3702-1-nemaakhilesh@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1737382465; bh=/aw8tkUvAVI7UHyX09gBcUG+58HDq9syFSZod3dxOqI=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=R9j6+IspOp7XKMSjrOyrTf0MvSJAEQfwy4uZnt9HZfo59w4w3cXN1YaxTAsM18/J9
 XgxAcRBQVTaqXhEy6SljXqRfnTRtnHH73GqB2SzMQUOoXQJ+IC6iotEKeWrOYaneEG
 jT5cxWAYdQTqS2d0zDZHydLdGhd6G5fMNxFlnRj3J8zE80ZDjUppdjCoeASOV+vwiY
 dUrTQUneS0gohO5WVEvaCoPthZoK3cagXNn2Sm1Vrx1KT+bknbjeo/FDQpOTpyVvjW
 qWCVsk2DFlcedMdFz5WfbXvw00tkix2+airTd5Bz8gC+Uc9YhxKTCkJcDVj95bodg9
 CpNQ8qCI7HB6A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=R9j6+Isp
Subject: Re: [Buildroot] [PATCH 1/1] package/ncurses: bump to version
 6.5.20250118
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Akhilesh,

On 20.01.25 06:22, Akhilesh Nema wrote:
> Release notes:
> https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250118/NEWS
> 
> - Drop upstream patch - 0001-fix-XOPEN_SOURCE-detection.patch
> - COPYING hash changed due to Copyright year update.
> 
 > Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
 > ---


This fails to build for me with the following error:

 >>> ncurses 6.5-20250118 Fixing package configuration files
/usr/bin/sed: can't read 
/home/marcus/repos/buildroot-upstream/output/host/aarch64-buildroot-linux-gnu/sysroot/usr/bin/ncurses6-config: 
No such file or directory
make[1]: *** [package/pkg-generic.mk:330: 
/home/marcus/repos/buildroot-upstream/output/build/ncurses-6.5-20250118/.stamp_staging_installed] 
Error 2
make: *** [Makefile:83: _all] Error 2

This is using the following defconfig:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_GLOBAL_PATCH_DIR="board/qemu/patches"
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
BR2_SYSTEM_DHCP="eth0"
BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
BR2_LINUX_KERNEL=y
BR2_LINUX_KERNEL_CUSTOM_VERSION=y
BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
BR2_PACKAGE_HTOP=y
BR2_TARGET_ROOTFS_EXT2=y
BR2_TARGET_ROOTFS_EXT2_4=y
# BR2_TARGET_ROOTFS_TAR is not set
BR2_PACKAGE_HOST_QEMU=y
BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
