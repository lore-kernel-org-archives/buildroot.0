Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A31C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DA8080E4D;
	Sun,  7 May 2023 21:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DA8080E4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pcu0Cjrj6HwM; Sun,  7 May 2023 21:48:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19A5981842;
	Sun,  7 May 2023 21:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A5981842
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 802571BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59CC040642
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59CC040642
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJu5lFBSeNqa for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:47:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B36940639
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B36940639
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:47:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id C630920039F;
 Sun,  7 May 2023 23:47:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:47:24 +0200
Date: Sun, 7 May 2023 23:47:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230507214724.GU252090@scaer>
References: <SN4P221MB0682A85E1D08A44BED847C8EA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682A85E1D08A44BED847C8EA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683496046;
 bh=ZZeXzadd8QGWLunhTpZcl4WzikzWPv6jJjM2c+XyW3s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=c1eIlFSd6dJyxQ90Pap02SjTVNOY8PRDQEP62mvn83TSoLwDOatputKKdwhEloHGR
 dVMnzRHfL5DqNpwJF5WEfnJ1hRV/LIITl2JcgsIcvDA/78etkxf6MZg2DZSNHPazFu
 GO4DB1l9akFxDBVYMilo8mnESAmb+W2wUUjCD9jm8xC6SI1F/3c7MNoRtSSl7b4F2C
 n4QF/wEkOZxF80n6mDCdsHm+siwN2xP6sQuOHvDCilF/RgTpn3at6UA65xFPffC7Oj
 BSBPhxSoxnfeN7ErZ7mLebNn80NfyBQPNQFTgmOYnSWmHFK/A9cq4PcqpO+4NXQtEo
 JJzNOFbZONCRw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=c1eIlFSd
Subject: Re: [Buildroot] [PATCH v2 1/5] package/rpm: drop remnants of custom
 CFLAGS
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

James, All,

On 2023-05-07 17:34 -0400, James Knight spake thusly:
> Drops the use of `RPM_CFLAGS`, which their use has been obsolete when
> this package bumped to v4.17 [1].
> 
> [1]: 429e247b869027f6ecd4efa0f31bccd2765e3875
> 
> Signed-off-by: James Knight <james.d.knight@live.com>

Whole series applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>   - This patch has been split across multiple patches; no changes to the
>      implementation itself (suggested by Yann E. MORIN)
> ---
>  package/rpm/rpm.mk | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index fc57a14fd6518ddcd65a90f294ecabbca8057f67..08bcb85ae41701a192330732984401d7092cd492 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -104,7 +104,6 @@ endif
>  # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
>  RPM_CONF_ENV = \
>  	ac_cv_prog_cc_c99='-std=gnu99' \
> -	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
>  	LIBS=$(TARGET_NLS_LIBS)
>  
>  $(eval $(autotools-package))
> -- 
> 2.40.1.windows.1
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
