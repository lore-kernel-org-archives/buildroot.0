Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CBEE77373
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 13:58:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C4383DEA;
	Sat, 30 Sep 2023 13:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5C4383DEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2fSAA--7_EvP; Sat, 30 Sep 2023 13:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B142883DBE;
	Sat, 30 Sep 2023 13:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B142883DBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C581A1BF2F9
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 98AAA41DDD
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 13:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98AAA41DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PZwx6-Q5r9Vf for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 13:58:31 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 287B641E2C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 13:58:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 287B641E2C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb04:4ad:b00:e4d1:b92:e94d:73af])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D193CB00583;
 Sat, 30 Sep 2023 15:58:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Sep 2023 15:58:25 +0200
Date: Sat, 30 Sep 2023 15:58:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230930135825.GC2579@scaer>
References: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230930082507.517920-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696082308;
 bh=AU0NnWnaOlPVWBntEF6fkUznmFXmsC3Bl7FlF5uEZLk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=B8+WlPstPjt6llwMPLhCZxEJCjikMsv6lKLoJfhQIlkLN6arZmJJ8VlnsIwbJdTmI
 h7Ki4S02BYLvqIi3kQM0hvT9TpUQzF977Q45wuXvCZJy1GK4TsGbz48KVuMTSZfDyt
 slZYHfZ4Tdg/2IyMU/kSWBNirpFkHwEyG1BepGtSCjoWwtEB8pMaCt7eWdS/1E9kUs
 8+zzhgcdUv3QhIBZdqUJVNhWbkzb0G3ApHCFXOg+4Hiucdv/RLY3V7dVS7wuQt5eRR
 ZROHd16fD90jWS/Jomd27Ak0WgrogS1O7anoQYfZZmKddKMkf8tzXUTIvV+9WI5CJk
 osApaVIksZUGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=B8+WlPst
Subject: Re: [Buildroot] [PATCH 1/3] docs/website: move Git repository to
 Gitlab
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

Thomas, All,

On 2023-09-30 10:25 +0200, Thomas Petazzoni via buildroot spake thusly:
> We're now using Gitlab as our official Git repository, so let's update
> the website accordingly. Gitlab only provides https:// access, so drop
> the explanation about the Git native protocol being more efficient
> than HTTP (also because that's no longer true).
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Whole series applied with a minor fix in the last patch.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/website/download.html | 26 +++-----------------------
>  1 file changed, 3 insertions(+), 23 deletions(-)
> 
> diff --git a/docs/website/download.html b/docs/website/download.html
> index c1fd38998c..7d7b405a61 100644
> --- a/docs/website/download.html
> +++ b/docs/website/download.html
> @@ -124,14 +124,14 @@
>  	  <div class="panel panel-success">
>  	    <div class="panel-heading">Repository</div>
>  	    <div class="panel-body">
> -	      <P>The buildroot repository can be browsed online through cgit at
> -		<a href="http://git.buildroot.net/buildroot/">http://git.buildroot.net/buildroot</a>.
> +	      <P>The buildroot repository can be browsed online at
> +		<a href="https://gitlab.com/buildroot.org/buildroot/">https://gitlab.com/buildroot.org/buildroot/</a>.
>  		To grab a copy of the repository use</p>
>  
>  
>  	      <div class="input-group" style="width: 100%;">
>  		<input class="form-control" style="width: 85%;" id="giturl"
> -		       value="git clone git://git.buildroot.net/buildroot" type="text" readonly></input>
> +		       value="git clone https://gitlab.com/buildroot.org/buildroot.git" type="text" readonly></input>
>  		<span class="input-group-button">
>  		  <button class="btn pull-right" type="button" data-clipboard-target="#giturl"
>  			  data-toggle="tooltip" data-placement="bottom" data-trigger="manual" title="Copied!">
> @@ -140,26 +140,6 @@
>  		</span>
>  	      </div><br>
>  
> -	      <p>
> -		Or if you're behind a firewall blocking git:
> -	      </p>
> -
> -	      <div class="input-group" style="width: 100%;">
> -		<input class="form-control" style="width: 85%;" id="giturlhttps"
> -		       value="git clone https://git.buildroot.net/buildroot" type="text" readonly></input>
> -		<span class="input-group-button">
> -		  <button class="btn pull-right" type="button" data-clipboard-target="#giturlhttps"
> -			  data-toggle="tooltip" data-placement="bottom" data-trigger="click" title="Copied!">
> -		    <img class="clippy" src="images/clippy.svg" alt="Copy to clipboard" width="13">
> -		  </button>
> -		</span>
> -	      </div><br>
> -
> -	      <p>
> -
> -		Please use the native git protocol if at all possible, as it's a lot
> -		more efficient than HTTP.
> -
>  	      <p>
>  
>  		If you are not already familiar with using Git, we recommend you visit <a
> -- 
> 2.41.0
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
