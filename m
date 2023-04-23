Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC624C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 14:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4414B81F3A;
	Sun, 23 Apr 2023 14:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4414B81F3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrz_W4oWhqcx; Sun, 23 Apr 2023 14:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91FD981F06;
	Sun, 23 Apr 2023 14:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91FD981F06
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D314D1BF346
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 14:43:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACA1D81F06
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 14:43:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACA1D81F06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YEQJeQG8Pal6 for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 14:43:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5485981D4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5485981D4F
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 14:43:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id AAABCB0055A;
 Sun, 23 Apr 2023 16:43:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 16:43:50 +0200
Date: Sun, 23 Apr 2023 16:43:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230423144350.GJ2696@scaer>
References: <20230422093458.46975-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230422093458.46975-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682261033;
 bh=KeQJzUtRPq2BHvVbiFBsBCy0WtdSfAjvX0NAVDWZulQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADL6gkqM41Ydw2AV24dbtlIegISTWbQatyeZBCAIDul+D3u87wd24bAxhCwoMt8gU
 o+T21QPucwJujReHfbTkPhg2I6ZYXK98jMs+Vzaz/7eSQqdRWLUzuFDL9rMdFIkFKz
 DvnExztJSvwkK+vVMZmLgOjM8re5eELpcJJZ91zOdbyHFXijERbZDACuZjzj2uJTGQ
 g6jBwp7PS45JCRnE+Hua8KZl6B7H/GTsptl2KsElq0Osk09RJGZ3PqHndEze5eJb6p
 BPVpsHKzmvavBE2Ysi4TgEREgKC76Zo4n+uADFilva73yKse+kyUHvbu3hLzgYcVaX
 UiKgSaIFWwn8A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ADL6gkqM
Subject: Re: [Buildroot] [PATCH v1 1/1] DEVELOPERS: update email address
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2023-04-22 02:34 -0700, Christian Stewart via buildroot spake thusly:
> This patch updates my email address in the DEVELOPERS file.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5cd882b579..d9e95a3d05 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -538,7 +538,7 @@ F:	package/syslog-ng/
>  N:	Christian Kellermann <christian.kellermann@solectrix.de>
>  F:	package/python-pylibftdi/
>  
> -N:	Christian Stewart <christian@paral.in>
> +N:	Christian Stewart <christian@aperture.us>
>  F:	package/balena-engine/
>  F:	package/batman-adv/
>  F:	package/catatonit/
> -- 
> 2.40.0
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
