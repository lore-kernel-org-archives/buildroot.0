Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71877C433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 17:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 113FF4092C;
	Tue,  4 Jan 2022 17:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ngP457--icws; Tue,  4 Jan 2022 17:14:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DB06B40963;
	Tue,  4 Jan 2022 17:14:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 362BC1BF32A
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2555F60BDB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 17:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D2xtEyeLcAsG for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 17:14:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3BA4560B8F
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 17:14:05 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id w16so151235123edc.11
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 09:14:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ap1r8zHQfqHs67KOkIY5GIcd/b4fI02qwqUMrAhCAs=;
 b=fEMuN5ZCP4Sn+c86m0tUu+992MBSzLGmxiGcMFtbIjauRTsX8JpHhbmITonArcA1EY
 Tb5rqm0QLSpAHxEOCHZFetewWIA9y8Du5ctFYbWHVpKw1KjeqDH6erYlv7jq6TQN03Wq
 mz35hyN1gJKeMloGzR9jquFrfkpdmKIvbYq6096kAvnI6cETLms8PycZsHQS4oJR6s8x
 jNTA5m0rNUAT169QZhIun8IQHIAsRkHPKE1SdncVD+erW4YryEZnmuhrQdAdTtFTbG/Y
 UFfXSc6vwhaPwcUJBZRmtqnNO7mCu1nZwQBR53cpsjaShBKCLgaonnNSWV/f5Pa1NdKj
 XlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=4ap1r8zHQfqHs67KOkIY5GIcd/b4fI02qwqUMrAhCAs=;
 b=2q0FAdrNpHgeZJ9UV0G1QBOKb3yzjnfqDZrTvA3PaC4Ntqc/8kAtfKIDLrh6n07ZGr
 Wl68k30mbGI3ua93Rmh3DNOiQKZaJWomSW3aWhqpK2QU0MhWi+ouSCyE5MKjJZNJSj8h
 a5htlZmxjnO6vtQyfx2KXG2Wvl9NV/5EumH1VtiJc7BEiLmMFWbh7R9jwRRkwgaQf9CH
 +S+32MpSfc6WRsnH4EULgdarvzw1A59pRVShxlqFpW7B5XOfUCYH2QWqWFmQMY+0ksFs
 +x8tkj8xQ9+X2RQNYpB3xdLIloyRdLJiu5Md+SXWlGx+LT+5wStWUbFREB6wo+Z82A7+
 h5TQ==
X-Gm-Message-State: AOAM531nOHk8T2MREcoEpwJqsajo2JEHpJL59ilIO+Ei5yYejP2ZoJgA
 POxD8siO45boRjpcbrp0GI76MTcrIZHI8w==
X-Google-Smtp-Source: ABdhPJwwHNSlq2u1AdM4Beap8zubhYk4ZwrL3g+y54w3NkENJAm0RbKwlPdDeASzvtCYyCg3cUqBNA==
X-Received: by 2002:a05:6402:1d54:: with SMTP id
 dz20mr49033621edb.395.1641316443481; 
 Tue, 04 Jan 2022 09:14:03 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id h4sm14893760eds.90.2022.01.04.09.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Jan 2022 09:14:03 -0800 (PST)
Message-ID: <c1c732d5-a1ed-4ac5-9c4d-a9cc9f811c99@mind.be>
Date: Tue, 4 Jan 2022 18:14:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20220101195910.406035-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220101195910.406035-1-james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-aioredis: bump to
 version 2.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 01/01/2022 20:59, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/python-aioredis/python-aioredis.hash | 4 ++--
>   package/python-aioredis/python-aioredis.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
> index ca3f64d1e5..29e6361014 100644
> --- a/package/python-aioredis/python-aioredis.hash
> +++ b/package/python-aioredis/python-aioredis.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/aioredis/json
> -md5  343a451df2381b9ea368e12b9075caa5  aioredis-2.0.0.tar.gz
> -sha256  3a2de4b614e6a5f8e104238924294dc4e811aefbe17ddf52c04a93cbf06e67db  aioredis-2.0.0.tar.gz
> +md5  8f3547af83ef4b863b18c19f23166a9d  aioredis-2.0.1.tar.gz
> +sha256  eaa51aaf993f2d71f54b70527c440437ba65340588afeb786cd87c55c89cd98e  aioredis-2.0.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
> diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
> index 21a8a349c5..798dbd0c3c 100644
> --- a/package/python-aioredis/python-aioredis.mk
> +++ b/package/python-aioredis/python-aioredis.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_AIOREDIS_VERSION = 2.0.0
> +PYTHON_AIOREDIS_VERSION = 2.0.1
>   PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
> -PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/92/60/a3cb5fadc254cc6e709ba14a02531870b02386b8c7bb147bf80a2be93f76
> +PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/cf/9eb144a0b05809ffc5d29045c4b51039000ea275bc1268d0351c9e7dfc06
>   PYTHON_AIOREDIS_SETUP_TYPE = setuptools
>   PYTHON_AIOREDIS_LICENSE = MIT
>   PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
