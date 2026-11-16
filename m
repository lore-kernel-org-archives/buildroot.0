Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04045606A31C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=l4g8fX66
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18ED260801;
	Mon, 16 Nov 2026 15:38:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UStpEEoEOpEz; Mon, 16 Nov 2026 15:38:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 320BB60793
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843528;
	b=HJJtNm9IWxRy5M3bJ1zacJySx5huIAw3PueKXlspWlahDt365u+db8xMuf06FunyR6HN
	 Qs4klkPp7auGAMKy9UhiBVjphjA8xH9fgTHbduLdfC1gjs/mfnYuHq4E7EqYh9TG3NkQC
	 vmhkREXwLpdEIfUqShP7BSFz88RVDr5i0zyJ04sluwNpEwYRWv7RBENbucAjXAOX4eg25
	 C+qoKfFuaKvBuIFrlHVwEYDmtB0PH0ibd3rMwgAV4+S/n7eBwaRJzdU2N701GbAXKWPGO
	 cWwNbyGSiRz8tHTyRGZsZ9ys7dnY3lV83vKR2DMvReE/y9t3fRX0CRUIAus4F+gGi3g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843528;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MrhECL5ZjLzDeWk/KIi6b/ZSCeYojOelX/g+eiCSgcE=;
	b=n4yO+GDvOwJMjFWhTAmAxTfIQEbdVZUeC6a+kUB+JFg2NW9Qk81XVI9fsmMtTIG8WCbf
	 v3ekcBlW4xHtqmBBiOYorSygZFFuwfby6YLMXV8gL2jNkEjTfOxmjyTxyVZxOXOK7nsC+
	 czru4ttEjZNYdHDOETUoOVRHRtQyQG77YZYn6cIhk3QoMSVm6HK3HrzU5AZA7Lj9r9m9E
	 5Aloa+rdm8JfkpVwur6nWttB8DAB/ykIJBBtfaGiaNtDUTA2sPe6FREZgANd/wiPKM3zf
	 3cAVJfu1BXvy5coLE/W+EKY4OFfR12ZJRL0ejjDHbsl7caXsWYnrln/+Gxqb2mbBEKw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843528;
	bh=MrhECL5ZjLzDeWk/KIi6b/ZSCeYojOelX/g+eiCSgcE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=l4g8fX66B5uNwPDEiEDjklhyHZrVKlm7kdchpWK/43yRY1FZQZmYqUeUpLQgB1JUw
	 kQCb5FSX4xBuMKwCBFm38w8F8+Z9y6LrbxHAMjiwuEOxg+NEndr4wWl8Xv97qQ7Prb
	 SliYLUsXx+9sFh4oStd9hdnG2C7bKqyvmhfSmcMLWtjm5+FC2nMZ86QWkcKBG1jq5X
	 O8x1UqFCugUV3uILntD67kpc4Q2aP1iVkbFbAtK6pNxPciKLzRdoGWE/r/uIKDj8k/
	 +ZkDelOyp0Mg31Wf7Sz62DO0crwVWDSfBzvAUkcIBsXFh0XsDNmHdIddIhztMTFhZH
	 osk00Ou3MJy/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 320BB60793;
	Mon, 16 Nov 2026 15:38:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7785D109
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D4D480C3F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JMfINFg52ypk for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:38:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3F74D80B9D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F74D80B9D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso23412665e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843522; x=1795448322;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=L5oRiETmvMUacxyRFqcqSfCsHKa8z3gCtgrG+gpmAts=;
 b=LSVB34ZcjJpQHlFv5pq+9ys+Sz/Xqsv3MroEmEnMvDZfsjknnyuvr259IjgXGX6vkr
 kUFciOtgt16bwfbcRty+hbLfXvJj32MFzItG0cqolgsKlt22XsLUGgR4SBgaByvd2xdn
 yFN76u00ePsGbyN+oXq4MdTaApi1WqM63yaVTSHpWnQPC9b7R2OUUq9RdvMoGqv7xrvm
 3L4WmohXiqGLHOqZIRRi55B+3qhYMTmfD9e557ejtkIO/MG4qM8uQKsdjYw2nLketdzp
 rqfJmFZ/9f6k3X1Upc0xVe9eMMrKiGA6w3mDEIRKduPGEL9Gg67YOhXmN/7reYV/DjIV
 NNkQ==
X-Gm-Message-State: APuU4Z9d/XiC2lDepS1ym6fJFYUMJuDdnN+eKQixtXCO6Xlqa0BDV1OU
 qSmyZOzOVmr6DFHtWAXBxHQERVXLZ7OyzZ9adnAysq6rR9sGauXPkpq7tZYUON0Ob5v8WBxcURE
 5BMFjW7A=
X-Gm-Gg: AYBFou3uKpmfUVRL8t6S5pGYn4xXGRpOSpFEZaVq/904GUhS0RHHOPz3HBXK0NeUvPx
 d+Q2RqYKetAF9Q0Pd2S9F1pv9fkmmSxDbjZT60Ttyt8Zi00seKJpPLNu/VFrOuJuGEm2zw4W8Dq
 stDEt3OLVYSYcWEywZpFF7KhhEw4WEX1fd5WIEA+BhnRNXr0decBZ8529kq48Nyn5w9A43VoMQ6
 ccP79eE79Oz8qgtXRTvmCypv6fucqcSOdvWHOvejMhJHOD/Qfk4bz0iYkEuFohDgIykj6JWJSGt
 igSWMXpccLJE29YFzoYucg76qPNzaj0r7V4ydO7LEClJ/81/4YLf7NcNdN9yeNReZ2VhheG2HCh
 RT2DnhciU8HgD7JHTut0ADuUg69QI1/Xkt9l+sY+gkAezaTuCzD+J2uqMYRPVV5YynbmoVyE7G0
 NAHveJ0E21bmvDw3YmPvvne1X2IQUDdFDzsTJSa31+6O2/fY+LhV8ofNyoRc+Y4eTNIqtZdAICz
 1mdLmx2+pz2axEtMUlVhTaK78+IHX7r7CBEZ+nsMOtucKgcC+paaRCWiPFgMAiP09w013E/yk5I
 SmWSnlRzhPyt4t6u9CU98AdJKWbL2HY=
X-Received: by 2002:a05:600c:4f0e:b0:4bb:5f43:23bb with SMTP id
 5b1f17b1804b1-4bb5f43261fmr194856415e9.33.1794843522233; 
 Mon, 16 Nov 2026 07:38:42 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb4e33ae5bsm345801255e9.3.2026.11.16.07.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:41 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:31 +0100
Message-ID: <20261116153834.724906-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260917000152.3060291-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/sofia-sip: needs OpenSSL
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Buildroot commit bb254e2304274dc308e3d8699e92ea77e4189fb7 bumped the
> package to version 1.13.18 which includes upstream commit
> https://github.com/freeswitch/sofia-sip/commit/8081a1a6d05f174cb902664f73182c32fd2eee0f
> that added the unconditional usage of OpenSSL.
> 
> Tested with both LibreSSL and OpenSSL, the latter with all suboptions
> disabled.
> 
> Fixes:
> https://autobuild.buildroot.net/results/afe/afe7b327f12db86e4dc31ecc25b576bff5c4a0bb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x. Thanks

> ---
>  package/sofia-sip/Config.in    |  1 +
>  package/sofia-sip/sofia-sip.mk | 18 +++++-------------
>  2 files changed, 6 insertions(+), 13 deletions(-)
> 
> diff --git a/package/sofia-sip/Config.in b/package/sofia-sip/Config.in
> index 2ad1940833..37961273f3 100644
> --- a/package/sofia-sip/Config.in
> +++ b/package/sofia-sip/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SOFIA_SIP
>  	bool "sofia-sip"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_OPENSSL
>  	help
>  	  Sofia-SIP is an open-source SIP User-Agent library,
>  	  compliant with the IETF RFC3261 specification (see the
> diff --git a/package/sofia-sip/sofia-sip.mk b/package/sofia-sip/sofia-sip.mk
> index 1d47b43fe8..b8679f6961 100644
> --- a/package/sofia-sip/sofia-sip.mk
> +++ b/package/sofia-sip/sofia-sip.mk
> @@ -9,11 +9,14 @@ SOFIA_SIP_SITE = $(call github,freeswitch,sofia-sip,v$(SOFIA_SIP_VERSION))
>  SOFIA_SIP_INSTALL_STAGING = YES
>  # Fetched from github, no pre-generated configure script provided
>  SOFIA_SIP_AUTORECONF = YES
> -SOFIA_SIP_DEPENDENCIES = host-pkgconf
> +SOFIA_SIP_DEPENDENCIES = host-pkgconf openssl
>  SOFIA_SIP_LICENSE = LGPL-2.1+
>  SOFIA_SIP_LICENSE_FILES = COPYING COPYRIGHTS
>  SOFIA_SIP_CPE_ID_VENDOR = signalwire
> -SOFIA_SIP_CONF_OPTS = --with-doxygen=no
> +SOFIA_SIP_CONF_OPTS = \
> +	--with-doxygen=no \
> +	--enable-nth \
> +	--with-openssl=pkg-config
>  
>  ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
>  SOFIA_SIP_CONF_OPTS += --with-glib
> @@ -22,15 +25,4 @@ else
>  SOFIA_SIP_CONF_OPTS += --without-glib
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENSSL),y)
> -SOFIA_SIP_CONF_OPTS += \
> -	--enable-nth \
> -	--with-openssl=pkg-config
> -SOFIA_SIP_DEPENDENCIES += openssl
> -else
> -SOFIA_SIP_CONF_OPTS += \
> -	--disable-nth \
> -	--without-openssl
> -endif
> -
>  $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
