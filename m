Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F72C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96C2141728;
	Tue, 12 Apr 2022 18:31:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6k7RXlN_GlM; Tue, 12 Apr 2022 18:31:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6CC40935;
	Tue, 12 Apr 2022 18:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9711BF95D
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69ECF40935
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1CdUMlromPDQ for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:31:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F21E940303
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:31:27 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id g18so14086889ejc.10
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 11:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=felYrIkuJQvx4qmaGVl/qw/1on8eJqXKiExv35nJ8io=;
 b=FABZTETaOnHmSnstNOTLm6j2w5TmL3TccXFT5M/AtI/+b4TWfzQg2SnHS0jj/cfwPY
 b+gsy2wAmWl11NYi3yKwUIIhRah6oT6w8IAZ/AOlk1PxN68+ulS71SZGOrQpJAgE8Jqw
 sadWMJwIFpZ+jis7DEiY7XaEagXhkXv2RrqvY0a7wDcZoVgY+953cjQTLv8ZEaiqUjJh
 8AjBCTZ1lQfQjrBDv2SbpE+duTa+6ViyZXla1kHkdctEdLqNg+o3JpKdp5L2CvR8fGOH
 43ZDOwzendOzz5fttSUXqUDF4gv8qU8WXqmVTG4x3F7olAaIzWweMek7z4gfB3DhJ6yQ
 DM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=felYrIkuJQvx4qmaGVl/qw/1on8eJqXKiExv35nJ8io=;
 b=1k8rRfmyrzZVbFcbbfKvm2WZ2SE3e8QFR02nkq7X1NkIXKxYmLH2itiVvGcmW+ff8g
 PjCSYeoi0wVMo91uJWGcmZ5XKXMqIylJKr74oQOe9nlVRm1RpH3ceMlON4KTmliSa95R
 4u3P1HCkFnqaEURun3w8vrSbcbnP3LInhsIM8sXWrtlG7ZupviKe4+Z6oai2ghrOIsdx
 bMQNPlBk6Q+NHC/DzL82GNSI6PbVfThqyAiYi210c/FAoXg4gyDSxcvwuaMqMUyEUJiZ
 QGDh3QyHY2xUtc/NLM1fe1tLVDdc7jVLSK95Mq05cXh84MUYh0bo6sDs1Dl7dH+oHQXv
 TcyA==
X-Gm-Message-State: AOAM530StB9BRfPeWYIyCbJqgg8eqLyl2DWIGWdHLP2zKvq/UpR+/RA+
 ZiRO0QUZyWkNvq29O7A4VxEjag==
X-Google-Smtp-Source: ABdhPJyh+QZVRquebacQpeDVJzO9tzSSOJy8sakgDwG234V5BZYMFgir5dzkmVGt4m5sKYj42X+THA==
X-Received: by 2002:a17:907:7e8b:b0:6e8:9691:630e with SMTP id
 qb11-20020a1709077e8b00b006e89691630emr9186486ejc.113.1649788286040; 
 Tue, 12 Apr 2022 11:31:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 q14-20020a17090622ce00b006e898c912e5sm2285791eja.217.2022.04.12.11.31.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 11:31:25 -0700 (PDT)
Message-ID: <aa36122a-a1bf-01b6-f16c-5bae526aaa98@mind.be>
Date: Tue, 12 Apr 2022 20:31:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Tim Hammer <Tim.Hammer@orolia.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <DU0P251MB07797CAAE80C985DC8976335E3E79@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] [PATCH 1/1] package/dhcp: build internal bind tool
 gen for host (not target)
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



On 06/04/2022 16:52, Tim Hammer wrote:
> Building gen tool of the internal (bundled) bind needs to be for host, not target
> Switch to use internal build in commit 0c8dd6ebd656e06cf99a63eb93343715f4853503
> overlooked this.
> 
> Building dns library in /home/autobuild/autobuild/instance-13/output-1/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns
> /bin/sh: line 1: ./gen: cannot execute binary file: Exec format error
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7/

  Your signed-off-by is missing here. I took the liberty of adding it and 
applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/dhcp/dhcp.mk | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
> index f1e3c22f1c..2faea48c46 100644
> --- a/package/dhcp/dhcp.mk
> +++ b/package/dhcp/dhcp.mk
> @@ -23,7 +23,11 @@ DHCP_CONF_ENV = \
>   	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
>   		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
>   	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
> -DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
> +
> +DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(HOSTCC)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_CFLAGS='$(HOST_CFLAGS)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_CPPFLAGS='$(HOST_CPPFLAGS)'
> +DHCP_BIND_EXTRA_CONFIG += BUILD_LDFLAGS='$(HOST_LDFLAGS)'
>   
>   DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
