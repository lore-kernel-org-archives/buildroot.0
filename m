Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4489BC19F32
	for <buildroot@archiver.kernel.org>; Fri,  7 Mar 2025 18:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E697C40BDD;
	Fri,  7 Mar 2025 18:55:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcEMM6u2emFc; Fri,  7 Mar 2025 18:55:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1C9140C01
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1C9140C01;
	Fri,  7 Mar 2025 18:55:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 751141C9
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C6E140C01
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:55:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoFDB7z7X2dM for <buildroot@buildroot.org>;
 Fri,  7 Mar 2025 18:55:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3A45540BDD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A45540BDD
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A45540BDD
 for <buildroot@buildroot.org>; Fri,  7 Mar 2025 18:55:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 38237B00563;
 Fri,  7 Mar 2025 19:55:10 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 07 Mar 2025 19:55:10 +0100
MIME-Version: 1.0
Date: Fri, 07 Mar 2025 19:55:10 +0100
From: Julien Olivain <ju.o@free.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org, Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 Christian Stewart <christian@aperture.us>
In-Reply-To: <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
References: <cover.1740841539.git.yann.morin.1998@free.fr>
 <dee1cb43f9e636b7ccdc7d4602ae0ab438952c3a.1740841539.git.yann.morin.1998@free.fr>
User-Agent: Webmail Free/1.6.10
Message-ID: <4f56e492d92a06450d65a951c2d92781@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741373713;
 bh=DG4+MmSx23WjR62gzuueRTkH2uQGlaRP79MKL0E9o9M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=NreKrzZQERk8xegnF1UmYd2pgr/ZlWSBKRtetp67oYv0JEmVf3Mrw4bHpLvCIOhbG
 j93XHGUTEymfaR0UFiyj4cbqv95WRuDpUIwjOwKgbZndqAO2aXpy+ymziDTZ9E2F50
 l7dpIb6d2cPTPLxczrkg5bfoXbY80NNdTVUA2vI/Cg2w15Ol8WqhjLPayV4GyWadah
 dhhMV1FBx51AP63jvGyHlQcaiy5QjAK7pNmXU03p/LX5nH66LVWStBT+2/k0n4njrR
 u4MZkP3Yw+qTssZjTyqtep9b4ORvBL8aMv/TkIQ8pc5iJrNIsc6AVzyeWS58toqdWw
 LUjUDdGvQhS1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NreKrzZQ
Subject: Re: [Buildroot] [PATCH 9/9 v3] package/podman: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann, all,

On 01/03/2025 16:05, Yann E. MORIN wrote:
> Podman is a container manager not unlike Docker, but is daemon-less.

[...]

> diff --git a/support/testing/tests/package/test_podman.py 
> b/support/testing/tests/package/test_podman.py
> new file mode 100644
> index 0000000000..9e5be98b00
> --- /dev/null
> +++ b/support/testing/tests/package/test_podman.py
> @@ -0,0 +1,147 @@
> +import infra.basetest
> +import json
> +import os
> +
> +
> +class TestPodman(infra.basetest.BRTest):
> +    config = \
> +        """
> +        BR2_arm=y
> +        BR2_cortex_a9=y
> +        BR2_ARM_ENABLE_VFP=y
> +        BR2_TOOLCHAIN_EXTERNAL=y
> +        BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> +        BR2_PER_PACKAGE_DIRECTORIES=y
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_LINUX_KERNEL=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> +        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.202"
> +        BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
> +        BR2_LINUX_KERNEL_DTS_SUPPORT=y
> +        BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
> +        BR2_PACKAGE_PODMAN=y
> +        BR2_PACKAGE_UTIL_LINUX=y
> +        BR2_PACKAGE_UTIL_LINUX_MOUNT=y
> +        BR2_PACKAGE_HOST_GO_BIN=y
> +        BR2_TARGET_ROOTFS_EXT2=y
> +        BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        kernel_file = os.path.join(self.builddir, 'images', 'zImage')
> +        dtb_file = os.path.join(self.builddir, 'images', 
> 'vexpress-v2p-ca9.dtb')
> +        ext2_file = os.path.join(self.builddir, 'images', 
> 'rootfs.ext2')
> +        self.emulator.boot(
> +            arch='armv5',
> +            kernel=kernel_file,
> +            kernel_cmdline=[
> +                'root=/dev/mmcblk0',
> +                'rootwait',
> +                'console=ttyAMA0',
> +            ],
> +            options=[
> +                '-M', 'vexpress-a9',
> +                '-dtb', dtb_file,
> +                '-drive', f'file={ext2_file},if=sd,format=raw',
> +            ]
> +        )
> +        self.emulator.login()
> +
> +        # Do some preparation for rootless use
> +        self.assertRunOk("mount --make-shared /")
> +        self.assertRunOk("chmod 666 /dev/net/tun")
> +        self.assertRunOk("useradd -d /home/foo -m -s /bin/sh -u 1000 
> foo")

It would be nice to keep tests idempotent. This can be useful
while debugging tests, and avoid rebuilding everything at each
attempt. It is even more useful in tests with a long build time
like this one.

In the current state, running the test once with the command:

     utils/docker-run support/testing/run-tests \
         -k -d dl -o output_folder \
         tests.package.test_podman

succeeds. But running it a second time, it fails with error:

     useradd: user 'foo' already exists

This because this tests emulates a persistent storage.

If possible, could you improve the test to make sure it can run
at least two time in a row with the run-tests "-k" option, please?

For example, with a construct like:

id -u foo || useradd ... foo

There is possibly few other places that might need cleanup too.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
