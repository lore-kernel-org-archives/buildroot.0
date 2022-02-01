Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F163C433EF
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 17:42:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F27181D47;
	Tue,  1 Feb 2022 17:42:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VW1WnPef9uuy; Tue,  1 Feb 2022 17:42:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F148817C3;
	Tue,  1 Feb 2022 17:42:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3761C1BF396
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25CF3415D9
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 17:42:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T5n7eF7qE3D7 for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 17:42:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29988415D5
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 17:42:45 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ExAznsf4mroAhExAznYAJf; Tue, 01 Feb 2022 18:42:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643737365; bh=RD5Sirpgt0F0CYB2s+T+doYssxGyUle9abec9UsFdHo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=NY5ImWylSnFGOsX4QkwUwzfXnWTSrYNfFVcaEtYjOx7ppWKIj+54sQqsfIme2CE4A
 eBlTFJWeIQxsyj/QOrn46utEesXV6JgD/Q1lceiY5QR6DaD4jMjSWyNSiywB2sRgpf
 GGIVfBkibTfHqq9X8CRFuObBsaVove9fWbnCD5flVgWb0X5XXHrI2NZPhUooNHE25p
 OKFcD+vGxCvorkOywne6+a0PTL+tQXWRdc5ujqQZcbzRy7HtOoAyiCgYCWTvNBE5Ht
 lt+nlSWf0ZCSO0VT1j9pLCuM14mAObCj9Q9NC6UCvRNFN9G2Z59YfY5bSD9Oelp5mM
 PG1gwI+VizyZQ==
Message-ID: <69b69000-f7ff-cd04-2c1e-301a8d0d9dc3@benettiengineering.com>
Date: Tue, 1 Feb 2022 18:42:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220201174118.277366-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220201174118.277366-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4wfNcqFw2KAFVOzKUfeCTgPIgJjxAPSOL6ijKMJo820MkNDFy2O7ySfkI5gWhfuu7qMXQWYdANCstaypEN1atOdBEZF2Z7lllI1BLOw08wHi22qds5ZV29
 ZX0wDHTVl/ipWB62NWWV9o47kKlQ1yD4RBBIJxo62zAwU5nZeUxh53T3cR+XLuxyYF6jAPe9ghODJr1Y+/8E2OCZChex9bi/ioA=
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Martin Hicks from file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I've resent with Martin in Cc to give a Acked-by,

sorry for the noise
-- 
Giulio Benetti
Benetti Engineering sas

On 01/02/22 18:41, Giulio Benetti wrote:
> Martin Hicks asked to not maintain cryptsetup anymore:
> https://lists.buildroot.org/pipermail/buildroot/2022-February/635413.html
> 
> Also he doesn't mantain any other package, so let's remove him from this
> file.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   DEVELOPERS | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5255b096b0..555723867e 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1847,9 +1847,6 @@ F:	package/rpi-firmware/
>   F:	package/tzdata/
>   F:	package/zic/
>   
> -N:	Martin Hicks <mort@bork.org>
> -F:	package/cryptsetup/
> -
>   N:	Martin Kepplinger <martink@posteo.de>
>   F:	package/tslib/
>   F:	package/x11r7/xdriver_xf86-input-tslib/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
