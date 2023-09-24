Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1412CE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 16:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E6604139E;
	Sun, 24 Sep 2023 16:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E6604139E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLEBwnsDDGHG; Sun, 24 Sep 2023 16:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CA294156C;
	Sun, 24 Sep 2023 16:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CA294156C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1151BF21A
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:36:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 704F2405B9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 16:36:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 704F2405B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQ-KymS1v477 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 16:36:12 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A4AD400D7
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 16:36:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A4AD400D7
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:2d77:ae6d:70e:6233])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id C134319F5BA;
 Sun, 24 Sep 2023 18:36:04 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 18:36:04 +0200
Date: Sun, 24 Sep 2023 18:36:04 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jens Maus <mail@jens-maus.de>
Message-ID: <20230924163604.GP1469982@scaer>
References: <20230923105932.1865002-1-mail@jens-maus.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923105932.1865002-1-mail@jens-maus.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695573369;
 bh=X2R65ZxIQXiup56bDBGctCxbStMxCCz5eqMS4SGssAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PmyU6pY2EJegjhbMvF/eAqvRdpPZAtw9atK05c1fVfg6vSotDalkQTJ6XOS4oriqd
 oKFkoDX/LE6CRpnOm2aFpUartUaPaFmi5PtLFyIeHEhyyNBldOQ/nIT6TY9+R/8jbo
 LhqSuAxEkyOUmjoUS9D4bqDIVuXZPXh0pju4Vz2ME3SGoT1XvRGqVL7LWk6+TLMK65
 ZShNCR5smE5ZRLz6FFJvz6rfdjC5hYSmqC6sUXawgymdtpaGDX6TRqkcs5wGah+3+w
 A0aZiXVRB78sqQmUymFgB8SWBmfdzUY0/U6HTSaqEnW/OSD2i9ef454KJlU8jRXB00
 keeJOR8o/h/ow==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PmyU6pY2
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: fix cross-compile builds
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jens, All,

On 2023-09-23 12:59 +0200, Jens Maus via buildroot spake thusly:
> When nodejs is build a qemu wrapper script is used to execute
> some programs built for the target in user-mode emulation. However, in
> some constellations this causes the build to fail because libraries from
> the build host are used rather than from the target staging directory.
> This has been already reported [1] and throughoutly investigate [2].
> A commonly used fix for this issue is to explicitly use LD_LIBRARY_PATH
> to make sure that the correct runtime libraries are preferred rather
> than using libraries from the build host.

Compared to the in-depth analysis that Thomas did, the above was very,
very light. It did not even explain the core of the issue ("in some
constellations" is very vague, when Thomas explaned exactly what is
going on).

For such a difficult issue, we do want to carry the explanations in the
repository, when a remote URL may disapear any time.

So, I did duplicate most of Thomas analysis, and just tweaked it ever so
slightly so that it fits better as a commit log.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> [1] https://bugs.busybox.net/show_bug.cgi?id=14366
> [2] https://lore.kernel.org/buildroot/20221031213926.50d3c778@windsurf/
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  package/nodejs/v8-qemu-wrapper.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/nodejs/v8-qemu-wrapper.in b/package/nodejs/v8-qemu-wrapper.in
> index e1083f47f7..48222d089b 100644
> --- a/package/nodejs/v8-qemu-wrapper.in
> +++ b/package/nodejs/v8-qemu-wrapper.in
> @@ -5,5 +5,6 @@
>  exec @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
>      @QEMU_USERMODE_ARGS@ \
>     -L "${STAGING_DIR}/" \
> +   -E LD_LIBRARY_PATH="${STAGING_DIR}/lib:${STAGING_DIR}/usr/lib/" \
>      "$@"
>  
> -- 
> 2.34.1
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
