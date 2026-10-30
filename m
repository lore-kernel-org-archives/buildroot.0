Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34448606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MDB3Nu/t
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0897540EA5;
	Fri, 30 Oct 2026 15:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hs5QacMqs5qn; Fri, 30 Oct 2026 15:29:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D3A0D40E66
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374192;
	b=nt7ONZlXnnaRfJLWK2KPyrBLk5pYi4xd4fZE52FZ0mlqXj3XqmgLDtTWBvfHwHeNHb4K
	 D93+Ikwlrl3KsZ8Z+OsWY258qXkY413xNID8ImL1ivtwkk+x/mLKJp0Pt13ArgsDqxT5V
	 wPBXBSl+LlXQXWZyK1BN3UAtByBuyNZfsS3c0pwecU9xZUYoZFLYT2pT41YX1PWNqmYKR
	 yriCzZDXDYydunysHWJa4vQTTZsq/XFav42PEYCkjSSOaBzEo32WJNuoQc5L3teIYjRAi
	 dNp5x09AYcEaCnEojzbW26uEoH+z8ryQA//Djw94o+J9ZVmLK/ErjTCfGssgzdD3LyA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374192;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=lJemSkxBI9cPHfCMLhMMlx8Wu9XNqyKQZVIw7/+egqI=;
	b=dSw1QDE67wrUimcSUSW5/rEQxm6guxnRe0YBMRSWFL+aeL+9HZMYZ114jc7QKKPt7Q7C
	 GL3imyLl/BeojYOi8iwrXHnWE8bp/UEBWbyjG7bUk0KxdFXhWMu3HCSMaErjh8AuDaJYK
	 obCyUcUQhvsIr9WtbteMeWBi7XJ0W6LrQ7Oh3YGyv81rIW3SmRw4Gwoz2XtZiJlqu/2Is
	 g6DnvbKAIv7gwMf7sIqjB7RULf3xsWSbRi2aifNazHGqNgInm4Zw1dUpUZA4IR809hzSN
	 5uIZtSuJUlVaYOkZEHQVvd/XWOAop7MES/nf3tvmI0kHH/PP63o7KIxpNrGFtYj0LJg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374192;
	bh=lJemSkxBI9cPHfCMLhMMlx8Wu9XNqyKQZVIw7/+egqI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MDB3Nu/tU6Nx0fepsrBZEwbE0YIj30uMAs0WzFek35lEV04ChhVIUNIhtnymxMcrK
	 Mccw4+5WorDhpCE6yUhr0HlfwBgYnbmfznoIIud4dLAOk6EHHSs7tKsnvljv+NkAHD
	 5ueRoPfkqWYoccqsqSlZwhWzCoCU+P7HyOeYN8gkewhMtvzNwwfivKV0LqFL/9bLjr
	 zVyvJZjH8zUB0kgHfhFlWQ2puFsDSUTtH3f8j2MrJf573r322cRDydM8B5ZV6EQu/r
	 srAjymbaWQQwzQm1SmJoi6FuRWfLRAaQs5T85LdNXKUP8Y7qNPKu08QjuV0Etilk+l
	 PDkE8UE43jsTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A0D40E66;
	Fri, 30 Oct 2026 15:29:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9ED5B235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C6B340530
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBVE57eJJ_t1 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 664E640211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374164;
 b=Cxa2Ll4gmazBFo0GBFSSUEh/AFHkttzKbvamf1XlAgHFfrABnzjpFX6ol1yitcce3FVQ
 ftoo2V3BkzsqCIztKAytePsVhJxuc1+NiV4lsRn6nnvTYw4XLfst7LOvdvCxdXHcxOIM1
 +5BFDcQFHE7u/BPNQy/oxtKvoExgfnu5MrJ0iuvOZyIIi00FXjQOjUXtU7TC0IEwWbDPv
 gNmn2YXIXopqYGK/Djl8vCrSnHAkc9SlIJo340XMf4Eqzjy4gRyNnEOSRZOQ0oYFfpm1T
 4w+zxFZKVnctoATHrXVX7q5LlpQCiVdhqta7UhzLASCl6V31zyIbUAP4VjoLGvq6seQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374164;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=3jUt1RM6TIGzqqCUXGv3MWaB5WtNtg0PhegAb9fB/d8=;
 b=sPyHqQaXvahxZcgTfCXXgJaW0bC8p2fLXof8SNdyFsgfQ75uHQVuVRYzWM/MAycohoLb
 d4ffyA2stueeUNX3tG9aApQz845PMXoYUh0uEYcOOGLn7tasu/pIGZZn51miakA1fmfbF
 3XNLXDYElN6CAQnPmpJe/lg8M/kDU4KQkEFXhzqkXOHo+cB2quHaE8cxk2pGgFIdB1lsQ
 ZJQ/S8Nltkl9LWpgProa5WqODkw4sGFM1tntM1MXVh48dRHh3PpX8E0wlZ7077LXZ1Rt2
 yI/sp5aSONDmW0H8XyqKISq8bWu4mYztZxv4TE32KG9QgP9udLFl10fSQWpDk4UNkpQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Fcf4lUms; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 664E640211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:24 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a2d6cf958bso4166055e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374162; x=1793978962;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=3jUt1RM6TIGzqqCUXGv3MWaB5WtNtg0PhegAb9fB/d8=;
 b=k0t3wc6weGT+XV9O6/6SsmaBLK+KB4CZ6spZ6kP1061J6d1OpBLS8wO/eSIASSLgeJ
 P3yMXELQQuFgQs/XQXXKEwGTN80pePGj7R8PAs19AfXl1W/5hbOK7DR14n4+bdzv6qHE
 +u+qQn+2iDTSMF76ubKAnkkCmelj9xzOI/wpKsVRQN8Du/4z5NFAJKA8JNdMyZTl2AMi
 6umWyOCkNSEXyfQM7YpPiDpW22mvIWP5diTrxHXqJszcGGHoQwcgHRSyvTStpWA1x1uQ
 iukz0LbqAK50kDcq2fNuP+h61OwuvbbQU24FqQvja5/aCVP6vlSpG08E+dUVzSvmkLCz
 H5Xg==
X-Gm-Message-State: AFq9FYIhRm9z5sErRSCNe8/r55TGPV3MM3Nl48D+4ceAhEpiIzXoP2uR
 WLxQqW7W3e+jNEyfFcTAPExv5AInlLQxVj4vtVKj+ek31mLq5kz70XbAdyHKXSWiU6dNhEgWf+L
 heBs+JNQ=
X-Gm-Gg: AYBFou13QMpOX0czDnYvSB/p9I7ezzMsDbie7N9KYb+6KwLLLa23BEEZV7ES695ccad
 eag9aYkXKj1rA1VH5tLLolLJCcYiSXHOtJG8z0fl5MkzBHrPqpWrN1vSz6YaCz9NCgtu5/UUaWl
 JHebY7tI9VwAkXf2CLL0g2GUQlZvWzxh6iXAvq/CpyZjarUpUNwi/4hyJFVQedoBVf3bFFZfWsL
 GwqNP6ZvF2O8F0Vt3x6JL35rsZJFlswJqvOXchncsyEH+WTXaF7PzGyr86Xe47nUXUYYwqLjK3U
 1sCg6gvb8WKBfI/xJL7z4scDaT10a9lO1jb52RBoOBx9sLCJpv+EKmgQRp1JB/pSLbSHVspaw79
 yy7+T+FfFCQ4zvcgeaZAsaaHmEznLXkLzMIPc5s7Z1l0kH5PGLP8U7tctSus3MoEB0P/TX9V5LK
 nDZU7XJ2AKQ45CBoSUqCMEdek0dQiDOfs1KQVODlhLpDxswoPVG7/9piJC2vwzTRsr17x5zhU55
 a1yAL8leyyvFVlyVijaCVkV1RpoxqYoZEf8fu9zKpts4CbA0ch2YkEyNjopPnvutbJxYICa3xPT
 AhAleIxkq4tyGZGYfW1DgPIEOmyu0eo1Art7u+4QgxNqhG/bWaqR9zonpC34BVtRCzSRjD+G
X-Received: by 2002:a05:600c:a4c:b0:4a2:967:dfb8 with SMTP id
 5b1f17b1804b1-4ac1765d7d7mr59729375e9.20.1793374162165; 
 Fri, 30 Oct 2026 08:29:22 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abe885d91esm49255465e9.0.2026.10.30.08.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:21 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:19 +0100
Message-ID: <20261030152921.1907866-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023233005.2692911-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rtai: fix download URL
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The RTAI download area has been removed from www.rtai.org, so the
> download fails with:
> 
>   ERROR 404: Not Found.
> 
> The website now points to a GitHub repository holding the former
> rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
> Download it from there, pinned to the commit that added it, so that
> the URL doesn't depend on the repository branch. The tarball is
> identical, so the hash is unchanged.
> 
> This is not caused by a Buildroot change: the download URL has been
> the same for years, and upstream removed the files. All maintained
> branches use the same URL and are therefore affected as well.
> 
> Fixes:
> https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b
> 
> [1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/rtai/rtai.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
> index 6b309ebf85..6e189bf27b 100644
> --- a/package/rtai/rtai.mk
> +++ b/package/rtai/rtai.mk
> @@ -6,7 +6,7 @@
>  
>  RTAI_VERSION = 5.3
>  RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
> -RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
> +RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
>  RTAI_INSTALL_STAGING = YES
>  
>  # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
