Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95164C5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 17:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61AC381235;
	Sat,  7 Jun 2025 17:15:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RIOU3KUzcjiH; Sat,  7 Jun 2025 17:15:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D9781260
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D9781260;
	Sat,  7 Jun 2025 17:15:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 248F11A4
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1029B60B70
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:15:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9UOUHVf217b1 for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 17:15:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A5D2C60B56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5D2C60B56
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A5D2C60B56
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 17:15:11 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.224]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MKbkM-1u7Okb1diG-00Jk0a; Sat, 07
 Jun 2025 19:15:09 +0200
Message-ID: <cdae5c9c-6041-4d47-8374-7c0a28539cd7@gmx.de>
Date: Sat, 7 Jun 2025 19:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Eric Le Bihan <eric.le.bihan.dev@free.fr>
References: <20250607170936.1502446-1-fiona.klute@gmx.de>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250607170936.1502446-1-fiona.klute@gmx.de>
X-Provags-ID: V03:K1:PgkP4T4wK59DL8cH6DjYmvkTqcXh1/XZyzSg6DemRr16pepkG+j
 61ucgBYhUY1ZyBzAg2vy2TRG5YFJ3koLooUJtPfX2RTHyCzAkhwqyMedt/v5HqUaQ+vNPnd
 Q3U66JgSZ3ydR891GhZoDez+EoqPZQYaQu6oGgXkiLP30cVj2LpcaNYMUp/+XU9thik6F+A
 NC8ILh5lc1C5Bi2oHjLSQ==
UI-OutboundReport: notjunk:1;M01:P0:r0P/hhGWhVw=;xFSrhXDqwjAAErQ9wkJs03K5OF2
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1749316509; x=1749921309; i=fiona.klute@gmx.de;
 bh=j36iOCgSvi9uZi0TUQL5m6lfRBDbx8jCykeBXoO40XE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=UD9dpdm900xmPNUVnq/PgM+Pk8vX3nv+wN+E1WarK35dTDJpQ36hz3yLiDMtQvXq
 IUrpijlsM/I0HzU4phpFcuL9W+Z9Y6f0x2RDJZPK4uXQe1Ub8uW99kgoYwgi3y52N
 6fZ/GApfdJHmc94LDdaREN3kVxe4YYUZwLEwJ3qa8ARcaM/2xV7hTKs8UcwWoMFB1
 G10WpB4imUSHbd0222RZiDmmkjzuCxSWCm0p2UQTmG8TSawOd34xlrFpSTiWPK5ST
 BIjL6JyU4+nyOVGGStGbC0S7IJ+0ayhEiCP99YgjzljaOzN428xh8VvaqsAWX6rw1
 +bR/hmMk0aprjlMHKQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=UD9dpdm9
Subject: Re: [Buildroot] [PATCH 1/3] package/eudev: remove obsolete
 --disable-introspection configure flag
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 07.06.25 um 19:09 schrieb Fiona Klute:
> It was removed from eudev with version 1.5.1, when introspection
> became part of the gudev option [1]. This has in turn been removed and
> replaced by package/libgudev, yet somehow the flag stayed. Remove it
> to remove a warning during configure stage.
> 
> [1] https://github.com/eudev-project/eudev/commit/d5d6a7f3040992f853eb23eb1bafac3b77891c2d
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Sorry, please drop the second s-o-b line when applying for all patches 
of the series, that was caused by a "-s" in the "git format-patch" 
command that shouldn't have been there. These are non-sponsored patches.

Best regards,
Fiona

> ---
>   package/eudev/eudev.mk | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 8318bc1ed4..99c9f0dcab 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -14,7 +14,6 @@ EUDEV_CONF_OPTS = \
>   	--disable-manpages \
>   	--sbindir=/sbin \
>   	--libexecdir=/lib \
> -	--disable-introspection \
>   	--enable-kmod \
>   	--enable-blkid
>   
> @@ -71,7 +70,6 @@ HOST_EUDEV_CONF_OPTS = \
>   	--with-rootlibdir=/lib \
>   	--sysconfdir=/etc \
>   	--disable-blkid \
> -	--disable-introspection \
>   	--disable-kmod \
>   	--disable-manpages \
>   	--disable-rule-generator \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
