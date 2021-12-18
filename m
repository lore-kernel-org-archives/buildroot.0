Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ADAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 21:08:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB7084D38;
	Sat, 18 Dec 2021 21:08:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1B7_j47pq7fb; Sat, 18 Dec 2021 21:08:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0CA584CD3;
	Sat, 18 Dec 2021 21:08:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 637741BF2A0
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 508C24012B
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 21:08:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7W3zRYM_VCKf for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 21:08:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45EE340022
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 21:08:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 3A70B5FF3F;
 Sat, 18 Dec 2021 22:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639861726;
 bh=fLHWImB1U4pnHZUvc5XA7m2zklEtlqH0uI6C5bTWGQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ePaxOLb8M0Eac7RH/nR5Zys8++02WF4/g1kzkkv4tCF/G9h3RgWq95n4hLHPIRH7f
 aCn7SsJDlQ8nsKKD/yqi0xetbuUI6RLwm0aEdDwHQyJfkAB4IqNyBLBMLisOWshzgI
 ZmCHD/AQQ32is4OOsCK/L2EY9ADzuDdDoIdb3QkzPssK+HuuSheuVveCDC755tsX9/
 IQyw2IiQdMb7QCK26rVaw8zKZlSdGfhEnr3MVElI6WCE6LDxAU6Mb/DQBm19075IwW
 +wWroYDf9uFoRB1r2tfeZzUJ7vrKD5EddNwh5umT3dyDRAdN1LdC2v6a2RE4Pgc8+V
 2Bxkcin4zG5Ig==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Dec 2021 22:08:39 +0100
Date: Sat, 18 Dec 2021 22:08:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211218210839.GM2603@scaer>
References: <20211218210359.2092979-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218210359.2092979-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: rename the
 stm32f4?9_disco_defconfig entries
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
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2021-12-18 22:03 +0100, Yann E. MORIN spake thusly:
> Commit 494807e28dd4 (configs/stm32f4{2|6}9_*_defconfig: rename
> configurations) forgot to also rename the corresponding entries
> in the DEVELOPERS file.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Dario Binacchi <dariobin@libero.it>
> Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 61e3ea4381..35f3be81b8 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -529,8 +529,8 @@ F:	package/tini/
>  N:	Christophe Priouzeau <christophe.priouzeau@foss.st.com>
>  F:	board/stmicroelectronics/stm32f429-disco/
>  F:	board/stmicroelectronics/stm32f469-disco/
> -F:	configs/stm32f429_disco_defconfig
> -F:	configs/stm32f469_disco_defconfig
> +F:	configs/stm32f429_disco_xip_defconfig
> +F:	configs/stm32f469_disco_sd_defconfig
>  
>  N:	Christophe Vu-Brugier <cvubrugier@fastmail.fm>
>  F:	package/drbd-utils/
> -- 
> 2.25.1
> 

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
