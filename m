Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9A78FED3EA
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA8D384E20;
	Fri, 24 Apr 2026 16:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2lSi7I0X1EOM; Fri, 24 Apr 2026 16:27:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7DD584ECA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048057;
	bh=4Kotdt4AvKRp+85a7pAKMxUAK26xL5K2SQak/HVzxWo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=I+yU4jMCtM4FfoUol6u2ZY1mlzfPta+auMyb/eLW5YT0x7wmBrKkOvOa4VWewPZ94
	 Z67ZYs3aACsQObe2GGncH820YjS3biinSIEiQrhGsYj5lAk4oRD9scZ8Awqj2+IeoN
	 5vVv7ehIo6iAcOIkndatG9bPHP8dOLAlOq+U/aeJtRXQ4QEvK1qTT1nzJd1myk7Cp4
	 OXEEjQLC6sw5HfwZKlflf9SXX7WyfSUrYYIuuQ44zO/uBGJClY1sOv+217cci//Yp+
	 ojejEuKOWfCdJee+G2SubzH2a8AV27EjTS0EAnPGsEWxxBGEYRb779LJmSvJM9A2f7
	 pGP1YwLM4T7sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7DD584ECA;
	Fri, 24 Apr 2026 16:27:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EF74194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75F4F84EA2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ikLcVVf4JBx5 for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C31F584C49
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C31F584C49
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C31F584C49
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:27:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488ad135063so72473795e9.0
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:27:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048045; x=1777652845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=98f+kRSkRpTnwiW4sf8HXp1fGvMnMvLgVnyTFveoSdI=;
 b=fRKHWvyoxj81oigG+USASdnU4YHCaqAnEpJCgMxwl/xLf+WCoja9KOCyWJvmlaoM9V
 nRv1xarhBa0nybW6odtQX5VzPitn9KBRFsJlC88T/Li9waTRWPLV2LJu5Bdu/816CA1P
 jtXnQ0QDAZ6+ITW8b/0IyCUpGWda4hvJNQGmYjQz0NZKuMQxYeB5gR8N/UHuV8Rij3kP
 H7tWhPNJja1giH/hTae93hTVdG7LoeNYHzimmxIcaOyGLhIFvmtPn4YNVNY1F7S1t7Y4
 BSeDz/ZQyqlHfqzHQFX9bWRD3cuq5NO43AJ/0hD02SFWKUbTd851fRJR9N2kzaChnv3O
 DCVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+B3k9FWrYwKDHx2z/KualbTd3WJuHeTCErjYhyM6elqGyfI5bRw484o2MrWIJ5DOZOEAOGBKPJ4mY=@buildroot.org
X-Gm-Message-State: AOJu0Yym3M2TxYl6BZDgTEBSUfnrW7PMaVDruKMiO8Y+baz5kWVYqqQC
 BbeZ6yik6EAMfc3uox4NTFRYg2rtHFmrLdirpdbqJWZTPlCxDvgUBizcYTAi/bzpycE=
X-Gm-Gg: AeBDieuy3fKFq7xwNfjW/9FB9vsZe4UOBKziP2U7WGf5zO4+zOjdars4hE+b9YQV8SB
 rBJK1wUFB6cB5ZkSEl5baPkIKVGzzukd4UJ3PhKTOe7/5ZNRQUtwHpb0oGViG3PQg6Ke0LnKdlH
 P7sAhSh1LSHwy0nqbMqzYnhiR9QafiPuhSlzgAM/v5yJcITEmPnGSikgBM+FIiMmlYprNoi4xbQ
 7MQgrK1M0ih8Z2aRhuxI3ayJkgdpz3PiSpacmTXE1MwEG/qBTHLG72jmyvFdoetStdy2CA7MPxo
 kh81Fczkb3C9F0O4Q28hiyp2mgFqQLnI0QhCNd6mlGbWGb1aiuOXzThjD4B9CApyXrMiPPBCm/T
 gmRMCXonKs1m5DYp/DWpFKSCjZ/fvQLMztAXZ9eRvNAUsfVlFKGh81YelVxDYGo1YfKjwG8sGu5
 mQMrMmjIORvQW7CX3zGgj6BETg0w==
X-Received: by 2002:a05:600c:8587:b0:485:3f30:6250 with SMTP id
 5b1f17b1804b1-488fb7856b9mr354590055e9.20.1777048045521; 
 Fri, 24 Apr 2026 09:27:25 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc1cfbf2sm622218425e9.15.2026.04.24.09.27.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:27:25 -0700 (PDT)
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:27:24 +0200
Message-ID: <20260424162724.162176-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260416114256.969634-1-aperez@igalia.com>
References: <20260416114256.969634-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048045; x=1777652845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=98f+kRSkRpTnwiW4sf8HXp1fGvMnMvLgVnyTFveoSdI=;
 b=VTl+WvDfzrOwtx9NwUnpuXlV9+V+0wr/DzQ6vACWztyJRq6tTD9Gsutt9S6LMprao7
 E3MgWGgBRuSDaY44m4Y44np9qUHOQFplx5t+uyI3l4PpvswOJmq+IDwJOXVwODJ3ylMt
 e4v8VomMA13s4dZ8BJaXwYk2ndY1WGEAGn7EfjcWJhn9SoSyIhWRoLNyw88ovkfwvsCk
 7riH3iAlFxutfFjaSq/lUCTGvRPzo4peqbw6VfWhSOratskytUKIoHuCwMjsuQgXtH5f
 UjL/58PogMo0SmGD7BumzztfJgwibc3i51LficqzKfKClFgyF42LX9+uMi4eqxmAkmy+
 iqBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VTl+WvDf
Subject: Re: [Buildroot] [PATCH 1/1] package/xdg-dbus-proxy: security bump
 to version 0.1.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> While there is not a security advisory to go with the release,
> it includes a patch to prevent message interception that may be
> considered a security fix.
> 
> Release notes:
> 
>   https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
>  package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> index 93d4bc05ce..e5be1f0cd3 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.6
> -sha256  131bf59fce7c7ee7ecbc5d9106d6750f4f597bfe609966573240f7e4952973a1  xdg-dbus-proxy-0.1.6.tar.xz
> +# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.7
> +sha256  3ad3d27ba574e178acb5e4d438ba36ace25e3564f899c36f31c56f82c7adbbe7  xdg-dbus-proxy-0.1.7.tar.xz
>  
>  # Hash for license files:
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
> diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> index 0e92946915..6c3ef5c9d4 100644
> --- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> +++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XDG_DBUS_PROXY_VERSION = 0.1.6
> +XDG_DBUS_PROXY_VERSION = 0.1.7
>  XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
>  XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
>  XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
