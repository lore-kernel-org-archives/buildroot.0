Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CAAC05027
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 16:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E8882026;
	Wed,  8 Feb 2023 16:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E8882026
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7sodGSyUOHu8; Wed,  8 Feb 2023 16:28:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FC5582018;
	Wed,  8 Feb 2023 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FC5582018
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E032C1BF286
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9DB340190
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 16:28:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9DB340190
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jr17PQtMN4eU for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 16:28:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3537D4015F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3537D4015F
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 16:28:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0965713F89D;
 Wed,  8 Feb 2023 17:28:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 08 Feb 2023 17:28:19 +0100
Date: Wed, 8 Feb 2023 17:28:19 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230208162819.GA3386@scaer>
References: <20220610210541.3643416-1-fontaine.fabrice@gmail.com>
 <20220610210541.3643416-2-fontaine.fabrice@gmail.com>
 <20220612203729.GM427639@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220612203729.GM427639@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675873702;
 bh=JPnlNgu8xWD21xjpMCBmglF2rmcx88RzPANQ+zkNE2g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X42X8Cvjir4lFmg56ONj2g6dwugEjkW10TrlK8/regrSpUV3xJSV5prNMmav+oozx
 EIR7nGFPh/Zb5WKbWsbV+TmVzguU/RP89xCSM8/GVRdPYfmG+DcautDpwsIbZFpQYP
 dv6SFOnkYikpjyBZc/8DuwkxV/9qUpJtwbgDINgxj9QAFZsDST0Po1cLp1ujtpy27w
 jtj/jPL7idndrbmPIXES2PBdMgjaJUAV36n6FHmfeKqbyXmoNYDWNeAgdyyoEILbVn
 YoxgrnTVh0cNihalo8slPv6p092VWMhSoWgZeVq9c0v4jik665y7rnO8/28WFbXL03
 gd/3KRMhMiBgg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X42X8Cvj
Subject: Re: [Buildroot] [PATCH 2/2] package/dmalloc: disable stack-protector
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

Fabrice, All,

On 2022-06-12 22:37 +0200, Yann E. MORIN spake thusly:
> On 2022-06-10 23:05 +0200, Fabrice Fontaine spake thusly:
> > Fix the following build failure with stack-protector:
> > /home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld -shared --whole-archive -soname libdmallocth.so -o libdmallocth.so.t libdmallocth.a
> > /home/autobuild/autobuild/instance-1/output-1/per-package/dmalloc/host/bin/i686-buildroot-linux-gnu-ld: libdmallocth.a(append.o): in function `append_long':
> > append.c:(.text+0x115): undefined reference to `__stack_chk_fail_local'
[--SNIP--]
> > +DMALLOC_CFLAGS = $(TARGET_CFLAGS) -fno-stack-protector
> 
> At the risk of more goofiness, but the reference build issue had me
> notice that dmalloc uses ld to do the link phase, while it should really
> call gcc.
[--SNIP--]
> So, thisis a bit of a bigger change, but I otherwise fdo not think that
> disabling SSP is a good idea, especially for a library that deals with
> allocating memory...

So, I eventually took the day to look at this during the dev-days.

I've sent an updated series now:
    https://patchwork.ozlabs.org/project/buildroot/list/?series=340858

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
