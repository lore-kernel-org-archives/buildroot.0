Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C928C433F5
	for <buildroot@archiver.kernel.org>; Fri, 11 Feb 2022 17:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4E91400A6;
	Fri, 11 Feb 2022 17:12:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWONpjELeHDi; Fri, 11 Feb 2022 17:12:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4C95409F5;
	Fri, 11 Feb 2022 17:12:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 259881BF2FE
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 17:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 141E583E3B
 for <buildroot@lists.busybox.net>; Fri, 11 Feb 2022 17:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IH0CpcjI-3Bt for <buildroot@lists.busybox.net>;
 Fri, 11 Feb 2022 17:12:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92A8F83E39
 for <buildroot@buildroot.org>; Fri, 11 Feb 2022 17:12:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b8c4:535c:af4e:49ea])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 339F1B0051B;
 Fri, 11 Feb 2022 18:12:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1644599539;
 bh=mvxchVW/4lKE6uUjpGSEyP7VCrQIXPte3vpOeA0BrV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hiHqpFZwrHwhQ2ds5x1f9hIjyiWCtvqQX9rK/onIkxiv6ODVay1awuYJjH1Wlo9T8
 KMAPEVjRYrmt1YuaiiXjHSDIowQ8/GU3G4FkF2lMl6dOfycz9Rhuw76xjBg/j7KQc3
 jczyqSlfGlabc9KoqNdiK2F9DzkIqTvKz6lqPh92/VyCSk0kQTpH6p/++BS7tA7LnU
 wV/dy+Rq5TH/hFwxy9IJjXwtD3GhbIc5qYuDitgQNmRNjm95iZBIhrSSpvdCAo+wv+
 8cfVBJlJorLMY+psE96Zkxtg426fXkhayHkvGPGYSQ4sFNdRYHlafzT1Yta2B/8SUs
 6DRldKbWOvudQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 11 Feb 2022 18:12:13 +0100
Date: Fri, 11 Feb 2022 18:12:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
Message-ID: <20220211171213.GD3752867@scaer>
References: <20220210232327.119488-1-clayton.shotwell@rockwellcollins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220210232327.119488-1-clayton.shotwell@rockwellcollins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] support/download/post-process-helpers:
 adjust for older coreutils versions
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
Cc: Clayton Shotwell <clayton.shotwell@collins.com>,
 Matt Weber <matthew.weber@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Clayton, All,

On 2022-02-10 17:23 -0600, Clayton Shotwell spake thusly:
> From: Clayton Shotwell <clayton.shotwell@collins.com>
> 
> Ran into an issue with the post_process_unpack function using "head -z"
> on a RHEL box which is using an older version or coreutils. The "-z"
> flag was added in coreutils v8.25 but my IT managed RHEL box is only
> using v8.22. The fix I have implemented relies on the null terminated
> list and sed to remove the first null character and everthing
> afterwards.

coreutils v8.25 were released 2016-01-20, more than 6 years ago now, and
v8.22 were released 2013-12-13, more than eight years ago.

That is sad that you have to use an up-to-date Buildroot (even one that
is not even yet released!) with such an old system... :-/

> Signed-off-by: Clayton Shotwell <clayton.shotwell@collins.com>
> ---
>  support/download/helpers | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/download/helpers b/support/download/helpers
> index ab31e27..90a7d6c 100755
> --- a/support/download/helpers
> +++ b/support/download/helpers
> @@ -79,7 +79,7 @@ post_process_unpack() {
>  
>      mkdir "${dest}"
>      tar -C "${dest}" --strip-components=1 -xzf "${tarball}"
> -    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |head -z -n1 |tr -d "\0")"
> +    one_file="$(find "${dest}" -type f -print0 |LC_ALL=C sort -z |sed 's/\x0.*//')"

As far as I know, hexa needs two digits to represent a byte, so \x00

    http://sed.sourceforge.net/grabbag/tutorials/sedfaq.txt

    4.2. How do I represent control-codes or nonprintable characters?

    Several versions of sed support the notation \xHH, where "HH" are
    two hex digits, 00-FF [...]

So I fixed that, and applied to master,  with a rewokred commit log,
thanks.

Regards,
Yann E. MORIN.

>      touch -r "${one_file}" "${dest}.timestamp"
>  }
>  
> -- 
> 1.8.3.1
> 

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
