Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9023AC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 510B460E50;
	Tue, 19 Apr 2022 20:32:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_MTn1GBy3EB; Tue, 19 Apr 2022 20:32:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568AF60E54;
	Tue, 19 Apr 2022 20:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1103F1BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F25E741717
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:32:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d0rGhZ7FMyC1 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:32:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D983E415DB
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:32:53 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id g13so7536272ejb.4
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=Y46vf6hGMGDc7SqamnlEfHGbptjntz7Kx3DPDhfM14g=;
 b=c4M2+GwlCL/DGecj3LKLYd1IVI0+QzCGKJDK7NEza562gOogPutvMAuQj2lg02/dZj
 TzzMfeH9bInePXLdNP0gt5jwVsQWBKH75HVwd28y1P/NUFgQAQ4Xrj8l2EonEkjh5K3F
 STYXo6tMV4SIkvZnAgUR+gsbhy2KrWvx3J/loLcUch9X+XK9/HqvqKs98bL0eq68R3D3
 fV7izkcH/1g4/XTbfnrJhzyw+4/w/Pt/5jtQRbK1Hzb5P16q/o68ZiEmiS/mA6Gpc8a8
 k363WjgzpNV8vsghjvLl+xbCmQd7TwhpQRDJjzAAXQ5oMbSGtUlu3hR0ao5QoWbLrGzE
 4c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Y46vf6hGMGDc7SqamnlEfHGbptjntz7Kx3DPDhfM14g=;
 b=vYl8ZhD3KQf5CTGLXSGEhczQKAVpKlXezyqhyUesdioK+RRVNIU8gJViv6Ejg11W64
 nSf1zhbdvzmsG6NxfYqZcuQfeLN5iRLdrDHpdMzojCydeLha1SkNwj+UTUv4RGDHyHg4
 5ZZUQ6e4Owrv7RgwoT5pkCUsXXvvEY1tuiUjCVXLDOqauuf3foAy5AtGdsvDgv1tfocw
 /4Vudu/EaSL8dUSGGr9TEGYXjUHMDbP5Oy3sSwoR4OF2cmlma1dRD1kL6WAJ8nHnSlpG
 G1bhDQ4765jV5feHfdCjaggFoc6St8Cil25D5XsDbxRPEe+rAuDuwt1Fm8N/RXY6Noc6
 hADQ==
X-Gm-Message-State: AOAM533UPW2nbClfbc/7AJe1Txpl8Tap/gFehTxGuYe3mc86xemYg9b8
 KDH0fqlgZakszj+bPTNYGc6UaQ==
X-Google-Smtp-Source: ABdhPJzop/lwV8oi4rbVpqpySHPxfQIwJ+jgwK+2ET+UvCM/tRp7RVkpetfz2e3drWPFQpTrOFnmeg==
X-Received: by 2002:a17:907:96a9:b0:6e0:db4a:ba8d with SMTP id
 hd41-20020a17090796a900b006e0db4aba8dmr15305672ejc.87.1650400371965; 
 Tue, 19 Apr 2022 13:32:51 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 l20-20020a1709062a9400b006ce71a88bf5sm5975317eje.183.2022.04.19.13.32.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:32:51 -0700 (PDT)
Message-ID: <711e2b71-6bdf-c6c5-8659-a78dc569b3ef@mind.be>
Date: Tue, 19 Apr 2022 22:32:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20220419112544.993456-1-peter@korsgaard.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220419112544.993456-1-peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH] package/gzip: security bump to version 1.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 19/04/2022 13:25, Peter Korsgaard wrote:
> Fixes the following security issues:
> 
> - CVE-2022-1271: An arbitrary file write vulnerability was found in GNU
>    gzip's zgrep utility.  When zgrep is applied on the attacker's chosen file
>    name (for example, a crafted file name), this can overwrite an attacker's
>    content to an arbitrary attacker-selected file.  This flaw occurs due to
>    insufficient validation when processing filenames with two or more
>    newlines where selected content and the target file names are embedded in
>    crafted multi-line file names.  This flaw allows a remote, low privileged
>    attacker to force zgrep to write arbitrary files on the system.
> 
> https://lists.gnu.org/r/bug-gzip/2022-04/msg00011.html
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  I applied the patch that Marcus sent 8 minutes earlier instad.

  Regards,
  Arnout

> ---
>   package/gzip/gzip.hash | 4 ++--
>   package/gzip/gzip.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gzip/gzip.hash b/package/gzip/gzip.hash
> index 1cf73ff912..80b86f4797 100644
> --- a/package/gzip/gzip.hash
> +++ b/package/gzip/gzip.hash
> @@ -1,6 +1,6 @@
>   # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz.sig
> +# https://ftp.gnu.org/gnu/gzip/gzip-1.12.tar.xz.sig
>   # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  9b9a95d68fdcb936849a4d6fada8bf8686cddf58b9b26c9c4289ed0c92a77907  gzip-1.11.tar.xz
> +sha256  ce5e03e519f637e1f814011ace35c4f87b33c0bbabeec35baf5fbd3479e91956  gzip-1.12.tar.xz
>   # Locally calculated
>   sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/gzip/gzip.mk b/package/gzip/gzip.mk
> index 92588fcdb8..2092df363c 100644
> --- a/package/gzip/gzip.mk
> +++ b/package/gzip/gzip.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GZIP_VERSION = 1.11
> +GZIP_VERSION = 1.12
>   GZIP_SOURCE = gzip-$(GZIP_VERSION).tar.xz
>   GZIP_SITE = $(BR2_GNU_MIRROR)/gzip
>   # Some other tools expect it to be in /bin
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
