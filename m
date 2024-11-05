Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A877D3E779
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 22:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 188DB80EAA;
	Tue,  5 Nov 2024 22:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TzC9JPiqSiQR; Tue,  5 Nov 2024 22:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BB580ED8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29BB580ED8;
	Tue,  5 Nov 2024 22:39:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0738727F1
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016F780ED9
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HukuNeo6XFHG for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 22:39:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1F30C80ED8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F30C80ED8
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F30C80ED8
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 22:39:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 3A2A278034D;
 Tue,  5 Nov 2024 23:39:05 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46502])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 Nov 2024 23:39:05 +0100
MIME-Version: 1.0
Date: Tue, 05 Nov 2024 23:39:05 +0100
From: Julien Olivain <ju.o@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Cc: buildroot@buildroot.org, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
In-Reply-To: <20240827051631.234377-1-alistair.francis@wdc.com>
References: <20240827051631.234377-1-alistair.francis@wdc.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <b64f7f346ce3350571f00223b380d71d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730846348;
 bh=0DfqmpOtZLYN/5b1aYsHWZmcKQT0OeWVi6RtdyX+3eU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HJ278+xr92RjBCIavGLHll5IkipzFWq9GvhYp0/+if22cLx1vEfnD0xsos4AhybPB
 DQXnD+cU2TIe4vIOBLzzvXoqT/a0UMr4MvLS2QvSZ7ImSy4bX2B3rvuRofK2fmyMZh
 qMogMswQ52i5aLQs+HfCv/ehx3//8URyaGdbLl/bliXVA6vJ/2sq2hym0A3IPDlJhj
 D0dLCT+DJ5PwE2b+MyxNAORvYTqHcO/UrUlwXgelBjXcaUDoTfewKxoD+kRUwhfQ+i
 999M+PxLH74195iJrE/T7vyYwOG1cfBIqBLvOnJEy/X310jarvECQBGtFJIzlw6D3V
 jAG+SSB6Lya2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HJ278+xr
Subject: Re: [Buildroot] [PATCH] package/libspdm: Support spdm_context in
 the HAL
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

On 27/08/2024 07:16, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> This allows us to build libspdm with support for `spdm-context` in the
> HAL functions. This is required by `spdm-utils`, this macro will be
> dissolved in libspdm 4.x, with this feature being defaulted on.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Applied to master. Thanks!

> ---
>  package/libspdm/libspdm.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libspdm/libspdm.mk b/package/libspdm/libspdm.mk
> index e86a79ed67..2a76892737 100644
> --- a/package/libspdm/libspdm.mk
> +++ b/package/libspdm/libspdm.mk
> @@ -20,7 +20,8 @@ LIBSPDM_TARGET_CPU_FAMILY = $(call 
> qstrip,$(BR2_PACKAGE_LIBSPDM_CPU_FAMILY))
>  LIBSPDM_CFLAGS = \
>  	$(TARGET_CFLAGS) \
>  	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
> -	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0
> +	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
> +	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1
> 
>  LIBSPDM_CONF_OPTS = \
>  	-DARCH=$(LIBSPDM_TARGET_CPU_FAMILY) \
> --
> 2.45.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
