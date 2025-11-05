Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2893ACCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 12:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1AC641197;
	Wed,  5 Nov 2025 12:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-LrsegJvog2; Wed,  5 Nov 2025 12:31:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD17A411A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD17A411A3;
	Wed,  5 Nov 2025 12:31:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 16FAA222
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0818A40F15
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:30:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j7OUXfhhzKvO for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 12:30:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=60.248.80.70;
 helo=atcsqr.andestech.com; envelope-from=ycliang@andestech.com;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BD00340378
Received: from Atcsqr.andestech.com (60-248-80-70.hinet-ip.hinet.net
 [60.248.80.70])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD00340378
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 12:30:47 +0000 (UTC)
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
 by Atcsqr.andestech.com with ESMTPS id 5A5CUdkX007787
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
 Wed, 5 Nov 2025 20:30:39 +0800 (+08)
 (envelope-from ycliang@andestech.com)
Received: from swlinux02 (10.0.15.183) by ATCPCS34.andestech.com (10.0.1.134)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Nov
 2025 20:30:39 +0800
Date: Wed, 5 Nov 2025 20:30:39 +0800
To: Vincent Jardin <vjardin@free.fr>
CC: <buildroot@buildroot.org>, <tim609@andestech.com>
Message-ID: <aQtDb8Lx1YElafac@swlinux02>
References: <20251027033242.1797230-1-ycliang@andestech.com>
 <20251027033242.1797230-5-ycliang@andestech.com>
 <aos7pxpaqtz3y7x2rxow2wxhzwiu45it4yiaw74zxv7736mi4o@wk6tdskjpemm>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aos7pxpaqtz3y7x2rxow2wxhzwiu45it4yiaw74zxv7736mi4o@wk6tdskjpemm>
User-Agent: Mutt/2.2.10 (e0e92c31) (2023-03-25)
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5A5CUdkX007787
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org; dmarc=permerror
 header.from=andestech.com
Subject: Re: [Buildroot] [PATCH 4/4] configs/andes_ae350_45_defconfig: bump
 to uboot v2024.10
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
From: Leo Liang via buildroot <buildroot@buildroot.org>
Reply-To: Leo Liang <ycliang@andestech.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vincent,

On Wed, Oct 29, 2025 at 03:00:53PM +0100, Vincent Jardin wrote:
> [EXTERNAL MAIL]
> 
> Hi Leo,
> 
> On Mon, Oct 27, 2025 at 11:32:42AM +0100, Leo Yu-Chi Liang wrote:
> > This bumps uboot to v2024.10, removes unnecessary patches,
> > and add proper hash file.
> 
> Why 2024.10 but not:
>   config BR2_TARGET_UBOOT_LATEST_VERSION
>       bool "2025.01"
> ?
> 
> It is nice that patches can be removed ;)

Thanks for the review!

We have sent a patch to fix current v2025.10 u-boot as well.
(https://lists.denx.de/pipermail/u-boot/2025-October/601790.html)
We would like to update to current master after this patch is merged.

For now, we will respin a patch to bump u-boot version to v2025.07.

Best regards,
Leo

> 
> Best regards,
>   Vincent
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
