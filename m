Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D093AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 16:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88EFB60D58;
	Sun, 27 Mar 2022 16:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FMXYnm54dWmV; Sun, 27 Mar 2022 16:08:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DA6A606E6;
	Sun, 27 Mar 2022 16:08:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 05D3F1BF303
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7A35606E6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 16:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D8faHHPdWtvB for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 16:08:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B1706059C
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 16:08:40 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id r13so24074033ejd.5
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uOaGACUefyPArQmTORh/03cRMotaO7PW5jvqVB0KeLY=;
 b=GS5YIPx+iwSHcl/ad/wo78X03/vSokgRlKCe8+F6Vz1huXAhMFoKAmlMTXbKkTLofw
 sAQIivL33zVPcTXZrj6DAHGm73RQTJtQIGYQcUF2IXULPe7y9slVTOzl15A8aIbEyidA
 1WZK4nKRPSj4b+yDXeX8act7Z2lPkPn/oszZP+JmDP2h4Po63gPaAGXehkGg2KeYPSzZ
 8IMlFKUZiS/uxSuMGP0GWW5bMlKP0yAEf/gjPaFk8yppvxMlgQnYbpbVZuQwMiHWVJ56
 S2ATjYodfAQqXt+najfQGb/Uj5mynoSJ9mjvgLk2nblLmOJtld/CoPEia+/qOsJCABuo
 HEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uOaGACUefyPArQmTORh/03cRMotaO7PW5jvqVB0KeLY=;
 b=SWSVV3YB+ugSVDWQDPvuyJKWQMV7GyhhrOYc/pZk4+J82qxYyZNwldw3z6MD3cwNUM
 wt6ZirbRaCsVGsNlmNP10Qc2Xxti4EBOLVK0z/b7dgnJgmJ36EDxN2Hf4wCfpu08qUWK
 QWGbyl84yPrEOGkvVupzoxGa/dFvH+8PJEKrZkAqETi7RGxtNuCQ5mIQGAOFaAAHNv1o
 tir+gplD9L/bFBSarHGmi4q/J1v//9bk9/vvC/Q6K8cbHmg4o6LHeIsFLJ97ZVA2ZnbZ
 Xx9omEDCiVCDdE7Vx17JKfK2T90Bxuti5xdrejzM9+ipc0wqwoNuCBF/TOijAKTSTsST
 Dcgg==
X-Gm-Message-State: AOAM532YiIlDEBEKghEplUF0Lu7uQ0NesN7Xrz1CdsN+W6GeT1g8pICz
 8qQTSXCsuRO2opmrQ2fZabrC6w==
X-Google-Smtp-Source: ABdhPJwFc0RA2beU1oTlQ+fKsaB2wtkeKtWJvOC4YmLO9CLNxGKKOnBetxCD5PKKqRNiMWnRGIjHkg==
X-Received: by 2002:a17:907:97c8:b0:6db:6c57:64ee with SMTP id
 js8-20020a17090797c800b006db6c5764eemr23113340ejc.320.1648397319359; 
 Sun, 27 Mar 2022 09:08:39 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 gn3-20020a1709070d0300b006e1036666bfsm697795ejc.223.2022.03.27.09.08.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 09:08:38 -0700 (PDT)
Message-ID: <f8b66d55-601b-2f64-0821-d44b17aac130@mind.be>
Date: Sun, 27 Mar 2022 18:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220321230452.1901382-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220321230452.1901382-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ola: fix host build
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 22/03/2022 00:04, Fabrice Fontaine wrote:
> host-bison and host-flex are mandatory dependencies of host-ola since
> the reintroduction of the package in commit
> 16ff948444c3978d63f483344a3d92d994c64312:
> 
> configure: error: bison not found, please install it
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/ac089629a58d55ec5d1aa83fd77bd487bc9d76de
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/ola/ola.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/ola/ola.mk b/package/ola/ola.mk
> index 471ae8ed9b..cde90dbd5b 100644
> --- a/package/ola/ola.mk
> +++ b/package/ola/ola.mk
> @@ -25,7 +25,7 @@ OLA_CONF_OPTS = \
>   	--disable-unittests \
>   	--with-ola-protoc-plugin=$(HOST_DIR)/usr/bin/ola_protoc_plugin
>   
> -HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf
> +HOST_OLA_DEPENDENCIES = host-util-linux host-protobuf host-bison host-flex
>   
>   # When building the host part, disable as much as possible to speed up
>   # the configure step and avoid missing host dependencies.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
