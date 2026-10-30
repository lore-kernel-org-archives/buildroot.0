Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9791606A32E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=auL6XZiV
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A48F40D2E;
	Fri, 30 Oct 2026 15:29:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t520BsMKTw4T; Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D27D40D75
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374153;
	b=ZnJWBNKspkv9cO8knof/+VU5qEs7cansoj/+uMVHUi8O4ax48hi1AxxaxmC1fn6ax0E6
	 Obt9FzHC2C+ITZFWUL+TO+kkJfSAQWDp0twPOcA3fDyC/2EOxhhvcF+vJqNBBBcD7RkWM
	 J1xatKdFOx0TFvrTQ3hSvq15WwH73fTZxTZ9L22mRQ9hlSrP/kzBH49EWwRsDcSA0OH5m
	 cLsauEXooxpas5dCg+jXtaWDPyaT+Y8gufXmvDgr6cN+5T4DkDVg0Hs7Fv/N4crPa/4gX
	 r9Yw4pMcUCTu/KUBX4Yku9KbzZgbaoP820ki1pD7TCxYcgZaRKQmsElhm6V5RXu2fJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374153;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=e4kKoFKJXFmM0J6eT4pEc3HaR0Wbvy2iohqkLCGCXSk=;
	b=K9uJ5qUnYQqtOCYNnEafpV+F3TX46BkLIV1waUun02rzPrGxgAQIvrVXXpbpwGluYqhL
	 MZpJnM1r9dW01W8x/bXkGs5wmMi7JRVaUk5PdBB/2n+cKXhx3CLNNt1s0eNu2riAX2LvB
	 OVDKyvx+zWpMR4Mut5hwQM2/rgQKrI0w1nBqvEfntyyr6QTbEKj80we53C+dtr/YZq/Ms
	 dd4u0G6qbNCtMkkjfZ+K7CG5cQ06ZDEVkAkWVDDZeGEu4FkQglBbxmjWfmUbRcz2MDygv
	 r77r4M4vTM1e8huT0FKyAPNWELhbgb+U5/x56inl3J4OgcS8/DZU55oE6+svPxnxl2A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374153;
	bh=e4kKoFKJXFmM0J6eT4pEc3HaR0Wbvy2iohqkLCGCXSk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=auL6XZiVcWvZz4Efv+LOTQcesvXjzbqJXOr5Sh547X+75RvLyJsKVGj33RQ7nWJy4
	 tb6Pz0SRizaeZpfOB7sliGUrnHiMEius/qYPstqrYWhFr+Q/4DU1AA1XgFh2zSUuXn
	 t/rWeIAkuGjiN52PszEPQrfCW9gUaR3NkQIsK+9/FUsvgg9+rhomEx5Nm/p6qTZy0q
	 YC9cC/CM9dKJVZuBW9Ir9qzkad8emi/abAJo62RghuQz1vSwxuJae6vMhEQ+SELZ0G
	 QF+i/Pzk1Z8ouaZlfC6ig7mOzJFn2nq6TCu9b01XNGBsOEKTarsSRvJX0/F4QDEzbz
	 Zg7Gkvau7TvsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D27D40D75;
	Fri, 30 Oct 2026 15:29:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6192B235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 517BC817A3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amD0VthgC3jP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4247781764
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374096;
 b=A1CpTozqfPCXqSnkZXtkseOzRfd7IzypDCrzsdKw4PCC/Beyo9NK+FMuwWJ3x4ooig91
 JC03Dyk5fu7jl6vO49tr7BvliFhIBVpMAkFrAf93LPk+2Hc9ZnBc+zSSUnvjMprtJPZ90
 CGeSY60CilUgFf1ON8YZej47l/FDKyHIgM38iygdPpjXs3HcBsv3GNuRu3+4sKsnag2mi
 7uDE4XBf876FJuLgHwwzEjgoEvmwfh18N1xSM/s/NiaZdYtr4NNMxZUsnsJgIXjOiuxDR
 Hqxj+4zkEzsHkGZPy1VhlslIrAx7sdT40iN5Un2kUsrFmsO+QDWykwIjJ4plokWS45w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374096;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=McehbJYOVrfOGF7boxSONeTV6JTzt7g4RfZgtf67BuY=;
 b=n6WHYJcW4N6TgrfAAlhuY7qTiSH1tGbTQjdmI0bumJPtgXW5AI2SW8uqFHvzIR5FgZvG
 OLujsf1UUEpMol7hziD0h7vjVVoYty4eo7m9Or0pg5uije6furzrDw5ap/yLgwllOwMFu
 q+TUKtrVdtbjyirzMaVtkMPAUVAJDXQ4OhFJ5sN4D2cYDE3MD0zwUuCEjEuAisIrebHQ2
 PKsA1J+AiizwwSfd1fQxoAdTOKRq1d71WToUAuSqO5mJ7K8dMkf/j8GItIyME4eY5wgMa
 Xa/jgSfcGCfDh9YfDB0d3zrCMnPSKpf57K/HhWch2Jlh+g7KYB8WoOz/T6wK0wTMe5A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KfEZD5HU; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4247781764
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:14 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-48e6eb21a8fso361535f8f.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374093; x=1793978893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=McehbJYOVrfOGF7boxSONeTV6JTzt7g4RfZgtf67BuY=;
 b=ypKmZLh24y+mS3xq/NrmMHHXvGbssPKXfaS4clopnykTn11Hvlw3i5Ph5m2nkBCU+M
 oarS9LtV40tUfEh3g8t+09LbbQMIGoXR4bvldapyAb0xdiG1gUl3a1URY3iz/mYF3ixz
 VCcdTn1jejbIfF+kj5un1+p61pOn3wtn3RqovWI49mSZjZBo9od4ixj+RHRKEUbjlKGi
 dMicLzYswBaVzWyqWxD+kC2gCOOR3Ihigvz006jQ30Bc6qT7tmbq1VL5NjvsccjlZEY0
 Wk81t5NY+dCyRTX8yO0HxdxSecQw778aTTffCjXgKHje8DMl4GFvs92G/aXXHVvl2cMk
 ilqA==
X-Gm-Message-State: AFq9FYJLYs4FNSDrL1wdgdd2Lwjr2vk1Wr89ApzCSywQ2UFYRZyv4zmI
 rGDpE8Bb0bluNRu20mu8jI3w0ZiDrGLt8LqEZ5LHKswHul3J43Wxq3fA/DkHu7YQknmky7/AXUe
 NCfGlC/o=
X-Gm-Gg: AYBFou2gGtzTEB0UI/HHeAsEIORoRdBnNqSRcJNlP64uDaU4k7FS9SKdCD53y9gLPOz
 q47So30e4GvOwKPRioc2cWiAY95piMQOyFZQCyhQedNMXzd0Z6hVuHX5P4YwAp9rDjR5okmbmHA
 J2f/aYf7SNTAjmKiHJypHelmn7a3zxrnRHECpWWlBF4veHD4fNVotcsXOP827rxAwzWSEBGKI7L
 T5CzMPzB+Riv/1NYk51pyIy6+WQNiR0uAabNWFNWrbETt/tOKtA0nQClsGNmC7vAwjZrKlJKOyd
 rRuID4jaoKhXupI/xadC2JxT/hEnKKEZ9R04aE9g3Q/6Td2BW3u8GqqtC4QFGn/vVT0FwptZDoS
 0pJB4llQeuHHcMs1aH4OY5dPSXU0m0YbJHcEv0uToGvY5BAXUXVHLIdicZzIcswOL5OChft3XYO
 74Wrwxeqj+BDzjQg7RQ1KbWasKnOA5M711PLrzOCP00DZAQVvd6tMPxBjNlsrzwR1F5hTmZfEVl
 xdF8XmDEw18Erwa1JVXZw6klw5G7rImkHgxZVln6zU7muEMsnDnfv0+6ZMbH2Zr/RPjwuXTU+c2
 3N5xbNED7ScRyTE1TnVdWng4xpoykeAOuFeeOeOkNuM3nOw0I6nIwmLAH4Qt9YpW1QGaAVNQ
X-Received: by 2002:a5d:5e8c:0:b0:48e:679a:4b03 with SMTP id
 ffacd0b85a97d-48e6e4f8bbamr7109008f8f.45.1793374093003; 
 Fri, 30 Oct 2026 08:28:13 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71ba7168sm4035244f8f.55.2026.10.30.08.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:12 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:10 +0100
Message-ID: <20261030152812.1907193-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022153102.242860-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nodejs: security bump to
 v22.23.4
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
> This is a security release with multiple fixes, notably updated
> certificate following the eMudhra intermediate CA compromise, brotli
> remote code execution. For more information see:
> 
> - https://nodejs.org/en/blog/vulnerability/october-2026-security-releases
> 
> See the release logs:
>  - https://github.com/nodejs/node/releases/tag/v22.23.4
>  - https://github.com/nodejs/node/releases/tag/v22.23.3
> 
> This fixes the following vulnerabilities:
> 
> - CVE-2026-105481: http: ensure agent data guard works without I/O
> - CVE-2026-105482: dns: validate resolve inputs for null bytes
> - CVE-2026-106069: tls: reject non-canonical IP addresses
> - CVE-2026-106073: permission: check permission model in realpathSync
> - CVE-2026-106074: crypto: reset random caches across snapshots
> - CVE-2026-111497: src: expose BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH
> - CVE-2026-111497: deps: brotli: cherry-pick 0ed4268a4401abcb44720963
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/nodejs/nodejs.hash | 12 ++++++------
>  package/nodejs/nodejs.mk   |  2 +-
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
> index bf7a8358ba..5a9240d4e8 100644
> --- a/package/nodejs/nodejs.hash
> +++ b/package/nodejs/nodejs.hash
> @@ -1,9 +1,9 @@
> -# From https://nodejs.org/dist/v22.23.2/SHASUMS256.txt.asc
> -sha256  fff4078c5def658577f92c88db7db3bc0072924bfb93fe52c1e744a54e94abb8  node-v22.23.2-linux-arm64.tar.xz
> -sha256  ef8f26a3de19acd8c23548e6c3cfc2052610b0e67abb5fd64dbd92c8b1c1245b  node-v22.23.2-linux-armv7l.tar.xz
> -sha256  e2ba10110ad34096c051fe47134fcd12175ecc48e7e879d7d4c78b70cf66442c  node-v22.23.2-linux-ppc64le.tar.xz
> -sha256  d60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307  node-v22.23.2-linux-x64.tar.xz
> -sha256  bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb  node-v22.23.2.tar.xz
> +# From https://nodejs.org/dist/v22.23.4/SHASUMS256.txt.asc
> +sha256  6287aa46b6c375d816e63ae66d024fbbfd70404825aabdfdf898a970871d2f4b  node-v22.23.4-linux-arm64.tar.xz
> +sha256  c9057c6a3b8fbb9651ed115c1e96d4a7281b7b9c9ca89fa05865c98ed7ffd437  node-v22.23.4-linux-armv7l.tar.xz
> +sha256  e4732f45e0cad787d6ba70c4eb6db45dbdb3f286f67dee429dbc6b4ff36eac43  node-v22.23.4-linux-ppc64le.tar.xz
> +sha256  1805bcd35e6815559bd2eb97db438d3fdb0eb3a5e6a977b7c1badca76337e9ce  node-v22.23.4-linux-x64.tar.xz
> +sha256  7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9  node-v22.23.4.tar.xz
>  
>  # Locally calculated
>  sha256  c738ae413cf561f174e34f6961f8ca458aae2369a73640dda6234c629b98bcc4  LICENSE
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index 1147245504..d8ec70af43 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
> -NODEJS_COMMON_VERSION = 22.23.2
> +NODEJS_COMMON_VERSION = 22.23.4
>  NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
>  NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
