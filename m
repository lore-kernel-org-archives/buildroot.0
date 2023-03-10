Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE11EC64EC4
	for <buildroot@archiver.kernel.org>; Fri, 10 Mar 2023 08:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282CC4014E;
	Fri, 10 Mar 2023 08:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 282CC4014E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwa5dyo9MPqk; Fri, 10 Mar 2023 08:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75FB240123;
	Fri, 10 Mar 2023 08:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 75FB240123
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2F6DA1BF31A
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 08:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14FC2415F6
 for <buildroot@lists.busybox.net>; Fri, 10 Mar 2023 08:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14FC2415F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWIcDwqhn_wt for <buildroot@lists.busybox.net>;
 Fri, 10 Mar 2023 08:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55560415EC
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55560415EC
 for <buildroot@buildroot.org>; Fri, 10 Mar 2023 08:18:34 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id 77E68BDE0E9A;
 Fri, 10 Mar 2023 09:09:17 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 10 Mar 2023 08:09:17 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Kenneth Roland <kjroland75@hotmail.com>
In-Reply-To: <mailman.6972.1678395514.50374.buildroot@buildroot.org>
References: <mailman.6972.1678395514.50374.buildroot@buildroot.org>
Message-ID: <41d62067a8624bd2c8b0ed458571f8da@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.8 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1678435757; bh=VvSTkQGGsN5lT7DV4G77nU0lDxyMpyvd3nTcCysV9J8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=xF5DLHR5ii/f34MHMhfosFPm/1386othZeBVcgnwER79OTxvDPDvpQWab+8JDeaY4
 R/Xr/gzZTr98Po5hREz66dZeoSbyCmty/9zhH8AOlz3/VIU91/VNwJ9qHA1pA/M7Rd
 3irAT242KCy35XDKlMR18DtBLAR4fz9beezgtuCk=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=xF5DLHR5
Subject: Re: [Buildroot] U-boot stable asks for SYS_LOAD_ADDR when compiling
 for Le Potato
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kenneth,

On 2023-03-09 17:29, Kenneth Roland wrote:

> As the subject says, I am unable to successfully compile buildroot for 
> this board. I used this repo 
> (https://github.com/mathieu-lm/libretech-cc-buildroot), as support for 
> the Le Potato dev board isn't in mainstream. This fork isn't too old as 
> it is dated 2020.02 in menu makeconfig?. I assume that because this 
> repo is slightly dated that it doesn't account for newer changes for 
> u-boot? Uname and logs are attached. I used the value 0x1000000 as 
> given in the device's forums 
> (https://forum.loverpi.com/discussion/748/u-boot-guide-for-le-potato-aml-s905x-cc).
> u-boot Guide for Le Potato 
> AML-S905X-CC<https://forum.loverpi.com/discussion/748/u-boot-guide-for-le-potato-aml-s905x-cc>
> The boot priority of Le Potato is as follows: eMMC then SD. The current 
> version of u-boot found in the images is the 2019.04 release.
> forum.loverpi.com

Toolchain and u-boot versions are static, the fault probably lies within 
the instructions in the README of [1].

Clean up your build and initialize it properly:

$ make clean
$ make meson-gxl-s905x-libretech-cc_defconfig

Then run 'make'.

<cut>

Kind regards,
Andreas

[1] https://github.com/mathieu-lm/libretech-cc-buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
