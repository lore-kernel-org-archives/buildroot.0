Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D595C433F5
	for <buildroot@archiver.kernel.org>; Thu,  5 May 2022 20:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 225A741573;
	Thu,  5 May 2022 20:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id panu6uHdTkrG; Thu,  5 May 2022 20:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF02C409A0;
	Thu,  5 May 2022 20:03:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B46A1BF376
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173F2409A0
 for <buildroot@lists.busybox.net>; Thu,  5 May 2022 20:03:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wz21cVZ0hnhK for <buildroot@lists.busybox.net>;
 Thu,  5 May 2022 20:03:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1396E4091F
 for <buildroot@buildroot.org>; Thu,  5 May 2022 20:03:21 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id p18so6438268edr.7
 for <buildroot@buildroot.org>; Thu, 05 May 2022 13:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qh5UvyzAvS5JdsdDndkOu5Nz9YVxgk21RVEFYLN8F7E=;
 b=XgGcnNIFYIhcTi18OL4zNzCWjc98Y5eokl2ESc9CHkTx/W2x6xQhn8WRrccCAZtcCy
 tPqAqGsvIYnZLZKIjeKZBlpQhLgJOIK3svWutycYQhToSMJFXHWHkhd5cscixW9goRec
 WbC+/RfXTEgQx7uxoGklWw+2FXdFwO88ntyzpYZEwNxNoQ6SJcyWUB4BOep5qPuDBiZx
 AIA6saO/iZ3nt+5x3bx1q1jeJJCoTMeD4ez4yuADT7tN7tesrc0Wsq4bzIbXl4ujbQGp
 lBTZKndNBmgmKqHbUQ68Skgs4OHFPL6q2df7g7Yp7nQkgtxN0kDABQ2DJn0NVvG6nOVT
 8WdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Qh5UvyzAvS5JdsdDndkOu5Nz9YVxgk21RVEFYLN8F7E=;
 b=E0pHq2MmLC/g8/V5ieWrmERabKtA6xp5i+DTx8ua//aELz5V2PG6YCsh0szG8iccsb
 N5zMaR+pQvN+mduUBje/n+AFBu5uCYXR0l/S9pW4g7ntovIwtMaKa+nfDilRDad9VYUh
 R4Q2ZBOKk5W7KRyuqac4eqRUuA73oqZfhIU0FPNh8eDxErweJ5CQYWUMi9XORV5sh7In
 +VtgbUyXXfZgjEowXB5JQOC2vIaRzMbKOy9w2kgvKeaMa473TTBz5xCjyTaSXbm16Q1P
 gCiTywFeKej48re+g8kxW96BLj6wIFxjwWfT0poIXE8XWkeZOwvvykXyfHXStBe07R6q
 7ODA==
X-Gm-Message-State: AOAM532zoLIP6e8g24tV0OIK3cw4hsFxjscLLJB32jj8IGPel/btaXBa
 JaBlFC5ZhghCxSMYR3l4l2B3uQ==
X-Google-Smtp-Source: ABdhPJyi6YucA7Ewo/nHJY31Ns7YtIiOINJPTcxH/okm1GU4X//DRN5ACW3HCWzLKfA9jzNgn0u91A==
X-Received: by 2002:a05:6402:1e94:b0:427:e496:6da1 with SMTP id
 f20-20020a0564021e9400b00427e4966da1mr17029884edf.136.1651781000248; 
 Thu, 05 May 2022 13:03:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 cn18-20020a0564020cb200b0042617ba639esm1225886edb.40.2022.05.05.13.03.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 13:03:19 -0700 (PDT)
Message-ID: <ad692fca-96bb-fedc-5c21-c2edbf48452b@mind.be>
Date: Thu, 5 May 2022 22:03:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220505064353.3051663-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220505064353.3051663-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-meson: disable meson wrap
 downloads for host packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 05/05/2022 08:43, James Hilliard wrote:
> This was already disabled for target packages in:
> 12ba3563655e3ebab252e52daa6c710864fa869f
> 
> We need to disable wrap downloads for host meson packages as well.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-meson.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index f1390a18d0..465be41567 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -156,6 +156,7 @@ define $(2)_CONFIGURE_CMDS
>   		--localstatedir=$$(HOST_DIR)/var \
>   		--default-library=shared \
>   		--buildtype=release \
> +		--wrap-mode=nodownload \
>   		-Dstrip=true \
>   		$$($$(PKG)_CONF_OPTS) \
>   		$$($$(PKG)_SRCDIR) $$($$(PKG)_SRCDIR)/build
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
