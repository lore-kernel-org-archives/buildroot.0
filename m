Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2427FD006A
	for <buildroot@archiver.kernel.org>; Sun,  1 Mar 2026 14:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A054741AAA;
	Sun,  1 Mar 2026 14:31:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6klddTnWvAs; Sun,  1 Mar 2026 14:31:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBD2741AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772375479;
	bh=u4SXEgzJUEZTXVuYH1KQWjmpaxenV4OEG5oVZO9Z26A=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nP8MTYMQ5NyNTkOJK3YDtmKazLaXjDVEbGKFGX1rwYgEFM/W4BAfHKVkoVEb+Apjd
	 XqzKyVGniF3ygWr22817eajLtLUXpMZTbNZr2LeliMt9kkvrbCdNEWhsCqpWfCc+s3
	 STkU114MZf4eTS1Xw0KK8AKJDE7AfWExzigh6UW6vwFnZwTXo8sM6f5LVw2WKtd+R/
	 DSdRE8Pl/GdMJx0hbZLvVUckLIpo5+3ENDCCuIB5PKvxXHZznWeqa9xUExA/0aQPDH
	 CmO5BZu61rZZy6wa1mqeUHFFhlcw7/r3J7LVRExEoFTcjWJDCFvpWCFnZl3YjCfOGk
	 0B8qYYckSfwbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBD2741AAB;
	Sun,  1 Mar 2026 14:31:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FFED1EB
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 718434061B
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gm2tVhMQUWwf for <buildroot@buildroot.org>;
 Sun,  1 Mar 2026 14:31:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 43D554060F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 43D554060F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 43D554060F
 for <buildroot@buildroot.org>; Sun,  1 Mar 2026 14:31:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 0F04919F5C3;
 Sun,  1 Mar 2026 15:31:11 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Mar 2026 15:31:11 +0100
MIME-Version: 1.0
Date: Sun, 01 Mar 2026 15:31:11 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260226211455.3980585-1-bernd@kuhls.net>
References: <20260226211455.3980585-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <169c6fd682c814c03e5c6bc787c9a537@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772375473;
 bh=4D8cu+9APpMaOBjfSWHE72+LTu77sRNvRfa9wCHxt+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WWo6ACM8nCkh2/G+qA3fI212t6IiTyssVafKc92Hy2eXmTc0pCd+03jT8gZ8dKgrS
 dLlwEduwg/8OLrvQSSwiWBAWIXABWjSA7ht5DYsAb+HcdP8fnBraV1X6c3uRxJuCQY
 1BLeV9qEQCVfcITWfHuWZ1g8eoGQkAJBw8kHj3y3tbkPNZqHD5SiGxrLhCjibvlkiQ
 qTvgBW4tcxp2VkT1VdBt9stLBUiP+XJVTFbSRn/OZJCdhSXICGQtx2JgCIcsw12Lgu
 sjbfic6j1HjTyKj7UFxrjvg1ix7CJmFRsEYennL4WZdJlcoFAi04cAt9kQ1gJGybU6
 sU80sJZ/rl1cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WWo6ACM8
Subject: Re: [Buildroot] [PATCH/next 1/1] package/rust-bindgen: bump version
 to 0.72.1
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

On 26/02/2026 22:14, Bernd Kuhls wrote:
> https://github.com/rust-lang/rust-bindgen/releases/tag/v0.72.1
> 
> We need to use the tree hash as version number due to a download error:
> 
> $ wget -q 
> https://github.com/rust-lang/rust-bindgen/archive/v0.72.1/rust-bindgen-0.72.1-cargo4.tar.gz 
> -O -
> the given path has multiple possibilities: 
> #<Git::Ref:0x00007d64db1eed90>, #<Git::Ref:0x00007d64db1e7c70>

I believe this issue happen when there is a tag and a branch with the
same name. I think another way to workaround this issue, while keeping
the correct version "0.72.1" would be to prefix the version name in
the github helper with "refs/tags/". See below for an example.

> Fixes a build error with mesa3d 26.x and the upcoming llvm 22 bump:
> https://github.com/rust-lang/rust-bindgen/issues/3264#issuecomment-3218111176
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/rust-bindgen/rust-bindgen.hash | 2 +-
>  package/rust-bindgen/rust-bindgen.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/rust-bindgen/rust-bindgen.hash 
> b/package/rust-bindgen/rust-bindgen.hash
> index dc79a62ddd..dd2c622297 100644
> --- a/package/rust-bindgen/rust-bindgen.hash
> +++ b/package/rust-bindgen/rust-bindgen.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> f131b9cf87ea0a5db33ff3ad711aec4dbc4d383536f5f2e37493d63cbe95428e  
> rust-bindgen-0.72.0-cargo4.tar.gz
> +sha256  
> b547d29438450601b32a343a936f3c7366a1bcee99b27c0cd841afe758d1eae2  
> rust-bindgen-d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5-cargo4.tar.gz
>  sha256  
> c23953d9deb0a3312dbeaf6c128a657f3591acee45067612fa68405eaa4525db  
> LICENSE
> diff --git a/package/rust-bindgen/rust-bindgen.mk 
> b/package/rust-bindgen/rust-bindgen.mk
> index 8c02db557f..0a26a1a9d6 100644
> --- a/package/rust-bindgen/rust-bindgen.mk
> +++ b/package/rust-bindgen/rust-bindgen.mk
> @@ -4,8 +4,8 @@
>  #
>  
> ################################################################################
> 
> -RUST_BINDGEN_VERSION = 0.72.0
> -RUST_BINDGEN_SITE = $(call 
> github,rust-lang,rust-bindgen,v$(RUST_BINDGEN_VERSION))
> +RUST_BINDGEN_VERSION = d874de8d646d9b8a3e7ba2db2bcd52f2fba8f1f5
> +RUST_BINDGEN_SITE = $(call 
> github,rust-lang,rust-bindgen,$(RUST_BINDGEN_VERSION))

This could become:

RUST_BINDGEN_VERSION = 0.72.1
RUST_BINDGEN_SITE = $(call 
github,rust-lang,rust-bindgen,refs/tags/v$(RUST_BINDGEN_VERSION))

Could you test like that, and send an updated patch if this is actually 
working?

>  RUST_BINDGEN_LICENSE = BSD-3-clause
>  RUST_BINDGEN_LICENSE_FILES = LICENSE
> 
> --
> 2.47.3

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
