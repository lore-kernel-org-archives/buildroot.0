Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB8F606A32D
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Yag2FGpo
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97C8F60720;
	Fri, 23 Oct 2026 13:20:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ef56hXdPPtFi; Fri, 23 Oct 2026 13:20:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9DD306074A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761635;
	b=Jd/2wc1gh4t7TRgvPAzv/ieUWVDZaP1oI2OXR1aqX1sjiwh5zNd1oSUatd40s3OwsNaa
	 VWxSHQr+NLH33SBrKoWccVAYcQoS1Ww1n35d+RLmuaTezDPKO+KSqiePaGHK8amJn+H/I
	 L4mTUZFMLTTS1yTvnIyAool31pIlO4EEYpgJdyO8JQ1bE67PqFpKDNG3NwTGeB66fakfk
	 PoLQZHyHY61u56nuCTIs1cMrZGwaKp/vEEBE2LmEIp0lrHBB0Z/BWvG16OU3caK4HIDQg
	 yfuW/IjbyZmS6f6fDQwoLCPS0lmQOnR+W1q2r5aOX2jkrF9ddmzQKWwwP6Ll+9a6u5g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=LcnDMn6Y6fTV3cX4Ia/jh/AH9Q9CLh/X1gCMeH7Xg3I=;
	b=pdyeVkVgPa8iwF5iATmdoWq7wUKLccOC9w3ty4P3x2gARxypDQawPeaaGd+/VLJKXnhb
	 SPhd7VCIaqkAW8OlefZ4Ki7e63A7B1OjPoGKKzlMQzOAbrmvlD6+nfcUGPOPg9NujdOda
	 4EEVkSQ3SarV5gN1ESvq6VNTALduX89jhaldXvHFTmhETdYg1H4iLaBh5EkA7LJacTQLL
	 7hQFhjmr6/shBWjeXP8X2KHijBlu+SJZtHRaQRP7rOZ/ce5DyYd+aoPkX+aeVpqwFpI5D
	 0woeOF9qIA7YfZduZMhSunSKdMMguV5xOLJqJi0tGFrH5z3qmkogU9E/rXJO2Xyq2SQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761635;
	bh=LcnDMn6Y6fTV3cX4Ia/jh/AH9Q9CLh/X1gCMeH7Xg3I=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Yag2FGpoYHeB/z8fJo2WNlIUCYieyjAS+HYId9tLz74oNZytd+JcKC7WKm9+dagAU
	 M6u/SnaTOK7r2eEj/CVzLabxEuv3+0U6RGRQfw8RVicWPslbjYWSKg/BhZ+bfaSnQq
	 KxSgoX/AcOICC+lWF+i8gVuyghqHLJ72NipVrE1Pu6wO2yVgoVDvGaP7fxwU2f9Fnv
	 k1MBvJ1YaXZcdmOubWTEtrfwB6JwbuZpKpQkOwWneKUp6W35zcQc/s89CIRJ7eAp7D
	 RER8zg7C/ZfiQsZKstAyaUmAI3fKigVGQ7PMyJtWtUyPfLWLFZ6Q5qi+KorZBcL88+
	 +VR6uWrCk/OsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DD306074A;
	Fri, 23 Oct 2026 13:20:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 98A0B356
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EDBA81496
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHp9DTe6zGku for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:20:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9BC058148F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761634;
 b=saOuZfjMFq69BgSIyjGLKHGRoUNcIpCE3BOk5RYNgEr3ucTdPvR4ffBa+tAth+lxd9GP
 /pxB7FkXdbZk5Bx+RzEKBI1kLt4L114od6GLy0NAVTISW2vIDhBgtPDDJTz1OyLkfu26b
 Sf483Zfdub/Jr1l58xSbMjvnjQlsOGDJfGLhQp7ytMvSjae4rnfesT92PwXrIpqHyG8hC
 iJ4V6ANeU9Y8aNPqksFbayaMDkH0EoNWigNZ1v+Rsc3/Jau+zA/+6lDLcYV7Y/ZWCpuzX
 Cf2Qqdf/o1hYQaL+YEkAUOTGeD3XwK38OmXhJOfFwLvG1WvJgAv6/TNxS2mLjvaSwFQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761634;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=5lcDA+FKDYzCTjF4dTVXb+vCX39zXZmug0OIEuQ+pd0=;
 b=GwO+CcHGxIYgN55WMwePDgEYzyWV2hyR54NhuNW//pjIvcynSFBvVimXC45w7rD0Jrqf
 N5tr+iVkAMSvjpUUR2OhX5RqgNqKxcWHNL0uP0ef/uhMP3/F7Fbb9zBNNDZXYraVr2gc7
 pNtIUATuQBtAHN/H2ms6cZ2STQT95vWHozWMI9g5UOyrRjO166EE1dG7P9UFDh1mIty7T
 NLFTZt5uNsvs7plwyJdkyMm/XSvNXlZ7EAt+tiGd6gCOu9EGWw0dDg9SQGK4NtKmrPEcY
 GYZMKl0mr1BNpKCkezawWh9/maLfFassEVJ36wBjn0zkCN22XJmTuH32srBtcDixa0g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Sg2nf9Cw; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::334"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BC058148F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:20:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a1dede3c2cso10230405e9.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761631; x=1793366431;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5lcDA+FKDYzCTjF4dTVXb+vCX39zXZmug0OIEuQ+pd0=;
 b=q6+fRCfv6Xa61VFnLXV7t22sfhEinQja7vtkPvX6IaWxmozVwWF3dXEi/duRrKKnUZ
 6pBZ0Upd59vgOaS9N2AA7BHcNoA4NZoZ4XLTXc+yjql1P6Y7NX87whIHqcnrxqW/r5AC
 xvLLiG9yqMom8+sz9awjcv8SzhMECkjoy2nbhDdLMR52rBXPHjIk0yfWl11XwwSiWYDQ
 hr4UcrRmqgqMhRGlZ/zAa0GXCqrGiBTJV2fhojYK9W6zi9tHXkHlRun6lYqfD4fAVV9t
 xwTiRvtZrhU8DkUWbn57/VL1OBzt/OAIDFvGjuMz4aaKIPzHyMq87mDS+F/4yyAAvgh7
 crCQ==
X-Gm-Message-State: AFq9FYKcl9NdBIJLJOLg0g76LKm+cVspn2kdm0czPzH6X7v3fqzpHLiy
 tuqYm/TA9U2q0bW+aAyeJaoPGlCprZn/BODs8GI1oCu91U21W2+UblhFdgjfIegd6CCyR372FnG
 iB6Yn/0s=
X-Gm-Gg: AYBFou0qYG4oaK8fdmmUl+L7Co6lIjzhWdpnM5K5ded15oYc6mNmX2pCL64bYZo2nZe
 U7dcqIBkQTNwNeGRhacrPzA7lWpqGDD32SdiZrUhdyhVjY61aQc4RYy8o0X/QVD6oEoH6gGBuD7
 0q40Yw983u7aFMeKo6//HHhmYmezmu6I22f6vzfXYJ3f773cwg+5uLDgRq1BlueSKfAiYXhqP1I
 c44Q27X0Jg4huiY8xQhns0g0WvlyXoXDlIrvg8h8rc0+K3IwN/12vUDwu6LVIBCvZOFGwlt9Nif
 EhREEQErOQNZzi644XWMtPlIUEHNHSZCehzIEWCXFymMPCT7/A04stf2pMzrBwzBknclKhCv0a9
 rV2ZpcMs1mJkIOeKqq7ZRzjD3hQG9uyAu2jGnVyP31hEyfgCzxr+fxv6my5TDfueqjSBVG97pxo
 dwVjPwMZyQsMo6p19ZrnEpgaWnxzf77LejQMmTIHMGdP+kBqh76xItQme0M0Q+DoCK6aHDpwyV5
 XNSFv7FgFlw/C0PuhW80hdW9f+PPh7fQe/yDvXGfFpQBD9dSy7FJQJprQ==
X-Received: by 2002:a05:600c:3486:b0:4a1:722a:d2a3 with SMTP id
 5b1f17b1804b1-4a211eec13amr37684845e9.23.1792761630887; 
 Fri, 23 Oct 2026 06:20:30 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3805c596sm5320534f8f.49.2026.10.23.06.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:20:30 -0700 (PDT)
To: buildroot@buildroot.org,
	Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:20:27 +0200
Message-ID: <20261023132029.1606872-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261016152811.2817446-3-fiona.klute@gmx.de>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/4] package/uboot-tools: fix target FIT
 signature support
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
> Commit 928cc5dc5cb82e6f2cb43f853488309eb806ef89 ("package/uboot-tools:
> fix host FIT signature support") fixed building host-uboot-tools with
> FIT signature support after upstream changes to the config included
> since v2026.04, added to Buildroot with commit
> e049f6fef1fd1e1b0b6095e0ff9113312a7d7f81 ("package/uboot-tools: bump
> to version 2026.04"). This commit applies the same fixes to
> configuration for target uboot-tools.
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to 2026.08.x. Thanks

> ---
>  package/uboot-tools/uboot-tools.mk | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
> index b5924f6954..32fe9f1d7b 100644
> --- a/package/uboot-tools/uboot-tools.mk
> +++ b/package/uboot-tools/uboot-tools.mk
> @@ -33,7 +33,10 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
>  	mkdir -p $(@D)/include/generated
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
>  	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
> -	echo $(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),'#define CONFIG_FIT_SIGNATURE 1') >> $(@D)/include/generated/autoconf.h
> +	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
> +	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_RSASSA_PSS 1' >> $(@D)/include/generated/autoconf.h)
> +	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE 1' >> $(@D)/include/generated/autoconf.h)
> +	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_FIT_SIGNATURE_MAX_SIZE 0x10000000' >> $(@D)/include/generated/autoconf.h)
>  	mkdir -p $(@D)/include/asm
>  	touch $(@D)/include/asm/linkage.h
>  endef
> @@ -50,7 +53,7 @@ UBOOT_TOOLS_DEPENDENCIES += dtc
>  endif
>  
>  ifeq ($(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),y)
> -UBOOT_TOOLS_MAKE_OPTS += CONFIG_FIT_SIGNATURE=y CONFIG_FIT_SIGNATURE_MAX_SIZE=0x10000000
> +UBOOT_TOOLS_MAKE_OPTS += CONFIG_TOOLS_LIBCRYPTO=y CONFIG_FIT_SIGNATURE=y
>  UBOOT_TOOLS_DEPENDENCIES += openssl host-pkgconf
>  endif
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
