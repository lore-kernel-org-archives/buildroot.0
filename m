Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80410C433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 19:37:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 386A782FA5;
	Wed, 27 Apr 2022 19:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0BG79RNICi3X; Wed, 27 Apr 2022 19:37:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46DC282F80;
	Wed, 27 Apr 2022 19:37:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A81D91BF2EA
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 967E1418A4
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 19:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuBFDu2r8fwy for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 19:37:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67A934189E
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 19:37:32 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g6so5442314ejw.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 12:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=E+YV7Ja63rEPNfWKh+7Q91mcOicYZq9IhvdgrgGwayc=;
 b=ZzUH6TV8lTZA3UlIDgTe/T1MrLzROfodDySH6X0G3NtxVTdby35FcvYBej5lH879MP
 wiXrOWF66X/XsbAO9AO6g+6KysttdQVH+rJ/1OeXJIYAuuz5clgKwphDBwdxtsmm65S1
 DqhUYoib8BpqpMeJD9xGfDSpjgzQf2N7Acn4X9po+umi59xf4znZlTSur7rG/uOY++Lc
 4TetDxA36MatvHOGsoz0/DxYGqqy9FlVWDlwBwc2SX+fmIWNxUxt1naPr1xpLByKohxl
 CHnOU0bWnuEwsnAV+81O/kLVkix2vFFQUOGivq4ELPvkXqHO5ZhqJw3w+sGOsWuXif0f
 +9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E+YV7Ja63rEPNfWKh+7Q91mcOicYZq9IhvdgrgGwayc=;
 b=Xkp3tlOkpi0ngrT0LtzxHLF9EsoJU4ssn2PxmiF1k5bX/buFwPEZx1qNriKT9SF2Te
 IxFTPqTfkEkiZ+B0dlfa7ZZBtkH+YV4JBgGHbPMGjV9jXg0N9P2QI9bLcMC7sDz9/8AW
 N1vKq/1mN6iiOH20Za4HGjQkIp1U26TKt3SkfFzuNOV/d/6m32AaH8eziiYIBbErCA6y
 37xw8zOsUhiZfQa1bZ5ECIt/yklbsEGRzXq94+lkMlVn4Tn+/tlomAFWX7EVgQt3bLOp
 PhG31ydUbiLd4lnuL5npMnOPpk6BMbBmEfnjnxaXaUGYKOW7gkRZNiJAENq83x869V0l
 HR7g==
X-Gm-Message-State: AOAM532Fq57JhZv18pO7sK0NbyJtfbiLmf3r5QXV1R5hnNafxQgpQ32g
 ID+HJHxY2QkhHxT7ciDwHDVhvA==
X-Google-Smtp-Source: ABdhPJxUkA+ettDc3c4gQ0UveaJb+xNhFry8/9P3EmtDtOd+D41SuD3Ub5i5PIHKdRNYxOfAQUtQYQ==
X-Received: by 2002:a17:906:a05a:b0:6ef:a44d:2f46 with SMTP id
 bg26-20020a170906a05a00b006efa44d2f46mr28708245ejb.192.1651088250618; 
 Wed, 27 Apr 2022 12:37:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bm13-20020a0564020b0d00b0042617ba63cfsm87814edb.89.2022.04.27.12.37.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 12:37:30 -0700 (PDT)
Message-ID: <18d4c59c-8e52-20b1-51b5-87d6af969ebf@mind.be>
Date: Wed, 27 Apr 2022 21:37:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220426224220.1940185-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426224220.1940185-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/valgrind: bump to version 3.19.0
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



On 27/04/2022 00:42, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/valgrind/valgrind.hash | 4 ++--
>   package/valgrind/valgrind.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/valgrind/valgrind.hash b/package/valgrind/valgrind.hash
> index 748fc3eb82..8487c07e42 100644
> --- a/package/valgrind/valgrind.hash
> +++ b/package/valgrind/valgrind.hash
> @@ -1,7 +1,7 @@
>   # From https://valgrind.org/downloads/current.html
> -md5  de56a5532b0c81781db677ca712c585a  valgrind-3.18.1.tar.bz2
> +md5  4687a4990585a038c52f842448ef4e63  valgrind-3.19.0.tar.bz2
>   # locally computed
> -sha256  00859aa13a772eddf7822225f4b46ee0d39afbe071d32778da4d99984081f7f5  valgrind-3.18.1.tar.bz2
> +sha256  dd5e34486f1a483ff7be7300cc16b4d6b24690987877c3278d797534d6738f02  valgrind-3.19.0.tar.bz2
>   
>   # License files
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/valgrind/valgrind.mk b/package/valgrind/valgrind.mk
> index a3eabec9fe..b4c4b8b5a2 100644
> --- a/package/valgrind/valgrind.mk
> +++ b/package/valgrind/valgrind.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -VALGRIND_VERSION = 3.18.1
> +VALGRIND_VERSION = 3.19.0
>   VALGRIND_SITE = https://sourceware.org/pub/valgrind
>   VALGRIND_SOURCE = valgrind-$(VALGRIND_VERSION).tar.bz2
>   VALGRIND_LICENSE = GPL-2.0, GFDL-1.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
