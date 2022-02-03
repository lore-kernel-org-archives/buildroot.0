Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D403C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B79F0401CA;
	Thu,  3 Feb 2022 20:38:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xS0z083d_YH8; Thu,  3 Feb 2022 20:38:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AB5984048B;
	Thu,  3 Feb 2022 20:38:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A1B491BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E75960A6F
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LF-TvKWkUtmq for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:38:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC719605AE
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:38:12 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id jx6so12585100ejb.0
 for <buildroot@buildroot.org>; Thu, 03 Feb 2022 12:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BmcNZfvMt+TK5Pewoy5KS2cOeTx1TzBS7rgSCMXTdVU=;
 b=YQYswD05ALiHdoK/bbgcxVJuVknUyvknQbb2mSSJV+2ZbgBX21iJ4UNqnH4rGMrtYY
 /JJpIEDCYFaxbErHNfwnxgwXmCm2edzfBTr6ZHTu4hszQMR1W90f7kuyiWtkk7LmwW08
 +mFmsId+4esuRYJoKhgK1J1gvNasNX8JtA5MCXSRJYKxzi/tg2/PQJKejae6lP5d04c2
 fKg4X6M6vmZL1BIteKOYbDVaDY7Teh+4I25EW3Z+jZxyWbSnE2NrAxgTgyrCsC+QWzq8
 A0OTMT1IjAcFOnGevpnVyum9kG8962/IhYYXRn60CP9+UkszE+V4EoCSxF1vdxIUs0HC
 ZFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BmcNZfvMt+TK5Pewoy5KS2cOeTx1TzBS7rgSCMXTdVU=;
 b=L33b29FDCqBhvW45a3gPUmZgzooFZi4pWpIqwwidhAn+rVjwo4YNtLZa7AvHltwsz4
 Dir/1Z46tbn10dcPPFx0RGbyfL/edJWFOTRgSSnn94h3NZ8rSJ4NG+xNy9DSMfDZ2HgY
 7szW3yu0+Moo8JSzGsOPGawMPs5cMxZmUOywO9U4PUkwCu72XoD4BO1ouS8f04K4ylmO
 5nq3b7Ti7cJakc6WviAfulLs+xESuCFfzZoU6CvwR40+TRCKPY3dTeuXjGFUNOI1Ql1Z
 YIQFavp69J7WuaRuReda6t4sp9ZMnmNWe7+4V4ojW6DMtEjnfqeEUev1+nzE7AXZZcU9
 35lw==
X-Gm-Message-State: AOAM533Rt9VUDptQ++tjKbGNKHvF0fzGfcE3MI1mqeipD+Z/6eH4YZAm
 RbGq1zQxpQDk6fIdJg8JJsnJjg==
X-Google-Smtp-Source: ABdhPJxuWeUsZZ892da948dIQAQIdOEbqIJkTC1ojWE6L9Bnr7iLgW6ZhB4+iODQ/eojTEw1aiFM2g==
X-Received: by 2002:a17:907:3da2:: with SMTP id
 he34mr33260972ejc.595.1643920691019; 
 Thu, 03 Feb 2022 12:38:11 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bm13sm22659665edb.67.2022.02.03.12.38.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 12:38:10 -0800 (PST)
Message-ID: <2b31f3d9-12bb-dc7a-61ba-9e6981985cc0@mind.be>
Date: Thu, 3 Feb 2022 21:38:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220113232903.318853-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220113232903.318853-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/gensio: add avahi optional dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/01/2022 00:29, Fabrice Fontaine wrote:
> avahi-client is an optional dependency which is enabled by default since
> version 2.2.0 and
> https://github.com/cminyard/gensio/commit/5ab117c9743fd4719f610cf9f1ba45023cc25d7c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Changes v1 -> v2:
>   - Use BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
> 
>   package/gensio/gensio.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
> index 389de1e263..266ac137a2 100644
> --- a/package/gensio/gensio.mk
> +++ b/package/gensio/gensio.mk
> @@ -9,6 +9,7 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
>   GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
>   GENSIO_LICENSE_FILES = COPYING.LIB COPYING
>   GENSIO_INSTALL_STAGING = YES
> +GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
>   GENSIO_CONF_OPTS = \
>   	--without-openipmi \
>   	--without-swig \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
