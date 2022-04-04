Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C80C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 17:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D53954011C;
	Mon,  4 Apr 2022 17:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4sGK9PfCCAwh; Mon,  4 Apr 2022 17:26:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0F6440182;
	Mon,  4 Apr 2022 17:26:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B51B1BF35C
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6804B414C4
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 17:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cpG3XbxWeYkx for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 17:26:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 209764148D
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 17:26:31 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id dr20so21318777ejc.6
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 10:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/1i8yD+Ur+h8R9qzfyz7dtziLe+iEb2OWztnYMtLJys=;
 b=Qy8IFnTpKlE3zGXZfEbfhE7Re/9PaNlCWc1NZw2iCBx6nChXeXrzghzNP5bno0u7pl
 Uzv/91wJ75WYJjdmYcMM3bhl3QIAXrCOOiFpxhzvaOhgrwFr85PzoV0Ne4b7kCJQQXpP
 VhWpFi/I0a70Bte52seFFvxxc9vm9Uw/t6NWBjeGYXJVvArFJMDXbUJqh2bABdmDBxYE
 cX6lWOEQzdkd5cvponXYE/8hW6N+U/HyzAopWRBN3AHvC9C5HrSG5HDVIha6juzCcO4W
 pn33XBdCngX5UfQ3ec32Wwoiir2NqmfAfyWMCRPeXvd+KNhsIna5HSexmLFQuwjixY1R
 LWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/1i8yD+Ur+h8R9qzfyz7dtziLe+iEb2OWztnYMtLJys=;
 b=SJxVfWd9aKw3mwhccGm/AbLR2pVvKA5/yMojCapMRCeBqYSjFWIxHJ1RwF+Tej/tVL
 61n5DMD3Gs0P5BTqTSrzXmX46llQVpHSEI+nACT/8bHUrGE53fepDj0zbSXIEYB3OMUP
 4GjcCXUk/Gkh9RCZywsqBOB5qL8KU8berWSVyUHgPBR9Gz8CDh0lRzp1ZqBSlj1vSGwU
 PK08F8aD72I9YHFTe19qxXxVo8r4fR7C7LYiEDIat8uJumdF67KhsJuvvNBOv6e/WjFg
 sAGqT+82j7TSmdWYRXfD1viDBqdFk9ZPCPxS5m4V9qwKwA2HwMzgecuOIAfy2JvWHjrU
 KeEA==
X-Gm-Message-State: AOAM5318qWjCMsCXypm8KzRPZ4SU+6Tnz1eNWzFrEtmzGugizpnKjgx7
 q+xKnItsv7x2zSWnR3M0aafuZQ==
X-Google-Smtp-Source: ABdhPJxvaEuV1K9/EnQqEn6VH100/0y6OnN+OgqrJO62ZQ62ksmsZRcyYyXriavXzrZkayiw8jDclA==
X-Received: by 2002:a17:906:c253:b0:6e0:592a:49f8 with SMTP id
 bl19-20020a170906c25300b006e0592a49f8mr1058086ejb.707.1649093189307; 
 Mon, 04 Apr 2022 10:26:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 kk13-20020a170907766d00b006e1442fcff8sm4689498ejc.175.2022.04.04.10.26.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 10:26:28 -0700 (PDT)
Message-ID: <2f6d7a1c-2166-52f1-5ee6-18dea30049ed@mind.be>
Date: Mon, 4 Apr 2022 19:26:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220330173237.1377195-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220330173237.1377195-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/upower: add
 gobject-introspection optional dependency
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2022 19:32, Fabrice Fontaine wrote:
> gobject-introspection is an optional dependency which is enabled by
> default since
> https://gitlab.freedesktop.org/upower/upower/-/commit/0d7bf34ed6702c60028fa80e5d481621e9741d09
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/upower/upower.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/package/upower/upower.mk b/package/upower/upower.mk
> index 8989ca9f5d..a6f39d2f46 100644
> --- a/package/upower/upower.mk
> +++ b/package/upower/upower.mk
> @@ -22,4 +22,11 @@ UPOWER_DEPENDENCIES = \
>   
>   UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
>   
> +ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
> +UPOWER_CONF_OPTS += --enable-introspection
> +UPOWER_DEPENDENCIES += gobject-introspection
> +else
> +UPOWER_CONF_OPTS += --disable-introspection
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
