Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ADBEC0218C
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 20:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 159214245A;
	Thu, 23 Jan 2025 20:25:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M5qTjHXieF9D; Thu, 23 Jan 2025 20:25:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E11614253B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E11614253B;
	Thu, 23 Jan 2025 20:25:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C19394A
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2BD644253F
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:25:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjjPpwDROb_y for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 20:25:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C17D34253B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C17D34253B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C17D34253B
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 20:25:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id E3C4260128;
 Thu, 23 Jan 2025 21:25:36 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45660])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 23 Jan 2025 21:25:36 +0100
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 21:25:36 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119233256.1356954-1-james.hilliard1@gmail.com>
References: <20250119233256.1356954-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <fb0964cf290cbb2a6ab7863a756d8664@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737663938;
 bh=c2NXVDtik3m94Uy/gb01XQds6ibeQPDANdEfiKNVKsQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=M9osPCNnieJ/pMM02tnE2vaGNMJpBhQGM7oNxLdAac7gsNvLLGfikb+TO05tTVhxy
 V/CL2pMvoddsK0V0jphGMxDNyxXpAQ4PQo4D2t82jUpu/o8mqG+qV/L420EWoXd1A2
 XTplPOwMqcRAxhmBi0hfbSYi7bGOdDveagCao9BHArG6N+y2arZ1v40zLnDGa4pibD
 oDKP582/EaE+G/O3AcEKteY5JEX1wbE5r4l2VxotmAdQW4pGBNxM2tqvjm2CDxBmoa
 hdtzOy3DaPVc85WZmo+OqlSmwRtokOV3GQ/3GC2yDFKIMJyfItTL4ruM0RJ6LSFXEG
 Ht7oO1MXS4Xww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M9osPCNn
Subject: Re: [Buildroot] [PATCH v3 1/1] package/fwupd: bump to version 2.0.3
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

Hi James,

Thanks for the update.

There is still build failures for Kernel headers < v4.5. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1638625539

On 20/01/2025 00:32, James Hilliard wrote:
[...]
> diff --git a/package/fwupd/fwupd.mk b/package/fwupd/fwupd.mk
> index 9283eb43aa..5dc11dd953 100644
> --- a/package/fwupd/fwupd.mk
> +++ b/package/fwupd/fwupd.mk
[...]
> @@ -24,34 +25,47 @@ FWUPD_CONF_OPTS = \
[...]
> +	-Dplugin_nvme=enabled \

You may have missed my last comment, in the v2 review:
https://patchwork.ozlabs.org/project/buildroot/patch/20250118012320.2252811-1-james.hilliard1@gmail.com/#3446941
I'm putting it here again:

The build failure seems to be related to "-Dplugin_nvme=enabled" which
needs "linux/nvme_ioctl.h". This header is available in Kernel >= 4.5.
For the details, you can have a look at:
https://patchwork.ozlabs.org/project/buildroot/patch/20250111113625.326385-1-ju.o@free.fr/

So this option might need the same logic as you did for -Dplugin_gpio.

Could you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
