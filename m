Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B898EF55102
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 17:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 840A581628;
	Sat,  7 Mar 2026 17:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQcAshMCZW7C; Sat,  7 Mar 2026 17:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 228E981586
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772903276;
	bh=7KAMdCjY/b5CDGYJAkTa0EDQb4vVWOf6WpnjdVwWjo0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RdYzg5eCRsH9R/dPismeeZyWPfyAJE9Kc2fvssmVZZihAKMWJLztqGS31WRHzD3ca
	 Gck9KRJGNp33vDrWhFiADTNiAUIi6StBc+nCHD24vuW9h6H7JVhNqIA13UyDTy3fDx
	 XPv2C5eV/Xogz3vaUPlnbFyqgNTCByIcji5dalia4KEM6dLOEA6lqxqqcY8GCoQXCM
	 eLyWwgkjvvbMLnFQj6mVUup5ewExqgUhZs6QEjp75pe+IJE5dgxLaK/JeG1p0Okbjg
	 fXqUzwOpFn3hs5nK2U+jAN0H77MGsoNKb3oAYJzvxcuanjNwZG5i5Rr+wRNzIjNGrP
	 rxbtgJrmSUbHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 228E981586;
	Sat,  7 Mar 2026 17:07:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F09F1223
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 17:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D50CA81586
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 17:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gdJrdkdbv50S for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 17:07:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AD3C2814C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3C2814C4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD3C2814C4
 for <buildroot@busybox.net>; Sat,  7 Mar 2026 17:07:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id D971F5FFBA;
 Sat,  7 Mar 2026 18:07:50 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 18:07:50 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 18:07:50 +0100
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
In-Reply-To: <20260307153929.384884-2-francois.perrad@gadz.org>
References: <20260307153929.384884-1-francois.perrad@gadz.org>
 <20260307153929.384884-2-francois.perrad@gadz.org>
User-Agent: Webmail Free/1.6.13
Message-ID: <907a398121ce011ac302cf4ff78de312@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772903272;
 bh=L4O+rHieSC/D3uILIo6WgxmXWyJ+3x6ZZEwsHEeIUZM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Z9MhB+27vDEh3p+GAi/6AhjqBv76mTakfYMyEFwFWMctUDc23wDcHrgoTErsz6DaZ
 /tLSpx8Rf4MMPTdbM+sEj4Fmu/OAFA+4MEz44ICTHIbVkTG9HDTXlxqdLBdOdBdnu4
 NRC1zuo84g+BcusWw1InkzryiW3jBrDP/W7VHGAKDW3NJ8/cXOKVJ3nEFeLWeZL/yC
 zqAoUmVC1U5AZFBOHyHLuBmMdhB9ys6g6ltC0Wh9xTQ5+FhjTKRP+wiiGQmKAR2zve
 K5LzmKIwR0p0F0ErZJijWRvglncSgy3Inb0Cf2XdCzgy0c52RkYsO/ONfd3z56e2VC
 Kd6wH0DXYAVpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z9MhB+27
Subject: Re: [Buildroot] [PATCH 2/2] package/ficl: bump to version 3.05
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/03/2026 16:39, Francois Perrad via buildroot wrote:
> - sources are now hosted on Github
> - ficl have its own LICENSE file
> - remove one upstreamed patch
> - support only static lib
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
[...]
> diff --git a/package/ficl/ficl.mk b/package/ficl/ficl.mk
> index da9a9a33f..6ef94f11e 100644
> --- a/package/ficl/ficl.mk
> +++ b/package/ficl/ficl.mk
> @@ -4,55 +4,27 @@
>  #
>  
> ################################################################################
> 
> -FICL_VERSION = 303
> -FICL_VERSION_SO = 3.0.1
> +FICL_VERSION = 305

This new version is introducing new build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2370467259

For reference, without this patch series, test-pkg is working:
https://gitlab.com/jolivain/buildroot/-/pipelines/2370474375

Maybe those two patches could be squashed in a single one.

Finally, while reviewing, I saw there is a newer version 3.06.
Maybe you could consider it?
https://github.com/jwsadler58/ficl/releases/tag/ficl306

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
