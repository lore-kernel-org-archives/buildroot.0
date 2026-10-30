Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DB6606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=siXA3YZz
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69D9081B0A;
	Fri, 30 Oct 2026 15:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08LMrCcL_NW2; Fri, 30 Oct 2026 15:29:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 746B081B35
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374190;
	b=GfUDdLA2dK2eHljDIAMlRtv9jBCVZPmHrmI13JjIEEcVqejJ1p8l//3dbx3QQr5RYbhj
	 3SGhyCL8u7Tc90BCjCJF41URxf+gpnnsKIgyjrVGEz/J5RUz5PnazGFNRn6kSs3mzgZv1
	 wbjODB4eVDDddvKpgkxtpl+MrjA+pKROKgRzkdYT38a1FWR88BxdIt1nYL08vM4BcYq+p
	 OZB9zg4Y2ERjdWsqBve0tFK4tYVfxBlFcXAUUKCI6V1vGjmKvK0XDRKDpPZjx1nFPS1WG
	 yIeg872YV4icbIbioye/YTDPYx79rQXNSe+VHs4YMgog9jZq1Gf+H4VrdvjEQMeycWA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IOE4twp1TMvgPcnYIRJgMgpXbRXfpV2CPZvHt/PjX2Q=;
	b=VcPp+Iywpsn/oUd4/fM/McE6MPJwS+uiWDLXb6XkQf/YCoZ2aDdR66VG2AlGi5NCUqGm
	 jOdo56bb06fi5w3cQpru/70xgfKLPdyg5B1+mw/YBdj7PCie8zHMPpTqeRcfDt+/iLhp0
	 KNo2cvh17hG8GaOD8EqGXfA63B7rpSlh+RgB+pzhJ+Wbn3I+LcgWxBV9KDnGSLawPLDB+
	 ItrpRw+05xLKj60Xkm84rIVnb4gMueViSPyjBuaguRHrXk+38rvZ5T3U5Stg8l2NDk5Rm
	 yAkOitiSbpAtskRarAJguooSU92ILyG4PnM/vwCbN3EbLWz0MKgvG7FgFJfs72596Kw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374190;
	bh=IOE4twp1TMvgPcnYIRJgMgpXbRXfpV2CPZvHt/PjX2Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=siXA3YZz+WW5fojDp1kSXdKjZWKteJkLk0DQfm9I5s4C+FGvyvgqFvaC3lCugtTl2
	 gy2E7QcXleeF9BsNQVitFurMh5nXYbYThyvG9iAWpYOzgffROx9zBWO+ah1mxFziJx
	 rm44exonp0njMTP05Ab2oDC2iPnlNl2+LK7B5fHknktOGDFnktST9hYSw1hIU/8SMD
	 f23eZwG4FNxqPtU2V96zaIMY1X7VAs+vk/K+zKk7QTb2ZMvFKnHi0WvSXtRxXaMlu1
	 lMlw94PFtpLRR5lIsmvijQ0X+mknCkrHS1MPGKYXzEXmoNFwntMXzaxNbrrZGaeXgM
	 bKDcT4cctaShA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 746B081B35;
	Fri, 30 Oct 2026 15:29:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 92418235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 776A560B55
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IpVfUFtOww_e for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 8420760B23
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374161;
 b=ht9UzXO+ITXfZw1CenvHU8ahLZcvvPOg+4S5Puual3plvxmia3qrU7qf/x2YBW9jPx8e
 E4Ro1YGOcPULvhLcmXyBl4gcNvHtCy2DRLnz9ldIr55rfXqXszrmbG3jdA//wKjJi3+Vs
 ltFHkzRjhwr1VHT9i5uh57rgtGKOgSX1O77QWBROqCd+0dQRPrqYtEFK+VHXsxlAlyISi
 GPYGH8Fy5gUws7+T9ohMEKtQvpUP+/BKCO3U0uhoCkY+pjgZ7qnWDYHYiU+lNo3N7dXUB
 4cdwyOj40UB+wuiG0/Fd9ykkU3nSXEi1c6xuqB4WtFHkoH//K1jTEWe+tSIuQcBbKog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374161;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=OYZWyeD7Pb4vA/x+x8Hmpt7HCRFyKjkaHVvlO1hJNCs=;
 b=WSqilPJ1hfLSRy4mJlVXG9vpbamLR2HVJIULOGKDUPpLkzlqqTnuWyZmCk6Jgx+rm5Kx
 VMb9QBlhE/lPU9yCjPGPYsJTZK8sjRbHNDyO+xQVDBQERSMH+gYVEgWxFn1d+ZKxfk533
 pff7vW2GbtU6LPevuJo0KAZvMfBgVNEKCflcpIOQOj3sdRKoxETB3pSAe0ZR2GCoS4j8e
 Gpiqk9ohhi3QNHRREmJ5MpgaD7h85PrYSwV0PPr/YL2aUlkeigFureTpQZ0nMnhkVsrD+
 wLofKn5QXuABElN1YFEa0xH21B22WbNX7VID2uTEsrhOBi7yPVkOGqlWFgnVuFzGZmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="It75hla/"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8420760B23
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:21 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso5925265e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374159; x=1793978959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=OYZWyeD7Pb4vA/x+x8Hmpt7HCRFyKjkaHVvlO1hJNCs=;
 b=xoxbhWqAatYGaEXKxEKqXf2SyHh7XVzAjAlRZemB/Urv/l0WATPMcYMdnAoELzr6XP
 VwhUw/3s8O6b9MCuj2oQoRazrTgqm5Lh3TntvcfZQLlVyQXLzRP8CAH1pAmP1JFBlZws
 uDOCvTsnKcrTQQWnrT38FPC5KqiCeXctbDpvCap5F7/SRmIZE+GfF56EPCQT5G+SE1uo
 vXOzx0kAPNuEzpDM0lsx6IIL5otuz5BoOZ7m7lve8qcLi3oMDI8zfiwpjkD05cS6qWMT
 cQSU5eBNOFlLnK5Tq6W3XJkdkS/pKWJFLfpC6vlEnk7xyfH5jUZpZ3yqoWt/rWsmKAUx
 hCHg==
X-Gm-Message-State: AFq9FYKKVT7+ZByrYDCRNJjEp5Q7+Hxho4u/3+bR8WsnbbamB3ODEqoS
 QKGdPyVor4iSacujhaq7c5/zgrC7pWAPLGPylsHEWXs+wgxhoezeSqwlZJIxpbE1E+b5G8bjfiC
 G3CUEFDI=
X-Gm-Gg: AYBFou3nCmnR6RmhpGsBXAB5YcwrF2OG8kNnemEGehfqQ7PYvaFkWr9S65W03jZASzh
 nkv1Wzle4PNQWFcU7s5O4urigs7BbWlInE4PphvC5XUPJBgxOEeBG/zOrRTtvgaDONYJgop/6ix
 lSF31lzRkxI0/qILDem/qya8gQ+Uw0e549kdioHIGHRLvS9NPj0jzeT5OwryGbU8I69tWkEdUkz
 +tem4zPdxeuO4M4PEDh1CIrhixBupgrc7/MM9c4X/ISQcCGUdDgQHglFNac3DSTY1sQfzjyZ3um
 fkLNJc4Jv0nPBAPTE/rrjbJPOCCkBlAT9muP/QaDPJr5t7onV5BLhAo833aTALiyD2sgT4lSNPQ
 YU/XjL4r/vZZROW9P6tVq96+kztJpFYMorC2FQ1lUFUL/0TLF2SU4fD2ShQdeevxypdM9VhWDrS
 zOx/Mt5CbJvzot4AZBfy7nuljRwm1tT0JTrBDbNaYBF4+7EZZy1cbhyyZHh6ij+juCIiqipcD3m
 MRenpgu6ZmDbcryWsYbYh5uaMaY++AB3z++zkE4u/8d3SWc5/samKXAwVzWyZWUeDQv0kh6Ji7M
 9v3dAAwIvDVqb4mbq6DmFv//fsjFqYg4aNcpd3gLkwrSw/bQ7Mi5bp21Ye/V8is67pvxQSYt
X-Received: by 2002:a05:600c:6285:b0:4a1:fa27:df7c with SMTP id
 5b1f17b1804b1-4ac182dc8f6mr59878065e9.34.1793374159262; 
 Fri, 30 Oct 2026 08:29:19 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf5b289f7sm67262725e9.5.2026.10.30.08.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:18 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:16 +0100
Message-ID: <20261030152918.1907835-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023225751.2614512-2-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 2/2] package/avrdude: fix libserialport
 dependency
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Since version 8.0, avrdude automatically detects and links against
> libserialport when it finds it in the sysroot
> (find_library(HAVE_LIBSERIALPORT ...) in CMakeLists.txt), and there is
> no option to disable it.
> 
> Buildroot doesn't declare this dependency, so whether avrdude gets
> libserialport support depends on the build order. With
> BR2_PACKAGE_LIBSERIALPORT=y, building avrdude before libserialport
> gives:
> 
>   HAVE_LIBSERIALPORT:FILEPATH=HAVE_LIBSERIALPORT-NOTFOUND
> 
> while building libserialport first links avrdude against it. This
> makes the build non-reproducible.
> 
> Add libserialport to the dependencies when it is enabled, and
> otherwise pass -DHAVE_LIBSERIALPORT=OFF, so that find_library() skips
> the search and libserialport support is disabled.
> 
> This issue has been present since commit 0e16ff09e953
> ("package/avrdude: bump to version 8.0"), as avrdude 8.0 added
> libserialport detection. It therefore affects 2025.05 and later.
> 
> Fixes: 0e16ff09e9538d46c9726f8998080d55dfa5d41f ("package/avrdude: bump to version 8.0")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - new patch
> 
>  package/avrdude/avrdude.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
> index 476f031c99..fbad44a191 100644
> --- a/package/avrdude/avrdude.mk
> +++ b/package/avrdude/avrdude.mk
> @@ -25,6 +25,12 @@ else ifeq ($(BR2_PACKAGE_LIBFTDI),y)
>  AVRDUDE_DEPENDENCIES += libftdi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSERIALPORT),y)
> +AVRDUDE_DEPENDENCIES += libserialport
> +else
> +AVRDUDE_CONF_OPTS += -DHAVE_LIBSERIALPORT=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HIDAPI),y)
>  AVRDUDE_DEPENDENCIES += hidapi
>  endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
