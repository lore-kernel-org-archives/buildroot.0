Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E40606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lUEJBQKl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3345340BC0;
	Fri, 30 Oct 2026 15:26:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ymq3pkB-5O2t; Fri, 30 Oct 2026 15:26:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 400BC40BD0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374003;
	b=GWLj25ITTW/Ffjp5hUGMEfx4jjYG+oTk7Oo2jifJYuP5klXGtPzEIYmHe0htreSK1YmG
	 hBsEPa/VN7dFq2USF0lBuUtYnzIWgJIe7zgHho4O5aN9zo7tIyYI9Oekv1gCmeMmxkTjS
	 L2a1rowPZn9fSlViqcHpwJCmNsOzKjmGUePcIFl9SdjF4R1cp6zvb2igFksejcstrYnlW
	 UXB7QluhH+oeGV5izbhuGXuEDT5skqdwDVxpJY9BvoPiuLvx4BQyTxHNeklajSFSRnooS
	 kHuCVh5X03Daw91Byv4uusP8UXZmECvW6cWZaifWibMZL0LbTg+glQybuP4cHNLe+vQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374003;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FkOAhlPnaeb4ao3UR73dAUC/aIEeTtgqWPM9oXgAsiw=;
	b=TnQ3FV5x1uTMz28WYz9U91YzzqFi1cr55Fkft9t/nrBsUOa+YoIMwouniHbuuzVleGtQ
	 lapozn0BEFMwp8cymPpAQ6E5PgTHr3Ae+O9Xq4e9dLOxAjaDJdVW2EYrm/Euxs24EUoBh
	 nUeHdoje+QHUna27cbW3pMD+IV61APcjhnZ9lD7P2UQvm0NoO1D1tPCkbUww+SQvjybQf
	 9R1hg8JfRODz8k5yuu910WavqdlxqnlPfkGqylqCuFU1fh5UbnCisI77MNhBsSW9Fh6HD
	 ZoCyDAQSbFZT7YYbOyTuKJKpU3HxxGtm57EPVE9LHqWAiedq4zFr5+oD8rExjGWDUlw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374003;
	bh=FkOAhlPnaeb4ao3UR73dAUC/aIEeTtgqWPM9oXgAsiw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lUEJBQKlE+/WrdPccsrDXK6ej958fdy0abRijOL1RbgDvecNsTET7vfR62X0/5UBJ
	 syWIUTF0lKzs3ILqxotTzG+vyG50dlVNQhsMwPiZ2UiZMTW+AvKNJXfA/NWrbyYAr5
	 m+A0gEhWJinOrBDG/7cmMZMr+N8p60gR+BMUvf6RwvhjEnpNWI8bTW6zgKU3LHEjYW
	 8msxLStG2aVxaNoftXvgYRJJa8oFjp+bvBQiQe3qroq2IhaP/Y/6V6UabpC5p02Zc7
	 2BJZqeA3OoVld9/VjYMwlUe35cLHPUSIWJ9x/Z0x/c/UjK8GX2mjPdPBvFYMSJAi6O
	 4mYmTnU7TpQKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 400BC40BD0;
	Fri, 30 Oct 2026 15:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 647A0D43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 568804053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UBfsEylhBwVP for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1A89D40211
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793373989;
 b=Ci2CItzhRY35AKNd+qASpRSlCMhYiRjoJ1O2MbkAWyyEhIk6xeLmHfmi/NM3KdxQ8rbU
 WOdsmXflFqx1fZAwRxdVwzStHEE8HHL2c/9PPP5QCfuBPK5pT9YNr8RvL9Zn1QIF9v/y0
 3PLRi/INuvalHKCENk95rYVjrQtt9AW7Ey/7wBlQsMi/MY9iSut35Xf+yGcfj/Js+bXF7
 FJk1/roANwx3DwyiYo2d/I9PDh5wwT4s756RcjBkeBt7ZGgRrSZ/tvSwmqRoIHX0AhBZT
 IepXH+9aTieWmng/qu5qTtD7CAwUXRxKVvpQ2eM5/A9oFi6WMl6Cwr+lgHekmSq+ctQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793373989;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nDOM2yLpR6ZnMkrsU9XpisfHVS0emiUkLrujV1w0fC4=;
 b=Sg3oB8AZcPf8OPjGv8P8QnHWkey53XD4m//Hj+oKghqFg0TdcwMCAvVnbfpfb4/m7zGf
 nc/tW5x/1JwGCo0ONBERG4rbpsNbP+NV7OJniM/lU+NsoJ4WCzV16OlS0CIg1gs0wVswM
 rCyuQVxz+JKBy8wVFvhZ9CWIYASrVtT80+e/q5g1CDh/ni1F01IK8UTTT/ubC7/xsZDdG
 U2e/+2lgkrdLKuOx3KD+fdfUZzBgx/zxk1vupXUrLx1D0quV3mjRcJ70/hQyY3GG1Uy3E
 UPKLu2Mh99MJHDJ8BYFJHRDD8BHg0Jlk/ALPS9m4oWj79SZr4dDDQz9HYsyNMcH6IYg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=SJJatcZ6; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A89D40211
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-48bbb06e746so423853f8f.3
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793373987; x=1793978787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nDOM2yLpR6ZnMkrsU9XpisfHVS0emiUkLrujV1w0fC4=;
 b=h9hvYzy9pdGPeNHFh91rFNv+TzPljxvUsDz+EbzcdcwioksP6tlE/5JsTse47/uily
 3iFs9BJL4QpAQ+MZ3D6fYHNqx86kS+wUJfl8jX6JvBE6wFg2i1/iYmOXQZVDpGpeIHEd
 FPPf2K19R6vTmg5bgZ9dI0CgvLjckgr4ElXMkzW/v8SYbehGlGIIZnSXpnQeqQ9tsg9l
 uj6FC46OD4/PqMn89DTD75MPuZGXwV4gGTQFaiCVAjqwe2eOofnIOUrlg3M3aXYDeDnu
 hD237kIV6F6QX6qfoYdHFu339kVRZ9+GArxdeudIE9b9FsMIo6j3QiutkibtOHQRmEO3
 pkvA==
X-Gm-Message-State: AFq9FYLMiyZYNcAUkEu+YUWwMJDynDtaHQIGF2oQZupeYVL4lWx3BxZl
 yJUEvvGtW+0oxyDEdBe+FRu22GWr1jXnERcMqICRY2c6Gks1YygZDo0/RIxgMI3umIEX5fJNxon
 qYcziFTc=
X-Gm-Gg: AYBFou3i0/y/dK0FU+TtAkY1seDNwmuUrc611+0RVJxw1sxUeekvjE4gNJcGseZj4wd
 SNsjM2+7HA5qb//bTYNWHX0KkOtQFUliwsPkRtyYRafFyMRgPBC8RICVRTEN/VuAhjEnb2Hnxbm
 JBHQOAdS5OwuWuFvWnotUZ3ffVn/xoDUsPTWbAlYaNMZZYujxP8qvWkPzHBk83Ug/G0aIlwYRKi
 coPHdSCWzwp7Xmhxjn17mga4GZkZA2NgOB62J1pp6EgxPZt1MLcLt7/IV6f0ro28rUWQcydmp8v
 WFuQS1WKjkLEwIEZCyMW852IEr8kbpW/OMkPVep0/PCDBP1hhTJF1J7l+poYK782tgrvV2D/CPT
 4SsH3/4EYappVbW0tVFlrTL7xpJIB7HJp//IPPYDPDzqQlcr0/zHmvmwD5IUQmwW8Gh0/TechLM
 V9q/QRuX5TTanMCHoyfd9K2aJuCTphpe/ofMvmM3hkxwOQimhr1kbVRpp2P1r+xWc9aUqbsw5Wt
 dVgvJEub8lAlhuZbwisT9rAG5rOHxymTczHA8iLEYe3x+mwFLVzpkmNzOTzeLJc4nwdbRiIFvFZ
 4BuPmU1uR5ChMXGXmtIezqSu0QTJ+ydDZDkDanWAm5E8N/fFaWJXBbd8oqL6dNtWl5CUAI97
X-Received: by 2002:a05:6000:178c:b0:487:b50:101c with SMTP id
 ffacd0b85a97d-48e6e2bc04cmr6931783f8f.5.1793373986933; 
 Fri, 30 Oct 2026 08:26:26 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b723b4sm4051728f8f.17.2026.10.30.08.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:26 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:23 +0100
Message-ID: <20261030152626.1906184-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261014214158.535942-2-thomas.petazzoni@bootlin.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/podman: propagate missing
 dependency inherited from shadow
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
> BR2_PACKAGE_PODMAN selects BR2_PACKAGE_SHADOW, but forgot to propagate
> its !BR2_STATIC_LIBS dependency. This commit fixes this inconsistency.
> 
> We also propagate it to the only reverse dependency of podman, which
> is mender-update-modules.
> 
> Fixes: ebbaac08e3f462bf023c12077f739ed1c0543eb2 ("package/podman: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2026.08.x. Thanks

> ---
>  package/mender-update-modules/Config.in | 6 ++++--
>  package/podman/Config.in                | 6 ++++--
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/package/mender-update-modules/Config.in b/package/mender-update-modules/Config.in
> index cf2929dc69..4c60aece14 100644
> --- a/package/mender-update-modules/Config.in
> +++ b/package/mender-update-modules/Config.in
> @@ -136,6 +136,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # podman
>  	depends on BR2_TOOLCHAIN_HAS_THREADS  # podman
>  	depends on BR2_USE_WCHAR  # podman
> +	depends on !BR2_STATIC_LIBS # podman
>  	select BR2_PACKAGE_JQ # runtime
>  	select BR2_PACKAGE_PODMAN
>  	help
> @@ -151,7 +152,7 @@ config BR2_PACKAGE_MENDER_UPDATE_MODULES_PODMAN
>  
>  	  https://github.com/mendersoftware/mender-update-modules/tree/master/podman
>  
> -comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
> +comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
> @@ -160,7 +161,8 @@ comment "podman support needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_USE_WCHAR
> +		|| !BR2_USE_WCHAR \
> +		|| BR2_STATIC_LIBS
>  
>  config BR2_PACKAGE_MENDER_UPDATE_MODULES_REBOOT
>  	bool "reboot"
> diff --git a/package/podman/Config.in b/package/podman/Config.in
> index a8c625c5b1..2f20f77507 100644
> --- a/package/podman/Config.in
> +++ b/package/podman/Config.in
> @@ -9,6 +9,7 @@ config BR2_PACKAGE_PODMAN
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14  # shadow
>  	depends on BR2_TOOLCHAIN_HAS_THREADS  # conmon
>  	depends on BR2_USE_WCHAR  # conmon
> +	depends on !BR2_STATIC_LIBS # shadow
>  	select BR2_PACKAGE_HOST_GO
>  	select BR2_PACKAGE_CA_CERTIFICATES  # runtime
>  	select BR2_PACKAGE_CGROUPFS_V2_MOUNT if !BR2_PACKAGE_CGROUPFS_MOUNT && !BR2_INIT_SYSTEMD  # runtime
> @@ -89,7 +90,7 @@ endchoice
>  
>  endif
>  
> -comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
> +comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar, dynamic library"
>  	depends on BR2_USE_MMU
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS || BR2_PACKAGE_CRUN
> @@ -98,4 +99,5 @@ comment "podman needs a toolchain w/ headers >= 4.14, threads, wchar"
>  	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14 \
>  		|| !BR2_TOOLCHAIN_HAS_THREADS \
> -		|| !BR2_USE_WCHAR
> +		|| !BR2_USE_WCHAR \
> +		|| BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
