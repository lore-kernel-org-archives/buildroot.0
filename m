Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BB5C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3288581B69;
	Fri,  2 May 2025 10:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfGbVM2Zomxx; Fri,  2 May 2025 10:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E61B81E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E61B81E11;
	Fri,  2 May 2025 10:42:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C5BA6EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ACAFF40B1F
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4zj2ZzV16Qo for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:42:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1A4040B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1A4040B0E
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1A4040B0E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DD3B61C1113; Fri,  2 May 2025 12:42:00 +0200 (CEST)
Message-ID: <ed4fa46b-0bf8-40ab-a855-a4dd841feb35@rnout.be>
Date: Fri, 2 May 2025 12:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <74ac3e89c91062ce3cba6da676623c69fb2eab0e.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <74ac3e89c91062ce3cba6da676623c69fb2eab0e.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182521; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LgsICnaHoRvruW5Xjdrlsnxu68IlevyIce3yVbUHAIE=;
 b=NvnO1VQD6aFVTi648azUHD52Gye4vNchVyw7zSrh+xy1soKv402QQh+8pU70TZG+6/+HXd
 0VyDM96TVQZUOvxO/YGZEzCSZDAwkCl4+cZaEWO1+qCInJvgDMI/nsrFK5zBO71FsT/SC7
 aOi471aB/50fCpj1StkNzUlXHlyrHa/0KbxiKrs5u8MWRPa1FEu3n8BSs/7XQuSftRV6xN
 Fm3e4XGTrMPYNJWLGU46RirOrI78lVJU8XfowGORDDjqFtTUVZdjrg+cX6jyf/50/e7eqJ
 aIoy1FX1Tz33cV+hj1G3ZqU4IcshzO+DeiHoIPiP09uOeLm4L8b7glVgD4Bm3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=NvnO1VQD
Subject: Re: [Buildroot] [PATCH 08/29 v2] package/boost: move host variables
 closer together
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



On 09/04/2025 22:03, Yann E. MORIN wrote:
> Also, one item per line (chrono, container) in the list of libraries.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Michael Nosthoff <buildroot@heine.tech>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/boost/boost.mk | 71 +++++++++++++++++++++---------------------
>   1 file changed, 36 insertions(+), 35 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index c0d17f7670..044dd275b3 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -12,41 +12,6 @@ BOOST_LICENSE = BSL-1.0
>   BOOST_LICENSE_FILES = LICENSE_1_0.txt
>   BOOST_CPE_ID_VENDOR = boost
>   
> -# keep host variant as minimal as possible
> -# regex & system are needed by host-riscv-isa-sim
> -HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
> -	--without-libraries=$(subst $(space),$(comma),\
> -	atomic \
> -	chrono container \
> -	context \
> -	contract \
> -	coroutine \
> -	date_time \
> -	exception \
> -	fiber \
> -	filesystem \
> -	graph \
> -	graph_parallel \
> -	iostreams \
> -	json \
> -	locale \
> -	log \
> -	math \
> -	mpi \
> -	nowide \
> -	program_options \
> -	python \
> -	random \
> -	serialization \
> -	stacktrace \
> -	test \
> -	thread \
> -	timer \
> -	type_erasure \
> -	url \
> -	wave\
> -	)
> -
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
>   BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
> @@ -103,6 +68,42 @@ BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MA
>   BOOST_DEPENDENCIES += python3
>   endif
>   
> +# keep host variant as minimal as possible
> +# regex & system are needed by host-riscv-isa-sim
> +HOST_BOOST_FLAGS = --without-icu --with-toolset=gcc \
> +	--without-libraries=$(subst $(space),$(comma),\
> +	atomic \
> +	chrono \
> +	container \
> +	context \
> +	contract \
> +	coroutine \
> +	date_time \
> +	exception \
> +	fiber \
> +	filesystem \
> +	graph \
> +	graph_parallel \
> +	iostreams \
> +	json \
> +	locale \
> +	log \
> +	math \
> +	mpi \
> +	nowide \
> +	program_options \
> +	python \
> +	random \
> +	serialization \
> +	stacktrace \
> +	test \
> +	thread \
> +	timer \
> +	type_erasure \
> +	url \
> +	wave\
> +	)
> +
>   HOST_BOOST_OPTS += toolset=gcc threading=multi \
>   	variant=release link=shared runtime-link=shared -j$(PARALLEL_JOBS) -q \
>   	--ignore-site-config --layout=system --prefix=$(HOST_DIR) \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
