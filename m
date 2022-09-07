Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DBFC54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 12:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D75180C8C;
	Wed,  7 Sep 2022 12:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D75180C8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xBYoAfPuwY2K; Wed,  7 Sep 2022 12:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBE3F81842;
	Wed,  7 Sep 2022 12:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BBE3F81842
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C226F1BF59E
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A97C540183
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 12:43:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A97C540183
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HJ1eN5aYOrp5 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 12:43:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89BA540122
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89BA540122
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 12:43:17 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.28.15])
 by Aruba Outgoing Smtp  with ESMTPSA
 id VuObob1vPjvAqVuOdo768q; Wed, 07 Sep 2022 14:43:14 +0200
Message-ID: <4e6ab7bc-62cd-01d5-0efc-023d3e5267cd@benettiengineering.com>
Date: Wed, 7 Sep 2022 14:43:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
To: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
References: <20220902063939.2761040-1-dario.binacchi@amarulasolutions.com>
 <20220902063939.2761040-2-dario.binacchi@amarulasolutions.com>
 <f2bc336a-b07e-3f17-4a13-226be75eba64@benettiengineering.com>
 <cd899b55-35b3-0415-890b-2402c4e2e7d6@benettiengineering.com>
 <CAOf5uwnBeAEHo_+kd8r2xnC5-wnjGfZ5qeFcAxH2Sv6hU3zmcg@mail.gmail.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAOf5uwnBeAEHo_+kd8r2xnC5-wnjGfZ5qeFcAxH2Sv6hU3zmcg@mail.gmail.com>
X-CMAE-Envelope: MS4xfEAYhC7LuLk/Cg/up8TNpbkGNInPPHL768E/CzJ4uAvXxBiqja+G6g2OwcXo9aaoeixXVyBOZPHnXWoS/cZuCtEImewo4m3XSJ8NMqCjVEv/uwXBlRhM
 UKL9DVl7cG5ppEROV/vcyyDoJybavdWn169sfHKAk7oMJ3CC1DYxVo1bEMBnyMJmDH6wpHTr8263+YHg5MIv0mJGQDo1DBcezFSbLn9cuImlph/usA5dLobA
 LSzpC3xXHIE+/h8OG+Ji/kJv8sYfLMuR+JlYFdqYo9age2K4UB1gVejAnVlsHZS2wQr7Ts48WNe9ck+BfxKyADXqGUf7nt2Jd3X1o6c3d/opfj/up1BPUmSt
 ClBwWLunggdeNtI9P/a+2S6Saug7dwn9r+DYjKBhS4L5KuXyUO7W7IjrClhuAD3oVxKUmg6TwB1s0FzMc2sgwBy/qgEPBQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662554594; bh=+wF/SqfzcZRRCbruhQPlpBWBKS+yyHd5hSDwNYm+Fbg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=QClGmAmP3f/JqYnGaimdHhjdkvm4WZ1QGi/NiPIu9SaMbMsre50dKxlx8vC/icveg
 MHl7kenLJo2p8jdMMYqb5h8MtOZyP2utsN0yQJqG6BjVU9eBrdW6qyBHYhhelTOjrb
 bmw+/d34g7hoK/ZV+/UJFMUY1ilzmCWL2t15c/J8OeBIofKegtlH1jYObuD/Qyw5z5
 GFiy3jveb/tul6P42hLyUjZxiBlYWw8DWLwgr+TPM4tknXNtDFDUGPYwJaWIQTPeiN
 kCM4zsjvzW0a/S9p1XDrxLWkiMFAolJmoQzkqbtkGP3eCEuxJwt+O32t8sC+oy5ztI
 wW9yndBj1uTiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=QClGmAmP
Subject: Re: [Buildroot] [PATCH v4 1/2] configs/imx8mn_bsh_smm_s2_defconfig:
 new defconfig
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
Cc: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com,
 Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael,

+Cc Arnout,

On 07/09/22 08:50, Michael Nazzareno Trimarchi wrote:

[ SNIP ]

>>>> +CONFIG_CORESIGHT=y
>>>> +CONFIG_CORESIGHT_LINK_AND_SINK_TMC=y
>>>> +CONFIG_CORESIGHT_SOURCE_ETM4X=y
>>>
>>> This ^^^ produces a very shrinked Linux image, but here in Buildroot we
>>> usually want a generic defconfig or fragment that makes the boards
>>> working.
>>>
>>> Then I ask you to only add the mandatory CONFIG_* needed for the board
>>> to work correctly and drop all the CONFIG_* that optimize for size or
>>> build modules to speed up Linux loading.
>>>
>>> The goal is to be generic and let the user to have all enabled by arch
>>> default and just in case tweak Linux configuration. And in that case the
>>> user will have a complete defconfig. This is instead a fragment only
>>> where you usually add few CONFIG_*.
>>>
>>> Try to check the other *.fragment under buildroot/board for that.
>>>
> 
> The config is needed because the partition is defined for those
> products. We can not have 20Mb of kernel
> on nand part for instance. Generic kernel is needed if you have a lot
> of possibility to connect peripherals but in this
> case without a usb host and without a lot of connectors that is
> impossible.

Ok, this makes a lot of sense to me now. Sorry but I haven't considered
this is not an evaluation board with lot of IOs. So this works fine and
Arnout also pointed this here:
https://lists.buildroot.org/pipermail/buildroot/2022-September/650777.html

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
