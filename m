Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED57F606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 16:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l9QeFLpM
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C77CE6065A;
	Sun,  1 Nov 2026 16:58:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6jR753KswPgL; Sun,  1 Nov 2026 16:58:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E0AB6605F4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552298;
	b=OL3lrGFV3dKFdR6JddHOzwYaRhdGKVJc0PgzrsZOP3DAmwmnJZbd2DkF+2eQuoyJxTDr
	 LrKUPujFrKv+i9sJABUrL18DGOUGPum7Z/fKOzz+q2CvCr1fKUXEqpzbSCsG4VD1a1LDp
	 bN1T36s+6q1ghdQT81s/ukJxcPR+dzMvFoIcW45gIKzKSWZ41YwCzvLEJuQyDF76uMOdn
	 uFezMXrOnIZCVyC9G6W+GYhFC7tDxoVhb5NTffhkH3vUcFrMYg9zcnWJjS1RN/POuJeC0
	 YWMHj6bdOHc0EfDg3uKYlE6G26T5x+A28WtIk7Ja64SR01rcn1RvSitfKo4mUdrYqZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552298;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hUe58PjqF3Rwrfissce9XXiUwr9B2goYudrhVOG8YeU=;
	b=l5PmJdO/jne2YVgspqvwDkylM7XXIF4cb/PP9zn8oDWhvbCCrzxCfgZvzjn4qb+xIlIf
	 tB9Xg/TkCBqyfSHcAD7WP7G6aLoOCupzyExxjuWWcXs9QfHyLGlLXf+xrfh5RkI47JiUf
	 +y+Nxo/RSHVBzYb/Ep58P8vX9mLkET3PYVQiTcH42Zyl3sH7tn5hnvpTUCzq0yawrvAgB
	 wdbEGug6ne0PgNdOYVU1bU82dg6UyP3IKdWeFxhPNlE2s7LMp+RHyJu1vnEsfR/bdAjmd
	 ChK4FH9vk62DXpKcGWVJO4jpkEutq5TJdoIFcSqCm2z+YW8I0wn/yfVcMwi4gwnFoaA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552298;
	bh=hUe58PjqF3Rwrfissce9XXiUwr9B2goYudrhVOG8YeU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l9QeFLpMlsN5zBxHXcsaSBP57StYFaoKbe1VurFFr1eEtsWe/XNM4ohq2biJQZ0nS
	 7jrtcBJjjYUnXTGKV6m55q7zmQFAY0AXS1abQTmsuts7DKQuaBREVXUkYlrQ5ulH5c
	 jv4dcf81W6w/OXc2kHuwRZffb3oM9xuaKCvkoCSLmyEPLvlkBiziQEO2Z3X2WBhKrG
	 QzUhr4Qg4Ocu3Ex0I7Z2OZXTsn/SRWHTYSPdKy/BrJ4Nm3vka9W6pTspB0YRljyrAj
	 lsjkS/kIl+7Zmfuz2AXW8RTpdrNUcxp2NEVwKVHTvX5R9ejpCRcresM/+HheTlCbvP
	 RINvuUjguALpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AB6605F4;
	Sun,  1 Nov 2026 16:58:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DF1702AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C540280CB9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pQfaWpzxYl0F for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 16:58:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CEE7980DBA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552296;
 b=IBwoeEBLiTv8W6NOd+Nm8qHapo+NHuAXOYGZh/OAcAp2nbzQZ/Jrh8aNt1b0g7IVI2W6
 mkzSshAWs5YNdlVFh55ilV0RY07plf0cb/A7QVc2dpOajmcEVbRCFdGZLB6gzS7FDRkrc
 nNzqBv7iFy2MJiJHsqI7D+EZLQqf3/KHaIC27F4g3TLHIrpYza65hbJ77jC7znMiv/8Ci
 yX+BdWN3QB6FJDBxPrL0tPs+cnx/YyIFxVTcxHscw0L9g4Ij3gh7DhKXlhw4c+pBvoKz3
 YT4ZWMnS9ZkNxnmmCuCjuLq2AF7tCRKoqFOmiISZZn6ChbfjQJBQbKaBop41G2iLxIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552296;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=YFEv5Dd84xh1Izl5v8CpDKym5NEMQHnd9xI5i3wKaac=;
 b=Ex2bA3oMRpxxbAJ7UoO6PnQUAadN/OJF/mbkHBEHXLDpgd2OiWO4l127AwUalqUHFtkh
 JboMWE7Os3tb4cWIF1Tvaw/AJsDQeDTmMF/eZroG98i4BSOpG4s59M9XA+YLRwJFeVk5B
 BnzsGqPGmRbhWFNcFO6mc++of2xITD2fd144USRC61M4G/CGNK1Ksvonj31XZgcmjH/Ct
 kJvF0rxsH5B/ua7KmzTINeRcFX9zLvQX7XHCyAuqSm+2jWb4rOKT0ILKQQRKR1UyNPF3c
 /JsywrriO80dLQBLH3fF92hEhL4dlKGPYvKJ0dJe/pm+HfVGv4DJb0zsoYncD0dKi7Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="U039/XBi"; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEE7980DBA
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:15 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B83CE1A1355
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 16:58:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CF8860750;
 Sun,  1 Nov 2026 16:58:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 741741032912A; Sun,  1 Nov 2026 17:58:12 +0100 (CET)
Date: Sun, 1 Nov 2026 17:58:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>
Message-ID: <audvhswLJYPepCel@windsurf>
References: <20261101104535.1696412-1-bernd@kuhls.net>
 <20261101104535.1696412-4-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261101104535.1696412-4-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 4/6] package/libcamera-apps: bump version to
 1.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 01, 2026 at 11:45:32AM +0100, Bernd Kuhls wrote:
> This bump adds compatibility with ffmpeg 8.x while support for older
> versions of ffmpeg was removed upstream:
> https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65
> 
> Switched to tarball provided by upstream.
> 
> Rebased patch 0001.
> Removed patches which are included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: Marcus Folkesson <marcus.folkesson@gmail.com>

Applied, but question below.

> diff --git a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
> index 1aba972d13..6c0469b249 100644
> --- a/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
> +++ b/package/libcamera-apps/0001-core-Update-checks-for-disable_rpi_features-option.patch
> @@ -20,8 +20,9 @@ Fixes:
>    673 |                         controls_.set(controls::rpi::ScalerCrops, libcamera::Span<const Rectangle>(crops.data(), crops.size()));
>        |                                                 ^~~
>  
> -Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827
> +Upstream: https://github.com/raspberrypi/rpicam-apps/pull/827 (rejected)

If it was rejected, what's the plan?

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
