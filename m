Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F841C04ABA
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B64D613A0;
	Wed, 20 Sep 2023 17:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B64D613A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bxfS72x3Kje7; Wed, 20 Sep 2023 17:39:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CF161396;
	Wed, 20 Sep 2023 17:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5CF161396
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E61F1BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27A04404DA
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:39:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27A04404DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xAx1UeJNvZTu for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:39:13 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F68740131
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:39:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F68740131
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3EB0660142;
 Wed, 20 Sep 2023 19:39:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:39:08 +0200
Date: Wed, 20 Sep 2023 19:39:08 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920173908.GI512384@scaer>
References: <20230919210405.554008-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230919210405.554008-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231551;
 bh=D3nuz0PoIlQDwW6S+Zgq78A/IJEKENYIPgCE4hY3ubg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQYIrdpBTu06aaTBf5L/58VD8MMAY66p+J+CC/NfcpAM0tqQ1ufXfzdfD9kyfatjY
 FoDQJqdaMBer7rW5MmZFDFSB7YJoSOAAphViEiMqV6F0w4wRzwUEMV8Frkdm030noy
 dUDdGp/nA5EmakAK7J6Bxhw7t2JdR9VNqKpjB5FXvz5Is0F5sY4dR1mjoatC0SsyBo
 4oXNi7qsxdDJgwnTS7ZGXxg0py7su+crRK/UKbEn8/kPz7hf9gTQTbpNfc+TSMzIO9
 lLUo9mEmmErSo9jeYgp3yP1GpRPqlpJMWYg5++heNgzS1Bc9IdNieKUymqyaoQPbOh
 Uxrr+2kQTpa/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FQYIrdpB
Subject: Re: [Buildroot] [PATCH 1/1] package/xterm: bump to version 384
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

Fabrice, All,

On 2023-09-19 23:04 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2023-40359: xterm before 380 supports ReGIS reporting for
>   character-set names even if they have unexpected characters (i.e.,
>   neither alphanumeric nor underscore), aka a pointer/overflow issue.
>   This can only occur for xterm installations that are configured at
>   compile time to use a certain experimental feature.
> - Update COPYING hash (update in year and version)
> 
> https://invisible-island.net/xterm/xterm.log.html#xterm_384
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Since it contains a security fix, I tweaked the commit log accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/xterm/xterm.hash | 4 ++--
>  package/xterm/xterm.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xterm/xterm.hash b/package/xterm/xterm.hash
> index 12cd2e639b..1a2ad8fea0 100644
> --- a/package/xterm/xterm.hash
> +++ b/package/xterm/xterm.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after checking pgp signature
> -sha256  1e5bb7aad068fb31d6d3cbb77f80c7ad1526cd4c956a4ddcf2c5cf28af5334e1  xterm-376.tgz
> +sha256  31ef870740ceae020c3c4b4a9601c7f47bfd46672c1aaf2d213a565d64cbc373  xterm-384.tgz
>  # Locally calculated
> -sha256  9521ef761474cd31ea406f56a751646a7b42a9287cdc6f2f8e52ed4c4d2a73e7  COPYING
> +sha256  98d02d0b7f7b8aabb742b05e6960caaa9ae20e26d2f0d0dc57808362f2ac79bc  COPYING
> diff --git a/package/xterm/xterm.mk b/package/xterm/xterm.mk
> index d01b608d99..2fc2f734c8 100644
> --- a/package/xterm/xterm.mk
> +++ b/package/xterm/xterm.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XTERM_VERSION = 376
> +XTERM_VERSION = 384
>  XTERM_SOURCE = xterm-$(XTERM_VERSION).tgz
>  XTERM_SITE = http://invisible-mirror.net/archives/xterm
>  XTERM_DEPENDENCIES = ncurses xlib_libXaw host-pkgconf
> -- 
> 2.40.1
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
