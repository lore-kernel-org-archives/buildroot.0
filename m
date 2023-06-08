Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF2FC7EE23
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 15:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56BAB41FA6;
	Thu,  8 Jun 2023 15:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56BAB41FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8Edp2oYEX-o; Thu,  8 Jun 2023 15:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 278AC42050;
	Thu,  8 Jun 2023 15:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 278AC42050
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00E4E1BF964
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 15:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3F3614E3
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 15:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3F3614E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTWQdhvSWM90 for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 15:09:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CBA4614F6
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1CBA4614F6
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 15:09:14 +0000 (UTC)
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id EA4B9A05AD;
 Thu,  8 Jun 2023 17:09:11 +0200 (CEST)
Received: from smtp03.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix03.mail.de (Postfix) with ESMTP id CF77580171;
 Thu,  8 Jun 2023 17:09:11 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp03.mail.de (Postfix) with ESMTPSA id 708D1A0263;
 Thu,  8 Jun 2023 17:09:11 +0200 (CEST)
From: Kilian Zinnecker <kilian.zinnecker@mail.de>
To: buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 08 Jun 2023 17:09:10 +0200
Message-ID: <4834301.31r3eYUQgx@kilian-aisec>
In-Reply-To: <dd7810ad-cc9f-aec5-0554-84716766c0b1@benettiengineering.com>
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <dd7810ad-cc9f-aec5-0554-84716766c0b1@benettiengineering.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2263
X-purgate-ID: 154282::1686236951-2F7FC647-4ED82947/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1686236951;
 bh=jhFSqWI4szDzYEFF7FVvS478e/f578p/dn4pVuZ/YSU=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=EUGuMDSqJs6xXibV3euQU3Iguv/xW70YhKDYgh3kIz8GoTrOdnHLWQzd938fJAKWy
 TWEtMqpC6Yfb+h9RoR3sA1Wx4iciTZwStmniH+xl2h4/35A1Z7Z64oo+lF0qYVzNlc
 Qx1m86NwICYQZaifVUilDwGAf7PO5FtL7j2beNWtQwUDhpj3PO7BA2kMlG5OPXlTiK
 qONj1Q/a6XpkIp33neHGDVq4TRQnN2+MrdNGOiBuPN4bf9DctQLFl/b/K9MSufFrcy
 lbaIpb/+MT5pq4jBeO6Kezhlt4reWAppwI3w2ZhIRU/PDWjD2EywMz2ZNknhnHIfeY
 UNXH3cdsXlq9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=EUGuMDSq
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

thanks for your very helpful answer!

> 
> that would be good
>
 
I would like to try to use Collabora's U-Boot (and kernel) with the Rock 5b
support, for starters. And I would like to setup the defconfig such, that
buildroot fetches the sources from Github. Afaik this can be achieved by
properly setting the respective CUSTOM_REPO_URL and CUSTOM_REPO_VERSION of
the kernel and U-boot. However, Collabora's U-Boot needs two of the ATF
binaries during compilation. How could I fulfil this requirement in the
defconfig? I.e., how could I instruct buildroot to fetch both binaries, when
attempting to build U-Boot? If the binaries are present, I think I should be
able to use the CUSTOM_MAKEOPTS setting to tell U-Boot's makefile to use the
two binaries.

Also I would like to have a change to the used kernel config: I would like to
have ethernet driver support activated in the kernel (CONFIG_R8169=y). Radxa's
kernel version does feature a rockchip_linux_defconfig, which is also used by
flatmax. However, Collabora's kernel repository does not. If the kernel
defconfig was present in the kernel repository, I should be be able to use the
BR2_LINUX_KERNEL_DEFCONFIG setting in the buildroot board defconfig to
instruct buildroot to use that particular kernel defconfig, right? But since
that file is not present, what could I do? And even if it was present: How
could I introduce a change, i.e. activate the Realtek R8169 driver?

> 
> You can take for example a look at i.MX family defconfigs.
> Freescale(NXP) maintained Linux and U-Boot:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/freescale_i
> mx6ullevk_defconfig while mainlined defconfig is this:
> https://gitlab.com/buildroot.org/buildroot/-/blob/master/configs/imx6ullevk_
> defconfig
>

I also have a question regarding the freescale imx defconfig, you mentioned:
There is a "call" command in the CUSTOM_TARBALL_LOCATION setting:

$(call github,nxp-imx,linux-imx,lf-<version>)/<some>.tar.gz

I suppose that this line results in buildroot downloading a particular tar
from the net. But how does this command work in particular? Does it create
some url from "github,nxp-imx,linux-imx,lf...."?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
