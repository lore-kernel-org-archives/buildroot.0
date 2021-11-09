Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C33DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:17:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A69C61029
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 09:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A69C61029
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CDA96062A;
	Tue,  9 Nov 2021 09:17:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wocbjxmGLWPD; Tue,  9 Nov 2021 09:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA7B560732;
	Tue,  9 Nov 2021 09:17:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4EB1BF2B0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BF37402F1
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 09:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vMygP3tVvvZ4 for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 09:17:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp4.osuosl.org (Postfix) with ESMTP id D78EB402F0
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 09:17:09 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kNFUmyQOIyoivkNFVmNXAj; Tue, 09 Nov 2021 10:17:06 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636449427; bh=mASdttL/tQ3Bg7UFYzrlKXLNeg9AMXfDTI7LlPSIrrw=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=fVPGWp0d0Ab+SeQ2JxJ2B6NVnTd2EHzzDM0J7vp0xRAReo91/qN3qgQSi1BZnutpZ
 tEa14zBLuzKBPnecc8WjfR1W/alWWrUnQzRTGkLZOPHFU/i9pDOHaKp4dSI0yHk7CM
 BerZA9Vh+REyQGQa4+itTSQx5th3/Bsw+qy7e/ClQg7/4wSLij0/SivYEtsckiW0yF
 58F3K+rSZouayzBGascyQeFOM6RJRZvFX40iQ7CyNXfeQWe8ISp1sfzWhTMuEEwa8u
 7TbDjQCXalzUS9s9/MOs0EhItEG8FkJtdARPVkfF0jx4UF+i59cQFjiEfZGS6LzI76
 zZS/gNRg0NUUg==
To: Luca Ceresoli <luca@lucaceresoli.net>, buildroot@buildroot.org
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
 <20211108230520.4007148-2-giulio.benetti@benettiengineering.com>
 <312c89ac-4ae6-97e6-2c77-cb1a5e5e441d@lucaceresoli.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <b880f6ca-6a19-f7d7-dc31-4368e55160fa@benettiengineering.com>
Date: Tue, 9 Nov 2021 10:16:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <312c89ac-4ae6-97e6-2c77-cb1a5e5e441d@lucaceresoli.net>
Content-Language: en-US
X-CMAE-Envelope: MS4wfPdGhkg3U/bUiF6+f4Eldf3YrORKwv2SPiuLk77yp3rNdmzQZ5PK0NncVYFticP1gLhUT3MX6fnne7pIife35mzt76snpeKdFiuaIwxEaNCOUPs1SXXF
 rYWnKozxptdychG3li78CTpLOK39rs8YRLcuBENTOIDX8qvZpuIKqUplztj27P+6cOg9HGO790rYODzwUatIE2fyR/vbYWesMkjV/blAu1TQDk3VmW6ca28V
 wtBEJn61r2M4iZuFGVSP05puEKkCHTVgVcbUTlRjps53fqRUrB5UilPVlWTjR95khwsacYfNQZzK5ocx5JsDy9FHO8PADcvGFw9rXrui0COlkAFQBtNY95Nx
 EV3Pq2uP8HjDDnBgKZrgkIBvg0qUu1HgD/dEQwmBVcG+zb8bZZI7ryHPZ+9nnXy9mIEj9jtW
Subject: Re: [Buildroot] [PATCH 1/7]
 board/olimex/a20_olinuxino/genimage.cfg: fix build failure due to wrong
 offset value suffix
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?B?TWljaGHFgiDFgXlzemN6ZWs=?= <michal.lyszczek@bofc.pl>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Luca,

On 11/9/21 10:01 AM, Luca Ceresoli wrote:
> Hi Giulio.
> 
> On 09/11/21 00:05, Giulio Benetti wrote:
>> With commit[1] I've introduced a bug:
>               ^^^
> Which commit? :)

I've forgotten, thank you for pointing, I've just reworded for v2 series.

This is the commit:
https://gitlab.com/buildroot.org/buildroot/-/commit/43bfa1cf1046b0e44e87a02bc5a358bf1de5bfdd

>> offset = 8KB(not valid for genimage)
>> and this prevents genimage to work, so let's substitute 8KB with 8K.
> 
> I wanted to test this patch, but the build succeeds on current master.
> How do you detect the wrong behaviour?

I've supposed genimage parser was stronger but I've just found as you've 
found that it builds even if it shouldn't. Genimage only checks the 
first letter of suffix, so if you try to modify that offset to:
offset = 8KDEADBEEF
it will build with offset at 8K.

So I reword by adding commit URL and changing from "fix build 
failure..." to "offset value must be...".


Thank you for checking!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
