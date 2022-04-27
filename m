Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158B1C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 17:12:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 208C541A32;
	Wed, 27 Apr 2022 17:12:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dbr9JEgaXIoA; Wed, 27 Apr 2022 17:12:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B311D41A19;
	Wed, 27 Apr 2022 17:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE4651BF420
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA7DC404F3
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 17:12:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gzrUmIU7rjFi for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 17:12:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C8D64403FF
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 17:12:32 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id m20so4675452ejj.10
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 10:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VjO0lzHvolJheMStqzFHvztn9I/oOcJLjfMfP1/i6x0=;
 b=SGNUvXR87vF4uwIr7Sy8XrFl6l5Dga2WiNTQ+CJ06lGUNSBfNJlj0haGGkyKpg7xoj
 rvbyqSrH85/fn3qsOJ/Vo6UvViqnhk5uV6sBoqtTJGuvXMIYX5IBZIwJcru3SCczlMKc
 WVYdQMTUj+FcldaYrXwR9VX1FunQzXotEQFQf3fnK0nRcAFa5VqUJDIcVb68jFCYZF4y
 ZLkT3M355S39fhA1wNj1RMSjdAH7VaE+YiEZarAgp9j3TFVtDFq5bzgCiR00sfHc1TlG
 r320daVQIORK/Uk7B54iJV3aepdljk9yFwYJh+2HcENmGOF9KkQYRGGN22E1mubb4G66
 70xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=VjO0lzHvolJheMStqzFHvztn9I/oOcJLjfMfP1/i6x0=;
 b=sS+6FfSOhJ/aYY1fAmMqKwig5FlYAEX3I0Cs9eKoz7qJFQUxs2bJf01cXBGCLf0eR2
 DLvUzmhVEa2CEeOyliMSDQmjztSiGOB8urUcisSdhWjj4FNyO222ng5Mz8PK6GsSNwKQ
 vctbjY/fA6sWReVXumpHkk/WHhI+POyJfDQ66JbUxylXodbq6im6gyC+WCir1u5pcpbU
 lRf3N0+BtqbDXfoASpf7AsfCLUPSkR4Rbey21tg4x31LTKz3NFYE9l83YY+D/pSKDYc1
 6vDrwmt8oVAipDW9hSh26zp+NgJLrCX0RyFOoF6taLiweavfe3Q3bGFmQrl1q7BOe6Xo
 E8BQ==
X-Gm-Message-State: AOAM531dOSxn1cXMcn7T0PgyPhHdozZQNMLJ0nTPMEYQfjJSBwSwsen0
 N0y39tItdENjN0+8DALx0klFdw==
X-Google-Smtp-Source: ABdhPJycUEu3WoEScSj+2V1XJGmobvHuEmASWE/4yZa7RZmvGDCPKr92Qb5KBXZKdlczjClFQHLUxw==
X-Received: by 2002:a17:907:7f19:b0:6ef:fe0b:71aa with SMTP id
 qf25-20020a1709077f1900b006effe0b71aamr27148523ejc.493.1651079551031; 
 Wed, 27 Apr 2022 10:12:31 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a1709066c8f00b006f38d5651e5sm5067917ejr.174.2022.04.27.10.12.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 10:12:30 -0700 (PDT)
Message-ID: <1304a657-da69-7a04-4368-baa16040fedb@mind.be>
Date: Wed, 27 Apr 2022 19:12:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220424081903.3535909-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220424081903.3535909-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qpdf: link with -latomic if
 needed
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 24/04/2022 10:19, Fabrice Fontaine wrote:
> Link with -latomic if needed to avoid the following build failure since
> bump to version 10.5.0 in commit
> b5352c2177011ca389cbb7c68e78447549cbdaaa and
> https://github.com/qpdf/qpdf/commit/c5c1a028cdd3cf345046c46963fb0fdacfb2c33c:
> 
> /nvmedata/autobuild/instance-20/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-20/output-1/build/qpdf-10.5.0/libqpdf/build/.libs/libqpdf.a(QPDF.o): in function `QPDF::QPDF()':
> QPDF.cc:(.text+0x4e44): undefined reference to `__atomic_fetch_add_8'
> 
> Fixes:
>    - http://autobuild.buildroot.org/results/b69e6e380c47bc64c6555899c2f61f57bdae7ecc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qpdf/qpdf.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/qpdf/qpdf.mk b/package/qpdf/qpdf.mk
> index 8e0769059d..a58781f4f1 100644
> --- a/package/qpdf/qpdf.mk
> +++ b/package/qpdf/qpdf.mk
> @@ -32,4 +32,8 @@ else
>   QPDF_CONF_OPTS += --disable-crypto-openssl
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +QPDF_CONF_ENV += LIBS=-latomic
> +endif
> +
>   $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
