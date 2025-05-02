Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA6BEC3ABA3
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC66683AC5;
	Fri,  2 May 2025 10:30:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g3qZCJQL-FJ; Fri,  2 May 2025 10:30:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1EE583AFA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1EE583AFA;
	Fri,  2 May 2025 10:30:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 95EAEEE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C0058198A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kcq825U7XCsu for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:30:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D16DB83AC5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D16DB83AC5
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D16DB83AC5
 for <buildroot@busybox.net>; Fri,  2 May 2025 10:30:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D56781C111C; Fri,  2 May 2025 12:30:46 +0200 (CEST)
Message-ID: <21660be0-789d-47a3-bf50-c16d2d5208de@rnout.be>
Date: Fri, 2 May 2025 12:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20250416063732.469526-1-francois.perrad@gadz.org>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250416063732.469526-1-francois.perrad@gadz.org>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746181847; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ksUdkawYg8aJ39OS6vUXEdrBVc79JqQH2uu/S0lt8kU=;
 b=MdwbV19ga/zajWZmdF3mlXD2jpy6nQ3FXNml7uZqh29bhgju/yqf2YV5vT6fUac5v4dIiR
 EKnNEGOsmS1RpKbBoSbuqmL8/UnoebEfam8RD6HFy3T14TRtoQ3+FjHiSmwYRsdmiSUxBn
 ZepClJXUsDrmU7qNq7QZwWE+cT7XGFRbC+haq3FirmQEAhRUavrtzIsQwdHWpdNQ78eT4q
 U94mTtf7lA7rfXHkMGlmncM+5kuT2J2N/POrgr+q1oPGv6UYLkE9fu1yf2Fk2xkK4ten5W
 wDYwss9sFNolfE4+cxNxw5sWTgnMq9jCVc8fn4rcP31M39a8GmcNYPSrxLVx3Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=MdwbV19g
Subject: Re: [Buildroot] [PATCH] package/lua-periphery: bump to version 2.4.3
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



On 16/04/2025 08:37, Francois Perrad via buildroot wrote:
> diff LICENSE:
>      - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
>      + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/lua-periphery/lua-periphery.hash | 4 ++--
>   package/lua-periphery/lua-periphery.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
> index 666165616..b09dbe7c5 100644
> --- a/package/lua-periphery/lua-periphery.hash
> +++ b/package/lua-periphery/lua-periphery.hash
> @@ -1,3 +1,3 @@
>   # computed by luarocks/buildroot
> -sha256  63694d795a630afcdb4812cb0af489ab088501ad7fe1dc9ee1337b53ff849721  lua-periphery-2.4.2-1.src.rock
> -sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  lua-periphery/LICENSE
> +sha256  cd8ecf48e1dd53244f7e108e5e77f8a1c78949e8decd7ada1a881c6178b840e6  lua-periphery-2.4.3-1.src.rock
> +sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  lua-periphery/LICENSE
> diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
> index b9933a900..f0a52bf8b 100644
> --- a/package/lua-periphery/lua-periphery.mk
> +++ b/package/lua-periphery/lua-periphery.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUA_PERIPHERY_VERSION = 2.4.2-1
> +LUA_PERIPHERY_VERSION = 2.4.3-1
>   LUA_PERIPHERY_SUBDIR = lua-periphery
>   LUA_PERIPHERY_LICENSE = MIT
>   LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
