Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D19DFC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98F9240DE5;
	Fri,  2 May 2025 10:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWNB9iwbFj3O; Fri,  2 May 2025 10:42:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4DCF40DEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4DCF40DEA;
	Fri,  2 May 2025 10:42:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7EB35229
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7002383544
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rd4DZpvyDTkB for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 892978350D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 892978350D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 892978350D
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:42:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CE91E1C1113; Fri,  2 May 2025 12:42:08 +0200 (CEST)
Message-ID: <c8676d7b-39fe-4603-ac29-3a6b7ea99711@rnout.be>
Date: Fri, 2 May 2025 12:42:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <cover.1744229017.git.yann.morin.1998@free.fr>
 <4da58ad347f30da6f97e4fa8afc5a5304f536993.1744229017.git.yann.morin.1998@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <4da58ad347f30da6f97e4fa8afc5a5304f536993.1744229017.git.yann.morin.1998@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746182528; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Y/us/8o2bDU5UTs476lsqRra5a7T1sLW2IeFl6mY/IU=;
 b=eBv6uqmRCtHwUoM16R4PJMb97FbuMlUz/PjAE+FwN4blD3BVnhjb1YEKYSoglku6extvFA
 Nkqty8CwkGAtfgjDJdk+GWvMiXLC7Sd3FR/Bxl4p8wJ5ifhKzogGOwILlnXLLIrshVobRu
 dmirEZJHWEJv5MyyJV9mVRmOyNvBd/ueUNBiVoOtIsiev1MY/XIF165IbyXIt7DF4qnJni
 fhFrbI7Vk1wTbP/Ijj2W6ezYqVN4iiczyvlIyGTkEDiimHhMF15NCR9CLqI43WuJIo140U
 9/3L2I2AEuFr/VHi4Ql4Q5fp2CDtiFW035GYxBGN4kgV/86uCPUdYVrB/uDdiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=eBv6uqmR
Subject: Re: [Buildroot] [PATCH 09/29 v2] package/boost: move taget library
 selection variables closer together
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
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Michael Nosthoff <buildroot@heine.tech>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/boost/boost.mk | 66 +++++++++++++++++++++---------------------
>   1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/package/boost/boost.mk b/package/boost/boost.mk
> index 044dd275b3..1dcc4a4b3a 100644
> --- a/package/boost/boost.mk
> +++ b/package/boost/boost.mk
> @@ -12,39 +12,6 @@ BOOST_LICENSE = BSL-1.0
>   BOOST_LICENSE_FILES = LICENSE_1_0.txt
>   BOOST_CPE_ID_VENDOR = boost
>   
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_JSON),,json)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
> -BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
> -
>   BOOST_TARGET_CXXFLAGS = $(TARGET_CXXFLAGS)
>   
>   BOOST_FLAGS = --with-toolset=gcc
> @@ -152,6 +119,39 @@ endif
>   BOOST_DEPENDENCIES += $(if $(BR2_ENABLE_LOCALE),,libiconv)
>   endif
>   
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_ATOMIC),,atomic)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CHRONO),,chrono)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTAINER),,container)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTEXT),,context)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_CONTRACT),,contract)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_COROUTINE),,coroutine)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_DATE_TIME),,date_time)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_EXCEPTION),,exception)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FIBER),,fiber)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_FILESYSTEM),,filesystem)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH),,graph)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_GRAPH_PARALLEL),,graph_parallel)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_IOSTREAMS),,iostreams)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_JSON),,json)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOCALE),,locale)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_LOG),,log)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MATH),,math)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_MPI),,mpi)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_NOWIDE),,nowide)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PROGRAM_OPTIONS),,program_options)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_PYTHON),,python)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_RANDOM),,random)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_REGEX),,regex)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SERIALIZATION),,serialization)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_STACKTRACE),,stacktrace)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_SYSTEM),,system)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TEST),,test)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_THREAD),,thread)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TIMER),,timer)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_TYPE_ERASURE),,type_erasure)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_URL),,url)
> +BOOST_WITHOUT_FLAGS += $(if $(BR2_PACKAGE_BOOST_WAVE),,wave)
> +
>   BOOST_WITHOUT_FLAGS_COMMASEPARATED += $(subst $(space),$(comma),$(strip $(BOOST_WITHOUT_FLAGS)))
>   BOOST_FLAGS += $(if $(BOOST_WITHOUT_FLAGS_COMMASEPARATED), --without-libraries=$(BOOST_WITHOUT_FLAGS_COMMASEPARATED))
>   

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
