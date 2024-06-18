Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB94BC2BA1A
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 10:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78439404C5;
	Tue, 18 Jun 2024 10:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TEBcSgTslCZ3; Tue, 18 Jun 2024 10:18:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3276640578
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3276640578;
	Tue, 18 Jun 2024 10:18:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F7E01BF280
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 10:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4AE6D413B5
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 10:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Au7FmNGDHvt for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 10:18:07 +0000 (UTC)
X-Greylist: delayed 563 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 18 Jun 2024 10:18:06 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A14F5413A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A14F5413A0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A14F5413A0
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 10:18:06 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id C44742C838D0;
 Tue, 18 Jun 2024 12:08:40 +0200 (CEST)
Message-ID: <1014df63-f67d-45fd-9f9e-95ee1a17bd10@bubu1.eu>
Date: Tue, 18 Jun 2024 12:08:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: a.wellbrock@mailbox.org, buildroot@buildroot.org
References: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
Content-Language: en-US
In-Reply-To: <20240617180157.3771298-1-a.wellbrock@mailbox.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1718705320; bh=Fd4VifaJNKLuUtEMkiLIifar3iyVScQ+88ZZPFN3aH4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=ZOqHvNAo0GsaOiARFaA8h9BWAhHfYJZ6NuVvifLqQd6WhvfCYURLePWQDjBDSE5Px
 omUADS1/O8T1FL63hvQ70ZV9GXR20Dr7etbgQeAA0SQIEiGcirILdEXfy/pEqgUmjo
 +0xvkMtJs1VJ9ZxIQJHS2CXin3swO7iyqAv7D2WR4a4nxg2px7h1M7JHcG9Zrwarsq
 /Ce1AxS/1aqE5TvB9iv0giHD68clS0k8GJFY55OrIs/q8NabqqTPJuhDYTczMBWjzD
 /B7r9BsYTS8T76Gbg3M9tdO/MLkOHktZ8qXf8weDc97YKwIcyIDoHH+5yDC1LDGMB/
 lVIRsWJ7pvqhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=ZOqHvNAo
Subject: Re: [Buildroot] [PATCH 1/1] package/c-ares: update site url
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: alex <alexander.wellbrock@othermo.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alex,

On 17.06.24 20:01, Alexander Wellbrock via buildroot wrote:
> From: alex <alexander.wellbrock@othermo.de>
> 
> Download URLs changed after hosting of the c-ares website changed
> ownership:
> https://daniel.haxx.se/blog/2024/06/06/bye-bye-hosting-c-ares-web/
> 
> This cannot be fixed upstream as github pages does not support .htaccess
> files according to:
> https://github.com/c-ares/c-ares.github.io/issues/2
> 
> Signed-off-by: Alexander Wellbrock <a.wellbrock@mailbox.org>
> ---
>   package/c-ares/c-ares.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
> index c4441255a2..a75a40da70 100644
> --- a/package/c-ares/c-ares.mk
> +++ b/package/c-ares/c-ares.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   C_ARES_VERSION = 1.27.0
> -C_ARES_SITE = http://c-ares.haxx.se/download
> +C_ARES_SITE = https://github.com/c-ares/c-ares/releases/download/cares-1_27_0

Sorry, I missed that yesterday, this should use the github site helper 
macro like this:

C_ARES_SITE = $(call github,c-ares,c-ares,v$(C_ARES_VERSION))

With the additional benefit of not having to change the SITE variable 
for every version again here.

>   C_ARES_INSTALL_STAGING = YES
>   C_ARES_CONF_OPTS = --with-random=/dev/urandom
>   C_ARES_LICENSE = MIT


Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
