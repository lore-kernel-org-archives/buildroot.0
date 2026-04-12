Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F542E937E0
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 11:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C054240536;
	Sun, 12 Apr 2026 11:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw3giuTm3ouO; Sun, 12 Apr 2026 11:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA20B40554
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775994077;
	bh=Y8OymGE4GF8YaasssLRGNxIV53oAasPwAVrCNsSZzSc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mBHT7mT8sakWBTrpd6nxu0stGJ7ZKtel+yVUUmbfUdw31Br2cIf3rOf1ROU/u/N+0
	 Mq8l9xDfs5jhh+xBxH/kkGmUWO8l9+M1l69SLv8Gaul95iiFz7I/gt0vQ0SNXLXd9P
	 To4bjzqhxvdeDE+khtjy2EqFW4p9aZ9sCycD3JgA4n5jmp2pdIFwL2tgo5h8DiJpv6
	 PeptH5ltjiV6/lyoNXkWZRGNBIy9Obg079b7iy4VxgNtHam+ub5dMOj79mbCK00lZI
	 eROmMhfnLCSjK/7H2Z8K328Ge9mrzs9fh2be6zBm/tV9CJ+O+oorHm134nuutkid3t
	 2n4I5li7SjFWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA20B40554;
	Sun, 12 Apr 2026 11:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6AD5194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 11:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9C52B60BFF
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 11:41:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PchL5rB1CKJt for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 11:41:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A401E60BFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A401E60BFB
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A401E60BFB
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 11:41:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 417882003C3;
 Sun, 12 Apr 2026 13:41:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 13:41:09 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 13:41:09 +0200
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: buildroot@buildroot.org, Javad Rahimipetroudi
 <javad.rahimipetroudi@mind.be>, Javad Rahimi <javad321javad@gmail.com>
In-Reply-To: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
References: <20260412081915.1335127-1-javad.rahimipetroudi@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <c30f4b7de05e6a1acbda5ff73fd997aa@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775994072;
 bh=RsSLWPyvqAxyTZFLmGxF2WDUhkQLD4phsSSs+KO1YyM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=QxUVDDPTPy+CCWSX4hrnWXGIbKOwCvgLLBrSji5aZbxPf6Bkfs8u7M/tWlZ5T6J0j
 y2+n+pSdrfbIDJ/URSyZckRn6FGGhjJsoeEkgJyTa9QqPYuujsVJ9ESLfFzr0WJ5G7
 qp+WD0kqfTzTudPoQ1xoIVcXJdHV+rXTl3iI2xhbYYLu7GaG5ifucIafOOrS/0QZyD
 TWMTGwNqX2pIqcUDnK+4JvH9YuUFjIFgbniiIX3htWfzjmvUIaz1GJvsaOGnGFbEu1
 xB8z+QkOepy8kG5m9J9oRP2geIOAiASU5hm0mDlgPxZNh94Tyk80ZQZGfezEmpysMQ
 OVTajhO2hYjTQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QxUVDDPT
Subject: Re: [Buildroot] [PATCH] boot/uboot: bump version to 2026.04
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Javad,

Thanks for the patch. I have few comments.

Since you are updating uboot only of a defconfig, the commit title 
should
rather be:

configs/orangepi_pc2: bump uboot to 2026.04

On 12/04/2026 10:19, Javad Rahimipetroudi via buildroot wrote:
> This patch fix the autobuild error for OrangePi PC2:
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/13858950361
> 
> Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
> ---
>  configs/orangepi_pc2_defconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/configs/orangepi_pc2_defconfig 
> b/configs/orangepi_pc2_defconfig
> index 46d04b34c8..115fcc93fe 100644
> --- a/configs/orangepi_pc2_defconfig
> +++ b/configs/orangepi_pc2_defconfig
> @@ -23,9 +23,6 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.9"
>  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="sun50i_a64"
>  BR2_TARGET_UBOOT=y
> -BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.04"

If you remove those config lines, this defconfig will use the "latest"
default version set in "boot/uboot", which will changed in the future.
In Buildroot, we prefer having defconfigs using a fixed version (to make
sure it is more stable to what defconfigs maintainers are testing). So 
you
should instead only change the custom uboot version:

BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2026.04"

>  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc2"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> --
> 2.53.0

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
