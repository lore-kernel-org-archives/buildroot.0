Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7670BC7EE22
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 21:02:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2036242BD3;
	Tue,  9 May 2023 21:02:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2036242BD3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nDD3C_MLMUiQ; Tue,  9 May 2023 21:02:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 38F2D42BC4;
	Tue,  9 May 2023 21:02:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38F2D42BC4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D6FBC1BF2FF
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6DCC42BBE
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 21:01:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6DCC42BBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MZkoDkUbp7EM for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 21:01:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78DF42B99
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C78DF42B99
 for <buildroot@buildroot.org>; Tue,  9 May 2023 21:01:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3a04:4e20:1cde:35ad])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9C04E2003BE;
 Tue,  9 May 2023 23:00:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 23:00:59 +0200
Date: Tue, 9 May 2023 23:00:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <aduskett@gmail.com>
Message-ID: <20230509210059.GE252090@scaer>
References: <20230425171454.48802-1-aduskett@gmail.com>
 <20230425171454.48802-3-aduskett@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230425171454.48802-3-aduskett@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683666066;
 bh=/JxBo0p7dtym/d6dVlVfbd/NncF62v4EO1y8ItfgT+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RET6Wo/BiVRdtzJy1I7UDn3F2/zP7VRZ8tPGd/nLZmtmYn/BGMTSkhZCJZzsqXZwg
 cbHBDGDMIHc3jWHgWmjCduJ4l/aTYhUIc2PCBZ48qQiG+a77iZGuFua9uwFlYsaxC8
 iOxtJC6LaEc7naPLm8YuuiTvmbJRKijAWBkygHREPpIZJYF/rlwqmPxWYhFGQK/ayF
 YCbkwmuSIx7X7owhDV++2OzdBNIKGQgAas+zBK/MgfNRtMQIV9RKk34JrmTbc6JTEI
 vWJHje5rKkG/12PxrIMeioewBfiaLk5kS3wTBTUErPVmkHNMHGsIHFizOcwHSDx4IY
 +JZP2FV8awKpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RET6Wo/B
Subject: Re: [Buildroot] [PATCH v2 02/13] package/python-pip: add host
 variant
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-04-25 10:14 -0700, Adam Duskett spake thusly:
> In the following patch that updates libselinux, the libselinux python tools now
> require pip to install.

This was a bit terse an explanation, so I extended it a bit.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <aduskett@gmail.com>
> ---
>  package/python-pip/python-pip.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
> index 8cf3aaa3ec..35ad7bede2 100644
> --- a/package/python-pip/python-pip.mk
> +++ b/package/python-pip/python-pip.mk
> @@ -14,3 +14,4 @@ PYTHON_PIP_CPE_ID_VENDOR = pypa
>  PYTHON_PIP_CPE_ID_PRODUCT = pip
>  
>  $(eval $(python-package))
> +$(eval $(host-python-package))
> -- 
> 2.40.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
