Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45947C43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 07:47:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C818E84545;
	Wed, 13 Jul 2022 07:47:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C818E84545
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RtL92n7uB6Ef; Wed, 13 Jul 2022 07:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CABFA8453F;
	Wed, 13 Jul 2022 07:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CABFA8453F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 40E4D1BF37B
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 07:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2538B8453F
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 07:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2538B8453F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MQh4jE7tjPm3 for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 07:46:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B368452F
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14B368452F
 for <buildroot@busybox.net>; Wed, 13 Jul 2022 07:46:59 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9ED8C440F2F;
 Wed, 13 Jul 2022 10:46:36 +0300 (IDT)
References: <d88aa72dcbbcbf5988e643e3ecd0a49e1a455d94.1654802516.git.baruch@tkos.co.il>
 <Ys5oV/gCnSknmvtJ@einstein.dilieto.eu> <87bkttec55.fsf@tarshish>
 <Ys5vPCrxDXWvj+ok@einstein.dilieto.eu>
User-agent: mu4e 1.8.2; emacs 27.1
To: Nicola Di Lieto <nicola.dilieto@gmail.com>
Date: Wed, 13 Jul 2022 10:38:45 +0300
In-reply-to: <Ys5vPCrxDXWvj+ok@einstein.dilieto.eu>
Message-ID: <877d4he9ox.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1657698396;
 bh=j7+bBYBkMELiQMimwunCHdoPQ6XX1pt9PBzsLQiJFks=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=qm79mV7qXlUXV1Srntm6jXDfD0Uqf65q+tWIdJsvxHOUNOaRhZt0US5tm8JAvN/7C
 Utc6pPR0J4V1VxJ/bacKboKZtF41ufHK80BByqoLFLIBC9yuvBLQZCiK8R6dkKDj91
 PB9pPNlOOrXlEm6v+1QkxxXQMfkIBgLK8ESLWCINshJqnkUJyDdYoIMQoMu9vAewOW
 ebOv9u4/zrLQku9R2FpXGiDyBb9doRZF1nQwghofsLuYN68ljjGM6Ij/ZHfMOACAR7
 IIz13csT8rymqowgFISXHwKuQmCRqJKMk4/Q8J4jYSPD0S5pjCxfjEjHcjtnZj6g6q
 IuI2f4U4WHB/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=qm79mV7q
Subject: Re: [Buildroot] [RFC PATCH] package/uacme: requires TLS support in
 libcurl
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nicola,

On Wed, Jul 13 2022, Nicola Di Lieto wrote:
> On Wed, Jul 13, 2022 at 09:43:11AM +0300, Baruch Siach wrote:
>>This issue is already in current code. The line
>>
>>  select BR2_PACKAGE_OPENSSL if !(BR2_PACKAGE_GNUTLS || BR2_PACKAGE_MBEDTLS)
>>
>>does not guarantee that libcurl uses any of these as crypt back
>>end. libcurl might still have BR2_PACKAGE_LIBCURL_BEARSSL or
>>BR2_PACKAGE_LIBCURL_WOLFSSL set.
>
> It doesn't matter what libcurl is using, as long as it can do TLS. uacme needs
> one of OpenSSL, GnuTLS or mbedTLS and will work fine even when curl is using
> WolfSSL or BearSSL. Of course having two crypto libraries wouldn't be very
> efficient...

I see. So currently the 'select' statement is needed because uacme
itself needs one of these as a cryto back end regardless of libcurl. Is
that correct?

>>This patch only fixes the BR2_PACKAGE_LIBCURL_TLS_NONE case, but we can
>>easily add others for something like
>>
>>  depends on BR2_PACKAGE_LIBCURL && !BR2_PACKAGE_LIBCURL_TLS_NONE
>>          && !BR2_PACKAGE_LIBCURL_BEARSSL && !BR2_PACKAGE_LIBCURL_WOLFSSL
>
> That might work, as long as one of OpenSSL, GnuTLS or mbedTLS is
> selected.

One of them must be selected to satisfy libcurl need for crypto back
end. But it is not very user friendly.

>>The reason I marked this patch RFC is because we usually do not 'depend'
>>on non obvious dependencies like libcurl, but 'select' them
>>automatically to make it easier for the user. But I could not find a way
>>to avoid build failure using only 'select'.
>
> There was some discussion about this when I submitted the package:
>
> https://lists.buildroot.org/pipermail/buildroot/2019-April/551561.html
>
>>What do you think?
>
> I think your latest proposal might work but I'm not sure it complies with
> buildroot guidelines. Can someone more knowledgeable comment as well?

I hope so.

I'll try a combination of 'select' and 'depends' to see how far I get.

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
