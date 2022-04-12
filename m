Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1DEEC433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B01340B3E;
	Tue, 12 Apr 2022 18:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id on7p04Fw0q1b; Tue, 12 Apr 2022 18:32:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B21240B3B;
	Tue, 12 Apr 2022 18:32:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA151BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AEC840B3B
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id etTBensV0Gur for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CF27400FF
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id u15so20390798ejf.11
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PEaH5CSzCnFepjY5HyrPGXrYQ/VYT7GIpgcQunOv3Bs=;
 b=BwYd2LiDvXFgr9az6GsyVIYneZ0t83Y1YW3pqe+0DICkp9TqcK0FWt4GJeceI18kZv
 jvIIGqA8Wk/vV3DCjKOxZXe8SBOloW9uz9QuAff5uX0BMn3OaQKqV+A0dgLkzwCVzkLk
 2EKny7GsH/KOK6vjuYwSJ0P7fZn4y1HvEKywzSfNu41fa+zJKmS7nQTA3d0GcPCGsPJ5
 fvngFSnqo1C1E3I+mH67clTANUy0rWPxJUk9sgAMHm1EGLIB7bVScc8H3+kHGjQcj8Xf
 e1mU2JgnlX1D8EzlVpZVNNEcOlPFpOKSNwgA614229AVU7cKXtPquCENU8cbqYdQpSrT
 DlXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PEaH5CSzCnFepjY5HyrPGXrYQ/VYT7GIpgcQunOv3Bs=;
 b=CexyAIDqnmEzKdUbjMIF9+944UrhTe0iugShUfM+7/EjYEoJVkb2XBhmT09F10iAVW
 KfyZPiwB3G2//CQfdkoLhhYNPy7IrNqc/4IPrJMp9z/5DtnNpNJCYcrW01bGtHtgltgS
 zPTubItCB8M7ctsZ0ZI//ofv5gSkuAnAD/THaS7bFBpk3FP5NrkCP3dQ3AyL0E+ZAW0t
 RnozO15iHLXWH1C6t9ewFJHVEBEu/mFUP6rKndTmnrFmPdjUeORJHg9ElEFPz4xNtiF7
 hbkHO5wNHZrkZc3c+yrxamMRgxqvSAKnprfrmFP7J1trWOnbSMRWuNE6QILhHuXuSYPN
 BqfA==
X-Gm-Message-State: AOAM530G9JGAOFkGFFZ7J5sooInP54fFd3WZaFBwS2pEGGiAASvBhYRl
 BxYyB5XPz1tKruFqbgFY89EV6A==
X-Google-Smtp-Source: ABdhPJxjrCdztGNADnjc7FMD0ZD8JWRwFlOqps+hsUGrUNTLoTyH8z1qaSHq/SKE7vFpmjC+Uv98SQ==
X-Received: by 2002:a17:906:7945:b0:6e0:19:5f7c with SMTP id
 l5-20020a170906794500b006e000195f7cmr36665386ejo.458.1649788331844; 
 Tue, 12 Apr 2022 11:32:11 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 lb4-20020a170907784400b006e0d13f65e5sm13392385ejc.167.2022.04.12.11.32.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:32:11 -0700 (PDT)
Message-ID: <7d261d6c-dec0-b8a9-0d98-9d4c2b3bf752@mind.be>
Date: Tue, 12 Apr 2022 20:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220405215752.2803676-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220405215752.2803676-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix build without
 NPTL
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
Cc: Peter Seiderer <ps.report@gmx.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/04/2022 23:57, Fabrice Fontaine wrote:
> Fix the following build failure without NPTL raised since bump to
> version 14.1 in commit c9bd02911565819789120370178e82da5dfbacc0 and
> https://github.com/postgres/postgres/commit/44bf3d5083e151d772c5d6f656e3e162f573dced:
> 
> In file included from pthread_barrier_wait.c:16:
> ../../src/include/port/pg_pthread.h:31:3: error: conflicting types for 'pthread_barrier_t'
>     31 | } pthread_barrier_t;
>        |   ^~~~~~~~~~~~~~~~~
> In file included from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/uClibc_stdio.h:114,
>                   from /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:71,
>                   from ../../src/include/c.h:59,
>                   from pthread_barrier_wait.c:14:
> /home/autobuild/autobuild/instance-11/output-1/host/arc-buildroot-linux-uclibc/sysroot/usr/include/bits/pthreadtypes.h:135:3: note: previous declaration of 'pthread_barrier_t' was here
>    135 | } pthread_barrier_t;
>        |   ^~~~~~~~~~~~~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/70acbe121236ef0905c4466d4f7a0839723d2c49
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/postgresql/postgresql.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
> index c389246f80..1dfb20b58d 100644
> --- a/package/postgresql/postgresql.mk
> +++ b/package/postgresql/postgresql.mk
> @@ -38,7 +38,7 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
>   POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
>   endif
>   
> -ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
>   POSTGRESQL_CONF_OPTS += --disable-thread-safety
>   endif
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
