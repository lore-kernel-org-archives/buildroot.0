Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81948C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 20:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B258415E6;
	Wed, 23 Feb 2022 20:09:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SRPK6wKz07jt; Wed, 23 Feb 2022 20:09:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71C5C415C8;
	Wed, 23 Feb 2022 20:09:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 817A91BF5AA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7845D813A9
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 20:09:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ONgItj0NkOqS for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 20:09:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7E4E1818E6
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 20:09:30 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p14so54698095ejf.11
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 12:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=owznCEqLqcsRPNU5sItemrMrkWynkzEtM9c+fMEC6HY=;
 b=Cg7WNx6+ei7G8R0v4v14f4eloE7TZ/2Ba8A4v1BVbkrhy2oTCSn4pskGu+B/ZcVZqD
 fW1rxMippH2UsXwZVrqxlCRspelqdBh4ZH1unswklsJCaPFqJWi9oSDgHpxQ1PpCYlPT
 dZZ3+6/QevHlFlIPFnlzWYEkutsC+S1NgY7/kwitciAWylZhSM4w3XcNEPXBRYq+mVW8
 nxpNoOizteeh6Go2r271Q/S6oy93kcSzoNGx/QDcoedZkqPB2yUSHBLOcCo9vQra8LE4
 63GaX8tmDfmMBb+Kh3IQN4MVr/iZPCTPjp9I3VWIwd7FRI35wQamChPzqd2y8QzDHHL/
 RtWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=owznCEqLqcsRPNU5sItemrMrkWynkzEtM9c+fMEC6HY=;
 b=yTejr2H0H9y0r4fNHWghVZGDWwAnYmV/ctPrBeoNcIJwTEi6tY85gf+Lh/WLQBVlWd
 K8SyKXfeelhtTkIICb69xRffo+3ooY+AcUGoap3uj4fSgqWMfJs567o5Pk3d6ywh77e4
 G81FHeaDTyH+3OO73NNYit7Gf2P9WvqCjjG5jzZekguEupUooA6koGfyOtojem7JkOiO
 Xt/8Gdw6ZBcJRC+dE3mbLC/MD9z4deLNkADw+h3NRkugqxJpghpeyM16JK6CV6uss90U
 Xf6RURedEZWVRwzqsue3uO8+lFAU8fGHqTe/4U/1STDVoaj/oVTxW4cgcIvcDXHbT8SO
 +Nbg==
X-Gm-Message-State: AOAM533z7Ztf9rkWK+3xsCbXqEUgZAmeUCrwLy4MoZnKbjMU88NgSvzB
 0hJUvnAfOGQUXcGdPSIfnzh5QA==
X-Google-Smtp-Source: ABdhPJzxAK+x2gAX4h7VueEE5a6ek4qiFvbEzsIKzvhyTjLg4vywvdBVFeEK0Zmc8yQQOefFSrOYLw==
X-Received: by 2002:a17:906:ae97:b0:6cf:73fe:8515 with SMTP id
 md23-20020a170906ae9700b006cf73fe8515mr1027791ejb.462.1645646968824; 
 Wed, 23 Feb 2022 12:09:28 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id fx4sm248221ejb.221.2022.02.23.12.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 12:09:28 -0800 (PST)
Message-ID: <0517cc72-6918-18ec-f046-bfc2ec85da38@mind.be>
Date: Wed, 23 Feb 2022 21:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220215134110.2365539-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220215134110.2365539-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5webkit: disable sampling
 profiler on musl
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?Q?Ga=c3=abl_Portay?= <gael.portay@collabora.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/02/2022 14:41, Fabrice Fontaine wrote:
> Disable sampling profiler on musl to avoid the following build falure
> raised since bump to version 5.212.0-alpha4 in commit
> df0b0fe6919c0d0f3750f439a3cfa765232bd569:
> 
> /home/buildroot/autobuild/instance-0/output-1/build/qt5webkit-5.212.0-alpha4/Source/JavaScriptCore/heap/MachineStackMarker.cpp:686:2: error: #error Need a way to get the frame pointer for another thread on this platform
>    686 | #error Need a way to get the frame pointer for another thread on this platform
>        |  ^~~~~
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/87f52db7f8ebefa4c1ae3dd70d4a7a460f9aca35
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/qt5/qt5webkit/qt5webkit.mk | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
> index 2084f3af52..024184e267 100644
> --- a/package/qt5/qt5webkit/qt5webkit.mk
> +++ b/package/qt5/qt5webkit/qt5webkit.mk
> @@ -39,6 +39,10 @@ ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
>   QT5WEBKIT_DEPENDENCIES += qt5declarative
>   endif
>   
> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> +QT5WEBKIT_CONF_OPTS += -DENABLE_SAMPLING_PROFILER=OFF
> +endif
> +
>   QT5WEBKIT_CONF_OPTS += \
>   	-DENABLE_TOOLS=OFF \
>   	-DPORT=Qt \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
