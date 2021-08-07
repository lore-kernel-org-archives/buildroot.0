Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7244C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:21:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1926C610CB
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 10:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1926C610CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=grenoble.cnrs.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5D2040379;
	Sat,  7 Aug 2021 10:21:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KfHDk1iuQxg8; Sat,  7 Aug 2021 10:21:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C457F40481;
	Sat,  7 Aug 2021 10:21:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 081511BF2F6
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC36283376
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 10:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=grenoble.cnrs.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBsqZ-8H3F0O for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 10:21:03 +0000 (UTC)
X-Greylist: delayed 21:06:41 by SQLgrey-1.8.0
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 44C7B8336D
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 10:21:03 +0000 (UTC)
Received: from [IPv6:2a01:e0a:947:6e20:ddf:fa64:1592:c613] (unknown
 [IPv6:2a01:e0a:947:6e20:ddf:fa64:1592:c613])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id DD913BFC65
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 12:20:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grenoble.cnrs.fr;
 s=202106-grenoble.cnrs.fr; t=1628331660;
 bh=v2ZZo2NWFAlFyghCgZi3AfVWZ+09HC/e0DuP1dnG3z0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Ol85bObpqff4971WSY+93iWDUZtafhScLwgFMcOGV0plS09WK6x/JsAfau4LhcVo3
 SQ6Tv63SeU9I3u0JceNd/CfQoBO8ek/5uQMSGxxXCX494KhXKS3Y9wuXbQJMdKPFaj
 M80wiLYWFvLscyELpwFIcv4v4TxXqvLlWL8o6cjc0PdJMBeLJyRQZ+CbEkN3fHeBSD
 b0qT+moFVkeLkttOYlmXseZjDMKDAUSoFqFindTPK2NVvQqPj9jikWifPogyI9P88O
 sjJubTiDpQiT0lowWiAe+8mDw+T4eIGTJcHcH/7GSlh1hvJ6EVktC7F9yKWncbv9VA
 GFt4Kgm6DrU+A==
To: buildroot@busybox.net
References: <20210807070519.BBD0882F39@smtp1.osuosl.org>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
Message-ID: <68ad9a9b-54a1-1f6a-88c3-d6c171340b70@grenoble.cnrs.fr>
Date: Sat, 7 Aug 2021 12:20:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210807070519.BBD0882F39@smtp1.osuosl.org>
Content-Language: en-US
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2021-08-06
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello!

On 2021-08-07, the autobuilder wrote:
> Detail of defconfig failures for master
> [list of 48 failing defconfigs]

The 32 defconfigs that use AT91Bootstrap all failed. I just checked
their failure reasons. The following three failed before the build
started, because of check-dotconfig.py reporting missing entries in
.config:

 - microchip_sam9x60ek_mmc_dev_defconfig
 - microchip_sama5d2_icp_mmc_defconfig
 - microchip_sama5d2_icp_mmc_dev_defconfig

The remaining 29, namely:

 - acmesystems_acqua_a5_256mb_defconfig
 - acmesystems_acqua_a5_512mb_defconfig
 - acmesystems_aria_g25_128mb_defconfig
 - acmesystems_aria_g25_256mb_defconfig
 - acmesystems_arietta_g25_128mb_defconfig
 - acmesystems_arietta_g25_256mb_defconfig
 - at91sam9260eknf_defconfig
 - at91sam9g20dfc_defconfig
 - at91sam9g45m10ek_defconfig
 - at91sam9rlek_defconfig
 - at91sam9x5ek_defconfig
 - at91sam9x5ek_dev_defconfig
 - at91sam9x5ek_mmc_defconfig
 - at91sam9x5ek_mmc_dev_defconfig
 - atmel_sama5d27_som1_ek_mmc_dev_defconfig
 - atmel_sama5d2_xplained_mmc_defconfig
 - atmel_sama5d2_xplained_mmc_dev_defconfig
 - atmel_sama5d3_xplained_defconfig
 - atmel_sama5d3_xplained_dev_defconfig
 - atmel_sama5d3_xplained_mmc_defconfig
 - atmel_sama5d3_xplained_mmc_dev_defconfig
 - atmel_sama5d3xek_defconfig
 - atmel_sama5d4_xplained_defconfig
 - atmel_sama5d4_xplained_dev_defconfig
 - atmel_sama5d4_xplained_mmc_defconfig
 - atmel_sama5d4_xplained_mmc_dev_defconfig
 - microchip_sam9x60ek_mmc_defconfig
 - microchip_sama5d27_wlsom1_ek_mmc_defconfig
 - microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig

Failed because of AT91Bootstrap issue #127, as described here:
http://lists.busybox.net/pipermail/buildroot/2021-August/620375.html

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
