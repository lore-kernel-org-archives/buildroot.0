Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C594C7EE30
	for <buildroot@archiver.kernel.org>; Tue,  1 Jul 2025 07:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4142B4076E;
	Tue,  1 Jul 2025 07:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oaf9NvHYKZo6; Tue,  1 Jul 2025 07:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BF3440782
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7BF3440782;
	Tue,  1 Jul 2025 07:00:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53694DF
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 447594076E
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tf3Nn-cBSjWe for <buildroot@buildroot.org>;
 Tue,  1 Jul 2025 07:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4170140765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4170140765
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4170140765
 for <buildroot@buildroot.org>; Tue,  1 Jul 2025 07:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AF122B97003B; Tue,  1 Jul 2025 08:51:01 +0200 (CEST)
Message-ID: <d04fd50d-e790-49d8-b057-eebb532a7bf1@rnout.be>
Date: Tue, 1 Jul 2025 08:50:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250628225445.827543-1-ju.o@free.fr>
 <20250628225445.827543-2-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250628225445.827543-2-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 2/2] package/gcc: add logic to hide gcc 15
 for unsupported CPUs
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 29/06/2025 00:54, Julien Olivain via buildroot wrote:
> This logic is to prepare for future gcc versions and their new
> supported CPUs. As of today, gcc 15 is the latest gcc version
> and all architectures and CPUs in Buildroot are supported by
> this version.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   package/gcc/Config.in.host | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index 8640280fdf..23fcaa9825 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -43,6 +43,7 @@ config BR2_GCC_VERSION_14_X
>   
>   config BR2_GCC_VERSION_15_X
>   	bool "gcc 15.x"
> +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16

  With this, I notice that since GCC 13 we're also missing it in 
toolchain-external-custom...

  Regards,
  Arnout

>   	# powerpc spe support has been deprecated since gcc 8.x.
>   	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
>   	depends on !BR2_POWERPC_CPU_HAS_SPE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
