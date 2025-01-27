Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41787C02188
	for <buildroot@archiver.kernel.org>; Mon, 27 Jan 2025 20:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E89E481148;
	Mon, 27 Jan 2025 20:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zg7IB_ItzT_o; Mon, 27 Jan 2025 20:43:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E965B81149
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E965B81149;
	Mon, 27 Jan 2025 20:43:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B1FEAF7
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C83481148
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RPkZPLY0lb9B for <buildroot@buildroot.org>;
 Mon, 27 Jan 2025 20:43:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 21C1381145
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C1381145
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 21C1381145
 for <buildroot@buildroot.org>; Mon, 27 Jan 2025 20:43:28 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 4338CB00563;
 Mon, 27 Jan 2025 21:43:19 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43264])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Jan 2025 21:43:19 +0100
MIME-Version: 1.0
Date: Mon, 27 Jan 2025 21:43:19 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Adam Duskett
 <adam.duskett@amarulasolutions.com>, Daniel Lang <dalang@gmx.at>, Eric Le
 Bihan <eric.le.bihan.dev@free.fr>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
In-Reply-To: <20250118083837.2883279-1-bernd@kuhls.net>
References: <20250118083837.2883279-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.9
Message-ID: <65280a0983bcded1d95cb52d3ac3d827@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738010605;
 bh=meRW/vSPBLOTP29JEvV8+1n6mTC3pDzmceRLEc1W7KA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Wq9fI3dONj9ZnAw3Vyf5bpzQFdAUHWjr+eXlvvtH1e7WG5QJQaeANsmN9uGxx/tle
 PYV1iw9d6N5W5/LrXuIH+PLiRioEik6fqWfVs+Gwp6UrvfjvF8Vpn2T68cAbcEzf/Z
 MDq6QwIKV+RyP0lPT5jWNu7QTfSpLMCzbmYSk/VSP+8tRTvQGCLYpFzF9mu/xDimKJ
 YvDN/1N1rLDCDR2mO5XzuPWpflsuGQ06ShWmtDBTJ5TX86OTM/535P4eQZvufetjN3
 MchzpNLchMEqPWOKveAlF4zlXu12AxKvMyACw0MldoDiIV9rasIEJJwkzsGVlfxjA6
 G13KsQaIr0kmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wq9fI3dO
Subject: Re: [Buildroot] [PATCH 1/6] package/libdrm: add host variant
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thank you for the patch.

On 18/01/2025 09:38, Bernd Kuhls wrote:
> Needed for mesa3d bump to 24.1.0.

Could you elaborate a bit more in the commit log, on the reason why
host-libdrm is needed?

My understanding is that:
host-libdrm is needed by host-mesa3d, which is needed by (target)
mesa3d, when enabling the Gallium Iris driver.

It seems very specific, for now, to this Iris driver.
It could be helpful to record this information in the commit log
for future debug or maintenance.

> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libdrm/libdrm.mk | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
> index 9d463ca01e..a8a912859e 100644
> --- a/package/libdrm/libdrm.mk
> +++ b/package/libdrm/libdrm.mk
> @@ -116,4 +116,25 @@ else
>  LIBDRM_CONF_OPTS += -Dtests=false
>  endif
> 
> +HOST_LIBDRM_CONF_OPTS = \
> +	-Damdgpu=disabled \
> +	-Dcairo-tests=disabled \
> +	-Detnaviv=disabled \
> +	-Dexynos=disabled \
> +	-Dfreedreno=disabled \
> +	-Dfreedreno-kgsl=false \
> +	-Dinstall-test-programs=false \
> +	-Dintel=disabled \
> +	-Dman-pages=disabled \
> +	-Dnouveau=disabled \
> +	-Domap=disabled \
> +	-Dradeon=disabled \
> +	-Dtegra=disabled \
> +	-Dvc4=disabled \
> +	-Dvmwgfx=disabled \
> +	-Dtests=false \
> +	-Dudev=false \
> +	-Dvalgrind=disabled
> +
>  $(eval $(meson-package))
> +$(eval $(host-meson-package))
> --
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
