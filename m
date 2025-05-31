Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD9C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB3B140B73;
	Sat, 31 May 2025 16:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3xcqM0okktw; Sat, 31 May 2025 16:46:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5CD406A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5CD406A8;
	Sat, 31 May 2025 16:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id B35FA235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A576D401CB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1eOTnka-spf for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:46:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BE98A40068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE98A40068
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BE98A40068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:46:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3B651C0D8B; Sat, 31 May 2025 18:46:41 +0200 (CEST)
Message-ID: <70b48688-729e-42c2-b28f-9420a5ea63b8@rnout.be>
Date: Sat, 31 May 2025 18:46:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250509095901.24008-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250509095901.24008-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710001; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=W3vmunh/f3dbRk82BxS0tP0IALQXR3y9aSmoHWzPQVo=;
 b=WxDM2bZuCl7sanGqQuBsfbX23veq0J3C7WsAbMCpux00OpscDiPQgw3i8Tz2w6Sde7CHAn
 Ne8CLfy11UV6zjsmN67LNjTueDFRPc3up5fsM5HcvLyuH3qm+hXHD3rRF4DJ859KuHJyOM
 6tzjpvhcK1ZpEYTuNvo/Z/ShwXrIa6oGFuZ7sovRaRhagdLvtz5fZwkm/eateML5U75/xf
 diCE9DO292blW2sdbk96X7FBPgW7+oeG3S/W8jA4NnyL+bQ3Let+BBZwvNT4eiOAyl0ijz
 qpHfw/JIrlfKEqZP/Wa9ctZYYdElVsKOtqeg0lt9jYDLUDi5eDch19JwRJkTMA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WxDM2bZu
Subject: Re: [Buildroot] [PATCH 1/1] package/libsndfile: update project home
 page url
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



On 09/05/2025 11:59, Julien Olivain wrote:
> The libsndfile package homepage url [1] points to an old site in which
> the last update is for version 1.0.28 (April 2 2017). This site does
> not seem to be maintained anymore.
> 
> This commit updates the libsndfile homepage url to [2].
> 
> [1] http://www.mega-nerd.com/libsndfile/
> [2] https://libsndfile.github.io/libsndfile/

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   package/libsndfile/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libsndfile/Config.in b/package/libsndfile/Config.in
> index 4ccf937691..6fdc7fbd6c 100644
> --- a/package/libsndfile/Config.in
> +++ b/package/libsndfile/Config.in
> @@ -5,4 +5,4 @@ config BR2_PACKAGE_LIBSNDFILE
>   	  containing sampled sound (such as MS Windows WAV and the
>   	  Apple/SGI AIFF format) through one standard library interface.
>   
> -	  http://www.mega-nerd.com/libsndfile/
> +	  https://libsndfile.github.io/libsndfile/

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
