Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8E8C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 20:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5547B83EBD;
	Fri, 21 Jan 2022 20:39:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5ticrqKsolH; Fri, 21 Jan 2022 20:39:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E5A5818A2;
	Fri, 21 Jan 2022 20:39:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46CD11BF5F5
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 20:39:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3205D818A2
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 20:39:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V9Qq9IiZ-mSK for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 20:39:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E39A981846
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 20:39:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90bb:6e44:a706:407c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C7C1B780333;
 Fri, 21 Jan 2022 21:39:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642797588;
 bh=4F5hvdoYcHaGLrhpKe6yOAJyFyMgsZyIZ7xVJXAb5nY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d/m4WiZGEPC/IOl7PG1ZtVk2uptxuqbg5O1/jIBdrBn7LjNBSLje+JUKAWfOCiX8h
 lLfv8V46ZavZgMwSNLoRljt+sCN7P/B13lwcbYGXY276tPPBJSFtiK+T6Ey46Vc71j
 bQ88A77vRvFkBQR5RXPvx/bfj2hhfj8+wJa4h3NYzagRUaKe4d/tA6MuAXv4NrEjCX
 WmoTsiixQQNZl+Gh9ISwuP1ufqjowD/jS+IniQEpBiRFR7Dwb2n4pCZBhdcQjTtB2l
 C/A24INn+VRhSzmS8rhfVTWM89HFPpBK07lFSXqR0if48MO+WApki4a1mjREvDNa2k
 EerVg5dOpupqg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 21:39:46 +0100
Date: Fri, 21 Jan 2022 21:39:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20220121203946.GI3252931@scaer>
References: <20220120211941.1033249-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220120211941.1033249-1-angelo@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.3
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

Angelo, All,

On 2022-01-20 22:19 +0100, Angelo Compagnucci spake thusly:
> Update project to its new location and move to use the package provided
> init scripts.

The service file we provide is functional (it uses Google's server)
when the upstream service file is not (it uses a dymmy server), same
goes for the init script: we are trying to provide works-out-of-the-box
experience with sensible defaults. [0]

However, the upstream files are very similar to ours, and I see you were
the one to push them upstream.

[0] And of course, I had to test: https://example.com/ does exist, and
does return a date tag.

Meh, scratch all the above...

Still, I am not too fond of that, because then it means we are departing
from our customs to provide our own scripts in all packages...

Oh damn, I am not sure... But that is not the biggest issue, see
below...

> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
> index e9323f9106..3c4412b283 100644
> --- a/package/htpdate/htpdate.mk
> +++ b/package/htpdate/htpdate.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -HTPDATE_VERSION = 1.3.1
> +HTPDATE_VERSION = 1.3.3

Er... We have 1.2.6 in the tree, and I could not find the 1.2.6 -> 1.3.1
bump in Patchwork... Are you sure you prepared your patch against
master?

Regards,
Yann E. MORIN.

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
