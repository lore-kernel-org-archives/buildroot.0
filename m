Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9336C4332F
	for <buildroot@archiver.kernel.org>; Mon, 28 Mar 2022 19:54:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8263C404F7;
	Mon, 28 Mar 2022 19:54:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7D9UNg6Ff_3E; Mon, 28 Mar 2022 19:54:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4561440191;
	Mon, 28 Mar 2022 19:54:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 440B61BF2BA
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:54:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3DE928139E
 for <buildroot@lists.busybox.net>; Mon, 28 Mar 2022 19:54:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K1weryAE_Oik for <buildroot@lists.busybox.net>;
 Mon, 28 Mar 2022 19:54:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 541EB81396
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 19:54:29 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id r13so30881715ejd.5
 for <buildroot@buildroot.org>; Mon, 28 Mar 2022 12:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g9JjnxVr5xlYH6wVdH9sgVaqV7e03mSyaHj31m4p3h4=;
 b=HMrU0ng/UpzbEJItiTTdGuJNu7aJqF9KmMmApisB1HSWaxGpd7fkv1C7mn/q5AX/jQ
 UlTOJ3PbzUGhnc1DVz9hRoUTp5vzokA1TjCcfbSqetHzTB0SzaGmG3EGYkz1JZ0Go64A
 tpgHdi4Gcd0LNE85OLUt4pN/UWEXuaPj+cxqPnBIBqqYMn+bMevLXUjUoA2ckH9Y4ZNY
 NJIQi6VxsMfNCaPj5HkaeBqbKtfrbsklZ1fZdi+IaIspnTN2agAbZePZNT/kz90nrTv4
 H7CtcWqt81hhdldgz/Nm/8mtXMqaZlyh+nK373d4gZLecnleKLYYgLuf1rb8SgeS6Oqg
 Pngw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=g9JjnxVr5xlYH6wVdH9sgVaqV7e03mSyaHj31m4p3h4=;
 b=w/Eo6x5taOSCL0v4XJSuEWghpxL+mrDXRWlFlA8438/uVkBhTXADE6+Q8+05H3824/
 Qw8upklYgftT4wAJhKWe70Xxz1KPooz4YkRydOUPf+cNVPdtsxqtROd62uBzdgxYVwoP
 f2nJYtfnVNPPCtIzrKmSehN4TDevTQc01SkPkSBCnpZaVkZtrWZuZc09Mgxhuo6et/eZ
 ocJco89Jcj9WtzX1PTSn13FBDVdOSaiWMyUzO3QAnYfImB/YxoOH3vlv3VPucrkNHb/o
 rFFy6aUVEW6rHYAi+3DEUHfSktW9puK1zXCCGwmqT7xWlCaUWX7moFSKfg7bNDZhLqVM
 WqSg==
X-Gm-Message-State: AOAM5311mIRaP+zuXy01POI5zLBZ7Cz7Y5c4u5mOEzA98PaebIdy7fic
 vqs+HKsQvZo1oBmRCtc1bxlm/Q==
X-Google-Smtp-Source: ABdhPJyK1WB4Zl8N51M+npUdanvSjzjlptoSiWEmHAo8/5HO8gZ5sxfO4r1WnBIoDAol3NRh4s2Oeg==
X-Received: by 2002:a17:907:6e2a:b0:6db:c440:532b with SMTP id
 sd42-20020a1709076e2a00b006dbc440532bmr29975511ejc.95.1648497267299; 
 Mon, 28 Mar 2022 12:54:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 sh15-20020a1709076e8f00b006df881fd066sm6324328ejc.9.2022.03.28.12.54.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 12:54:26 -0700 (PDT)
Message-ID: <9470c420-5f40-c626-173d-a7e22571ba7a@mind.be>
Date: Mon, 28 Mar 2022 21:54:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Quentin Schulz <foss+buildroot@0leil.net>, buildroot@buildroot.org
References: <20220328111413.1618964-1-foss+buildroot@0leil.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220328111413.1618964-1-foss+buildroot@0leil.net>
Subject: Re: [Buildroot] [PATCH 1/2] package/qt5base: fix race with
 libxkbcommon
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
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Julien Corjon <corjon.j@ecagroup.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 28/03/2022 13:14, Quentin Schulz wrote:
> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> 
> qt5wayland package currently has a bug if the xkbcommon Qt config is not
> enabled which highlighted a race issues between qt5base, libxkbcommon
> and qt5wayland.
> 
> qt5wayland has a dependency on libxkbcommon package if it's enabled.
> qt5base only has a dependency on libxkbcommon if xcb support is to be
> enabled.
> 
> If libxkbcommon package is built before qt5base, qt5base will detect it
> during its configure step and enable the Qt config accordingly. This
> will make it available to qt5wayland afterwards, even if xcb support is
> not enabled in Buildroot Kconfig.
> 
> However, if qt5base is built before libxkbcommon is, qt5base will not
> advertise support of xbcommon feature to qt5wayland (which will fail its
> build because of a bug in the source code).
> 
> Since the package build order should not impact the outcome of the
> build, let's explicit the dependency if and only if libxkbcommon package
> is to be compiled at some point in time so that at least this feature is
> not susceptible to races.
> 
> Cc: Quentin Schulz <foss+buildroot@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   package/qt5/qt5base/qt5base.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index 4418f0d3ba..891635ad35 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -168,6 +168,11 @@ QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_LINUXFB),--enable-linuxfb,-
>   QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),-directfb,-no-directfb)
>   QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_DIRECTFB),directfb)
>   
> +ifeq ($(BR2_PACKAGE_LIBXKBCOMMON),y)
> +QT5BASE_CONFIGURE_OPTS += -xkbcommon
> +QT5BASE_DEPENDENCIES   += libxkbcommon
> +endif
> +
>   ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
>   QT5BASE_CONFIGURE_OPTS += -xcb
>   QT5BASE_CONFIGURE_OPTS += -xkbcommon

  The existing entries should be removed.

  Applied both to master with that fixed, thanks.

  Regards,
  Arnout


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
