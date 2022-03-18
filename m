Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99362C433F5
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 21:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D4A60B24;
	Fri, 18 Mar 2022 21:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MCguF8d9NEtL; Fri, 18 Mar 2022 21:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF0060757;
	Fri, 18 Mar 2022 21:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD8431BF2CC
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9CF340395
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 21:33:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jEJGFdM2Ozyk for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 21:33:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C75740297
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:33:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20af:3c78:ddff:75e1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9D7EE13F86E;
 Fri, 18 Mar 2022 22:33:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647639226;
 bh=H12c9XOyWiN90Qmder0Mc0+L9nnJ1s41jEfuy5eSUeI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tlxoiIj1lJ3BrHspuIUqVWQln0foIK99rRz989esCzWWHdnbeRWOOtqDaWyhbQaR7
 LIzhaNli3X02HBfamg43qX10hEP4z1NTN93VxIO06MVh7AAmLCVLyQQP0k/P3vDCTb
 b+fSY3sAmInYlVgqHhcEE3wMOiukyD6aEjvoqDeHXJHyDiea3Zg5nPYJw4/dN3x8Wm
 d9h48dWWOnW/jUUC8g640XZr008qxelOWDHzWcvlpodZcJQ211lDPvocYj/98JNs+z
 EHYiCjjqS+xk1VZuoYLCgDaKpqX391vamLdxM9lXuEfSIuTxeMPlWefFVGQfnrys+v
 q1ysenwGDwdrw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Mar 2022 22:33:44 +0100
Date: Fri, 18 Mar 2022 22:33:44 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220318213344.GK283544@scaer>
References: <20220318202044.10413-1-ps.report@gmx.net>
 <20220318202044.10413-4-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220318202044.10413-4-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 4/5] package/wget: add optional c-ares
 dependency
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

Peter, All,

On 2022-03-18 21:20 +0100, Peter Seiderer spake thusly:
> - add optional c-ares dependency

Again, not very usefull... But there isn't much to say in this commit,
the title is far sufficient, so an empty commit log is OK.

(Who would have guessed I would ever say that? Who'd have bet? ;-) )

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - split out from original patch
> ---
>  package/wget/wget.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index d0556e323c..69ca8f261c 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -63,6 +63,13 @@ else
>  WGET_CONF_OPTS += --without-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_C_ARES),y)
> +WGET_CONF_OPTS += --with-cares
> +WGET_DEPENDENCIES += c-ares
> +else
> +WGET_CONF_OPTS += --without-cares
> +endif
> +
>  ifeq ($(BR2_PACKAGE_PCRE2),y)
>  WGET_CONF_OPTS += --disable-pcre --enable-pcre2
>  WGET_DEPENDENCIES += pcre2
> -- 
> 2.35.1
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
