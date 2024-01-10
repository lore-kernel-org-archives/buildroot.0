Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B14FC4707B
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 22:46:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5AFD83A57;
	Wed, 10 Jan 2024 22:46:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5AFD83A57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGARyVUkCD22; Wed, 10 Jan 2024 22:46:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 256DF8392C;
	Wed, 10 Jan 2024 22:46:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 256DF8392C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 680E81BF304
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40DA38392C
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 22:46:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40DA38392C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WfwBDBIflfm6 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 22:46:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56110838DE
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56110838DE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A5D5AB0054E;
 Wed, 10 Jan 2024 23:46:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 23:46:04 +0100
Date: Wed, 10 Jan 2024 23:46:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZ8eLJfKmgRhsh0a@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-3-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704926766;
 bh=2eQ/Rsxb1juULlsdkczb7+1+HfLg2AJ6pq9rdhC2k+E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=upWLiEso5QjKbEe6s7fx5tLMMhmzZ2aayWPueiSeSYzSR6rSG16cfV4oKdCBR9LG0
 HGMQhzyZdDWAMd7XtxyTq3kN/QZVSJFersfE/1QSI2iW9YcoqQecUmRznF4gTlg5Kb
 IYaVg7vQeGecDn1aZt8CK+bWtHYcg8LCwXPLmbkUYpwmwhNgoTQqtqwhmU6BT9RZ28
 qRVY0Fy3uVeJeRuMU8roSx/KWaMk/O4HFBZGUQzfklJ6bx4obwmdVtlQefK+NYc4dt
 43/SsQefI3N9g+6EDIHGubAcanHFIaCLOF1meD1OudRSZMwZyhPKiStQINOZ7Z6+Xw
 wI0L5/wujjXOQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=upWLiEso
Subject: Re: [Buildroot] [PATCH v3 02/11] package/Config.in: move
 flutter-gallery menu entry
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> package/flutter-gallery was place erroneous under the "Graphic libraries"

I fixed the same grammar typo, and also reflowed the commit log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> section of the menu "Graphic libraries and applications (graphic/text)"
> menu. However, as flutter-gallery is a flutter-based graphical user interface
> (GUI) application, it is better suited to be placed under the
> "Graphic applications" section.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 9ec185f16c..a03415546a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -314,6 +314,7 @@ comment "Graphic applications"
>  	source "package/cage/Config.in"
>  	source "package/cog/Config.in"
>  	source "package/dmenu-wayland/Config.in"
> +	source "package/flutter-gallery/Config.in"
>  	source "package/flutter-pi/Config.in"
>  	source "package/foot/Config.in"
>  	source "package/fswebcam/Config.in"
> @@ -348,7 +349,6 @@ comment "Graphic libraries"
>  	source "package/fbset/Config.in"
>  	source "package/fbterm/Config.in"
>  	source "package/fbv/Config.in"
> -	source "package/flutter-gallery/Config.in"
>  	source "package/freerdp/Config.in"
>  	source "package/graphicsmagick/Config.in"
>  	source "package/imagemagick/Config.in"
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
