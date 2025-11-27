Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CCA5CFD2F6
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:58:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CAD860DA6;
	Thu, 27 Nov 2025 19:58:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 80zrGYWiLL6I; Thu, 27 Nov 2025 19:58:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACA26151B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7ACA26151B;
	Thu, 27 Nov 2025 19:58:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A74E708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4498384400
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OxGyl4TqTRrg for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:58:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 201DD843F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 201DD843F7
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 201DD843F7
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3557FB979CA9; Thu, 27 Nov 2025 20:58:25 +0100 (CET)
Message-ID: <1d8f3570-b745-4b8f-b243-74f905743ba5@rnout.be>
Date: Thu, 27 Nov 2025 20:58:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251117215250.1938011-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251117215250.1938011-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273505; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=sjUduIMeiM32khu5/VVwY7Ps7Jan//sSWbxcqfdSHhI=;
 b=fT5pjkA0Yzee4y2UraGEwGYlFOi3mGd/JktBgkFRRPPtunr/gQD1VdBegtTYSMPMM2yEEv
 230kcHgLfJTpqctLQP2DsGy34Va52kmeGVPvZcj1D+Fzw50wTMcYTCZxxq0pnooOmjLpg9
 4+t6DmvOGfJt0tS6qKrEGIL68XFOGkwFGzF5lgqftiXzISjWY+Gz2dlCsmvl3pZ2O0i9co
 WZtqjU9cF0ifHrssmhEVnqFStcBbpGL2SjrSfvuxsYJzbPdLsGIXa67Q/xUQPErfNV16Id
 SgdYFLGGNcO54njXSut4EHM5nSRQygooEUvl8nXJ0Srrq6nrXN5lX9Ht6r1Crw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=fT5pjkA0
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: remove Julien Corjon,
 e-mail bounces
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



On 17/11/2025 22:52, Bernd Kuhls wrote:
> <corjon.j@ecagroup.com>: host ecagroup-com.mail.protection.outlook.com[52.101.166.0]
>   said: 550 5.4.1 Recipient address rejected: Access denied.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d5ad36181c..34dd929720 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1791,9 +1791,6 @@ F:	package/libmodbus/
>   F:	package/ltris/
>   F:	package/opentyrian/
>   
> -N:	Julien Corjon <corjon.j@ecagroup.com>
> -F:	package/qt5/
> -
>   N:	Julien Grossholtz <julien.grossholtz@openest.io>
>   F:	board/raspberrypi/
>   F:	configs/raspberrypizero2w_defconfig

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
