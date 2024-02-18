Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D884FC48BF6
	for <buildroot@archiver.kernel.org>; Sun, 18 Feb 2024 19:44:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 854C34025E;
	Sun, 18 Feb 2024 19:44:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id piiCnemnEDpx; Sun, 18 Feb 2024 19:44:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DBF6402DA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBF6402DA;
	Sun, 18 Feb 2024 19:44:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D54E21BF83B
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC4E580EE1
 for <buildroot@lists.busybox.net>; Sun, 18 Feb 2024 19:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IbW3m2iIlwLC for <buildroot@lists.busybox.net>;
 Sun, 18 Feb 2024 19:44:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C61AD80EBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C61AD80EBA
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C61AD80EBA
 for <buildroot@buildroot.org>; Sun, 18 Feb 2024 19:44:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 944E213F81D;
 Sun, 18 Feb 2024 20:44:25 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Feb 2024 20:44:25 +0100
Date: Sun, 18 Feb 2024 20:44:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <ZdJeGdKHCcQaMiKM@landeda>
References: <20240218184536.1922309-1-giulio.benetti@benettiengineering.com>
 <20240218184536.1922309-9-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240218184536.1922309-9-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1708285476;
 bh=gKHDo6kIAmWbhRPwtpm05w8Y6exTwF9JuyhruZbtI18=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K0akHfkwPrYCqW4mgklu1yJ/ys7NO5RoUe2ThhcbEFqZ2DGTI+F+y4111rbZWHVjg
 SdjmUyWJlizmnPPBt+aAODxMwiLgP2qX0xnDlj7355CxFO1Nt4OAcpw1Jp+nutCceP
 qKAnSI3wQGuXl6wKrO/n5c5I7qJCxz028jhwv0BR4Zdj1NQEFWWSW+4p3DfhFuw57v
 1BNGI2monD15Rjn+cBcMkGUxbCeAmoa6dmP0Mnh72X6MUUuYodtLd+CGxvSaHxd23C
 9dwdxQbgiQVzczGiDkMMT/0Z7JRSyPIkp9cJpvu4CCrMCU1ey9YXncUDg/k6yuJGE+
 JOv2tj9jPDOKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=K0akHfkw
Subject: Re: [Buildroot] [PATCH 8/8] toolchain: remove binutils bug 27597
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Pierre Ducroquet <pinaraf@pinaraf.info>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, all,

On 2024-02-18 19:45 +0100, Giulio Benetti spake thusly:
> Binutils bug 27597 is not present anymore in Buildroot so let's remove it.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  toolchain/Config.in | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index 407a03c42e..9e6cff1950 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -71,12 +71,6 @@ source "package/gdb/Config.in.host"
>  
>  comment "Toolchain Generic Options"
>  
> -# https://sourceware.org/bugzilla/show_bug.cgi?id=27597
> -# Affect toolchains built with binutils 2.36.1, still not fixed.
> -config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597
> -	bool
> -	default y if BR2_nios2

As I suggested in the cover letter, and that I'll duplicate here so it
is recorded with Patchwork, don't remove the symbol. Instead, just drop
the default, and have the sourceery niosII toolchain select it.

Regards,
Yann E. MORIN.

>  # https://sourceware.org/bugzilla/show_bug.cgi?id=30730
>  # Affect toolchains built with binutils 2.40, still not fixed.
>  config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
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
