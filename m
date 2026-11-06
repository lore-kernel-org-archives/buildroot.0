Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3409F606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BdJ6rP4C
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12D8960AA2;
	Fri,  6 Nov 2026 16:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPtv1sYIIL0f; Fri,  6 Nov 2026 16:10:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4627660A85
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981416;
	b=FCpHBhSvw4m1+HYBVaT6mrImESHl7QiyThxlYV1F3LZeavFBSwKWQ5P264eNLg4539eo
	 Xw0DycAgrVSvyviPlf0fscrwt1HTu2/ob1ZaNxKB5TG+gUGiVUB0tb5OqHHlcsPL3cHuo
	 CF7ZnIoyYbl+EOFOFiBsY7kLMbFPOJbzYe3UIU+udV4jcNNQCGK1xWqqMLxOt3kLF216F
	 Mz3WYFqJwveA7idXAjVAC+7a7+/J+j7wq8BUC2CJvNzeZte6xhCFx4qaXdxt5WWrwi2Ps
	 LpiHofM/fILMvqJLBt0llbqofZnwJ6wApdiwfcKCFXGSDKZPi6T5Fws8izDaGFzlkog==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=sWZkoa6fjHOySMy90QOQboKHotLX5nbQbcNVx65P2lU=;
	b=sPDRRENTWiXa63uqvMeGLcQMObOc2QX50vImlAZ+OsBUfaYkeBJigjF9R0byMK6JSjw8
	 t7ax6cavzUY8hevo2zhC9Ac7T0ZDat24APKwhXOAoZXueO8PgpG4Tg+NYNJQfLX5LLxxt
	 N17e+N5xQwZM/VXu61tOyOC5S8c7DJVRnO/bC+OFDx7IidYI6kPhu+Z9AZe24WwpgN+QF
	 vwZMr7XE0QTcXSb7ATRNQsEN9xlHnZ2HPB15nHWPiBjIiProC+2bI3Jwa8brha9EMEEZd
	 xs7qjz0CkgFaVq/ASPLg+vEcU3tBM58Zjgnn6B2GjcEs9iPskuRo/7rx0/AakFvuH5w==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981416;
	bh=sWZkoa6fjHOySMy90QOQboKHotLX5nbQbcNVx65P2lU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BdJ6rP4CZMQE3aBArP23Y6otbQLm9q9tD0fpT9pAr/5+crpramntCKBaUYGJll6fM
	 y5H8KAZtPcRc/VNZKWORBi/3/wz9V9sYmrZWzp+E8ylbFWttwQZ8DzXxJPGAwtuGcK
	 rxOG15tR+12/W1fEkRNPtvD6sgURAe95XYCcgRAFPO6BZIEnNjCmwHhHKoA3nLlXDk
	 23rWtYlPckockOaQD9AK4hg3t1fmGOC0McSzXjZxdFJ5rPboxXzSiiQwiD3xVlyHqr
	 APh7Yi3GLCWQPfKdka7SrL+FwCPEULWF6JtRMUFw/XLvcs4zKM4UsBpiDbTxV7SKTw
	 /253MTQoXwg2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4627660A85;
	Fri,  6 Nov 2026 16:10:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EDFB42E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E840F60A85
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5sq7JfwvZUVW for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:10:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D12EB60A74
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D12EB60A74
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:10:12 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso7320285e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:10:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981409; x=1794586209;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=/49I91zMgkvgs04tVmOJDR5e30MwJdf8mc77ZNvdSqk=;
 b=fj+0xoshne9kPOavKIGjbitna/2kt1KGBQFRvjzBCDG1mnUOWsoLNeF5WLF2MkWic9
 ggcE945hEOY7haIfkrClzZhQnHJH6qDnYoxK0DnfJ7uxQx/B0xsr/5Jr3inlID1OHTbz
 mEN9c1H4Ao9h5Jq2kYnUqrCGl1ZojCZa+av5q2WTk7EqPlTPZ4CrzuCV7dnW7J5i1Wxw
 XTphyu6EfDRnbVNMnGhSYYTDW0CjVhmF+VL0jrGiGUUJ5V+8Su9Kdk8yi/Z/QzZH4woh
 Ch9oUxNgicHXAJ/OfTarGwTYODub/CXpJmlG6Zo6osgBR+MQ9mK9kfUf0mSTAdd5lfb3
 QBJg==
X-Gm-Message-State: APuU4Z9zdup57BUcIWcBmuS0ovm7C1fXvRegKKyA56Ds47L/IDevKGTj
 cqka8EGLbHFOIESsvo73GdDz95KA621TuYHgCBpQNPlMoVufqZE+i0lidva6xQueY+BQA6LqSPP
 LOnO4KkY=
X-Gm-Gg: AYBFou3mY3D4u0+m8LNkOTfvxMF28Ofn4m9pqnxGJoSdcdd4TcEWRBVXCGZkHhfIc2+
 nP7bWOAH7kf0bwrh6DEjOV+0+zpv3UuWnjCctDrYOQ+Jg3CzeyjW1muhIYEh97nlhZWkkH8fChR
 HhJVgGSikmVH5z5Qt1GHK3rxV7oTl1u9umlThC+PtQ9uzJfY0FcHNqAs6UWsJRYmmszWMx9NbJD
 HJSum3xt22VBQujmBUxTD0c1yuClEe9St0wT0ADpwZ94+d9oefl42W0zgXMJF8vqPAekceizuMp
 yxq1jjX6rhQXniwxwd4js2utZOuv40EFpVUUWiGGgrXow6SF4F4xZvsAjbGhtxyZxjaTxIBxPp0
 SB93Qjo4sKZe6AuJeJ5JIL/Y7vcAeWQdplmCSr2W8YDLalcO1sx+Joco9d2z9qKFvzrGjDtL29x
 ds56nlBOUF6k/ZcFr89ypsORM5VmeWGYs79nx9qo+NA6+podfto0tB9LrR5lAsKx5ciQQWL7p6Q
 IDHw1J7eHG0ztybDcfdcg/svppwqoM9JA+T6r90foclZIMZ81+SzlRr2x3B85gUDRcTgCGAhxxO
 96XH4LK9rK3KSPdygi1Y77lUC/KoUmkCDrW9Kkut6L358Xup4Tgn
X-Received: by 2002:a05:600c:a308:b0:4b7:6b0a:a2f6 with SMTP id
 5b1f17b1804b1-4b76b0aa492mr18400865e9.21.1793981408936; 
 Fri, 06 Nov 2026 08:10:08 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d809df21sm4396225f8f.54.2026.11.06.08.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:10:08 -0800 (PST)
To: buildroot@buildroot.org,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:10:05 +0100
Message-ID: <20261106161007.607486-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261027160326.1690238-1-dario.binacchi@amarulasolutions.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/drogon: needs a toolchain with
 wchar support
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> The trantor library bundled in drogon uses std::codecvt_utf8<wchar_t>
> to convert strings between UTF-8 and std::wstring. Toolchains without
> wide character support, such as uClibc without WCHAR, have a libstdc++
> that lacks it, so any executable linked against trantor fails to link,
> starting with the drogon examples.
> 
> ld: ../trantor/libtrantor.so.1.5.29: undefined reference to `std::codecvt_utf8<wchar_t, 1114111ul, (std::codecvt_mode)0>::codecvt_utf8(unsigned int)'
> 
> These conversions are part of the public API of trantor and drogon, so
> they cannot be disabled. Add a dependency on BR2_USE_WCHAR, together
> with the matching comment.
> 
> This issue has been present since the package was added, so it also
> affects the 2026.08.x branch.
> 
> Fixes:
> https://autobuild.buildroot.org/results/6b893fea68e25fd928daabff5cf034de76062ac1
> 
> Fixes: d38b4915e9437c5492836914c0a0fff12b4f1031 ("package/drogon: new package")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2026.08.x. Thanks

> ---
>  package/drogon/Config.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/drogon/Config.in b/package/drogon/Config.in
> index ce8a8313bded..c5e20c2017f6 100644
> --- a/package/drogon/Config.in
> +++ b/package/drogon/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_DROGON
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11 # C++17/20
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> +	depends on BR2_USE_WCHAR # std::codecvt_utf8<wchar_t>
>  	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> @@ -45,8 +46,8 @@ config BR2_PACKAGE_DROGON_YAML_CONFIG
>  
>  endif
>  
> -comment "drogon needs a toolchain w/ C++, threads, gcc >= 11"
> +comment "drogon needs a toolchain w/ C++, threads, wchar, gcc >= 11"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_INSTALL_LIBSTDCPP || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
> -		!BR2_TOOLCHAIN_HAS_THREADS
> +		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
