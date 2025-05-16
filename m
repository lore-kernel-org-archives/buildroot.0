Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63114C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:51:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2E80040CF2;
	Fri, 16 May 2025 10:51:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gOL3W9oL8bG3; Fri, 16 May 2025 10:51:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A924180F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51A924180F;
	Fri, 16 May 2025 10:51:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B6A81AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4852D83CF5
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rfvsIxsDjCiR for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4B50381F68
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B50381F68
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4B50381F68
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:50:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 585AC1C0FE9; Fri, 16 May 2025 12:50:54 +0200 (CEST)
Message-ID: <87151831-233e-41ad-ab18-6027cd07df56@rnout.be>
Date: Fri, 16 May 2025 12:50:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <aBIOK6jw0uVnsgqM@waldemar-brodkorb.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <aBIOK6jw0uVnsgqM@waldemar-brodkorb.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392654; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Psl7aUjIKEVKE/tLCJeRETBPg4I21yV2u2vRBMOww3s=;
 b=bdBcfVWVqV6nhOOPfUX54w8WEAZWmKncXDqbxSuwwffVdMmMXagkf1VtAGCCvAN22H+UxF
 mh2RiIsV7O4z3mqQ6eTWGRLZepO58KkOsv63tqiDUBKuxxxMZHikFMCqoFUsKSjL1opbRG
 bTC7ymYhh8vAyrgquduhs1noD8t844dbwbxSoqGLQiUmNfeAqRBx/vpYtltYU2JSr/Stcl
 wq11qK1zP7CicwpzAxGgyoQ0UWWQNcLowGZZx02i9jYPBd6F2rpPuyM7iMk8AIn1lr16cO
 hVnPXC9cqDSICQF6xn1qHv8NHSYcu6PDlC3PA/TONch52FB4kM1lUQ/QwykARQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=bdBcfVWV
Subject: Re: [Buildroot] [PATCH] package/ruby: update to 3.4.3
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



On 30/04/2025 13:48, Waldemar Brodkorb wrote:
> See here for a changelog:
> https://github.com/ruby/ruby/releases/tag/v3_4_3
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/ruby/ruby.hash | 4 ++--
>   package/ruby/ruby.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
> index 81c9f9c9db..ec17b092a4 100644
> --- a/package/ruby/ruby.hash
> +++ b/package/ruby/ruby.hash
> @@ -1,5 +1,5 @@
> -# https://www.ruby-lang.org/en/news/2025/02/14/ruby-3-4-2-released/
> -sha512  cb8b5023bce316393716548c5f0a44c7d0240724ff79b995517641266af30bedc6f402c1c8fa27368ea607e2aa6d36bbb201e00c6e9dd2a80d837431d32343b5  ruby-3.4.2.tar.xz
> +# https://www.ruby-lang.org/en/news/2025/04/14/ruby-3-4-3-released/
> +sha512  b30aad675cdcc1bdfe9e5fffe9d1925db3b3ac854a5e34180c368bc6e66f73e29ba5d802fea249353b7d799c01384c58bdd763fd1b679303158baa7824b9c08e  ruby-3.4.3.tar.xz
>   
>   # License files, Locally calculated
>   sha256  a2021e52d5d6adf7e3f45aab9d2b860ce03cdf6153776853e11d5668193eecfd  LEGAL
> diff --git a/package/ruby/ruby.mk b/package/ruby/ruby.mk
> index 891fd78d4b..b06a728799 100644
> --- a/package/ruby/ruby.mk
> +++ b/package/ruby/ruby.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   RUBY_VERSION_MAJOR = 3.4
> -RUBY_VERSION = $(RUBY_VERSION_MAJOR).2
> +RUBY_VERSION = $(RUBY_VERSION_MAJOR).3
>   RUBY_VERSION_EXT = 3.4.0
>   RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
>   RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
