Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7933BCD4F3C
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 18:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DB4606A5;
	Mon, 18 May 2026 18:17:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5eIuP5Z2Ur7f; Mon, 18 May 2026 18:17:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40C1A605EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779128259;
	bh=GmlH0UqENtZqCKTpaZm0RV4RGUUDbozqXCLF7D6vbdI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dSbLJubdof4ZrKaR9zkzeitFwM2ixXw6zja+8Hvwm404UP7BQ5oRaiVct2YC/5gme
	 mFMSXlazsDY0VUZhSBX75msHysQr0q/yIhOFKLzOkT4JDVbPQ2rO8ljnu51Qjg76oR
	 lGXIZJAFz/D/is3q0xLnWh+9UDa7z5Jstfd1frR1Yt3ybFvONwmNU5YvfEO9JTPsbV
	 BIJUDmo2TAZanggWmYIXzsl8ET9pCv9HR4osLPvq2rzKWj/X++LSwbB5Qh6/dFscm7
	 geqZnTuxgoKlCtAeNbKXKaGLJ1rY/iMNHGpPDNuSfCIFeB0vvw1+P7jVjnvw6mfS5B
	 q1iwmJWU0pfhg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C1A605EF;
	Mon, 18 May 2026 18:17:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1B8C1B2
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:17:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B32A9400E9
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gRrQWg2HhhI6 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 18:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FBB9400BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FBB9400BA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FBB9400BA
 for <buildroot@buildroot.org>; Mon, 18 May 2026 18:17:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0468B97C1E7; Mon, 18 May 2026 20:17:33 +0200 (CEST)
Message-ID: <546b8ae3-76c7-4f84-9648-914706a16597@rnout.be>
Date: Mon, 18 May 2026 20:17:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>, Richard Braun <rbraun@sceen.net>
References: <20260517203806.375813-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260517203806.375813-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779128254; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=g6pA5uO3cX40sk7USaAVO9sxeXX1lPHPPrbsibQEGUM=;
 b=cUZ3yYbm52nbebSbvZjHIuybNN277wEHSMeHV3Vnuel+PE9KeV40OewqhqyydIlTMKN6lW
 IGbssRIB1En7bbKcbzV5dw8F8cdUKs2JKZJs2XYa/jY3UXyIpEGUazGyaknaHTfRpjfIsi
 8dpMZSt0l66rMzKfTQ1bSB6mkyFFZz97IfrLsLXpnax21m16FuS67jClYyF6ZWHClalcTN
 jS7IBdAsZOvZkjNyv23oZ3eY8RYWmKfIPrzkAtXZ4STPsz/QLTvRC1yEb6TByXqkSXMIzy
 pIV/S6KKx/HqxMc+Q+U7fw/v2r1EO6eZJqahUPlrAZmdr9K81tNMBWWxm0Vh+w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=cUZ3yYbm
Subject: Re: [Buildroot] [PATCH next 1/2] package/zic: bump to 2026b
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



On 17/05/2026 22:38, Julien Olivain via buildroot wrote:
> For release notes, see:
> https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/

  These release notes say:

      British Columbia moved to permanent -07 on 2026-03-09.
      Some more overflow bugs have been fixed in zic.

  Both are critical for LTS and thus for stable. So I applied to master instead 
of next.

  (In general, tzdata and ca-certificates updates should always go to master, 
since things actively break if you don't update those two.)

  Regards,
  Arnout

> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>   package/zic/zic.hash | 4 ++--
>   package/zic/zic.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index 7fe7582f10..75242a306f 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
> -# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/TAGXKYLMAQRZRFTERQ33CEKOW7KRJVAK/
> -sha512  d14bc0680b9cb33d6526a2c0e483f2abafc2593cfe5fbfe7dcab940aafdc1baaec065dbaa1bb58b03586a8631ffdf43ebb22ff5a70503298b6ea2cf061d82c16  tzcode2025c.tar.gz
> +# https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/VX2Z3CBO6KHTYZNBBKFFWM7ZCI6TVCXP/
> +sha512  55b44d52a83c9db151be32c3d78376ea7f9d4311ef15ed6fe34b855b08fc546531e51309d178d9c175a6d5d7d0b058440e45a55d200ca8925e3798dac9bc739f  tzcode2026b.tar.gz
>   # Locally computed:
>   sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.mk b/package/zic/zic.mk
> index 06d8ebaf15..43e74e64c8 100644
> --- a/package/zic/zic.mk
> +++ b/package/zic/zic.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -ZIC_VERSION = 2025c
> +ZIC_VERSION = 2026b
>   ZIC_SOURCE = tzcode$(ZIC_VERSION).tar.gz
>   ZIC_SITE = https://www.iana.org/time-zones/repository/releases
>   ZIC_STRIP_COMPONENTS = 0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
