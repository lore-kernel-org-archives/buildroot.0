Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A46CC83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8114607E3;
	Thu, 17 Jul 2025 20:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f3fewBbnyqSR; Thu, 17 Jul 2025 20:23:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 256EB60834
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256EB60834;
	Thu, 17 Jul 2025 20:23:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B42B51A6
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99FCD81EBC
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QYEaKBh25itO for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:23:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C263A822ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C263A822ED
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C263A822ED
 for <buildroot@busybox.net>; Thu, 17 Jul 2025 20:23:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5D883B977AA6; Thu, 17 Jul 2025 22:15:54 +0200 (CEST)
Message-ID: <b09797d8-8077-477d-8e1e-bc28f0810548@rnout.be>
Date: Thu, 17 Jul 2025 22:15:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
References: <20250707130522.27119-1-mf@go-sys.de>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707130522.27119-1-mf@go-sys.de>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783354; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=Y/XFvpUEJsV/QzauwrajONy77qvnWTLLKYbj3Ks8FgA=;
 b=Ai+iChgyThl+njyLzvbHraWs3oWjr+EcnotEu/B5SHrnn7rMDqokm2NX7Tm2v9M1JZz+/0
 QQaNQTyuLVXl57Cst5EY8ercCwNskjSyiCm0G+rlPiUEWq1eT2Scgf4HnknPtUUj+6HPtS
 GMNS4j2N5KBq0upqOmbIbdvlmiDxybsJtdV20YtJITbRBnxdZn0L+Zz0kcjvzUizltG32H
 Rk42ITgEGMign7KXfDIsqvO0EZa1tFjzQWSLsczgcnIMSXeHrn5e+r4hDKJjh21u1D/sRP
 qUkVpOsUkDcUXGukjrViGOaIRKcK5e+dtpnM6i/E8XuZrGvZsOS5JlvtuK03+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Ai+iChgy
Subject: Re: [Buildroot] [PATCH] package/sdl2: bump version to 2.32.8
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



On 07/07/2025 15:05, Michael Fischer wrote:
> Bugfix release, fixing various minor issues:
> https://github.com/libsdl-org/SDL/releases/tag/release-2.32.8
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

  Applied to 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/sdl2/sdl2.hash | 4 ++--
>   package/sdl2/sdl2.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2/sdl2.hash b/package/sdl2/sdl2.hash
> index f5c0d44801..7e3a40ac5d 100644
> --- a/package/sdl2/sdl2.hash
> +++ b/package/sdl2/sdl2.hash
> @@ -1,4 +1,4 @@
> -# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.6.tar.gz.sig
> -sha256  6a7a40d6c2e00016791815e1a9f4042809210bdf10cc78d2c75b45c4f52f93ad  SDL2-2.32.6.tar.gz
> +# Locally calculated after checking http://www.libsdl.org/release/SDL2-2.32.8.tar.gz.sig
> +sha256  0ca83e9c9b31e18288c7ec811108e58bac1f1bb5ec6577ad386830eac51c787e  SDL2-2.32.8.tar.gz
>   # Locally calculated
>   sha256  97f35b302b361680ec1e891e95d2d52097bb95abff361434916d99dc1305f127  LICENSE.txt
> diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
> index 5225d8a531..1537d3d82e 100644
> --- a/package/sdl2/sdl2.mk
> +++ b/package/sdl2/sdl2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -SDL2_VERSION = 2.32.6
> +SDL2_VERSION = 2.32.8
>   SDL2_SOURCE = SDL2-$(SDL2_VERSION).tar.gz
>   SDL2_SITE = http://www.libsdl.org/release
>   SDL2_LICENSE = Zlib

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
