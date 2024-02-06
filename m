Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EDCC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:02:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0EAF41590;
	Tue,  6 Feb 2024 16:02:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0EAF41590
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k6XOnFt0PCT3; Tue,  6 Feb 2024 16:02:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 66BA641597;
	Tue,  6 Feb 2024 16:02:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66BA641597
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42F561BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:02:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3D98F829FD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:02:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QsZhgCidFyEy for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:02:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 456E082846
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 456E082846
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 456E082846
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:02:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2C2FF13FA37;
 Tue,  6 Feb 2024 17:02:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 17:02:06 +0100
Date: Tue, 6 Feb 2024 17:02:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJX_mIlIfumQQuP@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
 <20240206105246.1220945-4-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-4-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707235329;
 bh=76Y+nP82fGy5zwezNGpfsKKxoS4IDWfo7Uf32pB3cQY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QAR6HiVs65anyMjqHKBrVuBxJqtZnpbaOcbZRBLnd1VRNnmv9aD9bwEUWEqVbanUA
 qKoCyeRT4zAslEgrl3HxGx9aCO03aHGdE1MhlL1v1YJANajSCImbdZFmJSlw6OBEzL
 hBSN4mLlYqf47kntAy7OSHyizHIY6tMlPEo3ruqHoX+WkuFLsqKXL+pwvT3Ro+Msua
 7+Im9KnDKCSytH/XtrY3lFPvb2oomzXbi1DRCmBh0gK3HOyxmL4r2hRUHZwMGhZa2T
 N1QZ1yh4OeUQZxealXuonH7ErQGq64zdrzoUSh0QLsJcVgQFucDwy8Hl/P43UwozaB
 qgJKuZeNgbsCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QAR6HiVs
Subject: Re: [Buildroot] [PATCH 4/6] docs/website/support.html: document irc
 channel permission changes
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
> The #buildroot IRC channel recently changed from only allowing
> registered users to join to allowing anyone to join but only allowing
> registered users to talk in the channel. This still avoids the spam
> problem on IRC while allowing an exception for users bridged from
> matrix.org. These already have a username registered on the matrix side
> and thus similar properties as a registered IRC user/nick.
> 
> The commands to set these options were:
> 
> * Set +q on all unregistered nicks: ~/mode #buildroot +q $~a~ this lets
>   people join but they can't talk
> * Set exempt on matrix hosts: ~/mode #buildroot +e $x:matrix.org~
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/website/support.html | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/website/support.html b/docs/website/support.html
> index 13d63b13a9..28873c6d76 100644
> --- a/docs/website/support.html
> +++ b/docs/website/support.html
> @@ -27,8 +27,8 @@
>  		    When asking for help on IRC, share relevant logs or pieces of code using a code
>  		    sharing website.</p>
>  
> -		  <p>Note that due to excessive spamming on IRC, the channel can only be
> -		    joined if you are a registered user with
> +		  <p>Note that due to excessive spamming on IRC, you can only talk in the
> +		    channel if you are a registered user with
>  		    <a href="https://www.oftc.net/Services/">OFTC NickServ</a>
>  		    service. Follow the instructions to register as a user with a password,
>  		    and then join the <code>#buildroot</code> channel.</p>
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
