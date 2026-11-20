Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20764606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Fy69O19Z
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EBA4380E6F;
	Fri, 20 Nov 2026 10:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhgYeaqD4-yQ; Fri, 20 Nov 2026 10:00:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 131D4812F1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168828;
	b=M7ZfTSKVzHQK2KhFtqdsfRgmepg6tXOw7YyACOEmRsz9mjeHLNB8ucN+tfoGp9w+XjbF
	 ERIFnudbSILhg0LfaUNQXxl+OKaXaaJWjuOuBRisFpEg/4LpnoBbvmjNZu4JkDtaslCBZ
	 ySqw2XbbeKU9d8ezEfre6V7kBiyXRiJQh52PZWTe5wNZTrNqKfIFdSjCeDlefw3nbmPP1
	 ZFQqkZD7qA5nLkQkD+XO64Z05oiYMEXwpvT3XgnwELv292/McvZlolYefVRL4FE9Jpro3
	 mrck5enYUBKrazb6Mrt/sC8Dm7LVbln1tV0lyjSQ8HNgfyuo9cPHrdUv6i4W2h1WNlQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168828;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3Ukj/5MiJU92dBifyUQEb855vb4t1DFejMu/Ww9TC5U=;
	b=RakzU4sJfQkjtKdwbOZg/zn39ENUpIqkNGC+IfS38XWX4yizIoPoBv1J1ngbq7nIhmjO
	 835IQEuQIFH+dgEO/XHkVxLj7mnDAk+9v4PL3zsqvIcrxzmiWm3DGp0/l+Hoeg1xdcLDP
	 K5Ywk8hDScEXjQJ8eARWYA6XFp8utEIe2e0MdsjsJ2cyIh9KfgD7NYkiUhc28ThO45uRN
	 UaDl1ZfNJh9NEQO7vkNYZgDfGHwiBNN5xKAMXC+sXwHt2vRLTt2+E2F+qyimqpYSBL+fX
	 fJDsGke4Mi4tX0M0NEKgjhL2JwoKohTdTcZO3wwFmIXS7UsYpdCQSqFujv35vSPwsOw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168828;
	bh=3Ukj/5MiJU92dBifyUQEb855vb4t1DFejMu/Ww9TC5U=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fy69O19ZipCN4yjKhcFe2a4IU/bSPBr+jPoEN82GMmYkzerZuopz3YBCnneJvILDw
	 N2069+slB/7voIGgqty6I/Ukq/wi6cgT8AOqfqUqkObI4m8ZUefsF580LqEOYEs1zC
	 m+LUG1FJVq05KqGkTJ7mXAjfzEaRQX6+C+aQNWADssbhrfbRMt2twbiOFPb+mswqZb
	 3CTHeNcaDBb6Q49GdvObGhopd35qz6Xek17J+p8Q/8K1HgaSKeQjbQyZn5ddQ5cWoJ
	 QBcIOOXu6/B5dtes9fLFr4Em9hO4WVsVlAxMJC3UKZiAOSLTj7YfnbpUMQyVu0Gvo/
	 kqzELK9i/Hezw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 131D4812F1;
	Fri, 20 Nov 2026 10:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1ABF169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D367140D5C
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0vmnOPDIDMvl for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 10:00:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B354B40ADC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B354B40ADC
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 10:00:25 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4bb68c197c7so8084155e9.1
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 02:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168823; x=1795773623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=tr7ZCaShfOOkNd1dqxswjZjRh4ojXIATsk5POl05if4=;
 b=di0iz7FUMcAqurOyTsPwnLFQpiIeyTD1AhE5Xf4dFkZbSUQAB5QbNYsDagY+tpDO+T
 GKXorVAjtLCradsRV1m3sTpQTsVGjzkNNFeLOlMPVcNteiC2aSAQ8V9owwYJLOAt1z1B
 MLyG37o/6K52LJ3xVtEYq9ZI3P/C/sYhYRgVanJkac0OSaoUmtAKp5nYO9UrLwC1os80
 Zb9jMdRUvs5oMOOEfde1oPeqijNkvx646r8WfLYSuvSLroFmv5Uw3S+T2dZ04+eia0RE
 cTOBc5FOwZm6IKv8YgwHfXSlWjkKFW4R5lIR7erWuvRM9aDawHJGN9u4fnPi6YbKeaqs
 5o5Q==
X-Gm-Message-State: APuU4Z9nI835DYIY93kbCQFpf5ZN29C5jjZ7wrZMNKg5ltG4jeVnNera
 7oWWlQUHt6qULwlaTWYbhIAfYXFMCOCVPMGosfmTvPA+QB6XTDlfFAKHIYiNQsFVC3s+3t/2VSc
 /337UvqRJzg==
X-Gm-Gg: AYBFou2GTjJdEPyZlIgYlAenEsS/8lR+KRUInHm1+zmGPJg0OCdJsyvTmgJNkTvto9i
 pfaxZYyB0lDfdB1xFl3yjaqhaqwMc0NdAFHRQ0/BxxYvrbV2nx9vjr2X0VoDdwYBVoxkCj5MCPO
 P0lCbliBPGOEe4+BEu6+GJq51NmBaQ5SEjBuLLMLqNOMuyfZbNkvq15UI1zGbXpapr78sVLAY+n
 GwP6/ZB7aC7b4hl6SuIc/+2Gktpt2Dp+llO1sPszaJPXhQJRIn+nC5rWDDqAtzbS4oNRG0i7cAd
 JOvJ5Z2AjNlHlO8g4lqX61dTdZ3NCWaTnYbxyCaK1UDTJzuTaNrrpxmfU5tONUteIejTxfkOER1
 +5j16gdnT3gYxH6lvQHYzrU6t+asHOfcN87/BFaZVNHhJ0AYdPx00bWM7MphxWU98FOxHu3Azjd
 ++/7t6WTvSGWGdOUbQy+c+6cTR2EUNxrLnpSFJp3MKorM1OJGM5xBCWXbCfVlA0NYZniP8V9PZs
 T0WAcrFpWDX8fz0N7J838+XcnPnPGEKoQjDvPsJ2FxV0LMoXSpft49piXqWnoe3JuzDjDlkPH9G
 syRzi9quFw8sau19ClPxs2GyfddHj82n0qGU4lhu7KI4
X-Received: by 2002:a05:600c:c173:b0:4a1:813f:2a60 with SMTP id
 5b1f17b1804b1-4bb88800134mr56603025e9.11.1795168823442; 
 Fri, 20 Nov 2026 02:00:23 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm57089085e9.0.2026.11.20.02.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 02:00:23 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 11:00:17 +0100
Message-ID: <20261120100021.541742-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261113230643.3815452-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tor: security bump version to
 0.4.9.17
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> https://gitlab.torproject.org/tpo/core/tor/-/blob/tor-0.4.9.17/ReleaseNotes?ref_type=tags
> 
> Fixes TROVE-2026-075.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/7ca1b0385264ebae4bc06a15d07a11142260081c
> 
>  package/tor/tor.hash | 4 ++--
>  package/tor/tor.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tor/tor.hash b/package/tor/tor.hash
> index 648c28ae80..ece9622824 100644
> --- a/package/tor/tor.hash
> +++ b/package/tor/tor.hash
> @@ -1,4 +1,4 @@
> -# From https://dist.torproject.org/tor-0.4.9.16.tar.gz.sha256sum
> -sha256  6180e193152f4525bdca5475168419b2a2035b963c3c60162a187f86e6160e48  tor-0.4.9.16.tar.gz
> +# From https://dist.torproject.org/tor-0.4.9.17.tar.gz.sha256sum
> +sha256  ff372c41ee7013557fe5b7acd96c909950b27a7959c59fcb87c02591682fabe2  tor-0.4.9.17.tar.gz
>  # Locally computed
>  sha256  5dc29ea302cc75db6db4a7c88d7b5d4638b4e0f5f1d2e6d21ce71f707470b766  LICENSE
> diff --git a/package/tor/tor.mk b/package/tor/tor.mk
> index 17a80d5bce..fa505b5284 100644
> --- a/package/tor/tor.mk
> +++ b/package/tor/tor.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TOR_VERSION = 0.4.9.16
> +TOR_VERSION = 0.4.9.17
>  TOR_SITE = https://dist.torproject.org
>  TOR_LICENSE = BSD-3-Clause
>  TOR_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
