Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E92C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 13:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1774A41184;
	Sun,  7 May 2023 13:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1774A41184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KRas2wUkB4bf; Sun,  7 May 2023 13:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F8CC40BCB;
	Sun,  7 May 2023 13:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F8CC40BCB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E6AA41BF2F9
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C033E60592
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 13:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C033E60592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfR0uF7Li_Vi for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 13:36:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF40760093
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF40760093
 for <buildroot@buildroot.org>; Sun,  7 May 2023 13:36:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C160119F58A;
 Sun,  7 May 2023 15:35:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 15:35:55 +0200
Date: Sun, 7 May 2023 15:35:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20230507133555.GW252090@scaer>
References: <20230507133235.584153-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507133235.584153-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683466559;
 bh=NAQZzNBHNJiIDYIo3CpiUWGZcbVFCAVkwfHXRz+69g8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NjJDrJf+zlrkEk29ONya7XFwtIQ3Do2tnWf6D4cpCCFKCNGlEWPGxrH1uH13zS7++
 Z2xFV+yIcGtIq8CdRv+e8XKXtmmKwag5tKHzshcE5hAvGB2uXK3eOMFgP9gELtqMXg
 V7ph4wmrQPWYfLlDu0o9bP7US5JMIe4Qa0hUVP54dPB4IB7AnGQgd7tFV+RVH4lIe6
 QGPwrlJNifGHTALmfVGcZHFj9UmMGRyTTIjFTIc//SeSIWyjjQZdMlTBuoLNMjUnzH
 hZOSCmsyWH9sX2Z81N76wxI3EQJZN0Yjzr0f3tc0RsFHO6Q8A/+U1YQBi45wxJEn6s
 fBDGkaqR5NZ5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=NjJDrJf+
Subject: Re: [Buildroot] [PATCH 2022.02.x] package/postgresql: fix licensing
 hash
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter K., All,

I know you just EOLed 2022.02.x a few days ago, but maybe a quick
2022.02.13 (or 2022.02.12.1) with just this?

Regards,
Yann E. MORIN.

On 2023-05-07 15:32 +0200, Yann E. MORIN spake thusly:
> Commit 7d8b699c292d (package/postgresql: security bump to version 14.7)
> forgot to update the hash for the liense file COPYRIGHT, which had an
> update in copyright years.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Maxim Kochetkov <fido_max@inbox.ru>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/postgresql/postgresql.hash | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
> index 83b27a5fc0..acce26e8ae 100644
> --- a/package/postgresql/postgresql.hash
> +++ b/package/postgresql/postgresql.hash
> @@ -1,4 +1,4 @@
>  # From https://ftp.postgresql.org/pub/source/v14.7/postgresql-14.7.tar.bz2.sha256
>  sha256  cef60f0098fa8101c1546f4254e45b722af5431337945b37af207007630db331  postgresql-14.7.tar.bz2
>  # License file, Locally calculated
> -sha256  f6d6616acdb598742e2a7c64fa0551c1c72c309d279fd2d90370e5fdd41c8945  COPYRIGHT
> +sha256  1a7d13c3ab31961b91ba256f77d6e82e0b54bf992253060fe93bdb5466df416a  COPYRIGHT
> -- 
> 2.25.1
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
