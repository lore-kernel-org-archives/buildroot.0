Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391B2CD6E4A
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 13:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D73DE8427C;
	Fri, 29 May 2026 13:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wfPl-wvEnUk5; Fri, 29 May 2026 13:33:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E434C83C7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780061587;
	bh=TH5PnAndiKbP9DA1E70Mc25BEba2OCX1YBXbP2aoGCA=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WW1skooYmpi84PRQ4pgBO7Kwumshnow753Q7uDlAkogdj1kdX1waW3FfhsOPxrmFR
	 Aho0YKRYNqKnmg5l49jwRNAgewrVs8CAW5GDBJH5uW9Eid6W39Iz1/dLb8Wfp8ub6M
	 xaiDnNO4bW1ZIL2vnll3aMGc41pBXjLgcmjjbP/b8a5ztpjHDYSaymeVlH4buJvIBb
	 C5GmXkf1P/Aj3VIGei+m0blJK/HiOFemaEg/NQpnHo0w+sy1z/q0+5TOXjAKwN9vL1
	 jDw6x+4Ns2bBsF/Na+qhqb6tQPIGCpb+H/26G8tbPs89fwPSBkKyyQ2zGKZSQL69lK
	 nT73Lw7lWaGsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E434C83C7F;
	Fri, 29 May 2026 13:33:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64D17288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4536142143
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:33:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ig9eHyDGh53o for <buildroot@buildroot.org>;
 Fri, 29 May 2026 13:33:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 874F041F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 874F041F74
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 874F041F74
 for <buildroot@buildroot.org>; Fri, 29 May 2026 13:33:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 65BFFB97C675; Fri, 29 May 2026 15:33:01 +0200 (CEST)
Message-ID: <519e28ad-9005-45aa-ae36-674b0e35062f@rnout.be>
Date: Fri, 29 May 2026 15:32:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20260506184057.665854-1-bernd@kuhls.net>
 <20260506184057.665854-9-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260506184057.665854-9-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1780061582; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=D9g/7grxQIzvn2jHwkY3wbqfzRRyHXdn++IKn8qq5Qs=;
 b=QaN2SMjBDY+Uis8gab3TsZMCW39WNxG6tFjtqRcLna8AaFhYRFTxnPZs2diu0bX3w/OkjN
 gfh49ImYLRdvPqT0+Iq7B+ocgPXkJyGQULiPm8iOJGqWL973Y2vwhjoLA1caK7351Ea5om
 /sf5Flf8SP67OgQuwT/xuo7e96VvU+1xENF5xVzwC1l/nO9fhJsdUGCPf5emlxzKhdiO5u
 jhQD8Ng09kpC6BTyx1x26lB1qn6C3OUjeLDxu8zJjXewi303kwn0qYXGyZWIaWwHtCrxhL
 mON7XUUI2U9uMjuSPBTUpdEcqMKjaHFzzcwnZTccN59J6VMxhSJXGHBA4B3m1Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=QaN2SMjB
Subject: Re: [Buildroot] [PATCH 08/12] package/libv4l: optionally use libudev
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



On 06/05/2026 20:40, Bernd Kuhls wrote:
> From: Bernd Kuhls <bernd.kuhls@t-online.de>
> 
> libv4l only requires libudev, not a full udev daemon.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Since you signed this off with kuhls.net, I changed the author to kuhls.net as 
well. Same for other patches in the series.

  Regards,
  Arnout

> ---
>   package/libv4l/libv4l.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index a535b8e8a6..ce0b356edd 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -42,9 +42,9 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
>   LIBV4L_DEPENDENCIES += libgl
>   endif
>   
> -ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
>   LIBV4L_CONF_OPTS += -Dlibdvbv5=enabled -Dudevdir=/usr/lib/udev
> -LIBV4L_DEPENDENCIES += udev
> +LIBV4L_DEPENDENCIES += libudev
>   else
>   LIBV4L_CONF_OPTS += -Dlibdvbv5=disabled
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
