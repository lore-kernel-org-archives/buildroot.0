Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDCDC6FA82
	for <buildroot@archiver.kernel.org>; Sat, 10 Sep 2022 16:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEB8841C8E;
	Sat, 10 Sep 2022 16:14:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEB8841C8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CxlB_uf17wYR; Sat, 10 Sep 2022 16:14:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9509341C73;
	Sat, 10 Sep 2022 16:14:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9509341C73
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 548C11BF592
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 16:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B2578406C
 for <buildroot@lists.busybox.net>; Sat, 10 Sep 2022 16:14:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B2578406C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UU_Rtj8o5oS1 for <buildroot@lists.busybox.net>;
 Sat, 10 Sep 2022 16:14:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7824684066
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7824684066
 for <buildroot@buildroot.org>; Sat, 10 Sep 2022 16:14:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:981a:f392:e207:b56b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5F4F219F58C;
 Sat, 10 Sep 2022 18:14:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Sep 2022 18:14:33 +0200
Date: Sat, 10 Sep 2022 18:14:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220910161433.GE264214@scaer>
References: <db619fc8-b861-21b7-562d-5590fa53cf05@phobosdpl.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <db619fc8-b861-21b7-562d-5590fa53cf05@phobosdpl.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662826477;
 bh=GXpVf/o4cv70z4e6F/PTZLn/WM2NXtyUf8WWbvB/yGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CG2JB8aDF2vwC+s42WBFaE5Tx0SrKsjoetKsD+w3B4nEKfIdXK/c8XgGHbKlB6wiC
 +rrIHfnfa25wmhM7ZaopnUC2i9f/59xlwTSbCtNdhe38r9FHWy1bIwsRTEDMHLNeSy
 /2xi19T/eu03CCawCKTKGzAWgiMe5K5apxMB32Ucmgp//buIRPTrol3H3fEStmEf//
 IyNeONct27UsvDpTc5ZWEuD0clb2TP+NyMWmc3trOH5zQ2jRmyONCvI7lIpR8yDpOE
 tXtotNpl2S9hv2l4CWbIK96IESJO3H1tDB8R4JkTH9CqxhflhRwpY3M+NJAm51sxh7
 OHv6ig7Zf324g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CG2JB8aD
Subject: Re: [Buildroot] How to register to attend the buildroot annual
 meeting ?
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Sen, All,

On 2022-09-09 17:21 -0500, Sen Hastings spake thusly:
> I am interested in attending the buildroot annual meeting, but I am a
> bit confused as to how I am supposed to register.

Registration is now closed, unfortunately. Even as the event is free to
join, we still need to know in advance how many will be joining, so that
we can organise the event, which means registration closes about 10 days
before the event. This might not have been properly advertised, though,
and we shall try and do better next time.

Regards,
Yann E. MORIN.

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
