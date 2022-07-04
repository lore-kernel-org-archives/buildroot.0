Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA923C43334
	for <buildroot@archiver.kernel.org>; Mon,  4 Jul 2022 10:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73CB18187F;
	Mon,  4 Jul 2022 10:22:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73CB18187F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pdHuTGsJ-qs2; Mon,  4 Jul 2022 10:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D1D481852;
	Mon,  4 Jul 2022 10:22:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D1D481852
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBC831BF295
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B5C9760E0B
 for <buildroot@lists.busybox.net>; Mon,  4 Jul 2022 10:22:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5C9760E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHcI-6nJZnVw for <buildroot@lists.busybox.net>;
 Mon,  4 Jul 2022 10:22:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E43C460E1E
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E43C460E1E
 for <buildroot@buildroot.org>; Mon,  4 Jul 2022 10:22:51 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id e80so8832828ybb.4
 for <buildroot@buildroot.org>; Mon, 04 Jul 2022 03:22:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yeud2vKfrfp+DGbXfj5tqN5e54e45moFrxTyz0/AFjI=;
 b=Y2UewlkLeGiMwTHTV8P2j/wNE63kqS8FN5Fmv5XXtM6YHb1bIDRc1etMHQTQquRamK
 wPIGHh8f8PvjPFF9sJ0PDvfgCiy9IzVcEIfPmJvCV6jYfMtfsgt3jkW6urzEXgG0kkaP
 RBIFJn/xbf24wH5HoqKKtyfZWctP16C9chSyhXpeu1dsvWSwTRadXTN4CuZpNOKC4tAA
 jbyWrONIh98I+hFCkyROMuuWjUxRQPotB67E2SFmH2wCbIKZzDz2OHwPNLDBhqiKDz9N
 H6SYCZKjMGppddeYEr9qYJSY3tGH5xDOf52YpzsVjc+pyMSPUfsrT9K9ULOavTbdWMl+
 Rtuw==
X-Gm-Message-State: AJIora8pf2AZMBlVhM34TVRgZofKqg1FKuJvenEbTbCbP2xrRpuDqqWt
 YXpiuijg0O1JUOIQiCObUotz/91ngrjEgQ4RlyPmdvHq2Ik=
X-Google-Smtp-Source: AGRyM1vyi2oNnA7ACQlGbl5IuNzhtW8sIIq54MD73B38AQkI+OxmNFJ2Qpi8hO5TbrpRlNMLVmfU/7ka4+hSZHRQg3s=
X-Received: by 2002:a25:2182:0:b0:66e:2a27:7d30 with SMTP id
 h124-20020a252182000000b0066e2a277d30mr11508569ybh.491.1656930170588; Mon, 04
 Jul 2022 03:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220704094613.5636-1-yegorslists@googlemail.com>
In-Reply-To: <20220704094613.5636-1-yegorslists@googlemail.com>
From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 4 Jul 2022 12:22:39 +0200
Message-ID: <CAGm1_kt3Epd-12OiwzVD6H4U9-V=uD-pCrP8RxHVK0x5nia-5A@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Yeud2vKfrfp+DGbXfj5tqN5e54e45moFrxTyz0/AFjI=;
 b=WvrHsQ8N7iXkYoJDXWKrLqfbBbHBZVhUD9ck8Et8wmq9NZ1yp12nuR1mcJgC/1B6x/
 eLuIB88tIM/vIOdJ6GvZZV7OF4ji/Sjfx0veyeDmkfBKX4xuziWrC5Cv+A0MnIaMLwkW
 0YFWoCaV9OlTDiChSFLYV0QtciP9Hdx2CnbQyzh4mHsV9WD/m4GOx3j0CtWLFWVgEK8O
 KS4EKMrbWFcL5fq8+eZ7GG8RKZgxC//S50vzwD5ChO8mbDVYwYWrADQc3LrCBBgs+5uW
 H3ferMOfLLObT+oPYC/SiX+GZJXXMbh+4JXoj3NVeP5ZBT2l44/QWF08eBZBRflJWWas
 Auvg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20210112 header.b=WvrHsQ8N
Subject: Re: [Buildroot] [PATCH v2] package/python-automat: add missing
 build-time dependency
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 4, 2022 at 11:46 AM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> python-automat needs host-python-typing-extensions.
>
> Fixes: http://autobuild.buildroot.net/results/a4a52da24032222860ad6abe89bf66839cc2e812/
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
>         v1 -> v2: add Fixes tag
>
>  package/python-automat/python-automat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-automat/python-automat.mk b/package/python-automat/python-automat.mk
> index b94fd2e1c4..03d6759718 100644
> --- a/package/python-automat/python-automat.mk
> +++ b/package/python-automat/python-automat.mk
> @@ -10,6 +10,6 @@ PYTHON_AUTOMAT_SITE = https://files.pythonhosted.org/packages/80/c5/82c63bad570f
>  PYTHON_AUTOMAT_SETUP_TYPE = setuptools
>  PYTHON_AUTOMAT_LICENSE = MIT
>  PYTHON_AUTOMAT_LICENSE_FILES = LICENSE
> -PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm
> +PYTHON_AUTOMAT_DEPENDENCIES = host-python-m2r host-python-setuptools-scm host-python-typing-extensions
>
>  $(eval $(python-package))
> --
> 2.17.0

Please, ignore this patch.

Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
