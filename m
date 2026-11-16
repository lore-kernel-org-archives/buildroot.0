Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3084606A32C
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=eBy/NpMk
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A87240737;
	Mon, 16 Nov 2026 15:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XJ-RrWnTuvW; Mon, 16 Nov 2026 15:38:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D8D244071F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843535;
	b=sI7cRtpSJ5cwd6egFmjtub9lIJ7vY+ftb9QXVZIdQ14RE0yc+aFF2L9oDujnpJBEE3vp
	 HGarHvvrFIMaZ1YM5ROUUw5YTJPnMmZsDyxiGjjHYuA83sn5Rpb9gJMIq5IUgwF3ggJCz
	 Hoq9CAgtPl8hp4hVep+kGXoLC7iaWytagSDaasnvYqh7b1idm3URJT2f9D8et5QAejPKE
	 YKylgWtr3xNL04SyB3CIz7/3NOUSvgDEhytVJmyuyVhbIJRTHv9OGTHGokMoOQYEs5Yi5
	 WWvVV7/9HdDqmhe253pRkm2hD7f3iLtt0Sx9eFDYsJ5ZklQbjVfH5dPCTt5vtgbAbsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=jTx8bcIj0iogTEEPGW7c5P7Nu/J9Pt3B6M787C1WWNM=;
	b=l01IdWCEWSidHlTHx26Bee3QsnIZQ8hc5x1ea80rWDqnIn842XWZfq7xOIHa/dTgruV/
	 bfnYqgeCKGIb1tYIz3EH92Llr7Mw5sAo7DNkanociKPdEbWKlWVOY61vZfHN5jM/1s5Dj
	 FeQTjaINj8G9Rxk5FmyHkjnUxihJexRUd3ac0SeFtcxAQRKeAHybtlu0Av5yE9mc1m6Ec
	 GhuZLZFQr6g1QvDCpLjLjeaW4/oT1vVn3VL9bbn8RF9TccPHFFwwpigSvP8gDTkGg5oIq
	 sUwpCzrQzMnEKfJIeCsMkQWw9QZ5zBki9e3xR7tm86r28e57ekyUnv+AB8WXjV8dpLw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843534;
	bh=jTx8bcIj0iogTEEPGW7c5P7Nu/J9Pt3B6M787C1WWNM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eBy/NpMkJdyhRZpUQj/5jq3MFVkFj7JTNGp/Ceoummegr6B6sOmRtlqT1ZhJ5z+Cg
	 MomvqxRbas6k6i32oTVjMjvdMhqAw/W4s+BG6UehuHLEzJJbe4Vezm4+IPxO36vFB1
	 FLs5KcacZikHMPy1kXPtbYXDNSW6yEM6fRS8oPLBK1/vLzi0NOtCZbM2CcF5O4JEIF
	 8OgawRiamYLrsrdAdfQ159IibTplMZhGo0VpCBdhYhvPKNEbQ2FQ7QqPfL1xyqEgYo
	 oh6C1NBDMLZNZvRlvgEZLH/wB0zGr+wRIQ5YL+xIZrRER7q1oDo+8zpZwXE2au9U6J
	 IDap/XtONfipQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D244071F;
	Mon, 16 Nov 2026 15:38:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 796992FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B47B80C3F
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtEnXFVYnSAo for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:38:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 31C8480B9D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 31C8480B9D
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:50 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso13144195e9.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843529; x=1795448329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=P0ryKwQmDvRDAqLY2/pArk4GRY5zXlvbI6YqUsdASBU=;
 b=Hb+3xgDhpmy0/9w0U5v5dxbg1CLtIuW5VZqo8UR09W/7H0GqfmaLjBvSVZpVIUDwA2
 3Dcv77LxqHFYva0xSvjTmjY2OD0/NVOz3B0hXucvWpDj/KMv4zKOtO8ER0xXDpEEHnf/
 3FnqISA9JFrd052mqrMy8lpBQhBY5nR1SbIKYSykNItV/NbCY01X+yWdzhgpPtCEzJkJ
 Ic5TSAJvQLbuhNWsuLqDEcfue7z9v7yGUwZAoPPsZ4AmnN4v5z/P2DI7aDlgAVN37aPj
 Y0oqIJCcdjbG8bpqf8sN72S4azDufw/hDv+j70Je4VmTC5nSxhkYUTUXfj/cGdxKiyFM
 gP3g==
X-Gm-Message-State: APuU4Z+3bTqKOR42tLdPe7P866hlKOlYEooN/qIhG6VF1I6XorLSv0cy
 EoSDjE1vkSKmDFzO53kI9mob+wEvd87B/9si7ICzk9abmry731C9thVo2TBVMBUMkMwkh3ZiPK7
 TMJ3YyfI=
X-Gm-Gg: AYBFou1mHYTlSlFBcTQtwRaE5u0/ntJDqJDRCH2RnjOAlhHbvskLuf4Cfw7uIneQqJ2
 t2eoE8kx/cU0iHrHmBgzxewF5ZBMeZoMNORY159/cbEVviVPdEi9DTmr2YJdemEx7KVnR0xg1o8
 eQ3afY/uQPyRaUIgoWk+KGrRXUEWNT40rgRoKT9LKOHN/sUu/mDzWV7BqgmLmpuuYbS029IPVX9
 +L15t+2h5A5J6KNVF1yh2VMdSAgd71wu4nNgiY9YdMBAZ7ZOtRykLKynja62JyzCPWcIFAb58ze
 bjc+0faHE5a5R7UTD+SUNnCd47owQ8/VDocVthhtc3P1+n04wAEi3Hg4l5q4RyJY7qD59J/kVmQ
 a4uDo8E4mt2Ddiq4SgTiiSG1dpM5CJ084B8Ap8CduH2I1TL6cSKmfzIl/M1I2ob85L6LEBrZ3Vs
 nbuaoJVP1rSimQ5G5iTdYe7gSVwBeM6V8xEv/7ZyCjOfm7pRnecbGoquFF6VP15DTfDXQL6BFl4
 sE+gzC8tiMXfY3GkJjlYyMOVKO6Iobi8+mA7QlwFbtPZhg/LRb8tLjpX2xYGhDlLhS2gWqrU7O2
 m54Ys8f+3e3A64RkOOmnDEWevAUIeV6IyKR9EeuofMZrzOQxluHi
X-Received: by 2002:a05:600c:4746:b0:4a1:813f:2a60 with SMTP id
 5b1f17b1804b1-4bb55a6a642mr246346685e9.11.1794843528838; 
 Mon, 16 Nov 2026 07:38:48 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb55acdccfsm311015495e9.8.2026.11.16.07.38.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:48 -0800 (PST)
To: buildroot@buildroot.org,
	Bernd Kuhls <bernd@kuhls.net>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:45 +0100
Message-ID: <20261116153847.724995-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260929193342.1905539-1-bernd@kuhls.net>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/rsync: bump to version 3.5.1
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
> https://download.samba.org/pub/rsync/NEWS#3.5.1
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Added configure options to handle new optional dependency to libidn2:
> https://github.com/RsyncProject/rsync/commit/f0177d82a8fcbbebaac2bdf556f983160ae03988
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commit/1915a4f7200942fdd6203b07debc24b57ad70502
> 
>  package/rsync/rsync.hash | 5 ++---
>  package/rsync/rsync.mk   | 9 ++++++++-
>  2 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rsync/rsync.hash b/package/rsync/rsync.hash
> index 84cdaf680b..3fc2603049 100644
> --- a/package/rsync/rsync.hash
> +++ b/package/rsync/rsync.hash
> @@ -1,5 +1,4 @@
> -# Locally calculated after checking pgp signature
> -# https://rsync.samba.org/ftp/rsync/src/rsync-3.5.0.tar.gz.asc
> -sha256  c7ffd1ef653e99540f661e47cb00b7f9cad1ee6b972399b16f93d672656e0d33  rsync-3.5.0.tar.gz
> +# From https://github.com/RsyncProject/rsync/releases/tag/v3.5.1
> +sha256  c55f9c9dc10fb8bec397b399a0fdded53cc9a2d8e30891bb0d63724d25c37bef  rsync-3.5.1.tar.gz
>  # Locally calculated
>  sha256  85c19ea50a224c2d0067a69c083584e5717b40b76610ec1218f91385775067dd  COPYING
> diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
> index 391659a33d..af18dbf608 100644
> --- a/package/rsync/rsync.mk
> +++ b/package/rsync/rsync.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RSYNC_VERSION = 3.5.0
> +RSYNC_VERSION = 3.5.1
>  RSYNC_SITE = https://rsync.samba.org/ftp/rsync/src
>  RSYNC_LICENSE = GPL-3.0+ with exceptions
>  RSYNC_LICENSE_FILES = COPYING
> @@ -34,6 +34,13 @@ else
>  RSYNC_CONF_OPTS += --disable-acl-support
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> +RSYNC_CONF_OPTS += --enable-idn
> +RSYNC_DEPENDENCIES += libidn2
> +else
> +RSYNC_CONF_OPTS += --disable-idn
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LZ4),y)
>  RSYNC_DEPENDENCIES += lz4
>  RSYNC_CONF_OPTS += --enable-lz4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
