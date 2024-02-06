Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798DBC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 075CB400E7;
	Tue,  6 Feb 2024 15:59:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 075CB400E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8SBPAT_jyAd; Tue,  6 Feb 2024 15:59:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F38A140607;
	Tue,  6 Feb 2024 15:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F38A140607
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4071BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:59:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5D6640607
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5D6640607
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8ULJ7PtrDDXH for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:59:50 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B831400E7
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:59:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B831400E7
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A378313FA3A;
 Tue,  6 Feb 2024 16:59:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 16:59:45 +0100
Date: Tue, 6 Feb 2024 16:59:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJXcd5J5UwansD-@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707235187;
 bh=qC4N/G4xybx2fPpT5tHfSTcOY5HGj+JW2GtgYvkH/6o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m8HE8yTy4MCSZm/sNE6g4q1etwLPG/AFiVjXNRb+rFBm8vMyVN0MfNcnHsB8BCB3O
 RJfsj7B3hTm121EcuX8PNRGJ1vtV3ZzbCfrZs1+1b6vBdFzfHwO447i6BB/hHIon6U
 yvziTuAM3HKF5THhTCNe9G6ywlVUCDacUf+wBz9UQcOrEi8WarfsHP+QqrUUGILaAZ
 QSkNUBqzrTFx61zX7X/Mv/P29oPoiFnlYLSXPPGOxXKYWaeeVO5Jbz4SNG1hrc16sI
 q0aq1lbTvmAM7ri9NCp9WZm8Rom9j3D6n9iu2YG9j7lGN8m6ujx3IVE5ywkXneLlno
 vBXuhPc+YmP3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=m8HE8yTy
Subject: Re: [Buildroot] [PATCH 1/6] utils/readme.txt: expand check-package
 description
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

Marcus, All,

On 2024-02-06 11:52 +0100, Marcus Hoffmann via buildroot spake thusly:
> check-package does a lot more by now than checking .mk and
> Config.in files. Add this to the description.
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  utils/readme.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/utils/readme.txt b/utils/readme.txt
> index 3e8833c4ea..d5cda70bfc 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -12,8 +12,11 @@ brmake
>      nothing.
>  
>  check-package
> -    a script that checks the coding style of a package's Config.in and
> -    .mk files, and also tests them for various types of typoes.
> +    a script that checks the coding style across the buildroot tree. It
> +    checks package's Config.in and .mk files, runs shellcheck for all shell
> +    scripts, flake8 for python files, checks for typoes, etc.
> +    It checks the .checkpackageignore file if errors should be ignored and
> +    errors if there's a file listed that doesn't produce an error.
>  
>  genrandconfig
>      a script that generates a random configuration, used by the autobuilders
> -- 
> 2.43.0
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
