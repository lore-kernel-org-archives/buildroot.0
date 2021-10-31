Return-Path: <SRS0=Itk9=PT=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79B5C433EF
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 627D660F70
	for <buildroot@archiver.kernel.org>; Sun, 31 Oct 2021 17:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 627D660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 333DF6067D;
	Sun, 31 Oct 2021 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id litz3TcMaz3j; Sun, 31 Oct 2021 17:46:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B9E760591;
	Sun, 31 Oct 2021 17:46:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E73341BF39F
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5CA260591
 for <buildroot@lists.busybox.net>; Sun, 31 Oct 2021 17:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QmBLPNE1kIz4 for <buildroot@lists.busybox.net>;
 Sun, 31 Oct 2021 17:46:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3AD76058F
 for <buildroot@buildroot.org>; Sun, 31 Oct 2021 17:46:27 +0000 (UTC)
Received: from [192.168.153.129] ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hEuYmGUhprIRlhEuYmD585; Sun, 31 Oct 2021 18:46:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1635702386; bh=iOX9zsVskVxd65Mn7GOOeIi7j+oVidaXEdFk+fjshnQ=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=LYnc9q069HFYCdAVG26+2f7TnJPQSh1G9ZBJzdO8Ub/UNerGXZeIMeGXyhslg8vqb
 s0sHK8Puv4An/uKHY5BXOgpCfVfR7YbSauiltnXAO2bZSKX5qoI+sJVh91UUvMUNOE
 MBfW0XO/QLc4vO87x1NdGeuKIPEIif64/HQ/sURYlgqcVTIah9O/2XrQmtAFPIlyVU
 ufZJb/o8lFyd5baoFYI68Qa1f7oviqHaY7sp94bzYd2WeI0F326okjHuqAwN4zVKbN
 CH93kBvYoiX/25GL4MN7tvcTtUs49yIztwySyfDDf88cyYesGqLhImV161cUIANd05
 nkxoehm0wmwSw==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211030234650.939616-1-giulio.benetti@benettiengineering.com>
 <20211031184200.12836d56@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <0134fdf3-eed7-d84d-e676-e7f092e1a3e5@benettiengineering.com>
Date: Sun, 31 Oct 2021 18:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211031184200.12836d56@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4wfOj/5JMLlrE+MQCHpxatlYbRjshs4VvqJ2k01kBxug+VTg/pP1XpwFpeWOxVW0usqapLo0gwFhCR8VxGIVfoPSHkJPBZqQ2xvvxB3MKKLQW53hv9iv3R
 NqygaefCtEnsx1OEtdhEuQpxnPwRQBttjpEm6zBMPjqdHJ6GzD3NRzlt68+V9ygUThJxrRcTj3w//EuY+Pg4jwbbrlb73xYnDUXGYrxdBb3qaXKn2kR0O27z
 gZcOV1qQEziON1TaIqeqR8rw4I20TYV2Jdx9j/sAJQR0Ic5d0vORBvTT4V70RIQKeApdPD976qotb2L4a8IGMD+55VI/cpumoJY3xf6uKeTYpjXc6OAgDCLY
 4MP+hmPi
Subject: Re: [Buildroot] [PATCH 0/6] configs/olimex_*: fix uboot build
 failure on gitlab jobs
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
Cc: Luca Ceresoli <luca@lucaceresoli.net>, Leon Anavi <leon.anavi@konsulko.com>,
 Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/31/21 6:42 PM, Thomas Petazzoni wrote:
> Hello,
> 
> On Sun, 31 Oct 2021 01:46:44 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Giulio Benetti (6):
>>    configs/olimex_a10_olinuxino: uboot 2021.10 needs openssl and python3
>>    configs/olimex_a13_olinuxino: uboot 2021.10 needs openssl, pylibfdt
>>      and python3
>>    configs/olimex_a20_olinuxino_lime2: uboot 2021.10 needs openssl
>>    configs/olimex_a20_olinuxino_lime: uboot 2021.10 needs openssl
>>    configs/olimex_a20_olinuxino_micro: uboot 2021.10 needs openssl,
>>      pylibfdt and python3
>>    configs/olimex_a33_olinuxino: uboot 2021.10 needs openssl and python3
> 
> I've applied the entire series, but I changed something: the options in
> a defconfig are not sorted alphabetically, but they are sorted in their
> "natural" order in a defconfig (when generated with "make
> savedefconfig").
> 
> Of course, those hand-edited defconfigs, with extra comments, makes
> using "make savedefconfig" bit less convenient, but still I think we
> should follow the ordering of option that "make savedefconfig"
> provides, which is based on the ordering of options in Config.in files.

Ok, thank you for pointing.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
