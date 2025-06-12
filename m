Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B00C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 567444090D;
	Thu, 12 Jun 2025 20:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nHxK6jxAJ1k8; Thu, 12 Jun 2025 20:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA894090E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA894090E;
	Thu, 12 Jun 2025 20:08:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C8A191BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF07C4067B
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4m0oNqTI8s5 for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:07:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C680E40456
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C680E40456
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C680E40456
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:07:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0566F1C10A0; Thu, 12 Jun 2025 22:07:56 +0200 (CEST)
Message-ID: <00caba4c-fbd6-45d9-97f7-e519e5d4dfc2@rnout.be>
Date: Thu, 12 Jun 2025 22:07:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre-Jean Texier <texier.pj2@gmail.com>
References: <20250604090732.29376-1-ps.report@gmx.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250604090732.29376-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758877; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LqbzOnvipvku5BMCAF53h8gx0wSZ6qTTreceCcuv3qk=;
 b=Tf/ZC8efPdzgLEZ39rXTYgWjK2qFJ/sUtyp9tyZAfVd6mwd/ZnNe1ksZegWoJzPSbVGCa0
 wS6N5eVe2S+06vBtKf+vUh5wEUdYi/i4PTsJgefaE+N+pQLqc+jL/f0827EUi7c/skPg/i
 /uOYy+wj+s0/50C+ygrkVl07XdDaz7u/AVGxllJeowZZoUEnRuBq9AD+9Rhc1Tgznk3RjT
 IBqcbieaEk/mhrZ6+2wRzoH+w49wdQ5Qn8287P+KYzwxlwRDTEO2pGANB0PnE6WdBIzML4
 WSBARY5HfojQrw0Dv/JNJQb9TLUcHwc1J/aTpgBnUtfyRhSuNW0xYALb88VrHA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Tf/ZC8ef
Subject: Re: [Buildroot] [PATCH v1] package/mongoose: fix openssl/mbedtls
 support
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



On 04/06/2025 11:07, Peter Seiderer via buildroot wrote:
> Since version bump to 7.12 (upstream commit [1]) the openssl/mbedtls support
> defines changed from MG_ENABLE_OPENSSL/MG_ENABLE_MBEDTLS to
> MG_TLS=MG_TLS_OPENSSL and MG_TLS=MG_TLS_MBED.
> 
> [1] https://github.com/cesanta/mongoose/commit/0613cc62f4dbec6beb76e9ddece60d52171585c0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/mongoose/mongoose.mk | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mongoose/mongoose.mk b/package/mongoose/mongoose.mk
> index b41f6a054d..8316a8d59a 100644
> --- a/package/mongoose/mongoose.mk
> +++ b/package/mongoose/mongoose.mk
> @@ -17,10 +17,12 @@ MONGOOSE_CFLAGS = $(TARGET_CFLAGS) -std=gnu99
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   MONGOOSE_DEPENDENCIES += openssl
> -MONGOOSE_CFLAGS += -DMG_ENABLE_OPENSSL=1
> +MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_OPENSSL
>   else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
>   MONGOOSE_DEPENDENCIES += mbedtls
> -MONGOOSE_CFLAGS += -DMG_ENABLE_MBEDTLS=1
> +MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_MBED
> +else
> +MONGOOSE_CFLAGS += -DMG_TLS=MG_TLS_NONE
>   endif
>   
>   define MONGOOSE_BUILD_CMDS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
