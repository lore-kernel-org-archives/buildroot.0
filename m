Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB2E4C79F8C
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 17:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9A3B4059A;
	Sun,  6 Sep 2026 17:57:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DTItL3vTLcII; Sun,  6 Sep 2026 17:57:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9843440599
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788717474;
	b=TOE8tvGLsztYZeytE7mVuY5fATpKQRC73bFb2dcwmAGGvt6kyn6P76W0W6dYR0Y2KGK/
	 FR6K6IfqrVSAnoeLjBRuPyS00p6Lv0z7TPH8tCKDSqQsSJOJSNmjR4hYL7q62vesf93r0
	 z4ANO61BJBKsBPAxKKMXTB7slkxfriBnqai7imJlCLjBN8SYD18TctnnJjDrAeJXijp+x
	 59l/814oX4JvO8RBikGkpyoxD0mV7EJlYqnKWiyk/PsCpsj23VjTWNXao9UBphE2toEt9
	 0VwudOLU1WzBGQHcZ9+a1oVIOdJDFooNFAFow1UH9JYzFyqR6d4WVQ8/bRklR/Ie01A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788717474;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=4zcvwO5qX4yKR4o9aXUoWAIj5EDFeja5QCgmhUt6Yw4=;
	b=KcNLdli+Ps0b9Y9Vc2QKH+fc8N3oWOEhbPscUNw/Pi/WE+J4WFImpBGFKiK0K6wFlBf+
	 MUyNLAmwe8nSVnYJA32YBZp32HQ/5+e9txI3AFko3wGqacF+5tF5w/wsINEc4YXkLrecM
	 18uV3eF+KHo/K16+rQyLrJaoSdPe7wjndo4e55krawilxm98KfHvVS0s/X4UlbzkV08gn
	 rqQbAI+mSxyLUW9/HHwZQjBba0KaQtXVb7KmfLVgYJTES+GtAMSnjTAfc80HYCqUIND3C
	 dNPnkuo51J9WOxG2ve6e3a2UBFZ8Ex9RXJyH+nuVJvUfIFO0hTFmYhrY/PHIIOwWI2Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788717474;
	bh=4zcvwO5qX4yKR4o9aXUoWAIj5EDFeja5QCgmhUt6Yw4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CZgLCekHaNfv120a/7ymvfGdr0ZPYYPxqV68YuT6rPJadRBEivHYePMCj2FWXaRes
	 RFpSHg2zZe5aQXD/SxM/BoGbVzK6Wyo7Nof6oDoCF3vyplmi6n64GUlACkcffeYkk1
	 GpUow/P8CE9tTsvDO9yxYpGT86BC3mkIsjccqc2N/Yj6K137KpB1//Kjcl+yKbIFqG
	 60F9A/MGlFFlJrpGCbNrQN7Seofm8aCG1Ob3SodRF6DxqOmAKrB8JNHWrJXvn63h7B
	 jCBgeuWa8kOg4xjJrlmP7uNJPpFblR7St+P3aR7FBLr8zXeKg7BMWTVAQ7VR5dlL0d
	 xokS4XtiLj81g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9843440599;
	Sun,  6 Sep 2026 17:57:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 909792C7
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75E9980AA3
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:57:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N2x1YKg8h5Hk for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 17:57:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7B51D80A9F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788717471;
 b=RE8bLnSnAOLlcKC49YmHVdhEEVK3GrKE+LJmNDAJ0KKsfO32NGBEY8JzgRFkOhMmOU68
 R1okc320VaaErZ5doTwNpslZBljdnKDA3Y5DO1pYhqE6WIEal/i8RDc/NymPtHBw34MiK
 JEMqW6STFGK+7Th0tssNwempQ07u6dd57+TzJUeQYWcVGq1VIEmjxqYQlwhFuXY89kGAn
 aAy7ryb6ni9RcjNjbOr4pjxWwFJIc81fTI+HjUedG3ZJpXCWrqdBxbodTLkk1v9nRPadT
 q1r5ZgURbxiCcDV1jPSanmq8iVnEVaUmsCwBSmyqB1+gUTApJ8k8wG+kcx+gWtJvFTg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788717471;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=FSJaGbCBEwntVaSmzuqCwtUkU7nhG2ep2/S//KRpqpc=;
 b=DJ+cK7oLDJVUimf0i598CaEqcf44lkW8lBvvSXBuOw7dDXAn3CCQntammhfLCwVnRZtB
 JWBN3TxONl9O6+pky4RDCP2R9NUqjy81RBA+4iOhzhhgsUykc9YdR+/0Si5Ko5107SezT
 Xyn+XKK1CAIdf0nYZMLVjh0htK1mTi83cyRJRiXTqXQpudc9cbUuQ19JNEFOzVCzi8I9g
 cnXizkZiwsRhd/nBaPJX+V+cyQ0OvUn7a5bxHBT6nUd4NnQVj0WZ6CqwcKhoSsw6db+Bq
 oD2exq5VDjpC32JsGu2cbN/rjUHsoqMEyksW5Muu0Af6aiBrbYEH7+RavzdAjx0AHFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DvDmjen3; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B51D80A9F
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 17:57:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 48CB560128;
 Sun,  6 Sep 2026 19:57:45 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Sep 2026 19:57:45 +0200
MIME-Version: 1.0
Date: Sun, 06 Sep 2026 19:57:45 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260904171454.195351-1-bernd@kuhls.net>
References: <20260904171454.195351-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.18
Message-ID: <507d53e20261b7a015f33af381003c51@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{rust,
 rust-bin}: bump version to 1.98.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Thanks for the patch.

On 04/09/2026 19:14, Bernd Kuhls wrote:
> https://blog.rust-lang.org/2026/09/03/Rust-1.98.1/
> https://blog.rust-lang.org/2026/08/20/Rust-1.98.0/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2821138019 (check-*)
> 
> https://gitlab.com/bkuhls/buildroot/-/pipelines/2821140645 (tests.*)
> with the exception of tests.package.test_rust.TestRust.test_run due to
> Gitlab error "No matching runner available".

Those tests are too big to be executes on free runners. They can
be executed on a build machine with the support/testing/run-tests 
though.

>  package/rust-bin/rust-bin.hash | 132 ++++++++++++++++-----------------
>  package/rust-bin/rust-bin.mk   |   2 +-
>  package/rust/rust.hash         |   4 +-
>  package/rust/rust.mk           |   2 +-
>  4 files changed, 70 insertions(+), 70 deletions(-)
[...]
> diff --git a/package/rust-bin/rust-bin.mk 
> b/package/rust-bin/rust-bin.mk
> index 80f912d43d..9655f5c618 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -6,7 +6,7 @@
> 
>  # When updating this version, check whether 
> support/download/cargo-post-process
>  # still generates the same archives.
> -RUST_BIN_VERSION = 1.97.1
> +RUST_BIN_VERSION = 1.98.1

This new version fail to build from source. When trying to
run the test with the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_rust.TestRust

The host-rust compilation fails with error:

rust-lld: error: --compress-debug-sections: LLVM was not built with 
LLVM_ENABLE_ZLIB or did not find zlib at build time
collect2: error: ld returned 1 exit status
error: could not compile `std` (lib) due to 1 previous error

Could you have a look, please?

>  RUST_BIN_SITE = https://static.rust-lang.org/dist
>  RUST_BIN_LICENSE = Apache-2.0 or MIT
>  RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
