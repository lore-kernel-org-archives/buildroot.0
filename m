Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63563C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:36:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DAE54197B;
	Sat, 28 May 2022 21:36:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cfMMmL95jx8R; Sat, 28 May 2022 21:36:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF80341974;
	Sat, 28 May 2022 21:36:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 416681BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F66740B80
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JXC8wIzPPh_K for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F03E40905
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:36:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id B409B19F55C;
 Sat, 28 May 2022 23:36:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653773779;
 bh=AB4UCsqi6XHNiDQohAte2mU7XwdKt0sReA0S3aK6V8U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LIcPELELqoSCFrW6FNc0l4VDbK/OWl5evWmY1f6Ahgkqa2esYvCzDA0H279rz0+Aq
 7p8obL16hBp7ZUQfs1EZgt4EumbkQtZXP/EHcVMR8ldqQnN198EJasUl7LNIZMePC5
 IgqDt7lawLV0Ol3GTDwu7vIe1ua6utpexTpxXwlT1Pl/3rxkduW9KkI4vHxuBVqCxg
 +19knW/7lRnalZJl+xEknNu4SauM7mt3w+qrDCxaZT0hRwvmU/xyleEnE+Je1Lz9pJ
 8e58On71prLbboxsc+Spq3BcPBe6CV03XmwBixcON3oe/9T8fwIpiYsEBZxccHIB1l
 bVuk7Jwg/FLUQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 23:36:17 +0200
Date: Sat, 28 May 2022 23:36:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220528213617.GM301044@scaer>
References: <20220524143239.1050052-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220524143239.1050052-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH/next] package/linux-firmware: install all
 RTL_RTW88 blobs
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

Arnout, All,

On 2022-05-24 16:32 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Rather than installing just the three blobs mentioned explicitly in the
> .mk file, use a wildcard to install all blobs. At the time of this
> writing, this matches the following:
> 
> -rw-r--r-- 1 arnout arnout  29K Mar  9 13:28 rtw8723d_fw.bin
> -rw-r--r-- 1 arnout arnout 136K Mar  9 13:28 rtw8821c_fw.bin
> -rw-r--r-- 1 arnout arnout 148K Mar  9 13:28 rtw8822b_fw.bin
> -rw-r--r-- 1 arnout arnout 198K Mar  9 13:28 rtw8822c_fw.bin
> -rw-r--r-- 1 arnout arnout 142K Mar  9 13:28 rtw8822c_wow_fw.bin
> 
> I.e. rtw8821c_fw.bin and rtw8822c_wow_fw.bin were missing.
> 
> Although including all blobs nearly doubles the size, it still totals to
> just 660K which wouldn't warrant making more refined sub-options.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-firmware/linux-firmware.mk | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
> index 0c725737d0..64d096df14 100644
> --- a/package/linux-firmware/linux-firmware.mk
> +++ b/package/linux-firmware/linux-firmware.mk
> @@ -154,9 +154,7 @@ endif
>  # rtw88
>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_RTW88),y)
>  LINUX_FIRMWARE_FILES += \
> -	rtw88/rtw8723d_fw.bin \
> -	rtw88/rtw8822b_fw.bin \
> -	rtw88/rtw8822c_fw.bin
> +	rtw88/rtw*.bin
>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
>  endif
>  
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
