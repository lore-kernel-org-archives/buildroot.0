Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87ED5606D808
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ETVpsAMp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6130A81E2A;
	Fri,  6 Nov 2026 16:10:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOhCMMOyy6Da; Fri,  6 Nov 2026 16:10:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5290481E27
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981440;
	b=iDAGNyQwxk2BQU15zJGmHUh/QkD1AzeJqXucD5cDKCgy7iWWyikHZUIY7uKrCrgQPhKo
	 905nJFpbQ3GRFynsQNhZw9cI+bE5uuEP4FmLHrF3lic0SWfjC3fDUQCkewViaLP81N59/
	 V0+ILO04Q9fIA8dKdSYAoCkc20kpeexzx9fRmavocFjjw5kc89tIzWeZQTNrxEDyeVZEg
	 Qfd4YE1CV3AsFthUHcbnp+p8p7EgTTFQGAxO15FBpqNk4MNbiQHHlkkWr5mRaoP5iAZ82
	 lS9EiwxmzjDzeHjD3E8vb3IckYXEyPIsdG+WKFwspPpPM9h8dVqRiMOHdjGTNheUDtA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981440;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=wtppyD+YKpQBQJi0Icu1H4wC8S7J/n4jLT6bSTSXtaw=;
	b=Qb1Zqgs6idCRlkPMswcjlHcHSM163w3zAjEwLNCwdkJc9eXLqfJluJq/YpETS+wEttyH
	 SwVKoJuRxRLA8jceIWGfyT1vmzf7PBtbYJMGzV6b8RIh0MM8V1uOV8xH3+CIzWWEB7xrZ
	 uZ+pd1SpDI+bpli6bG4jim3EmDPAjqGr053P4UvFbQEJNoZlUyNAf8HonVUu4UfKw2Hjd
	 l/XG6kitnpl8wfqo2k2KuVSTMwq5b2gruE+mdaMINKy/TrD0VCOXbTvVgv8tJacpz4N0W
	 jKR3xxwZ4GO1/5tw+NNwQ07BGM/KbF/ddONpTaK5ifhRU7vszmsBgVDF4OnuK9PAWEQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981440;
	bh=wtppyD+YKpQBQJi0Icu1H4wC8S7J/n4jLT6bSTSXtaw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ETVpsAMpNzEEXU0uOLB3es5jjBP8AK9lpw14a+ujXHBvRX3AQhlCPcLXs4HVoZoQU
	 z+2Njgw3HsrFqEc8CWbAOnNgovBesK2CaTramwgtItUU7elAeVj4hiinTrEX3t7Asz
	 EA9c4JITtCQlH7WgqXbaCcOJzUut7ciH45SdE/BirojviLsKr0UyItrBbWTvYECXfi
	 +7JlrybHwAtiXTsAqx8T5ZWR8ZjpbCYqOYxrd2VZqY9XvGR1yd6qKcLHomgZFv480f
	 98+lFQfih0rOj9P12a9nPzbm36nhFpoQZ1hOMFRDhQEIYC+7Y15wCEn4USl+TimzNs
	 VVwt0yOgBRU2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5290481E27;
	Fri,  6 Nov 2026 16:10:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABF134B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D4C881E27
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ba8WpBs3Gb8W for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3696081E24
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3696081E24
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:37 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-492fcbfaa88so462311f8f.3
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981436; x=1794586236;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=O1oyeRNoAbCCbTVO6sj/a1xUEHX/uN9cNzLp50CdEr0=;
 b=Flswv1Tq3ogbs5ziJTveSYXBvkM34xI1YpDBgnunORhEwVHk0e/z6kIN0EOhruapMU
 92qenOGUU8KkKPAbM/3VvNJVyzVBcrfdN4zlJfxZqQSxTwrXNlQY1RtTrwQi/6rAVR9f
 jUokkN+WLhGITmx7169BS7caSTgrmO2/XSiC/QMDlQ3GAmrLz8aS9vPD498xdBy/Te6H
 JYnnnmzB6DQ/QMtAaH61Cj5EtWWWS1ZT32yeNVize67efYnRvQibFEWU1UqGg3bpgvjH
 CQTczij+wkKZhhQGJHCxOzqgwwVBA2Tgkmtt0BMUF1ICXc1A+JUdKFXgfuYmRQPBf9VO
 27fA==
X-Gm-Message-State: APuU4Z9bGmBuRbK0fJYnn7TAUnEnoHST+YqzD6AUGK1GUUbeAd60H26G
 snvIh07lUn4w6B5PcuhZ6x9UsBCDPO0GrV0SKEQu3CdhnSOqa0TYRYsS7tN5QHMq3y/u0fBYuhS
 d3AK2CLM=
X-Gm-Gg: AYBFou1tmiGl/8XLnWm9bXC8Q8CBURCFuFS4/HmhwiTkyDe/xUNsg4yfz6ETl2vvrpT
 k/OuVFy8volPZ5f8IeO9ihDx+iouWU/O9nCKnS2mTHngqhCEvnRU3Ph97TN/kPqx4B8QZXG93/t
 2JHa37Dgp3ornXgU5BQrbmJwCHCniZPXsWwcOOiTqZlPLGulBvF4K9Mo2JZX5irSITEnLFGRcgR
 B2YN6Ul1rDOfsyDl7hjcGNIV+GWLq7drX1GIBw03Glf0ful5mvd/pIwoJ9SO7bsBobgbklfE6ie
 ZJvzEYX8LzUENCbx8gN08/RlJOAGGc8Rtp5wpVMZvSsT2K15PiriukC0S8B1ytmMBJgNBE4tpaF
 30sUX//1blBbMF/jILQn7m8Hr0Nk/0eXZENae8dgHouk6C5knWto5dRwubPH4J6wtMyiPDdAgOX
 yL2PBeU/yP11BBBos9LL2BWxDgIxvo1PNmjjPTCD0HWzalHyo4MQFaSzpZRSeZq6LJ2hhdMggh1
 7Dyz9QPk8Pr/SzNUu2krqeJl1k4SaKOZYJU13Z4S+NBNQqumXWTrEtHUL3k1mY26xJFy2iq2y42
 7B0mrHNuMKt2hARxMorp/TFNlexWf81MqpYpQ7VBEN8kdmklCu/QiQ==
X-Received: by 2002:a05:6000:15da:b0:487:40d:af29 with SMTP id
 ffacd0b85a97d-492778d1b34mr4545311f8f.36.1793981435806; 
 Fri, 06 Nov 2026 08:10:35 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d72335e3sm4414830f8f.31.2026.11.06.08.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:35 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:32 +0100
Message-ID: <20261106161034.607697-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261030113514.1090450-2-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libaio: fetch from Codeberg
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> pagure.io was shut down in 2026 and is now a read-only snapshot that
> no longer serves release tarballs, so the download fails:
> 
>   HTTP ERROR response 404 Not Found [https://releases.pagure.org/libaio/libaio-0.3.113.tar.gz]
> 
> libaio moved to https://codeberg.org/jmoyer/libaio, whose releases
> carry the original tarballs together with their sha512sum files. The
> 0.3.113 tarball is identical: it matches the existing hash. Point the
> hash file comment and the homepage there too.
> 
> This is not caused by a Buildroot commit: libaio has been fetched from
> releases.pagure.org since 2018.11, and all maintenance branches
> (2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x, 2026.08.x) use the same
> version and URL.
> 
> Fixes:
> https://autobuild.buildroot.org/results/0019c80cc07db35d11241c516c04a0ad3e00ca57
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/libaio/Config.in   | 2 +-
>  package/libaio/libaio.hash | 2 +-
>  package/libaio/libaio.mk   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libaio/Config.in b/package/libaio/Config.in
> index eed843f44b..6796035122 100644
> --- a/package/libaio/Config.in
> +++ b/package/libaio/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBAIO
>  	help
>  	  Library for doing asynchronous I/O
>  
> -	  https://pagure.io/libaio/
> +	  https://codeberg.org/jmoyer/libaio
> diff --git a/package/libaio/libaio.hash b/package/libaio/libaio.hash
> index 4ddc97334f..f37e4cf4f4 100644
> --- a/package/libaio/libaio.hash
> +++ b/package/libaio/libaio.hash
> @@ -1,4 +1,4 @@
> -# From https://releases.pagure.org/libaio/CHECKSUMS
> +# From https://codeberg.org/jmoyer/libaio/releases/download/libaio-0.3.113/libaio-0.3.113.tar.gz.sha512sum
>  sha512  65c30a102433bf8386581b03fc706d84bd341be249fbdee11a032b237a7b239e8c27413504fef15e2797b1acd67f752526637005889590ecb380e2e120ab0b71  libaio-0.3.113.tar.gz
>  
>  # Hash for license file:
> diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
> index 16cb502f16..0512c6a728 100644
> --- a/package/libaio/libaio.mk
> +++ b/package/libaio/libaio.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  LIBAIO_VERSION = 0.3.113
> -LIBAIO_SITE = https://releases.pagure.org/libaio
> +LIBAIO_SITE = https://codeberg.org/jmoyer/libaio/releases/download/libaio-$(LIBAIO_VERSION)
>  LIBAIO_INSTALL_STAGING = YES
>  LIBAIO_LICENSE = LGPL-2.1+
>  LIBAIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
