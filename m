Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EBBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7E16F5D5;
	Thu, 21 Apr 2022 19:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xQu5le0jjTge; Thu, 21 Apr 2022 19:09:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A333B611A2;
	Thu, 21 Apr 2022 19:09:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D5C71BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A8E181D88
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:09:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5uvu-7upFSi for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:09:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84365802CF
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:09:47 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id a1so2081660edt.3
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 12:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=SznGRHenA3JV6opUKQ6eZTUJ0VwQty6PBWes+s9+WDI=;
 b=YVD2ugMnEH+Ok+ofSHV+N++arrHLjU+jomQUHKq+VkmTw6F7nzwC/lHdYh+DINCet+
 jMpoHw/eSXW6Jg/t7LaVhcQ9Ql6C8cjIrZV6Cx+N7gm8uV5fm4vE0172ljgY5+GNPGhQ
 MGlNra9MlyQ9l2dmSDrmcIv7qINrCVi2V9G0XfTs8l4sKpDnr6radkL6841Ddg2AMSd0
 2I1q9sqPygh38TEi3MVWrnvzoIi2JzFUIO735FWt8SNQsZ8GUvB6EqxZzAf8fcSlvxJS
 IhRVjINaUljycEI6tfb3bH2HzbmNxYlBrVXmfzocHc8906DOWLg9vFM5aLIGcLVUaO3t
 lqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=SznGRHenA3JV6opUKQ6eZTUJ0VwQty6PBWes+s9+WDI=;
 b=wDOz1xH136BX/OkOQ8PyecrccLfpM6MQMif2Ibjm5IvKa3EjhBSh7vNkS1CcpSBP8G
 nQbRU2r0/33EGfMwTSgcQ9B58wiY3tIaRDwtxRuVl1I1jD/lSRd0VtANTPV7nFvjwxEU
 G5xtGi7G2MJ7ukk9wNWlyWo5iaQfPNsaLWGddB5/qIYZ6Nd8YheFo5+G59i1QIkLHprs
 1gze1R93PieU0sfo8Ej+07ErClqH3j79S6qPLrhC/cOzT6xrSPbhewqH63qZ1gVbfqFa
 11HKFhLPXZvCrCS7OjxfAkDv5sykjMvQl68w7HfQ2cCrifw5AaV+cqK4MTCPoCU30OQN
 GiZA==
X-Gm-Message-State: AOAM531hKr9qZ801ra3aBY+eGAiURYWCBQARpHE8rz7TFlx/0v6otdva
 hyQhjEnyuZZj1yVoOr46ujdbLVcW/HxBjQ==
X-Google-Smtp-Source: ABdhPJxOMbYtbB1TOQksKGMYHbMU/3vma1e3ed17h+U4m0VM05st2cOOBYLlP6iUagj+438VHuQ/ZA==
X-Received: by 2002:aa7:c6c3:0:b0:425:b13b:94f with SMTP id
 b3-20020aa7c6c3000000b00425b13b094fmr1030841eds.313.1650568185807; 
 Thu, 21 Apr 2022 12:09:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 k7-20020a17090666c700b006e8688d5fcbsm8114442ejp.135.2022.04.21.12.09.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 12:09:45 -0700 (PDT)
Message-ID: <3c32712a-a150-c4ca-4acf-e84d88bdd2d7@mind.be>
Date: Thu, 21 Apr 2022 21:09:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220413204838.1172927-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220413204838.1172927-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/libwebsockets: add mbedtls
 optional dependency
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



On 13/04/2022 22:48, Fabrice Fontaine wrote:
> mbedtls is an optional dependency since version 2.4.0 and
> https://github.com/warmcat/libwebsockets/commit/3aaf38d3d89d0436301fe66d9a5c097ea4fb1064
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/libwebsockets/libwebsockets.mk | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
> index 152659cee6..f8093b92fa 100644
> --- a/package/libwebsockets/libwebsockets.mk
> +++ b/package/libwebsockets/libwebsockets.mk
> @@ -27,9 +27,18 @@ endif
>   
>   ifeq ($(BR2_PACKAGE_OPENSSL),y)
>   LIBWEBSOCKETS_DEPENDENCIES += openssl host-openssl
> -LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=ON
> +LIBWEBSOCKETS_CONF_OPTS += \
> +	-DLWS_WITH_SSL=ON \
> +	-DLWS_WITH_MBEDTLS=OFF
> +else ifeq ($(BR2_PACKAGE_MBEDTLS),y)
> +LIBWEBSOCKETS_DEPENDENCIES += mbedtls
> +LIBWEBSOCKETS_CONF_OPTS += \
> +	-DLWS_WITH_SSL=ON \
> +	-DLWS_WITH_MBEDTLS=ON
>   else
> -LIBWEBSOCKETS_CONF_OPTS += -DLWS_WITH_SSL=OFF
> +LIBWEBSOCKETS_CONF_OPTS += \
> +	-DLWS_WITH_SSL=OFF \
> +	-DLWS_WITH_MBEDTLS=OFF
>   endif
>   
>   ifeq ($(BR2_PACKAGE_LIBEV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
