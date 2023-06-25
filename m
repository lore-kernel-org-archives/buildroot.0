Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8ECEB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52CEE60BF2;
	Sun, 25 Jun 2023 19:10:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52CEE60BF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03onmBBufa9Y; Sun, 25 Jun 2023 19:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85D7A60B16;
	Sun, 25 Jun 2023 19:10:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85D7A60B16
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3121BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:10:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 547C360B16
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:10:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 547C360B16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lmzEBSW2cc5N for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:10:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72D6460B0B
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72D6460B0B
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:10:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51a52a7d859so6533357a12.0
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 12:10:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687720246; x=1690312246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5f3aAVeylvvU5h/9UTRiGjrATREwgB+XldEBu5Hp4aQ=;
 b=R78ozGVPLyDV9Q0x2br0WnRFvxAAYuiqjkn4mUE7PgFTGCwD8xnXoUYCHajeAvVg/P
 j6Rm+3l0lnNtlSOB4P/6R0N1Ho63rYPnUw7qxJCC3eG8qfk7WeipzyU4dOglIU8TNFep
 S8bJnXMLzPJnitIsm6CGN/E7C/kBBxe5vafZQ77h7Bc0YerNMMa1KAUaOHvayXEAWm7p
 c5n7JlzZlJiEEYrfnsJMha4QHzqujkCcXvJmpFbf/La9u5JOdMDq1aAcn344Z2FfE3Mv
 2kDGUkOC/15vR0qoptwmVfby5KW2/Moe/tcdxIDB239HhiUYBFg7w/V5IAE1FCv0Ho0M
 CuIQ==
X-Gm-Message-State: AC+VfDxmYCyGRommPMX4gD4GMF5Stpu1UqMV8pogVACJ4IzpILmNy1r2
 Hm+PmjZcy36mIc1U4k39CE8FcVije2Y0YKXUSS8=
X-Google-Smtp-Source: ACHHUZ6jvF6n7kQNiFWL8aGXHsDdXDehfVTJ6zqREIa3tqsA/CHmDUldUQLeC5dIdh294wGSVKNxhg==
X-Received: by 2002:a05:6402:34c7:b0:4fc:97d9:18ec with SMTP id
 w7-20020a05640234c700b004fc97d918ecmr27531423edc.21.1687720246780; 
 Sun, 25 Jun 2023 12:10:46 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 x26-20020aa7dada000000b0051be4cb7f54sm2026571eds.84.2023.06.25.12.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 12:10:46 -0700 (PDT)
Message-ID: <cf615eaf-5d13-6f83-ff88-fbbb7db79221@mind.be>
Date: Sun, 25 Jun 2023 21:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20230621160050.359493-1-bernd@kuhls.net>
 <20230621160050.359493-2-bernd@kuhls.net>
In-Reply-To: <20230621160050.359493-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687720246; x=1690312246;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5f3aAVeylvvU5h/9UTRiGjrATREwgB+XldEBu5Hp4aQ=;
 b=KFJY+i+lCpTWDOaeD4dy5qCX0FDzdhYyVHjIidSHqddAp900U/lU+iBsaltlv1MGxh
 98djxvN6mjN2PpEQyoslnPC4YUyXrV7gQUAGDBi6umHz/ofzYqcd/46wGunR83NEeGyq
 Qxk5UjJC1qO/bDGj82Xh83rK4VwYq6GZOERdXWF4W+0G296sZkgudPQGpJyguKsOSoWd
 mSOtkaBrXP//JJpz8FHq3Vy0oq+6jdoeW1exYLzxkamGWWDHh2kNzgwqz4P6anTTRxIK
 Q5qYZ/WmvYFHqvNjzfUXo7+iHacncT92/BrHdD0huxKheo+BWUyyDHVyug3Wy7V96771
 AtgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=KFJY+i+l
Subject: Re: [Buildroot] [PATCH 2/2] package/gupnp: bump version to 1.4.4
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 21/06/2023 18:00, Bernd Kuhls wrote:
> Release notes:
> https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.4.news

  Why not 1.6.3? Are they not compatible or something?

  Regards,
  Arnout

> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>   package/gupnp/gupnp.hash | 4 ++--
>   package/gupnp/gupnp.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gupnp/gupnp.hash b/package/gupnp/gupnp.hash
> index 823dbd7927..aa32745b14 100644
> --- a/package/gupnp/gupnp.hash
> +++ b/package/gupnp/gupnp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.3.sha256sum:
> -sha256  14eda777934da2df743d072489933bd9811332b7b5bf41626b8032efb28b33ba  gupnp-1.4.3.tar.xz
> +# From https://download.gnome.org/sources/gupnp/1.4/gupnp-1.4.4.sha256sum
> +sha256  3761b15cb063621f847f3effb7d7637f0317500fca6bda1e1904f73921750a1f  gupnp-1.4.4.tar.xz
>   
>   # Hash for license file:
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/gupnp/gupnp.mk b/package/gupnp/gupnp.mk
> index da04eae682..0e3d647710 100644
> --- a/package/gupnp/gupnp.mk
> +++ b/package/gupnp/gupnp.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   GUPNP_VERSION_MAJOR = 1.4
> -GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).3
> +GUPNP_VERSION = $(GUPNP_VERSION_MAJOR).4
>   GUPNP_SOURCE = gupnp-$(GUPNP_VERSION).tar.xz
>   GUPNP_SITE = https://download.gnome.org/sources/gupnp/$(GUPNP_VERSION_MAJOR)
>   GUPNP_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
