Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297CCC433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4FF60E93;
	Thu, 16 Dec 2021 19:09:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a3a8HdFUd2Dh; Thu, 16 Dec 2021 19:09:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E8C60D75;
	Thu, 16 Dec 2021 19:09:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7B381BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D6E806101B
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id udbezHPAQsiN for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:09:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CEEEB61016
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:09:12 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id y22so19751747edq.2
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 11:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aBwCo9GverXRWUnsVzspI0jsQjwpoyWqOLNO1vYz3VY=;
 b=PWP+w8pTjAlfqkuO4oXAYvv2VWI0TCV/yJqAtl9BSbaMvB6lC2RwLVaXPr5irWgQVi
 DKLyGNF0IT3+3W2a8MI5CVQULrbtVx26c87KT80vcfU52tAR/tX0hWk2GImdW9VEuVrO
 Ewuta6+t8YXfqxlw+jyjxItg7wfLuZN+lb8AHz7DTMFlRxjZUbOm3UbBKcDXmVE3coEw
 fg5uiuJyCCFOkusNjgs9YHUkBYLtB8PsgSfxC/v+0fJJtmBymg6opxYot7NrAGYtmA8I
 z7FirE4TVRTFFq52dAphcs9RYjw3PnUsJSHn8TrHZ1QIRXoR1+oacLxiOJXhnMpwtbTu
 Sx2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=aBwCo9GverXRWUnsVzspI0jsQjwpoyWqOLNO1vYz3VY=;
 b=Cqf7DZKuYy4OfX9wnRIXamtEphrGxb72ATQSOv1AD7VAmKK9Eizhm8kPkso0Xc96+7
 bh/3272K1LJFl86jxyPZODwWQgZaaYia8WopQBkNweBxT1LArh/grSgb6f3JotWTbIXq
 dvMp9YNrGWE9j9pOBCRyTuPUB4kSzcexChnRj39n/kqNXqtp5JOaXjoQqptbQ9HTDUY3
 IqwpmpOd8ZGmt+dudgPijW5mJuQOfwEJzWm0rDeGpSz48S/0XFJskM85Qma+xrCMy1gQ
 ibOTT/Nif3mYNR9rhfcK38/3BiKVMGPFJv76TG8+QVdeoAuFWXv2+DaxYeU8CvN7XC9w
 aYiA==
X-Gm-Message-State: AOAM531f76k2WScP7p2fwmekxLHk5fTaHqxnN2itGD+NeoptOo48erOT
 8XdNaaeSDKO092foyU9HAiNY2N4Di2qELg==
X-Google-Smtp-Source: ABdhPJy/CaL/z90ak0K87B7x5hCW8znv0dW1oexBYZe5heS1Rli+O5BjZOgh1X3c6AlOn4w7yAEA+A==
X-Received: by 2002:a17:906:e52:: with SMTP id
 q18mr6586559eji.278.1639681750518; 
 Thu, 16 Dec 2021 11:09:10 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id dn4sm280471ejc.95.2021.12.16.11.09.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 11:09:10 -0800 (PST)
Message-ID: <f264d9f3-1f1b-e758-3ca3-7af067cd7ce6@mind.be>
Date: Thu, 16 Dec 2021 20:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211215172146.3784645-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215172146.3784645-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: disable cunit
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
Cc: Vadim Kochan <vadim4j@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/12/2021 18:21, Fabrice Fontaine wrote:
> Disable cunit to avoid the following build failure raised since bump to
> version 8.1 in commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6 and
> https://github.com/FRRouting/frr/commit/749714731ee9a59ae39be77e7db3915ce3ad0bd8:
> 
> In file included from pceplib/test/pcep_utils_counters_test.c:33:
> ./pceplib/pcep_utils_counters.h:112:2: error: unknown type name 'time_t'
>    112 |  time_t start_time;
>        |  ^~~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/b68d3e369e2925938bde39508988aa9b701f1045
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/frr/frr.mk | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/package/frr/frr.mk b/package/frr/frr.mk
> index e707f50ca1..fac9c6692d 100644
> --- a/package/frr/frr.mk
> +++ b/package/frr/frr.mk
> @@ -17,6 +17,8 @@ FRR_DEPENDENCIES = host-frr readline json-c \
>   
>   HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
>   
> +FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
> +
>   FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
>   	--sysconfdir=/etc/frr \
>   	--localstatedir=/var/run/frr \
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
