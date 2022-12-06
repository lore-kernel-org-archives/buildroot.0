Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AA2C352A1
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 06:01:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ACF8840641;
	Tue,  6 Dec 2022 06:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ACF8840641
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UWHMTCXhBaDi; Tue,  6 Dec 2022 06:01:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4B73405F7;
	Tue,  6 Dec 2022 06:01:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4B73405F7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D16B81BF34C
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 06:01:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACF708142F
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 06:01:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACF708142F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fVIy8kWyKjLD for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 06:01:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBB58142E
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6CBB58142E
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 06:01:20 +0000 (UTC)
Received: from sapphire.tkos.co.il (unknown [10.0.4.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id C5246440150;
 Tue,  6 Dec 2022 07:58:20 +0200 (IST)
Date: Tue, 6 Dec 2022 08:01:15 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20221206060115.gd2i2gjc2pz33omh@sapphire.tkos.co.il>
References: <20221124124546.A2767844ED@busybox.osuosl.org>
 <87y1rwcfl5.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1rwcfl5.fsf@dell.be.48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1670306300;
 bh=mcNImsKnyGiRlrjwE1YmmItp/VpWJr2t89paOT4aTjQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rer/gzEcUECaP/z5lIKindRPCy/fOjEekS8LohilNYwQHUmDb8yBLaS8Z32MejGhp
 ERQ3pSBqCSLtQP2lNfz++2vZRN41i8KHQbQxSYUQ7wQwCnUpaGX3l3pBhWmHJORgDb
 TIXNomcySjEPgHW1WIl407T4AEeDYHnncEm7gD4CGKHxgjvzbH1t+KC9vDH5dQqPkF
 OuwfftZO8x6jMx3iwcB13sOzNAPCTfPi8kqHRW7hJG/LpHeqF2BkzI8IF6H4XKDNhz
 pPzM7hoEMs++Vm/6HA/ma5/Ip4iWqI/AjKr9rGMKnsbhYgRFuGduvdm2Sg8nrHUHXs
 mmAmA+TU7E56Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=rer/gzEc
Subject: Re: [Buildroot] [git commit] package.libopenssl: fix
 enabling/disabling mdc2
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sun, Nov 27, 2022 at 09:22:46PM +0100, Peter Korsgaard wrote:
> >>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
>  > commit: https://git.buildroot.net/buildroot/commit/?id=45bb69c2bdee44346d6be5b58e46b2278e40a04a
>  > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
>  > Commit 3dbc86f09897 (openssl: bump version, enable mdc2+camellia+tlsext)
>  > form 2010-06-03, forced the build of mdc2. Commit a83d41867c8d
>  > (package/libopenssl: add option to enable some features) added an option
>  > to explicitly disable mdc2, but forgot to amend the existing enabling
>  > option.
> 
>  > It appears that, like most (all?) openssl config options, mdc2 ends up
>  > enabled unless explicitly disabled.
> 
>  > Additionally, mdc2 depends on DES, so without DES, mdc2 gets disabled.
> 
>  > So, drop the explicit enabling option, and make mdc2 select DES.
> 
>  > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>  > Cc: "GAUTRON, Erwan" <erwan.gautron@bertin.fr>
>  > Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>
>  > Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
> 
> Committed to 2022.08.x and 2022.02.x, thanks.

Not in 2022.08.x as of commit 3c7c6cd5982 ("package/wilc-driver: fix build 
failure due to missing Linux options").

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
