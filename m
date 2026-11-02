Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D24606A909
	for <buildroot@archiver.kernel.org>; Mon,  2 Nov 2026 16:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EI55KCsj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=raTvceE2
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18649607E6;
	Mon,  2 Nov 2026 16:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BMazcpV81vEG; Mon,  2 Nov 2026 16:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 02B7D60703
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793635781;
	b=jXSOteOcXBpjp0ut9tdFpLIc+o3cslsZxlbpKywD1nxXApm3b6sbQGj+T6NmdhYF2cVj
	 HOszL7+gwks6TaJzZ6kU8Mabr16ZO4yUmfgnUTtVmvzsp+PrVT43NlNBfikB6J5tsxGEB
	 iRGchrxJVSvd2X8441Rd+EbL1oBCxRtd8uHZbWtHmZvBoabTOzo0KqLJVt7SNBRTgNJ2J
	 HtOobyMTyA8i6DuDINXdIXwyZ2FORTtb3RJwltQssJxjbODpnWRxa7nWMH1xrK32y1bhU
	 MnE5IHlJ+NqEBztJgNmuH2DqzjeCrHiCBvNKXLkX/pFSTa6SQk9kSm9LsOke7t1wUNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793635781;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=drRa9LpjgN1aIyNr74ZCg3c249hOlLdh5raiKbddRL8=;
	b=k+1+I88xB+L0FaTTjZ9AxAYGzpA2J7x9ZQbxztzuMVvGnlVAN69iYf9EpicfubZjhHG2
	 qy2TOqfC3cUVrhNsiX3c1hqIG3jrIvYrEwciGnCbfPN+0j008zaahB/6u94D9+nISrrNz
	 qV/zgjR2ClLryulH8UOWmeo5V9baoG1PCiZRJWn8XH4/FteEdA5dshOCYKZDKdCr690Kg
	 rBxux5RLZibwpz+evq6AkUgbPkGTbfmnHDLz42VYvwvhcv/K5ikjz1KYCd4p1s1ZZA0Nz
	 vT70GNWlIDEEflEwijpScE6nQfkggW4gNKBBuKctdT97eJaQvQVX+4GEUrN3+4NzcfA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793635781;
	bh=drRa9LpjgN1aIyNr74ZCg3c249hOlLdh5raiKbddRL8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EI55KCsjRMzrX/ytcgxdXQSThA6fnSz8q4nogMlmlzQr8B4iX3l6a6ZwiBH1hHfbn
	 PHpGUaEVHa+/Qhdr8T7ijy6wvPmKa4E70vK7aTRl7sIoa7+8eX5EcnKO4zL7h17g4r
	 nkRUWPjVVch/Amii+NOghjMdRvxj/nTpjIJLkC0yE1oWu8MuBqN6a+Ryrrg7ivJXCa
	 K1wDf5yXbMlqb2vy4Lrfm8kfMmZVp/S4B6M6TAaQo4WoqXiNoLycP9BQR8GgXmc4lZ
	 rtM1OgleJjVtAnVx5MU2SjOYw/b1pGCXBrWhJ9Ft32BmHQYPnTHypEgBBimHEeCBQi
	 k1Zc5d2nXVHrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B7D60703;
	Mon,  2 Nov 2026 16:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 02E7F411
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8C1D80D9F
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unvQAvzLXNLi for <buildroot@buildroot.org>;
 Mon,  2 Nov 2026 16:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B96DB80DB0
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793635778;
 b=RBywMfcvPjvluCtcYyXisYCj2dcth08oXmWnwX1rWU65yjAN9mvkekAFgF1qp9CJxtNM
 6R/o2qsFYqgJS3mtJftIbT7TsXBh9gBfZeyPZjF+fcS/HTITQrZJerFF9vFhzRCdOhsZI
 w+iJ8N05TIYam/xHwavnYMak7vHK98mw2tFJG6AWk6644qffoSwsWm0qy3cT4p/ckobXt
 t5ijh7tnOR5mGkAm0tNmQeEW6B4+N8vrGt1ZfVk7uNrsts5D+rY2/waff/BzbbtjGEM5j
 1YjEsr1h1TTRgVaWdV+x2h2XZftHEu9XxCSw/da4d4prQPKohNhVLDLrBolbW28cwEg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793635778;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
 bh=EmuVzJSLcZ5urfnSbWkSTzG+elkUFZruBV0JKoJkUUI=;
 b=bQ4SZd2m3/l427rAmqt808Ux/8eOG3RwdqyZ095B0YOR5AIG6Sd8cbsNoMD86sy9Ls07
 ndDo8Q888KmJdZv1Kj5O4Uo5mi4iN1AEwreDM80hX1v1E30G96oqKfgG9aH854GEoQLwI
 SDqjC2UJ4PIcxJxw/ZCXH35P2/nKBSB/dCn02OFPGZG/XZQ/FmL5U8Mryz7bchA3zAHKM
 qRmHiqtL36RDkkYYYR429L7PMe9oJA53xiy6bYKIqeYvPJFVzgvvWlLp4qAyEveRhrJKO
 +jrKy1u78d6K3E05W8LeWIRbjyFT4PXbCJw+JvHYQ6UMxGM5SDYvRZ8xwqI0F97whNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=raTvceE2; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::535"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=raTvceE2
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B96DB80DB0
 for <buildroot@buildroot.org>; Mon,  2 Nov 2026 16:09:37 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso4741246a12.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 08:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793635775; x=1794240575; darn=buildroot.org;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=EmuVzJSLcZ5urfnSbWkSTzG+elkUFZruBV0JKoJkUUI=;
 b=raTvceE26ycgiSoVakABzfujIuz1ladGeo1sN53NY7XWhmSFDmo06MSSB7cmWfdcCM
 bBfFMR37GMB4DzI7cxQMGVGKnxxEEvizXXQrsZIhlSu54dJ4oozyJOu+MH0ZgZeTc9XE
 ElZHWR4zADbBYGrxE7X7iGUlqLQBg8BX20P9M2yPaIcuVmtp3un0oID5OfJM6z7yOgNz
 zBZPWio9WjOSXfpC5kLj0PjPkwh9yzMehn2CrDbqk6tvPAkY8h09gtFqyaaL9RbxPWGr
 5bNBSRkEZfRmcCxc6LgH03ydLwbZDau39OUXwYXCR3j8a1/z7Q1jVcZlkdspV6Hi0PSC
 pC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793635775; x=1794240575;
 h=content-type:mime-version:message-id:date:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=EmuVzJSLcZ5urfnSbWkSTzG+elkUFZruBV0JKoJkUUI=;
 b=k3Kc/3W8jPIJ3a35/Tf8dcDvhbnTvXszRgdjXxnpTfM6xJNmXRiO4CIdUf4U6IE4hv
 oY8W4E7AFEtTA5q/sUhzJh9LNiqMWbpMDq+Gr71cyiGfgr9/Xg6/WZ5zZRr0N6iWN0zo
 4iz89nduz1hqVKYi+RsZ+r3uaQ+VrxaDUaFOTLp3YFt86DbQzyYM0xdkEh0Qd58sEnMZ
 Fzg8MIVLXunKEkHafULVtLRT0ZnQCrxfWSMq3yt32ljAK2632NJcPy4AsxD93ROXKVjM
 bTliAHP4xbQHUp7zxYlDtTxijPdCBuLLP0tSvG0YlscUfvdIt9DR1rgQi88/5l/zUh+e
 mmuw==
X-Gm-Message-State: APuU4Z8MvpMUYRvJY4sPhjAjmZLauFT9lLHiHKuXxUoLfI3EFbxf3Jda
 Yyg026jwfrLjBFIJMFpOMaGgYCy6htcVZPQi6PcdZRifgPEMbU24Vwxj
X-Gm-Gg: AYBFou2W1KF56ZtGTlIT87af/K3YSgbku4ptB3GSs3PJZizRCPjUwF4eMVAA1xosadC
 XsL7KvpjOovofIWZIFIyyky+KoUYowxbXxBgtRBZwmaWf3UWVXZCAHUYsfHrsG+n9Csdvxqgs28
 gtJ42ymnofGWf83QgK5lzX7pqwpx5h4w5hJ7Czyec7Wo/yTxNg3ptfXXlCWZwXqOQnSsA/gQQJx
 X/0k0Z472+LHebRG8spaaT+Bb/I3hXN08tTEMMp6FQoNgLidyI0HjluLkp0vOWALMsubtm7aOHn
 PPsTg7EsD3J2Z7wMG4JTxvIyZMwDGDeVgs+88d0cmLHMBLMOL5I6upYUtXBfp/URXVhz0D4c2vU
 6FUnxK5bIZgA1cWf+Fkg9kzGOXkZ3jmTit8s7jXCkI4wqupOSAJLDhJltaNU64usU2WrZASvUwU
 V9GkRfkxCPHVVYDt/Io/XS4wiPO93tL/T6eipuCfXqgb3rIiQxqkzZ2nM50Sere+FqYg+PriVWb
 BJ05x7ruRK5ekXOVq74HDBDOf0bMynPiMFHeTOtH8ezJUn/liZraE+Oz1y2a5Ackc/KgrcTX1/G
 ohktHo3cPG2bm89OvS0CixXT0RLK7VJb2EKQ1x1l1KiwvvqmMw1g7vs=
X-Received: by 2002:aa7:c2d2:0:b0:6ac:b9b5:8e8b with SMTP id
 4fb4d7f45d1cf-6b4d438c0ebmr5650468a12.15.1793635774868; 
 Mon, 02 Nov 2026 08:09:34 -0800 (PST)
Received: from tollan (h-46-59-53-126.A259.priv.bahnhof.se. [46.59.53.126])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4ec9a8908sm3473325a12.1.2026.11.02.08.09.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 08:09:34 -0800 (PST)
From: Mattias =?utf-8?Q?Walstr=C3=B6m?= <lazzer@gmail.com>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20261028110002.400620-1-thomas.perale@mind.be>
References: <20261028103248.1317597-2-lazzer@gmail.com>
 <20261028110002.400620-1-thomas.perale@mind.be>
Date: Mon, 02 Nov 2026 17:09:33 +0100
Message-ID: <87zevrb4g2.fsf@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] package/pkg-golang: record vendored Go
 modules in show-info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thomas Perale via buildroot <buildroot@buildroot.org> writes:

> Hi Mattias,
>
> I haven't totally check the series yet but during the ELCE2026 Buildroot dev
> meeting we have discussed this issue. Go is not the only case this would be
> required: Rust, the kernel, potentially NPM packages and other standalone
> packages that support generating an SBOM (such as wolfssl, brotli, ...) would
> also benefit from a proper SBOM generation support.

Hi Thomas,

Thanks for the context from the dev meeting, I wasn't aware of the
discussion. A generic SBOM step sounds like the right place for this, and
I'm happy to rework the series in whatever direction you settle on.

> The idea was to add a "<pkg>_SBOM" step to the generic package infrastructure
> so we can both have something shared per infra such as Go and individual package
> implementing their own procedure.

If it helps, the series is already split along those lines: a post-build
hook in pkg-golang.mk writes the module list to the build directory, and
generate-cyclonedx only reads a generic "vendored_dependencies" field from
show-info. Turning the hook into a $(2)_SBOM_CMDS step in pkg-generic
with pkg-golang providing the default should be straightforward, and
other infras could fill the same field.

> There are still some missing links before we move forward this way:
>
> - How do we support the variety of SBOM format (CycloneDX, SPDX, compilation
>   database)
> - Do we include in the CycloneDX SBOM or just reference it ?

I don't have a strong opinion. What the series does is record facts
(name, version, purl) in show-info and leave the format to the generator,
which keeps SPDX possible later. For packages that produce a complete SBOM
themselves (wolfssl, brotli), referencing it from the package component
seems simpler than merging, but I haven't tried.

> Some question for you for the Go case:
>
> - Would it make sense to use the utility CycloneDX maintain for Go instead [1] ?
>   If we go with the "<pkg>_SBOM" step I described it's something we could add
>   to the dependencies. And Rust packages could also use the CycloneDX utility
>   for Rust.
> - Can you compare the output of this utility to the one you propose so we can
>   better assess the pros and cons ?

I hadn't looked at cyclonedx-gomod before, so I tried it. I ran
"cyclonedx-gomod bin" (v1.12.0) on the Go binaries of an Infix [2] build
(x86_64) and compared it with what this series records for the same
packages:

  package      binaries  cyclonedx-gomod  this series
  podman            3         164             164
  cni-plugins      17          14              14
  yangerd           2          11              10
  webui             1           3               2
  netbrowse         1           0               0

Both read the build info Go embeds in the binary (go version -m), so the
module lists come out the same. The differences I found:

- podman: "+incompatible" versions. The series percent-encodes the "+"
  in the purl, cyclonedx-gomod leaves it as is.
- yangerd, webui: cyclonedx-gomod emits "pkg:golang/../features@(devel)"
  for a "replace ... => ../features" directive. The series skips local
  replacements since that code is part of the package source. I may be
  wrong that skipping is the right call.
- webui: the series records github.com/openconfig/goyang as
  pedigree.ancestors of the github.com/kernelkit/goyang fork that replaces
  it. cyclonedx-gomod reports only the fork.

Things cyclonedx-gomod can do that the series cannot: module hashes and
license detection. The hashes were empty in all 181 components here, as
Go doesn't record them for -mod=vendor builds. License detection needs
every module in the module cache; in our case the cache is only filled
when go-post-process runs on the same machine, so with a populated DL_DIR
or a mirror it would need to download the modules again at SBOM time. I
don't record licenses either, so neither approach gives us that today.

Practical differences: cyclonedx-gomod produces one document per binary,
so we would need to merge and deduplicate per package ourselves
(cni-plugins has 95 components for 14 modules), and it would be a new
host package that follows the latest Go release. The series is a small
Python script using the host go we already build, and it stores the
result in show-info rather than in CycloneDX directly. On the other hand
cyclonedx-gomod is maintained by the CycloneDX project, and if Rust and
others end up using the CycloneDX tools as well, consistency may matter
more than the points above.

Let me know what you'd like to see in a v2.

> [1] https://github.com/CycloneDX/cyclonedx-gomod

[2] https://github.com/kernelkit/infix

Best regards,
Mattias
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
