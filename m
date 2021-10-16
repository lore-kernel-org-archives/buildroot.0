Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988D3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:36:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2A7061213
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:36:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F2A7061213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B19C76069C;
	Sat, 16 Oct 2021 07:36:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vc0PNalEUR-l; Sat, 16 Oct 2021 07:36:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06E0F6067F;
	Sat, 16 Oct 2021 07:36:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A3AE1BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:36:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38A684061A
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:36:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ipfOj61KlchX for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:36:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EB5140603
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:36:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B46797802BE;
 Sat, 16 Oct 2021 09:36:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634369793;
 bh=ZtzJ5jJ7wtL1R4J7kKN6sxasv0LX0JVWMXv25yZNDNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qL1sSXu8IC6A2cFq5OW0v5/wPQyadVWuxQx7BA3Qu9tKiqt8TRV97pyaUowsJW8LR
 JTDq6w2LCiE5P3NIzx0fgojucCv6zvD5z5CCZ0tnazvUbGrEBs3qct5xYSs8B0cS8C
 kGY1T/bRACC/QCSSsVJQm6ZpNlvSzdcpoonpx+fGAAnwWrI+1vKGqVKM3hNN8dgYG8
 5LpUj7OOHArZitybkto8xk5/WVMvPZTGJq+YfN90vcX0LMg1a7j/PB8pRvV/p9GGAl
 vBi80Bc4EirpkRRIgo+b0qFtHGv0BOIVH+ZhNK1irQArUo9utG8X5FiurKv74/bW2J
 ziSIWwcrW2x9A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 09:36:27 +0200
Date: Sat, 16 Oct 2021 09:36:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <20211016073627.GB4165837@scaer>
References: <20211013162410.520492-1-yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013162410.520492-1-yann.morin.1998@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/dtbocfg: add missing comment about
 kernel dependency
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2021-10-13 18:24 +0200, Yann E. MORIN spake thusly:
> Commit b00b9c865d21 (package/dtbocfg: depends on kernel) forgot to add a
> comment when the kernel is not enabled.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Cc: Herve Codina <herve.codina@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dtbocfg/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
> index 862dc0ccc5..2b2a8538a3 100644
> --- a/package/dtbocfg/Config.in
> +++ b/package/dtbocfg/Config.in
> @@ -7,3 +7,6 @@ config BR2_PACKAGE_DTBOCFG
>  	  as a userspace API of Device Tree Overlay.
>  
>  	  https://github.com/ikwzm/dtbocfg
> +
> +comment "dtbocfg needs a kernel to be built"
> +	depends on !BR2_LINUX_KERNEL
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
