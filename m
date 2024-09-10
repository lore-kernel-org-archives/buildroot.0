Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE78EDE9BA
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15EE7606A5;
	Tue, 10 Sep 2024 20:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kP9L8M7zP0Yi; Tue, 10 Sep 2024 20:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12FAB608B6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12FAB608B6;
	Tue, 10 Sep 2024 20:35:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 473721BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34EB6608B6
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYcZ7FM4gCdg for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:35:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3710C606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3710C606A5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3710C606A5
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:35:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1E3325FFA3;
 Tue, 10 Sep 2024 22:35:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 10 Sep 2024 22:35:47 +0200
Date: Tue, 10 Sep 2024 22:35:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <ZuCto8psI7WBMPzU@landeda>
References: <20240910070823.4158894-1-peter@korsgaard.com>
 <20240910070823.4158894-11-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240910070823.4158894-11-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726000551;
 bh=EUJuAJCku0oFFbE3GxbnMh3fz+kUpDxamt1LaWb1Hw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QHFZdchw7V+WGRWgX2kk7N99nNmAYypg0FZr1hpiyLJhURvpDE5S6UCer8SPwyVTb
 MLBBWaLXOunfmSZ/dCcq7nQJxg1Foj+7XnwZM4Ehm2KEoO5hqtw710rpahxsgTEjGF
 9CFJkePfDVohafZRqusq6KlolJSPOr7kNgTOwaTu6kBmMZe3KiTRMz9AFthBXpuAGP
 KUb9dPy7JiADpwOGZ2RhktvyG1HI5uISLx7UbofjYxwFyN2E6CYq0SS5anqhPaVhcO
 Kqc2kZnQo33bB7tcFIdRWsNi+SXmNl0c97lriUBhDM8uKpCg1lH/SFWD/g8P6OX/A6
 YZAA5AmAJ9gXw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QHFZdchw
Subject: Re: [Buildroot] [PATCH 10/42] package/alure: fix dependencies typo
 in comment
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-10 09:07 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/alure/alure.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/alure/alure.mk b/package/alure/alure.mk
> index f0eca8a2ee..8042081b28 100644
> --- a/package/alure/alure.mk
> +++ b/package/alure/alure.mk
> @@ -12,7 +12,7 @@ ALURE_INSTALL_STAGING = YES
>  
>  ALURE_DEPENDENCIES = openal
>  
> -# Disabling alure examples remove the dependecies on physfs and dump libraries.
> +# Disabling alure examples remove the dependencies on physfs and dump libraries.
------------------------------------^
This is also a singular, not a plural, so I also fixed it.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  # Enable at least one built-in decoder (wave).
>  ALURE_CONF_OPTS = -DALURE_INSTALL=ON \
>  	-DALURE_BUILD_EXAMPLES=OFF \
> -- 
> 2.39.2
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
