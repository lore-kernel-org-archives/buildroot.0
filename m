Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 565F9C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F35E0415D0;
	Tue,  6 Feb 2024 16:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F35E0415D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WREEXvbNKeF; Tue,  6 Feb 2024 16:00:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4028416EC;
	Tue,  6 Feb 2024 16:00:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A4028416EC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE7361BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 928C0416BF
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 928C0416BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VYXMj-RHHbNw for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:00:39 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2C6DA416B9
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:00:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C6DA416B9
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5FCC313F861;
 Tue,  6 Feb 2024 17:00:35 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 17:00:35 +0100
Date: Tue, 6 Feb 2024 17:00:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJXoxA0EqZbS9Fo@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
 <20240206105246.1220945-3-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-3-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707235237;
 bh=nq7HkscIxj0qyyYnTzlsIIfzZVp/SxYP275v4G3FN3E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SM5GTYgP+V9syh/ci460aJoaNUKez4Y8JEwxMvLsSi3sOYGS1lSHtc4w4W6oNtUkd
 kmtYB43SxtG3CN1bus784LyKnyf6StV9AaWGQFhWSC69eta7XAqXwxaOEPG9Y+QS7q
 6RJ9GW/SeRI9VCxGH1mDkwke9u5M1DRA5EQ019EBpT9A8VvVRSK4KRb+EESW3ayB+q
 W6R/qdUw5EvHT1s448wPvtYQBEEgV2iP9cB+5DZN21AWO/0ZaE5DrWGGJFyTWn+yaJ
 e99CeopXvXZllchnxB1MrGF71r1VGeV8595GUHrux0D77iKN/vbSCpKZ2LT/1lHqav
 NebHY65DNv+4w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SM5GTYgP
Subject: Re: [Buildroot] [PATCH 3/6] docs/website/support.html: document how
 to join irc channel from matrix
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/website/support.html | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 9be816f836..13d63b13a9 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -21,7 +21,9 @@
>  		<div class="col-sm-11">
>  		  <p>The Buildroot IRC channel is <a href="irc://irc.oftc.net/#buildroot">
>  		      #buildroot</a>, hosted on OFTC. If you do not have an IRC client, you can
> -		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>.
> +		    use the <a href="https://www.oftc.net/WebChat/">OFTC web interface</a>. The
> +		    channel is also bridged to matrix as <a href="https://matrix.to/#/#_oftc_#buildroot:matrix.org">
> +		      #_oftc_#buildroot:matrix.org</a>.
>  		    When asking for help on IRC, share relevant logs or pieces of code using a code
>  		    sharing website.</p>
>  
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
