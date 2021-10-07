Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CF0C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 06:01:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B23D060FC1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 06:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B23D060FC1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 51AC84018A;
	Thu,  7 Oct 2021 06:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt0rmXOJSdHB; Thu,  7 Oct 2021 06:01:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3FD784037B;
	Thu,  7 Oct 2021 06:01:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B3FED1BF5F6
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 06:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4824037A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 06:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sa6awLd-TnGv for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 06:01:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FB294018A
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 06:01:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:a11c:d3e8:9e5:2853])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 32CFF78034D;
 Thu,  7 Oct 2021 08:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633586486;
 bh=R/RPhUvcTCd6bntH5C+Alogy/5fGr9LiB2k0NiZLVzw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrW6+xJBoqFSWyaTnydyzTJc66nr+aVvhdZtOT8yhrc2JA5cSDRDdS4dAbVDihM4X
 eDZrOZGPpmqbN8gyDfFqotk6ws/4KJPSgxM4hrEyJVmXtZ4vNpNP3ijPwjp8UdAc5W
 47ANnEbk2P0S/17xpsJ58hpo+7lRYedO9VOYBkQwDBzD/YkQc5ao68nPK87sKcXmGD
 edx6CeNxYCpp8zSLmBmaSAbkzkArJsEvs4oYh2n5bazRsysLMIr8yxfk7Mxr7c9/fW
 6AqBDOCl5GC/pPZZHMk55NQrSiH+v3LC7CCYt5RhFVTIHqbCY6HpYRwyQgrylQfcD4
 68QiIvVUzrbUQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 07 Oct 2021 08:01:19 +0200
Date: Thu, 7 Oct 2021 08:01:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20211007060119.GG2081069@scaer>
References: <87a6jl5qvb.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a6jl5qvb.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] Buildroot patchwork strange Submitter
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
Cc: Jeremy Kerr <jk@ozlabs.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, Jeremy, All,

On 2021-10-07 08:13 +0300, Baruch Siach via buildroot spake thusly:
> The "Submitter" field of some Buildroot patchwork entries over the last
> few days from different senders is set to "Baruch Siach via buildroot":
>   http://patchwork.ozlabs.org/project/buildroot/list/?submitter=82609
> 
> Any idea what might be causing that?

That's because of DMARC mangling in the mailing list (or something like
that, I'm no expert): the From field is replaced by the list adress, and
thus the patches look like they are all from the same sender, and
somehow the name of that sender is arbitrarily chosen... Not sure aboutr
the heuristic...

And this time it picked yours. In the past, it picked others' nmaes, and
I expect in the future it will pick another one...

As for what happens when the patches are applied: I have a script that
fixes this when applying; I think the other maintainers use pwclient or
some such, and it is also automatically fixed when applying. Maybe git-am
fixes it on its own too?

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
