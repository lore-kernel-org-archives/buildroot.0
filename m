Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57918C4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 09:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC34A41175;
	Mon,  6 Nov 2023 09:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC34A41175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ny1IwTTxyNqK; Mon,  6 Nov 2023 09:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0E2041171;
	Mon,  6 Nov 2023 09:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0E2041171
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 085111BF488
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC75341171
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 09:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC75341171
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MLydT8d2prrA for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 09:57:35 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 08EFD4014E
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 09:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08EFD4014E
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D1FBEB80EC4;
 Mon,  6 Nov 2023 09:57:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1E1DC433C8;
 Mon,  6 Nov 2023 09:57:30 +0000 (UTC)
Message-ID: <a9b8d38c-c21b-4be4-ab31-7aa27ab897c8@kernel.org>
Date: Mon, 6 Nov 2023 18:57:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231030002748.280144-1-dlemoal@kernel.org>
 <5761b87d-4843-4669-bc65-f6e1351e12b7@kernel.org>
 <20231106084314.2458b0c3@windsurf>
From: Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <20231106084314.2458b0c3@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1699264651;
 bh=LOw4XS2wTRGI0EZPK3XjRJ/RQ3GOfV2ThNt45Jfsvao=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CoMVm3S29TnsS09dKxWci86nqKoEBhTSw7Xj9UzeOsSvESgckEOCjlITX9q4Amlzj
 tbzIF0mbn78JgoyXcsl6R4kjelSKWkfj3tUfGMRLfnS4IvmcuNdGF6Hib7XMr2xphw
 49tIOqZkP8LsRzjBhiz6Qt+qQo4oVUIyWE3LzLXl9sWPMW13Dob9YzIJ6QsKQp0kT7
 31PJdFNzuRJGazAdAr/disXpdM6aGnY0a2jyz15uk03FkQpcLnZSQGRIbGjCO0UnQm
 CA0tYcA3uJEEryyT0DCJMWXoSJPFfHkDFX/dh0v37rSzNhot/+nDjbFLcOtcEaRrb3
 SQGiar6AwdZag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=CoMVm3S2
Subject: Re: [Buildroot] [PATCH] package/gcc: Fix gcc finale library
 installation
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 11/6/23 16:43, Thomas Petazzoni wrote:
> On Mon, 6 Nov 2023 11:17:41 +0900
> Damien Le Moal <dlemoal@kernel.org> wrote:
> 
>> I received a build failure report (again) for the RISC-V Canaan & Sipeed boards
>> configs. This patch fixes these build failures.
> 
> I need to dig deeper into this. We looked into this issue with Romain,
> and I believe our conclusion is that it was unfortunately more complex
> than this, because in fact BR2_TOOLCHAIN_HAS_LIBATOMIC is not a fully
> accurate representation of whether gcc has libatomic or not.

Understood. Thanks.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
