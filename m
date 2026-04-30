Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2777DFF8873
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 12:41:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6F7D429D0;
	Thu, 30 Apr 2026 12:41:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5-SJpJI4O28; Thu, 30 Apr 2026 12:41:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E82F8429B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777552916;
	bh=92+SNyij8vlggiWf+i/m7Q9k/WfpTJ1gP4TJ3P5wnKA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oI1g3fQDmW4eylrtxQ8F6Ctzs6LndpvMV6EjdUvs8wAdq+0y1JYqWCrch1WOUe32L
	 buUGw21ovkTVt5fM3tDiXOjnVNXc2y7w/zlFPSMIKTV06W6eyYk/XQLINhtj2ztd0v
	 qQHUPHERPZmiz+46DRTVpqackym0V2h+/LsEC285pgOt68gbt1zqAg4m3fU9UsMfDj
	 VMHnsB9f7AV7md4LbADeadiDQ3HAa5dGFqkaXr1XGViEib0VC/HHl36pofs8BM6wuF
	 06Zt6oLVXYrNzn3Z3HUvARCWmQzPJp4Sgkyg/x4e0uOTGjyCnFRtI9XF79ZWO8XmK4
	 vd0B3QVi3c9CA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E82F8429B9;
	Thu, 30 Apr 2026 12:41:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E3AA192
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:41:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D274403D6
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:41:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uw3NtC2-01zB for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 12:41:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1DFBB4073C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1DFBB4073C
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1DFBB4073C
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 12:41:53 +0000 (UTC)
Received: from [172.18.252.108] (ip-185-104-138-116.ptr.icomera.net
 [185.104.138.116])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D0F042C86F8B;
 Thu, 30 Apr 2026 14:41:50 +0200 (CEST)
Message-ID: <87be7e74-d1d7-4116-890b-7ae7d6557017@bubu1.eu>
Date: Thu, 30 Apr 2026 14:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
 <20260425085657.474422-6-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20260425085657.474422-6-fiona.klute@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777552911; bh=3Qm/fJ7rrej0ax3tYLfP1A/Jk4NPsxn0xEeM56dyKTg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=IxTHpfQqloAzZjU1aEO+eysJmKtAAhVkmPEoaGdQmDl5YNrT44kfI/0RzjO5lOAjl
 8S9v/O7DWVJoxVfKIpusFs/xtzPcnXQTAdwnAJG8Sy1daAUtB58Me9XgkgEBJHxrW0
 woa8+YaN+2/H6H1m7Fv0fOT3xsroTP43CuAlrtqBRWgqApcP8cm15jipNLrvpWQ4gA
 /y40qfHStPD1HVraRQJCe72oU0eEbenm+BZ3JMMj4MVqJd82lzRYOh1bA6j+l+EYHp
 YaZwzu1vO76EiwGjnMwTNr19yP+n0SGGv619E/zCMK8sn6l4gW/pQtDHbNpgyZTfk6
 Wvk2gqeJQW0vA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=IxTHpfQq
Subject: Re: [Buildroot] [PATCH 5/5] package/kmod: enable dlopen() for
 compression libraries (if any)
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 4/25/26 10:56, Fiona Klute via buildroot wrote:
> With dlopen() enabled, kmod will load compression libraries only if
> actually needed (loading compressed modules into the kernel does not
> if the kernel can handle decompression, depending on its
> configuration), and only the needed one.

I don't think this is covered as part of the existing kmod test, right?
Could we add a test covering loading compressed modules without too much 
effort? There's probably a lot of possible variations here (kernel can 
load compressed modules on it's own, or not, and the various compression 
algorithms) but maybe some base functionality that this still works with 
this change can be covered by a test?

> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---
>   package/kmod/kmod.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index e1f713dc01..0afcad0d48 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -28,6 +28,10 @@ endif
>   
>   KMOD_CONF_OPTS += -Dfishcompletiondir=no -Dzshcompletiondir=no
>   
> +# load compression libraries (if any are enabled below) as needed
> +# using dlopen()
> +KMOD_CONF_OPTS += -Ddlopen=all
> +
>   ifeq ($(BR2_PACKAGE_ZLIB),y)
>   KMOD_DEPENDENCIES += zlib
>   KMOD_CONF_OPTS += -Dzlib=enabled

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
