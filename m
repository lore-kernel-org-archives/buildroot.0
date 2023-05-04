Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F0AC77B73
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 21:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C1DE427A5;
	Thu,  4 May 2023 21:08:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C1DE427A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gI97ijEfnz57; Thu,  4 May 2023 21:08:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A7B84279B;
	Thu,  4 May 2023 21:07:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A7B84279B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 454291BF3AF
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AFDB60A67
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:07:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AFDB60A67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WsJrpLdcUXiW for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 21:07:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABC55608A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ABC55608A5
 for <buildroot@buildroot.org>; Thu,  4 May 2023 21:07:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:2a0:f7b8:e40f:da5c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1006E140FAC;
 Thu,  4 May 2023 22:55:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:55:57 +0200
Date: Thu, 4 May 2023 22:55:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230504205557.GB2661@scaer>
References: <20230504204522.6352-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504204522.6352-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683233760;
 bh=WxgCDbTrQFyryQegOW3oXQqE5L8nzq2bVmiQiVuwtWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Xylak3sXG4r5gWPf5co6I1PnNFzoAcELh0fEyq/1N8jdLUqia+Qd+gHuuAjOhAzGf
 h0J16aEz6uBPMgtzL8j/nMsRwy/Vd4iU1ZDtTxni3CJyAougkXGVgdqU7KjCTFSKp2
 nJjP5T9osYbGNTeEoTa6Dxytq9RxvozdSycNQegRS5GGFM0jkkDURu5KBTIU2pLG8h
 hd+zeQ7raOt7uuC40OWwOwnTCBh64+fgi3gUpUsxiHNuB61HoChWuNEW7BtL3huz5z
 +6HWKVFec+nIkzhEKccOWfZFc9KSf7BPRAc9ZxIGNTcDF258Gkwo7mU+DVBNeWCP2c
 GwZKDZH3rId9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Xylak3sX
Subject: Re: [Buildroot] [PATCH v1] package/edid-decode: change download
 from git URL to https
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-04 22:45 +0200, Peter Seiderer spake thusly:
> - change download from git URL to https (and SITE_METHOD git)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Quickly applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/edid-decode/edid-decode.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> index cd0bdfa0f0..247ed207d3 100644
> --- a/package/edid-decode/edid-decode.mk
> +++ b/package/edid-decode/edid-decode.mk
> @@ -5,7 +5,8 @@
>  ################################################################################
>  
>  EDID_DECODE_VERSION = 2d44e1b01c7ed7d65b20ecdce62d354841832201
> -EDID_DECODE_SITE = git://linuxtv.org/edid-decode.git
> +EDID_DECODE_SITE = https://git.linuxtv.org/edid-decode.git
> +EDID_DECODE_SITE_METHOD = git
>  EDID_DECODE_LICENSE = MIT
>  EDID_DECODE_LICENSE_FILES = LICENSE
>  
> -- 
> 2.40.1
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
