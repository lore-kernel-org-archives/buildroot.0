Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB243C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 10:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3D880E78;
	Wed,  7 Aug 2024 10:42:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHDVn-VPswW1; Wed,  7 Aug 2024 10:42:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8EF4180EA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EF4180EA5;
	Wed,  7 Aug 2024 10:42:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C8C461BF97F
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B65524017B
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 10:42:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hH2dGBcbGrfI for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 10:42:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 58945400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58945400A4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 58945400A4
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 10:42:29 +0000 (UTC)
Received: from [192.168.178.36] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 3A5B72C8021C
 for <buildroot@buildroot.org>; Wed, 07 Aug 2024 12:42:27 +0200 (CEST)
Message-ID: <cf493046-a460-4d97-a8eb-57b7a76c329e@bubu1.eu>
Date: Wed, 7 Aug 2024 12:42:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20240807103900.125819-1-buildroot@bubu1.eu>
Content-Language: en-US
In-Reply-To: <20240807103900.125819-1-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1723027347; bh=+/wcU7WNmCNC6XhNHjuMyOnHfz/8V2Dk9gV/Uk9RQgU=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=LM3O/lkGG+tL3WG42pPBZO5vieDbpe4pBAxBTq8Kn+NpQTlCmgTRI3ThMm8seZQf3
 5xEcsUzpFvmkSJ12Ufs6cjAI1mjGUQsxRKBjDYRquuTB8jAImVvI9ft0XAf0QQAY8H
 AG5ksXnrrsyKKdaWtyqfCLTo0zF/k9mwEx/hIfqelKTI3+zj0oSDOp+s+aGlA4B1uA
 AGdSP3qJFfrD38tigiGxnWQ4C6uJokX1HenH7J499kab1Bl4RFXFFtwGprqNvWIHoP
 2Plcd/5e38SOT8KMmg+5DKjJOXjGEMHTiBJlhWcROG46BFHfgf1a5as8dFCK5NzgDO
 h50xZ8M5ganog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=LM3O/lkG
Subject: Re: [Buildroot] [PATCH] package/nethogs: needs toolchain with C++
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07.08.24 12:39, Marcus Hoffmann via buildroot wrote:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

I forgot to add a link to the autobuild failures this fixes:

http://autobuild.buildroot.net/results/a250f6f3e93ceddad2d4c7cd1f29233fce2b327e
http://autobuild.buildroot.net/results/b68e8c601b31c70bc30cdfe913f7988f54255dbf
http://autobuild.buildroot.net/results/298090dfb9db42ba9f219d2c268bc798373142c7
http://autobuild.buildroot.net/results/b59851d542418ad0f40d86b32dc7573248233de4
http://autobuild.buildroot.net/results/18cc7058d567916c7d2bfb16b7808b71ed731948
http://autobuild.buildroot.net/results/786e68c8c397038511db4e8bea589839a7d9b056
http://autobuild.buildroot.net/results/8eddfca525f6951e6d11184e312cffccfc443ba8
http://autobuild.buildroot.net/results/bdfc7b723abdf4aea48e40e789883405061e4e1c

> ---
>   package/nethogs/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/nethogs/Config.in b/package/nethogs/Config.in
> index 2d6b44739c..fe5a4cdba4 100644
> --- a/package/nethogs/Config.in
> +++ b/package/nethogs/Config.in
> @@ -1,5 +1,6 @@
>   config BR2_PACKAGE_NETHOGS
>   	bool "nethogs"
> +	depends on BR2_INSTALL_LIBSTDCPP
>   	select BR2_PACKAGE_LIBPCAP
>   	select BR2_PACKAGE_NCURSES
>   	help
> @@ -8,3 +9,6 @@ config BR2_PACKAGE_NETHOGS
>   	  do, it groups bandwidth by process.
>   
>             https://github.com/raboof/nethogs
> +
> +comment "nethogs needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
