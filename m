Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8F1606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hqOdtURS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A18F81E1A;
	Fri,  6 Nov 2026 16:10:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id injTx8DBHc91; Fri,  6 Nov 2026 16:10:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 794AD81E18
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981433;
	b=kvLIONDt1pGefbdpf8edmXR0m9lqOWigWrpYLhvRLxJhWE8ugD+APdm9tBnoYUizNjHo
	 midGgE5ythoYD4bYl1xFCHn+myI0OY/LHd1LwrYb/ZB7IQJ8nh2sjBxVOlx9A9vFy2FEl
	 H3eKVrbB+FNzRY62RlAQF0PB7VRfPQsdhonkrzhDC7Ob27W5KkYaRfiM0H5b2ZAVjnmHk
	 ihXcc7iSIxU2Q9U7gtjdwZaw2S4dBxQRX/rgqSMSyOm4y/0QVef2Izqw9dhfcl9XIPTQD
	 5kQDx7frpMBqbvNG9HEoQwSXik8dv2B8CQfUxxrgpY//FZBjD30+VxE8pXSkgSJOLVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981433;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=AhhjiEDVIv9Q6rlP5k0QqJboQth+JOY08CijNh12Sjw=;
	b=N2AxE4Z+SC+8Xdpq5Zx7JHXF2HO1smIrw6KOpQ6fnp6otv/C7lmDzkVHgoH4XRAGmImQ
	 zVIZIOra6sGMoxffxAuIH4w9/lOZVCHOSic33/WnyTAUN++g4/EpjClKHeg8ykMoFvvSK
	 1u0/Ux93Rqn+h2sKmw1ytpNvTFZdgCAuE6JbjqwTP0NvmETHkwClfyK1ZeA5auAXRgQub
	 +E01691VkCEX9A+GU+Q49/vZq8dVnmetv4J2njJEp4P9AP/WqGh+0SegVepRpJP+oq1b4
	 bCYIRzjQ30DKJLZjTQ5v4kreourcIwCfHwPToSXeHVEGWYlBZQNfj8XSa7Y8YNqfawA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981433;
	bh=AhhjiEDVIv9Q6rlP5k0QqJboQth+JOY08CijNh12Sjw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hqOdtURSEZPMAj5NB4t6YAIzCKRDTM3jk/SWTk/sQp5JnL2lR9uxUt6Qi+dCUUTdp
	 sVKIF4CT1wjtRq9l0NgLPo0/XJfair2BgW1YZnDK3Fu7PwuJb4LJE8i62D3piI/LSz
	 2uvUqMGyurSu7EMMjbqTDEk6qiZmOkKUMMsp5GM7h//ve5dAgoHMHguAdLOHiFfZ7o
	 j3IiwdO2ab9cwqFXS787QFt29sufvaDqoD0G1wj7dLNPiK54UN0S6glCIiuBGxfbpL
	 6+fh71wMXjuor7wrt5InoAbg/faem4kXWSRz1Bom6U/NHYGSMEMKonLcf+/JKPxLgp
	 tG2bgEXN/W8+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 794AD81E18;
	Fri,  6 Nov 2026 16:10:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC2272E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BE070403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a5qpyeNpKhiv for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C0CB9400AF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C0CB9400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:30 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a5036bbac7so5215895e9.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981428; x=1794586228;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=cUIH/N7A9QKyOdmIW1MGv8dn8i65SMPOBsVDXjWN8Go=;
 b=jy3/MRNdoCC9VuI3kncj/wOtsrRQ1Im4QQ4Ro+phTuyUSznaPrTj3tk81P98piJz1Q
 ofe/nPiyTm2g2DR4aL9WznplgTvWI5Bsm8k2msBDTwjZ7jdfmDZeuAWZAhinBozmgerz
 CT5d8sMEHNfwOve4P9mlP98DXzfZibY1LXeWw8A0w8l6eCnPW+WGjjtIVsLNlH+boVyD
 Mhs57LCzt/TMSmippdrX4twZFa5r/Q0G7mwUfwpFR5NYc9AafMUf8ospkgSS7Zt49aeY
 VWOPdZMPtWcUcbi5ypRypKqhR0FInkNtfnnFARuca3ysBBoi8kX0U5lCgDVmJIKe5Qhl
 moaA==
X-Gm-Message-State: APuU4Z/P2otrldgKrlBetrni4Vko9NuT6ONXlRMTsGQv4aFqRBO4Zgzc
 O4sqFGm3mDIMCmtdYu4fdbD0xcg2HMPM+fJeJoysh3uB2S+AzblIV25IclemXFe/yxd6GfrZsui
 kuVzfwO0=
X-Gm-Gg: AYBFou1pI6H3mAuJAYitcG4IaA/uJNyYOfLtN+1LHsYGt8YD9ZM8YRe83ng0KmJEJAn
 0qpR7Edo0L60bdyhFT/RWXf8DC6yp5wzjMUldsp+meXq9qgtwBL7TjpZtEtuRmFMExcWY/Upnp4
 M8ZtZoq5wzTO1nWV4JKdm9MqpEEBVw1+8amc9h5lFkOokgOSHRDf9SSOHmL4PghSSCZnzBRhGJ5
 g7KxLn5gDZ3vD4wpP3SjFLcxf2llhgnv/oyl2YwlZ+gQIWxU2LmQoGAmMt933IUnSatdTeUY4vH
 ZLAdkDSFCWdov0qX2RzVrJfFOMNGFIB5HfRD2jy2d8as2cUciOgDU3vNvjIQ8KP+JF6f7ny011w
 k6/GFr4LOz43mlJbnJXGGmX2WSeTQTblwUVVQFKAGEpiRaOkCFijCvdW+U5PA6M+u9LTj/wucHh
 1ub0dxnIWo2AarpIm/CjH9BzWen0dRWbo9KFbgAC8bG7PRkZqTdzCcqPM48vfSPZy2fji72EGEq
 gT9gZGDeDhaHJKj03D6KepWIdlV4iaLfEzuUme5tysEVPSf6soYYquJ2GoirkCXzKILss0fnWgO
 csnSXHiiDMxv2L48Uw1UeiZHcOxjLGQ=
X-Received: by 2002:a05:6000:4025:b0:48c:77ad:d52d with SMTP id
 ffacd0b85a97d-49277d9c67dmr7131142f8f.43.1793981428320; 
 Fri, 06 Nov 2026 08:10:28 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d73286cdsm4073723f8f.28.2026.11.06.08.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:27 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:25 +0100
Message-ID: <20261106161026.607639-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029211140.1455177-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.15
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.15/ReleaseNotes?ref_type=tags
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 37dd1e6000..dc7d35fa67 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.14.tar.gz.sha256sum
> -sha256  182449ac1c8ff43278da27b69b02040e11d03d0327db6d9126e4190ec6235e4a  tor-0.4.9.14.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.15.tar.gz.sha256sum
> +sha256  1911f5b216a6814ed143a08bbcff1c6dc96d2ca3b505df9a21876080a92963f3  tor-0.4.9.15.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 49b9524c26..3f07cc356c 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.14
> +TOR_VERSION = 0.4.9.15
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
