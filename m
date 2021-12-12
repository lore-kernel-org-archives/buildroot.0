Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B729FC433F5
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 14:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DD474240E;
	Sun, 12 Dec 2021 14:03:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B-HIXk4mUnby; Sun, 12 Dec 2021 14:03:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B85D4241B;
	Sun, 12 Dec 2021 14:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8427D1BF36C
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7213E4241B
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 14:03:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id skpxQEhY64V8 for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 14:03:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 249024240E
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 14:03:52 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id t5so43870238edd.0
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 06:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=xgstPo9Lp3SrFLlMmEbRccU3NqpzuGyus3g/7LGwcw0=;
 b=ZXY4JF8R8VrOCtYdKdjKMRgCoki5Yweilvd/a61yX97cbArf0BC2XuL8gUZl1myBWf
 3Ru/HnVt05NoBv72HOPHnNLPNOjFLW6L+cgvDo2sY+iOyx7cgnFDfP19ARDZIRnWzZFh
 GfyPkfURxsbKJIjEaSyiVqBvWnJC4YkAeJTK2kXzDmDvmL0+3brJB9bXeg85TyhLKQOt
 eEOKLKOZg9rLHqcaRTQcn31TDYlWsxeFzdCt1qV71rIgqDeRuYyY9Cafgix0jVMnhpn6
 4jGB0WVhUgNEHeCr+YN9DltAXHanPdymsLfG8ISZ7lBlfUczlPbyz2mKdQyLuVcB0UUs
 nncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=xgstPo9Lp3SrFLlMmEbRccU3NqpzuGyus3g/7LGwcw0=;
 b=yPTrRRtiCkhj5URbrzWao1/gB1iz41s8oJdot9P1DY/qkWffgnpukSN1Y+2xao9pFg
 fouLBnRgedP9seGXxYWsF8AVOOwWeTTcfGR09cLBIyGAbOdmZ59fwk6FUEa/hc5MgzyS
 gvkpwKgKejO1vsV+gaXkgjwbPdUjSujkGcSEu5B8Hj3+yRr1UXdrMCKixTtOMcN1Xoda
 TSsmXPXsQwQ6CDzTLCSN2wJTUrrSRHni6VPRmZSTKlZsAk+yqStBoHsglCUEXs8sGawl
 tu0Qn0QUqenFSNdRQ6g+4VgvIAu+bmpMYpd8BeTHfIC92BDvb1P7kG2A4pXF3ew9Xncv
 GUKA==
X-Gm-Message-State: AOAM531Devah6vQtN9xvLtRMxGIXRvONuhA4mtVq/UZSBKyYDUplzcba
 sEZpewfiDlHgpiOScyenHebSu9x6x9n7MA==
X-Google-Smtp-Source: ABdhPJwE4XeKic05ptlrmMco1fLVBYDzYLCdnTxmQpIDeFU09TbSVyb+hxZOwUlCe/SPvQ+RWS1jfw==
X-Received: by 2002:a17:906:cd03:: with SMTP id
 oz3mr38159859ejb.252.1639317831183; 
 Sun, 12 Dec 2021 06:03:51 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hx21sm4400556ejc.85.2021.12.12.06.03.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 06:03:50 -0800 (PST)
Message-ID: <55b0f900-f6e2-dc77-d5b4-74cf69cf1a88@mind.be>
Date: Sun, 12 Dec 2021 15:03:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Angelo Compagnucci <angelo@amarulasolutions.com>, buildroot@buildroot.org
References: <20211209221529.498292-1-angelo@amarulasolutions.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211209221529.498292-1-angelo@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH v2] package/grep: bump to version 3.7
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



On 09/12/2021 23:15, Angelo Compagnucci wrote:
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> v1->v2: updating the signature url after checking
>   package/grep/grep.hash | 4 ++--
>   package/grep/grep.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/grep/grep.hash b/package/grep/grep.hash
> index 9dfe2f2c23..29d9eb1cd6 100644
> --- a/package/grep/grep.hash
> +++ b/package/grep/grep.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated after checking signature
> -# http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz.sig
> +# http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz.sig
>   # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
> -sha256  667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e  grep-3.6.tar.xz
> +sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/grep/grep.mk b/package/grep/grep.mk
> index 27d204d4ce..233f5fe633 100644
> --- a/package/grep/grep.mk
> +++ b/package/grep/grep.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GREP_VERSION = 3.6
> +GREP_VERSION = 3.7
>   GREP_SITE = $(BR2_GNU_MIRROR)/grep
>   GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
>   GREP_LICENSE = GPL-3.0+
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
