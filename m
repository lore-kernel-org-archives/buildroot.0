Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D723C001B0
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 18:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9E7A41DDA;
	Thu, 10 Aug 2023 18:13:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9E7A41DDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3fL-EI7OO5Mt; Thu, 10 Aug 2023 18:13:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8446741DE6;
	Thu, 10 Aug 2023 18:13:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8446741DE6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BDD261BF3CE
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 18:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2419417DB
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 18:13:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2419417DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNiN2PRAL81a for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 18:13:46 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 91476417D7
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 18:13:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91476417D7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9c21:609:a9c4:c6b1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A0CD978035D;
 Thu, 10 Aug 2023 20:13:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 10 Aug 2023 20:13:39 +0200
Date: Thu, 10 Aug 2023 20:13:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "chris.wood@lmco.com" <chris.wood@lmco.com>
Message-ID: <20230810181339.GH421096@scaer>
References: <PH1P110MB115562DCC66A2B57EA65AB0CE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <SA1P110MB09929404D9FDB9F5E043A920C60DA@SA1P110MB0992.NAMP110.PROD.OUTLOOK.COM>
 <PH1P110MB1155CA9BDBBEADDFE214E69FE60DA@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
 <20230809100554.62bae1e6@windsurf>
 <PH1P110MB1155DC279FDB977453E573DFE612A@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <PH1P110MB1155DC279FDB977453E573DFE612A@PH1P110MB1155.NAMP110.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691691223;
 bh=JXDD+ouByqsrBMPtmfOPJ4ycM6jnSm2UHFdVwxu1qFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u5Bf7qVf8H2qSK9/sZstuyjJm9TSCpuWr7tqF/OPF9K7Jf/qKL0P1h6P8vvC6k6Mi
 i7EkEJGFwnU1SGoe25lTLc4tITYGtsWMr0EV5NS/9CDeJ9q+X2tSnCdnvUlFnjMOgR
 2G8QNUem4dqj7yBtjatnGUzDlC8oukBZRNMj0Z7y4o5A6XgW2ERvAZZueZv4njdGDs
 Gg+FnpQXM2fdt72ijxQnDj17A9fnWu/ag6grWc/WN4lG1+knXsfo6LofLyHkscyC9W
 crcM/W6sZwknGG6Yqi5cK53++Ow+FIEmgzNfEcs7yHG23FE2PCrJC5jTYv1FK7dCgn
 24kZneBxuSNSQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u5Bf7qVf
Subject: Re: [Buildroot] EXTERNAL: Re: FW: Buildroot Licensing Issue
 Uncovered
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Chris, All,

On 2023-08-09 12:19 +0000, chris.wood@lmco.com spake thusly:
> Thank you for your quick response, it was much appreciated.  We do not
> use the NXP boards or software at all so removing it completely from
> the package would make the software more easily accessible for
> development purposes with other architectures.  If someone from your
> team could remove that subdirectory containing the 5 files that create
> the patch and call the NXP website, it would be appreciated very much.
> I agree that in 2012 software licensing analysis was very much
> unexplored territory for most of us.

We have just pushed a commit that entirely removes the lpc32xxcdl
package from Buildroot, which means the files of dubious licensing are
also gone:

    https://gitlab.com/buildroot.org/buildroot/-/commit/503252d8b0951af306189b63ea852723c6540f5a

This is going to be part of the next release, 2023.08, due by the end of
August 2023. Backporting to the stable branches might be done in a later
stage. In the meantime, you may want to backport this change to your
local copy.

Thanks for the report!

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
