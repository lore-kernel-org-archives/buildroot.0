Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66A2606A32C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ABi54mBJ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0CEA40CB9;
	Fri, 30 Oct 2026 15:27:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EKMPj99c1QBn; Fri, 30 Oct 2026 15:27:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF0E140CC0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374078;
	b=bOo0ozJIIHbr1l/3eUf6cf31K7TP7r6idvLZoDeeORKoByKQ8TY0m8TWJ1nnCWb1rGeO
	 xzHdxzI7SYBzavfC6LUbuJ0+huUjnc+wPDLiN6frImQN61ays9dto3o0CvxK66lb1Ves1
	 mT5GMlVPJ5y77Z0DOniVzcUHArnRi7NDLRGubGpYiD+DKR/aeDdzd4BTJ4Q2u6qvoEaen
	 nlNrXeux/MXVkDFUiKr+YJ15OivIDnkhyo3yQ8gz3UH9A7caybc5kzxdoGwb3TrGAMXFY
	 btyDWwWcPwQaw/KeNIRDsmSywMVgnD/gru9lEI06Dova066nzdL3lQLWOuNv12eeZpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374078;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=F/6n0LNQkr5AJ8g2QqPaxSJSB/UJFWoIccHkgx8hWAQ=;
	b=DPcTbQI4/w8QJRKCxryfoFh1pHybxruQgwx8LcfyRXPlbxK1kA1bhG0SqVX8w6IX3Bnq
	 bKhFlZX9LViIBtvzVGgPilE+PUMfGKYCXQjFU39y5g/aRY1Cloinhh0GaRKru8eqHUCfA
	 7kSglx8wYcG5SwNdl+wznrg4SBYd02PdO0AI+aJaC1u8IDgIalxz5LAc0jYUkJlyIkUBW
	 0VDRnB1sALVb94Pw9/WhqMAK6Vqux7s3ksXX73Bzv6Mf5cvjLnrHsrMt8K3JlUAiXM+NS
	 u/jnq+zj9Z4OmM3xDpltbEi0IMGpJpjPMn3r1XWCAy4KuMJqCoj5dzH6zJ2iITNMePA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374078;
	bh=F/6n0LNQkr5AJ8g2QqPaxSJSB/UJFWoIccHkgx8hWAQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ABi54mBJYOfycPz1EFVvafJI7RJaWN68pY4uU3KecNvEe1Jv9wnK8TJCGdC9fUBO9
	 fPYXyDWMaA+ify2BJly2NCQMLQZQx/Mnd75B0u9TPIdQ1eTn2EBrakR+gVccybSgHm
	 2LEUibdKDcv4K67avO7gex9jzcCCfkGB3MokrqZdHyV607MPYgxsKfDkAnLkEfI6XS
	 Mq1LQHsmkV/iZP7Hp8uL8/vU+7c06DbP0rUpDzv8I5hmKsATLexfrcm02Fwun4AtIR
	 IKuIMqAFgsi05evKu0ZYrjZOlvyciyDGGHimA3ljlfXjx+eMIpP9J0rexCldG8x0WS
	 Unm4HVZ9RKMCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF0E140CC0;
	Fri, 30 Oct 2026 15:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9BA9FD38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 980FB60B0F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-6r3aEkxke7 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:27:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AAAAD60B0C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374053;
 b=iLH6KAFNzRfrhcdyzK1LlQJIskD+zS0IIvkeHibRtPXXKKVOy22SU5YzfNOpNCg5FER4
 9aOcLVXBkSBaQ1SrhyPRVLLHJ+y7lSimxZwJgxmFVHf4EJlLWj0GWZ1uWQJkY477ufD1+
 aUeu9OarD+91ZTnlR76ycvb6NB2LexelwUsgXHkircjYl96WVFIp5reCnRbTxeU41cy4k
 XYtq8XL4AMCZublsJipvc4r8uxpWdkEfY/DUwZOdBvkZHiQeybZPuwLWFTr85jssYF9tC
 laoFoPOmbiKKzoweA5u4ylAewkCop1BFyoT1JC1olmr/X/ZgHQJT+2NH3T/oeqH7n3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374053;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=wgkHrld9FrhmPjKo2EaIYqE51IGYD3ZUCoPxNKmpe9k=;
 b=KjQNWVcJZ5EyIEMF6JzQTFnQAV0EXFOxj/sboUX3e12cbDFx8AnillMAEXij0qCdNKd2
 HfPgnStVwqzTfGIsxhTvz26sSZ9sZ20TCd79L80b0kHZp6jl4La24gkMr5rWyr05siGns
 61m5PrF5OQFHVfSySDlp7L0x2+uMwxFgrrLXEO4P0YQ1MHeqVgj0Z6q/rd3sjiDKWOPha
 IWfuJlOTqu/PK2pgn8bM+g+LNaX8xnaqAfErd2kmFUG3qPVNUeu/fRfhGzGzz4g92i2LP
 AR53vln4m2t4frfviEy5GnI9j245Z6S6yAOEZ5jalxId5X5yWqYSflbIpW08Q23kAHg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=BX8XX1wm; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AAAAD60B0C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:27:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a210470b49so6436525e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374049; x=1793978849;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wgkHrld9FrhmPjKo2EaIYqE51IGYD3ZUCoPxNKmpe9k=;
 b=tH0pUx/Kw5z0mki12Q/X2pS5fiLRIn8GiOQ1fqTHuL7/72KWu0JfE51apsgnw2MD8Q
 iovWFmaAfGdYvYDpLwUlsQl8GAeJSUOgNOaVAfNLz/19IRVHH3b+7ZN7/7lT36C694lo
 0WNQCuaq+O4PskXwGZ8Ulo9sm8J7pL1c4iaIDCn8VBCsxh0oodLtO/uq7Re9bFtx9sYL
 Hso6u8hbW/KSwaR3fojufj1Ii4QwQuAiDyncm16lPQeKPqY+mTUJl5ShZlD818AvS+xE
 s6GeWkcPSee8b0eUQx15Q1nhEGQROfXoNgw81mbqJXyLQAyE3LBVhjMzSgMkErKHnO/c
 NxNQ==
X-Gm-Message-State: AFq9FYJd4oZGATGhbRxEH7SweOJI7bxTHuSoHp+nR0msFr696S3tEz+b
 MTy7eW67y5I7Ya/lGkqZfrOr8/OC5KA6PHvobQSiXlvHnVsTbozt5Ypoaj0xUv9K9XOK/6OacmH
 3bu9GGq0=
X-Gm-Gg: AYBFou310zQReumF5VwzonxdNvQ6po6nRpVh8mILSDPIyPeyMS/GUq+kqpSIifVOw/3
 kpfXj1mZNk+j8c/KXidf9JhdEe6IcEkMfI0/jqqroYgzBmmDxiwME0mwkxNj2327w/+24riwxnP
 dZ0E/t3NHO1lNpXsKrwwP5M54zX3KkBqB8ZQxFptPig4KbCOJIkieud1hvyv3Q6XfNIrfY5iYwJ
 gNOG4FbT+qKzUO0FNRLziY3I6YQV9YuTCTQwCIDtY4UTVgawwTkul6ec3NgQmCQu8R7aZhGJ03P
 r4XqgYgdUV4sQPBO4hYvr0ShMvigV0IIQhR1PdoBQXYUY7KMN+EKrtZ8cW2SoGxhO90pp1e+P1+
 vUson1SBT0XQ76A6AcchXMZvYZpNfmNQtp/1CZqTIouG8wlixkwN82949/EvTYisDT4uCnlTAY6
 WXuQdc5WCQmbqLBuYxDshZmaKOaGkp31S+1UE19nBajM7X+k9HJ/VQPb/B4A1HYG+nK7696LYqX
 RCUkXsBZdHAz1HJ/nXOm0m7+AjzSxdUbYJUQe8CG92DuKJajklxrYm3N2S2Kb0Vnv0efk+lXS6z
 ttvURk/SnwsqAiPigWOswT0Scc/esg+cixS6t6Xz8gW8VYjDJ5H9SzWtrtPAwAwC9Iai91fC
X-Received: by 2002:a05:600c:3b1a:b0:4a8:b8b4:6226 with SMTP id
 5b1f17b1804b1-4ac18c73d17mr57000135e9.28.1793374049345; 
 Fri, 30 Oct 2026 08:27:29 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf7146621sm69729985e9.13.2026.10.30.08.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:27:29 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:27:26 +0100
Message-ID: <20261030152728.1906769-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020202639.1094960-1-ju.o@free.fr>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/4] Revert "Config.in,
 Makefile: add BR2_HIDE_SECONDARY_TARGET_OPTIONS"
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
> The initial attempt to make secondary configurations to be selected
> less frequently by autobuilders is not working as expected. It was
> observed that the i686 architecture was selected most of the time,
> because it is currently the default choice. We revert this
> implementation to propose a new one.
> 
> This reverts commit 4642f903cd613bc52f9bb8ea94c4d0ab18464c92.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  Config.in | 4 ----
>  Makefile  | 7 -------
>  2 files changed, 11 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index ac58c685d1..09806f5cb4 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -15,10 +15,6 @@ config BR2_HAVE_DOT_CONFIG
>  config BR2_BROKEN
>  	bool
>  
> -config BR2_HIDE_SECONDARY_TARGET_OPTIONS
> -	bool
> -	option env="BR2_HIDE_SECONDARY_TARGET_OPTIONS"
> -
>  config BR2_VERSION
>  	string
>  	option env="BR2_VERSION_FULL"
> diff --git a/Makefile b/Makefile
> index 490f1d419d..9b62da3e40 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -258,13 +258,6 @@ export LANG = C
>  export LC_ALL = C
>  endif
>  
> -# we set a default value here to avoid a Kconfig warning about unset
> -# environment varilable. This option is passed as an environment
> -# variable to be controlled by autobuilders. The purpose is to test
> -# less frequently some uncommon configurations which tend to generate
> -# more build failures.
> -export BR2_HIDE_SECONDARY_TARGET_OPTIONS ?= n
> -
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>  ifeq ("$(origin V)", "command line")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
