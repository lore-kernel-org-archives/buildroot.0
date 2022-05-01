Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E8C1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 19:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF27414C6;
	Sun,  1 May 2022 19:43:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1xeXIwwDXty; Sun,  1 May 2022 19:43:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66250408A0;
	Sun,  1 May 2022 19:43:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F0D91BF3FB
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8CDAF403B7
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 19:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0KhyEx5LWGl for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 19:43:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A53294015F
 for <buildroot@buildroot.org>; Sun,  1 May 2022 19:43:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9448:1aca:a169:bea6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 1D4937802FE;
 Sun,  1 May 2022 21:43:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651434230;
 bh=WlgzTj3icad4N+2LWRdRWd24BCwQ8Wd4mlHNm7pU6nE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q5SsiUNNjSJNM/mgIkCb6h4dgnoKhTr5aZAZGUQpexrQFf3/IKgDMljxKizCpogZd
 Rua5pthZv3gZGXSeI6eUEkF5w7hph+mzCu3Py6Y9FYZCvjNDqP5eahc3FOcvv5BCC7
 EgNdhHuobK8486dVIp2bH6DCuszNf78hYmb0f5qGw4ZSKkaBcVBjYDenIslikDknaz
 xXNEratCl1GtpZvee5yTGRO6Xi1clc5+cmddlDeb9XpwuQtSqzjiRUMSWGuGAG9JpX
 WQVAOe8vUrR5Z/svSuZ5U9Y5gRtNTNdK1n91ZXt3jhVjwIgmtdcnVCO8WdfwbUSPqF
 d7sz9lKryfg9w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 May 2022 21:43:47 +0200
Date: Sun, 1 May 2022 21:43:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220501194347.GO3624965@scaer>
References: <20220430185701.606071-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430185701.606071-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/tbb: always build Release
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

Arnout, All,

On 2022-04-30 20:57 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> When tbb is built in Debug mode, it installs libtbb_debug.so instead of
> libtbb.so. This confuses downstream packages that want to link with it
> (e.g. sysdig).
> 
> Always build in Release mode. This means that BR2_ENABLE_RUNTIME_DEBUG
> has no effect for this package, but that shouldn't be a bi issue.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tbb/tbb.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> index afe756a85a..fc720fd2f5 100644
> --- a/package/tbb/tbb.mk
> +++ b/package/tbb/tbb.mk
> @@ -13,6 +13,7 @@ TBB_CPE_ID_VENDOR = intel
>  TBB_CPE_ID_PRODUCT = threading_building_blocks
>  
>  TBB_CONF_OPTS = \
> +	-DCMAKE_BUILD_TYPE=Release \
>  	-DTBB_STRICT=OFF \
>  	-DTBB_TEST=OFF
>  
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
