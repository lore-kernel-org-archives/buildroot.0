Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28168CF3181
	for <buildroot@archiver.kernel.org>; Wed, 19 Nov 2025 09:01:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE3E740AD8;
	Wed, 19 Nov 2025 09:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OuXg_aeFHKy; Wed, 19 Nov 2025 09:01:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEB740AD9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DEB740AD9;
	Wed, 19 Nov 2025 09:01:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 927A837D
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 848B68282C
 for <buildroot@buildroot.org>; Wed, 19 Nov 2025 09:01:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6frqKK8MuzTd for <buildroot@buildroot.org>;
 Wed, 19 Nov 2025 09:01:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13EA6827B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13EA6827B1
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13EA6827B1
 for <buildroot@busybox.net>; Wed, 19 Nov 2025 09:01:42 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.102.212]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MC34h-1vQuK60lUj-00G7Mr; Wed, 19
 Nov 2025 10:01:39 +0100
Message-ID: <cecb637c-cbf5-4acf-abed-6190ce9dc90d@gmx.de>
Date: Wed, 19 Nov 2025 10:01:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20251112093116.481902-1-francois.perrad@gadz.org>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20251112093116.481902-1-francois.perrad@gadz.org>
X-Provags-ID: V03:K1:uyF/B2u7W0azYP4CkCGyZ1k/9G8DWFA99lQdId3ogwM1ANMJN8+
 iuiRMD2qjUuY5BPZCHpsSSl7GjHogU0yxeTTzlXdhOm6egsI7Ggwh2mCetE9ym/P0fWpFSb
 artP8YXcASdmQvDz0quxK5BmQJjwoMml4vvanHbRk9qaJIn+UsOi4A2P/XeXXzVREECarDU
 CSMZfCY+4cJmw/l7eLO8A==
UI-OutboundReport: notjunk:1;M01:P0:bpvIuS4ylq8=;MqL8fkinfAh197j8Pl1UzHCRVro
 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
 sytdGfU8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1763542899; x=1764147699; i=fiona.klute@gmx.de;
 bh=8BVyXiV8vhh/wJrrfSp6922fTQ3a30DamYeS6PymHLo=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=nZW7y3y/V5MPLD/93NVcPgCeoTyZy19OBXH3yZ/BWB+a1LBVledDTB7Op+SeEGAv
 xaWom5m3luGr8rD8XYgRmdQwHiknzFLw8UWkje7hww5TW5Q+6QPeNuM5jdcPJEjCn
 17iKkYrahTxNYQpqzkgrljZ3NMfw/oh+ExPawV2Q/jMtMSyXNxNkbJjgEkigEszbj
 z8ukzOEyJymjOO0VtgFDDMEBxVxOLmruCWQ5S/u6GixYkKvrRqnz3IaXSIg1JOhtk
 Gp8ltZNzYd2E2voz3IcnrZ9HJAUTa4Rmnsq3TMOAvupZrxbKgx+3wVbTZpbj7dyLv
 HUf4aKmzPbWDVsC4LA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=nZW7y3y/
Subject: Re: [Buildroot] [PATCH] package/kbd: bump to version 2.9.0
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

Hi Francois,

kbd 2.9.0 fails to build in at least one test (arm, glibc in this case):
https://gitlab.com/buildroot.org/buildroot/-/jobs/12104755669

As far as I can see whether zlib.h provides gzopen, gzopen64, or both 
depends on compile flags, but I'm not sure if it's an upstream bug or 
something that needs to be fixed in Buildroot. Could you take a look?

Best regards,
Fiona

Am 12.11.25 um 10:31 schrieb Francois Perrad via buildroot:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/kbd/kbd.hash | 2 +-
>   package/kbd/kbd.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kbd/kbd.hash b/package/kbd/kbd.hash
> index 25866751f..d46a60a80 100644
> --- a/package/kbd/kbd.hash
> +++ b/package/kbd/kbd.hash
> @@ -1,4 +1,4 @@
>   # From https://www.kernel.org/pub/linux/utils/kbd/sha256sums.asc
> -sha256  519f8d087aecca7e0a33cd084bef92c066eb19731666653dcc70c9d71aa40926  kbd-2.6.4.tar.xz
> +sha256  fb3197f17a99eb44d22a3a1a71f755f9622dd963e66acfdea1a45120951b02ed  kbd-2.9.0.tar.xz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  5a16340fe773f422144b436df90319114a2884933c56e9be6fad642e59be5e1f  CREDITS
> diff --git a/package/kbd/kbd.mk b/package/kbd/kbd.mk
> index 953adccd0..8008a9b3b 100644
> --- a/package/kbd/kbd.mk
> +++ b/package/kbd/kbd.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -KBD_VERSION = 2.6.4
> +KBD_VERSION = 2.9.0
>   KBD_SOURCE = kbd-$(KBD_VERSION).tar.xz
>   KBD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kbd
>   KBD_CONF_OPTS = \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
