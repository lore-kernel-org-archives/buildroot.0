Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 268D9C83F14
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 12:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6F9C80FF9;
	Wed, 30 Aug 2023 12:53:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6F9C80FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wa_rLtpTMMom; Wed, 30 Aug 2023 12:53:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C29F80C08;
	Wed, 30 Aug 2023 12:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C29F80C08
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B79201BF487
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 12:53:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DE2B41751
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 12:53:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DE2B41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oGnyxB_4Pi0i for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 12:53:31 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A2BD240198
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 12:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BD240198
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id EDCB6440E97;
 Wed, 30 Aug 2023 15:52:40 +0300 (IDT)
References: <20230728172026.3337541-1-bernd@kuhls.net>
 <87sf80pykr.fsf@48ers.dk>
User-agent: mu4e 1.9.21; emacs 28.2
To: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Aug 2023 15:51:52 +0300
In-reply-to: <87sf80pykr.fsf@48ers.dk>
Message-ID: <874jkgvghm.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1693399961;
 bh=WmLIyu+2zkatYsvWBUShgwvCblWW4RJVrahjGAcN6z8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=KjkmObNDeYqTbOk9X01iCuBTekG6E4euJR3qT1v6e5LdnetNdegSYJCkgz1BDeCUS
 3jWAgvSWFtf6Sxoup7C6o0j/TnK9CPkiahNEONiSOogbMQIew9Z0pcC0AjVOnEhwcA
 sx26AChQAA3EuFhoWnf3cXOVC5E2gM5ls8rKr7lD+9v9LP6DmrSEdCDX8Vr8coVn9B
 GqNJq4kOWoZYvKAotd7/KC5L5RoMY1lgELCiWIZkC3CKPO0QCtdtRl4B/u24IIsz7z
 5a4wpZtVvbVzFsiXWLRmM+9JGqvjC2c6Uq2dtxXuzGUAY6lxdooHpoAUbhUqKF01J/
 iczD7EiqzoE4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=KjkmObND
Subject: Re: [Buildroot] [PATCH 1/1] package/php: force arm mode instead of
 Thumb mode
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Wed, Aug 30 2023, Peter Korsgaard wrote:

>>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:
>
>  > Fix the following build failure:
>  > /tmp/ccqcLrVb.s:4053: Error: selected processor does not support `umlal r2,r1,r0,r3' in Thumb mode
>  > /tmp/ccqcLrVb.s:4076: Error: selected processor does not support `umlal r0,r3,r1,r2' in Thumb mode
>  > /tmp/ccqcLrVb.s:8644: Error: selected processor does not support `umlal r0,r3,r2,r4' in Thumb mode
>
>  > Fixes:
>  > http://autobuild.buildroot.net/results/1d09a0a58cbc1712416de746d57d4532df580673/
>
>  > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
> Committed to 2023.02.x and 2023.05.x, thanks.

Not in the 2023.02.x branch as of commit 34dde405262f.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
