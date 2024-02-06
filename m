Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF76CC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 16:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 85232415B8;
	Tue,  6 Feb 2024 16:00:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85232415B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8O7jv1MXrPa7; Tue,  6 Feb 2024 16:00:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DA4E4168C;
	Tue,  6 Feb 2024 16:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DA4E4168C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8CDC41BF2FE
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65BCB41E79
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 16:00:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65BCB41E79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XsG3WxKI7G8x for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 16:00:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66A1741E05
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 16:00:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66A1741E05
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 507DF13FA3C;
 Tue,  6 Feb 2024 17:00:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 17:00:15 +0100
Date: Tue, 6 Feb 2024 17:00:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJXjxMVP8i1fma4@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
 <20240206105246.1220945-2-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-2-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707235217;
 bh=Ma9/H6CaCl7JCVpJE01L7kfyMe6I7Yp9mDwJ8wsIzcM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s+ulCZSC8Ubjhx2c70NXOgCiJjgseI07Y7AX8x7j/uZXmVTJAkxjZoby5Yoo9ERLF
 YkjG84Nplfg/smluZVOXW/YXYI8rj9Lwl2QJSV8bU3qcQoaZNK8BxuzHuNymE9ezT1
 mMR4k83ULzFwoaVzg9rj86TkxiyxXZ4TPYlGst8QRUX3pTOmis3sx5TMX4q8LhmeSR
 uSYcFxZSdxjok2yaNzHeM/pqZ959+muCrX2+T84SikhJIB6A/pAb/wTUKVSvDbRYTq
 suo9DYv7SVEj8QQ9DOtw+prf4fnjzjNoTbujcy7GoXtnZk9I1Awdks/6uDfNM8bM/f
 oO9FatoU0ostw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=s+ulCZSC
Subject: Re: [Buildroot] [PATCH 2/6] utils/readme.txt: document docker-run
 script
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
> ---
>  utils/readme.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/utils/readme.txt b/utils/readme.txt
> index d5cda70bfc..2cb6b0af9b 100644
> --- a/utils/readme.txt
> +++ b/utils/readme.txt
> @@ -18,6 +18,10 @@ check-package
>      It checks the .checkpackageignore file if errors should be ignored and
>      errors if there's a file listed that doesn't produce an error.
>  
> +docker-run
> +    a script that runs a command (like make check-package) inside the buildroot
> +    ci docker container.

I've slightly extended that to state that an interactive shell is
spawned if not command is specified.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  genrandconfig
>      a script that generates a random configuration, used by the autobuilders
>      (http://autobuild.buildroot.org). It selects a random toolchain from
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
