Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF58E77173
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 09:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 687434032F;
	Mon,  9 Dec 2024 09:12:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWvB4tjxnwim; Mon,  9 Dec 2024 09:12:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 328DA40332
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 328DA40332;
	Mon,  9 Dec 2024 09:12:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B5CD979
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 09:12:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 78DB040949
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 09:12:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bx9feHV2ZTi3 for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 09:12:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org B9B2E40945
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9B2E40945
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9B2E40945
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 09:12:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.114.177]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MgvvT-1tqbJP0wJR-00p1SP; Mon, 09
 Dec 2024 10:12:10 +0100
Message-ID: <9dcf56f4-1938-41fa-b2d1-ca133959e134@gmx.de>
Date: Mon, 9 Dec 2024 10:12:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20241209082722.3049825-1-peter@korsgaard.com>
 <20241209082722.3049825-13-peter@korsgaard.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20241209082722.3049825-13-peter@korsgaard.com>
X-Provags-ID: V03:K1:iFjHGme3mPF2ylAKhppGUVHAHm8/Gs7v9kfp55cNyVIHvAEmA3i
 r7I7untaIx6qmN8PlHTQe2FlQalXGiQmgl581t9/T3nCNjFORKsoGQvrJyk3Bwx43eh7+js
 RX1NUzEOBuwRMUWg3W34GswBSX06DuuHxqceRwBaVJvqOuxzc9Kvk2uaqisz03kiknM6rXD
 ssHbnnjUTEE0C/Qt/BpbQ==
UI-OutboundReport: notjunk:1;M01:P0:p8lHGfaz4oM=;cGbfvMc5zrn9uZnzVxW/v2E2G66
 YqQVZ+Xe4kDB8BHRo9WMOTOwgTBRX8RQV/xGfUUeKIFfZFCZRckNDDF+cAhPbLOLRjQg6GoXD
 m8EBnij2jCEopN7O6ZLmxcZvIs+o8nBOXi1tXBEAQX9C62VLhMTob+NS3SeyA0Tz0k0bCvEZk
 eycKXJYfzIFMb+H0wB5PDSRYukBNiGIweFJr9r5IWbsYqzgX+KZn/byc3+nT0fU3zZsJ2xy0/
 Z3ZZxqlZIRSpMK+5arJUF8KNffCChGEyrlQ7KEGjDdA3+xbBVb5jTuTFhQPcOwTMPcA06nLEe
 Yhirjrewhdt3aDg4NWp70c2XeOuKGWxc/oTpxSgWqy27xropEehdhI3SUX27DxQotluYobCU+
 9mzSvz9EeMlYNkVAaYbTk8ytoXdxqCbLVFbbLLr0UczhMYyC6QWWhpVVvrfrat6UiZCEbDacb
 rkmO4TWjBzX9QtwWohViA1a8LbcM7WGBVbclGrGFV4NKLZYh3zDLt8TQwwBoNsWSdQjUMdTQE
 Qa2wDGQfK7ruizwnS+4Kr0VA9QMrAIE5pDgKUL5JHSQQjS5qOAbeP29BkCnY7M4BUdByXX2RP
 b/iyCRKbVDKWzrLtFAi9+Rkx40FIKAEPz1kyq+d3UmXKoBU2wzGtKE3xSnoZyH81y9BQ+QM+6
 srO9Nv8q7dV/Ahgk0RxFHS47G9xidXkhw0ftu9AYNJSLLYh2YfmQvS93Vcbq6/DzqVEEbIODx
 ySdwHuDGAc5skHtFYJ4swDAxHTkiN7zu6Yh2+l7ddmgDDOaHC2jpngbEh63UfMKgJZkY02kmA
 aM7wlDKvNAkiflEGYJlXWd0nVd/yOa1YHSCqRHY6QqbLKaZd7bHGrCqJXrPv7rn+pnre68Kwj
 hBR5k9g+sCQPX8gu/wtV+U0/aUuHnsklWewi1+POqUjd6VW35UDrw9l1dVhtnYpSTO3BN0Ene
 h7W7M3+RTGKsxVWQBAY4Wnft72OuvuFlteyqQsvkS+K41NO1/FMwGqE08AnOZ8kqoIVvkoFJZ
 nndgKJy4oMd1iB19/oIfAoAOQlaF1K2lGd2O/f6dy1MZ7FTjgzE7WtnUcYftcy/7r/QDU1eHh
 wdA4hSqkFxAUkSgDFDUOUnXDKg0kI9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733735530; x=1734340330; i=fiona.klute@gmx.de;
 bh=YqOVHJ72d9H+GMnWYEPhYhlwwnnwKBpbMO4CjXuPEQg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lB1VgPbL610N1Aik4s0QvimxABaMwjscrSjOQujg9sak5C/Kib5gE6V6pwkl5Hrt
 FZS9dhpras35oLctCvnz1VRyXbnAVVFswAp7QEGdOx2A3PZZtEsCLKuq9u0EwDhHA
 a+rXlPgeEtJeLBxHCLg0xhZcM1ojSneRHjAMkBCZXVNGxk+lyVHchW7KCjvVfDqRp
 EcZMbsKTLIE0XmZh8yTCvw4R4/Vumdkyr7TsxOS6WpE/CszMWuxaDh6jH5p9nU5Gk
 4pJ2OSWmUF0KgUjNwR4vuj7yUF4G6BxP+Ymjlt//EZjcj3/iWYZ5qP9pFPkKmfDmJ
 1aWyRzFyPgjuBQF9pQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=lB1VgPbL
Subject: Re: [Buildroot] [PATCH 13/23] package/python-asyncore: fix
 'library' typo
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.12.24 um 09:27 schrieb Peter Korsgaard:
> Found by codespell.
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Acked-by: Fiona Klute <fiona.klute@gmx.de>

Thanks!

> ---
>   package/python-pyasyncore/Config.in | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-pyasyncore/Config.in b/package/python-pyasyncore/Config.in
> index ad1376a243..09318baa58 100644
> --- a/package/python-pyasyncore/Config.in
> +++ b/package/python-pyasyncore/Config.in
> @@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_PYASYNCORE
>   	  Make asyncore available for Python 3.12 onwards.
>
>   	  This is a compatibility package using the code removed from
> -	  the standard libary, upstream does not intend any
> +	  the standard library, upstream does not intend any
>   	  maintenance.
>
>   	  https://github.com/simonrob/pyasyncore

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
