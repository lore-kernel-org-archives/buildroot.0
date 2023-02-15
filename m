Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA5CC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9524941761;
	Wed, 15 Feb 2023 21:20:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9524941761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTPYt9Pb5YDT; Wed, 15 Feb 2023 21:20:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85A0341762;
	Wed, 15 Feb 2023 21:20:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85A0341762
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A13EF1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 879AF60A94
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 879AF60A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4T8T2_vvMrjn for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78D5560A70
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 78D5560A70
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:20:24 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso2715419wms.0
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 13:20:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B/G+4AAZVJy38yjGiT6CXvtDPwpYOi8tmwGytNjP4v0=;
 b=mG4kZq12D3gZIZyXrJopqZElYKGwKA9U5V2N4dBWjdYkUOhtJObofgpF2GcV7wbU+P
 2SRRJPN071oFGGlCx9HiT11EYkdU4eQzlfcEWlrQLbHs7gpoNbH2PHaLwLtaSYtORpVa
 GdtU8Ufk55ZvYzThZdF4a6DG54gLA4A+e/EsDATlBKecQ/3uH/0+WG463O9lezidnYpD
 Ru8uf431XKNaXmWhsm1DSHcj9v6TQrSzZFK/i0+QhK6iyCoBj/u2SsJkXc0T9UlRfb9t
 2E3/4bZ4ZvpMVfAVd1tPjLE+BpWNBeyAjS8FLDXjIKmWlulT2TV1c+56o6BL+Y3r0x0+
 TgBw==
X-Gm-Message-State: AO0yUKVXURQYEey7fnNMud71u9XO9ulCQ1+yxOYNNB0gndMQ9d2xSAtD
 19mWQ0ElkgEOduVHt8I5b2OSWgOOOI+YeOjF
X-Google-Smtp-Source: AK7set9C8cK/nMtBMRC+v5q4eh7T659gl7p022fNZ5WUFjfRNycmj55v5pRR9XM+IJZoULXtHHVr9g==
X-Received: by 2002:a05:600c:43c6:b0:3dc:58a2:3900 with SMTP id
 f6-20020a05600c43c600b003dc58a23900mr2857527wmn.29.1676496022520; 
 Wed, 15 Feb 2023 13:20:22 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a7bc843000000b003d9aa76dc6asm3074177wml.0.2023.02.15.13.20.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Feb 2023 13:20:21 -0800 (PST)
Message-ID: <e581867a-6166-3a05-1d6a-af4373610f39@mind.be>
Date: Wed, 15 Feb 2023 22:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230215211531.331246-1-james.hilliard1@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20230215211531.331246-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B/G+4AAZVJy38yjGiT6CXvtDPwpYOi8tmwGytNjP4v0=;
 b=Bs0oq5d90FInoT35Vby8KvXoZdcrB0qxBoRtEP2PqLaMLpCr+GudH6yL2pDhkkyJLh
 F+SQ39wtfopQmXJCfoQpgHZltp7H4TT5ctw6FfrdCaEw36HZJsyvxJ7XHy2EcnIMyGZh
 Sloe47ele+K0mv0CjFeoY6gzJyOcfwYnKEwmQ8AiYlwiCe4Y2HXxs8uFScVdLHhyU8rf
 HEpCgUiLn+6Rx+ZcoOdL62Bj0hjAKe2TpbzHJ3tCNS1e1uDvghM9jE4lkg0a1MniYtt4
 3lbzzGEESa4H5iGjhb1W+iCHdu6bjrTYul/FY4VGVXP1yDGq0tdSwISr9naEqYIcxt7N
 LMBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bs0oq5d9
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/genrandconfig: make default
 toolchain_csv path absolute
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



On 15/02/2023 22:15, James Hilliard wrote:
> The default toolchain_csv path is a relative path to the buildroot
> directory.
> 
> If we run genrandconfig with a cwd that is not the buildroot directory
> the default toolchain_csv path will be wrong.
> 
> To fix this make the default toolchain_csv path absolute.
> 
> Fixes:
> FileNotFoundError: [Errno 2] No such file or directory: 'support/config-fragments/autobuild/toolchain-configs.csv'
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> Changes v1 -> v2:
>    - set default path as absolute
> ---
>   utils/genrandconfig | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/utils/genrandconfig b/utils/genrandconfig
> index b3576f8a51..3552b83694 100755
> --- a/utils/genrandconfig
> +++ b/utils/genrandconfig
> @@ -801,7 +801,9 @@ if __name__ == '__main__':
>                                   dest="toolchains_csv",
>                                   help="Generate random toolchain configuration",
>                                   action='store_false')
> -    parser.set_defaults(toolchains_csv="support/config-fragments/autobuild/toolchain-configs.csv")
> +    buildroot_abs = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
> +    parser.set_defaults(toolchains_csv=os.path.join(buildroot_abs,
> +                        "support/config-fragments/autobuild/toolchain-configs.csv"))

  Sorry, that's not going to work either (if it was that easy I'd done it myself :-)

  buildrootdir can be set to something else with the -b argument, and we want it 
relative to *that* one of course.

  Regards,
  Arnout

>   
>       args = parser.parse_args()
>   
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
