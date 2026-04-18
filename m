Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCDCF99C89
	for <buildroot@archiver.kernel.org>; Sat, 18 Apr 2026 18:54:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2302D82260;
	Sat, 18 Apr 2026 18:54:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxwxvSkxinlo; Sat, 18 Apr 2026 18:54:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6A4C81A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776538471;
	bh=w50cOlNkg2xJ9a9QxNaL6o5HWfQ4KuW1ZhH7rddY4Nw=;
	h=Date:To:References:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CL63ZWUlcut8MEQ2N66qo1MXsnGjb7bJQoSR3xGrmGvEHmaDIJGkap/sU/jtZJS9m
	 495FH5sxLGlphK7N1qpOI8X1ioA4GTX9K2XOhzVN+0R2xzec6jadNIgaA/8FBjhSme
	 K16USAfLh/UwU6rbT4TUdjz1L0TvjKFc6zI9gDK47TNK36K7mlVYqszGj0JOoCal7g
	 sKmJ+eslTHXv+O7EwlFOdxg0j3zSNkQ+ZClQKSSXosWJaY0I+kKY+eXaaFP43TVmiE
	 6v2R8SB/3TqB0OdZUwXv6kfLLaESFBKNNs1um+a24D1OQIGD45KZsen5RYhK9WE9wJ
	 MRqQ9VmOJrceA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6A4C81A29;
	Sat, 18 Apr 2026 18:54:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C6930259
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8DEF40E2E
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:54:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-xDqrzdWwE8 for <buildroot@buildroot.org>;
 Sat, 18 Apr 2026 18:54:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EAD4840E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAD4840E91
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAD4840E91
 for <buildroot@buildroot.org>; Sat, 18 Apr 2026 18:54:28 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 5A0F42C80CC2;
 Sat, 18 Apr 2026 20:54:25 +0200 (CEST)
Message-ID: <7ce8e1ec-7c5a-45a3-9104-c50fcf94ee45@bubu1.eu>
Date: Sat, 18 Apr 2026 20:54:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, michal@weblate.org
References: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
Content-Language: en-US
Cc: Fiona Klute <fiona.klute@gmx.de>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
In-Reply-To: <20260418155515.9980-1-chakrabortyshubham66@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1776538465; bh=9ctUXtFuxFOIkttz+122hBzITc6Zce8YVfVeJaRo1gw=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To;
 b=CCYxmUFdVMrEBYifU+WdtgotInJMx/Ji/HUMJG23gwXb6KUC0KqA0yZSPqUpEIBk7
 Ka252/zIooKzV45vAPamJRjyK0m6ipRL5FNQ7XKq1x2CamGbqv+GIHhP7v00rPndBL
 Uw9vy308Tuirof58xbSlfe2W4CvE2Btl+v3kvh6IfJJh2/41CrQsr2hFz0P7qR8EEa
 1dXYv2Cn8saN5V1A3ThFUE+UIkcqNApqvZAsJ+Y+OUSuiDupMss4CaVzCzFudXGLzS
 toP1RKmyLTp9OHnLj5JZdDs3Muor9DuGYNWkn8kGrLzuozgLchjdwuiDypTDjmov6j
 quSeTTNHOdKvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=CCYxmUFd
Subject: Re: [Buildroot] [PATCH 1/3] package/libenca: bump to version 1.22
 and migrate to new upstream
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michal,

I think enca is/was(?) you project? I wanted to confirm, that you did 
indeed hand over maintenance of the project to the OSS-Revival org, 
before merging a patch, that switches the upstream in buildroot.

Best Marcus

On 4/18/26 17:55, Shubham Chakraborty wrote:
> The original upstream site (http://cihar.com/software/enca/) has been
> deprecated. The project has been revived and is now maintained at:
> https://github.com/Project-OSS-Revival/enca
> 
> Changes from 1.19 to 1.22:
> - Project moved to GitHub under Project-OSS-Revival organization
> - Updated build system and dependencies
> - Various bug fixes and improvements
> - Continued maintenance after original upstream abandonment
> 
> Updated:
> - Version from 1.19 to 1.22
> - Download site from dl.cihar.com to GitHub releases
> - Homepage URL to new GitHub repository
> 
> https://github.com/Project-OSS-Revival/enca/releases
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>   package/libenca/Config.in    | 2 +-
>   package/libenca/libenca.hash | 2 +-
>   package/libenca/libenca.mk   | 4 ++--
>   3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/libenca/Config.in b/package/libenca/Config.in
> index 5e951ed835..55527260ba 100644
> --- a/package/libenca/Config.in
> +++ b/package/libenca/Config.in
> @@ -3,4 +3,4 @@ config BR2_PACKAGE_LIBENCA
>   	help
>   	  Extremely Naive Charset Analyser
>   
> -	  http://cihar.com/software/enca/
> +	  https://github.com/Project-OSS-Revival/enca
> diff --git a/package/libenca/libenca.hash b/package/libenca/libenca.hash
> index 04c9d5127f..dfa0bb940b 100644
> --- a/package/libenca/libenca.hash
> +++ b/package/libenca/libenca.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  3a487eca40b41021e2e4b7a6440b97d822e6532db5464471f572ecf77295e8b8  enca-1.19.tar.xz
> +sha256  95a70dd21198e6427d77a1d79721f4f87dd8bd07fdefe71a2062c6f41eee39da  enca-1.22.tar.xz
>   sha256  87f1bd4a52b4029476b684fcdd51fed3c6b2540e462d3c2d3bfc9be4558b2825  COPYING
> diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
> index 63b6895087..84c32ef7fb 100644
> --- a/package/libenca/libenca.mk
> +++ b/package/libenca/libenca.mk
> @@ -4,8 +4,8 @@
>   #
>   ################################################################################
>   
> -LIBENCA_VERSION = 1.19
> -LIBENCA_SITE = http://dl.cihar.com/enca
> +LIBENCA_VERSION = 1.22
> +LIBENCA_SITE = https://github.com/Project-OSS-Revival/enca/releases/download/$(LIBENCA_VERSION)
>   LIBENCA_SOURCE = enca-$(LIBENCA_VERSION).tar.xz
>   LIBENCA_INSTALL_STAGING = YES
>   LIBENCA_LICENSE = GPL-2.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
