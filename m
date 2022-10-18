Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48722C433FE
	for <buildroot@archiver.kernel.org>; Tue, 18 Oct 2022 13:15:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B9DBE40B66;
	Tue, 18 Oct 2022 13:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9DBE40B66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8IIAKuFXgPT; Tue, 18 Oct 2022 13:15:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E86B14048E;
	Tue, 18 Oct 2022 13:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E86B14048E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7BEF1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 93935610A7
 for <buildroot@lists.busybox.net>; Tue, 18 Oct 2022 13:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93935610A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XdrVF5NG_C9i for <buildroot@lists.busybox.net>;
 Tue, 18 Oct 2022 13:15:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 111916109C
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp3.osuosl.org (Postfix) with ESMTP id 111916109C
 for <buildroot@buildroot.org>; Tue, 18 Oct 2022 13:15:43 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.206])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kmRZowYbGae4mkmRZosi1e; Tue, 18 Oct 2022 15:15:42 +0200
Message-ID: <121f1b7b-457c-0c19-f94b-2f2decca0a29@benettiengineering.com>
Date: Tue, 18 Oct 2022 15:15:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Peter Seiderer <ps.report@gmx.net>
References: <20221017073953.510219-1-luca.ceresoli@bootlin.com>
 <20221017211048.43d2394c@gmx.net> <20221018085943.104f227f@booty>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221018085943.104f227f@booty>
X-CMAE-Envelope: MS4xfAKtb3XA1u4107cZA7R/hi+RprcgVHJJrB+Wx0AVlKYaVMUfBiujluTgr4twgs1zHmNQsKnhY5Pes3Qkq/pY7kYznG/7Zrjr1KDRf34g63dMgowqpVj6
 OU0voBS0W7NJwpyc9kbEClfZJq9GtDyIr1Bl2nCHds8+zkfjdazwbryCtITpkuOybt3jAHVkgT6UfIvBYxEwiAPwj5YYNU2RQE6RPbTRTxVOhOO77qw7VeD8
 ibHasdHvrmhoAO5lkqgA0XypmozraUDFO/BQPvK12nBcaz82vC6ukv6sp/eF2MLCY3u0n2Wy62uQgcfszVTYJiCL1axrC50C/zaIroyiuZSI2Sb/Y+PZjEoM
 RgcDFGM10gOmkUe1XpgeF5Eo+J90Cinnd27FwmDIdTW5iGG94L3F9qFkE2Put196OeTCxJ0UIZ4Rv4NQcAV19PUv6xgwuciyeTFeIz+O2ei9zTDgD8A=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1666098942; bh=6pbuQ5OECVsL0ijm/NtcNNFOaEmWmqEhBBlr/ZNkVfE=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=njovY4jgiNE7SkjoZ4uaooRmXKQalN9BjcLqb1AB9sWapb6Cr0LFdeYtioxxyvu2v
 5QhHx6+FzR6UB/I/kr6r6yHCLilE5UjvGYM9gJXSaHFzrd8hkmCM+LYnwDzzcJmJBN
 orSESF9KaHZ52jjiI4FOCY+JLvnXrj6ttFrIJmfMJ10IGrVfMj4N1PX2aOtovQtnu6
 lLWzdWc0AkG/mIJdlR81izDEv4f+OOcmIT/7cq8EPXqVTbkR/1vJRDdlYDH/V70pN+
 0mg2q6EpciCFU0ctpgeowyU/OgPpUq0dmSLR1Exipb5v/hmM8mzZfdho1zNg68pqrn
 P9D/zFYpfAPyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=njovY4jg
Subject: Re: [Buildroot] [PATCH] rtl8188eu: remove package
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Luca Ceresoli via buildroot <buildroot@buildroot.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 =?UTF-8?Q?William_Wennerstr=c3=b6m?= <william@willeponken.me>,
 TIAN Yuanhao <tianyuanhao3@163.com>, Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca, All,

On 18/10/22 08:59, Luca Ceresoli via buildroot wrote:
[ SNIP ]

>>> There is currently no fix in the github repository, and it's probably not
>>> worth fixing because, as the Config.in help text states:
>>>
>>>    This is needed only for Linux kernels before 3.12.
>>>    Since 3.12, there is a (staging) driver in mainline, with a
>>>    similar codebase.
>>
>> Despite the buildroot help text the rtl8188eu code base is still maintained
>> see e.g. 'rtl8188eu: Fix builds for kernel 6.0 '([2]) and the various forks/upstream
>> versions tend to support different feature sets regarding IBSS and/or monitor
>> mode etc. - not sure about this one but valid for some other rtlxxxx ones),
> 
> Good to know! Why not adding this info to Config.in too? It would avoid
> others trying to remove the package again.
> 

Good idea, I've just sent a patch for this:
https://patchwork.ozlabs.org/project/buildroot/patch/20221018131506.123350-1-giulio.benetti@benettiengineering.com/

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
