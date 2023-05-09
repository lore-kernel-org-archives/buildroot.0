Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F19C7EE23
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 15:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC286405BF;
	Tue,  9 May 2023 15:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC286405BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xyV3rke6x6B6; Tue,  9 May 2023 15:45:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 027CD40B8D;
	Tue,  9 May 2023 15:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 027CD40B8D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26A2D1BF20B
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 15:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB9E540315
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 15:45:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB9E540315
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT9E2riILucu for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 15:45:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6A825404DF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6A825404DF
 for <buildroot@buildroot.org>; Tue,  9 May 2023 15:45:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:89f6:f9b6:d1a9:3e6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9893E78050E;
 Tue,  9 May 2023 17:44:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 09 May 2023 17:44:59 +0200
Date: Tue, 9 May 2023 17:44:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20230509154459.GA252090@scaer>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
 <20230502154713.1490788-6-etienne.carriere@linaro.org>
 <20230507213849.GT252090@scaer>
 <CAN5uoS_PLOt-oPrNKiop4E-fQrVaRa+6GL9Fkqg=vC=waZoCAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAN5uoS_PLOt-oPrNKiop4E-fQrVaRa+6GL9Fkqg=vC=waZoCAQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683647102;
 bh=EJSYbsPgdkuW5BuozBfJHB9OpG0E9DlaoVoHLRcvDdA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fCQpw/i7qakUef8LWcExHSlVrxq8dBGz+mAO9JSd8+2gbnr0PN2zNIhjA+Ym5Rig2
 ayqVYWduoiU5vI0ZZL8IsphLFC9UAvyDahUGlxPGij1Zotg+TZuWzCuo6OeU8WtqVt
 b0gex+V2WNwtgE4RdfDf6XikLEksjfcLe1XcSfHuBb52foG4Y+JLFsoyRwUTMozP8k
 ExSajpBn4PQzZ0JPLbFyS/ZwUJ/3C0zYhhCbQX40UcAPTWrdsRqKOd8ZKpFzqHm7ZQ
 qVQkube7hkBILyLJPZ/btzoyYqUO5yAqemSXfwr2uWrJeExlJtQVhdfC0PlOOMLj6i
 ocn+YOEttsssA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fCQpw/i7
Subject: Re: [Buildroot] [PATCH 6/6] package/optee-benchmark: remove
 deprecated package
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Etienne, All,

On 2023-05-09 09:17 +0200, Etienne Carriere spake thusly:
> I didn't even noticed patch files were listed .checkpacakgeignore.

That's relatively recent, and the tooling does not yet catches this
issue; see:
    https://patchwork.ozlabs.org/project/buildroot/patch/20230506212531.365446-1-yann.morin.1998@free.fr/

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
