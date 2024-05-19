Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93698C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 07:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39FA6400D8;
	Sun, 19 May 2024 07:46:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1s7Sw8t_ogKQ; Sun, 19 May 2024 07:46:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4104B400EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4104B400EA;
	Sun, 19 May 2024 07:46:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFC2E1C3B66
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 07:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C5FFC60622
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 07:46:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEqm_Iy-0-zx for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 07:46:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71F55605F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71F55605F1
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71F55605F1
 for <buildroot@buildroot.org>; Sun, 19 May 2024 07:46:29 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id DB14F13F86E
 for <buildroot@buildroot.org>; Sun, 19 May 2024 09:46:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 May 2024 09:46:25 +0200
Date: Sun, 19 May 2024 09:46:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Message-ID: <ZkmuURGjDJb7eDIF@landeda>
References: <cover.1716063903.git.yann.morin.1998@free.fr>
 <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9acaf4118aa1e3ba7ad9e0516a78273af7d05d3c.1716063903.git.yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1716104786;
 bh=4G4M8O7k7ZIoq7Bg1LX0a+XF2yrPATT3dV4Iwck34hE=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=PDZKggbStyp9J9dPEWpy4/m212sU9K607Z1yi1Qk+Upt1ppQ/cT7jnLbPGZI/HcIA
 7h/9TqZYJZ+g2tN0k3RmTKwfZ6mynUL0NT+2U7P225MQK7VOtFSA8GKCLeXV6DNgCz
 GwEXgPv9vSZeM1HaDNDerMiNgJpaZUtarRtaouRLInpbZELXuDEbtTuVYvUCZogCIo
 fV6WdJ+LrfwCD7g3UgGuGahh7TmyrAiSRK+lI6ctnfDJ+1f3t1Sc5EC/DiQQ7aWIjK
 0659Jz3p3RnKRznGZC+ZHwK011U8pa5x3o48pPpEk83NpH3ElTFJWKj6QJ6Wi1Q5u7
 MV34fEZAX/oOQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PDZKggbS
Subject: Re: [Buildroot] [PATCH 1/2] support/download: introduce curl
 backend for FTP transfers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All,

On 2024-05-18 22:25 +0200, Yann E. MORIN spake thusly:
> Recent versions of wget, starting with wget 2.0, aka wget2 thereafter,
> no longer support FTP (nor FTPS, aka FTP-over-SSL). wget2 is packaged in
> Fedora 40, recently released; F40 does not even have the old wget
> available in its repository anymore.
[--SNIP--]
> diff --git a/Config.in b/Config.in
> index b5a94325c4..534efa4050 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -103,6 +103,10 @@ menu "Build options"
>  
>  menu "Commands"
>  
> +config BR2_CURL
> +	string "Curl command"
> +	default "curl -q --ftp-pasv --retry 3"
> +
>  config BR2_WGET
>  	string "Wget command"
>  	default "wget --passive-ftp -nd -t 3"
                  ^^^^^^^^^^^^^
I forgot to drop that in the series...

I'll sit on it for a little while, and respin later with that fixed...

Regards,
Yann E. MORIN.

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
