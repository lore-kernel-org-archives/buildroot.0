Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A00D606A326
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Jvjv/lQo
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24B2840E00;
	Fri, 30 Oct 2026 15:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMdP3Mrnd_Hu; Fri, 30 Oct 2026 15:30:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 44B9840EAE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374201;
	b=RpcAHY8ayooYD+ovs3yxPmDwG2xx6ay59sQoncsOi+lWNFuR/9utthOqeTSvgJ2PZ5Dv
	 KDlAaPek03uiPSHQ6Ww7RqeYmLpXGaDy2D81tGZcMKNKlJ0jnD3y4GB8CE1UJwMYUs80I
	 WOkw+4e/V0PAbJt+H+mOaKvRojFrkmfxM+bK6S4iO17Qm94eLtGyUuVC2cPsbRl+7tI4F
	 6WhMaBoaIk8B9Zbj5DZmbyYEaYqu+OldJqmIq4CecMZLHpwkIe+sLtJyqL4VxmlSIetRS
	 D1U8ExI85Nd6E+F06inH/ZmUqn4bELBKaUdO4lK5znziVNLizvyXnM7eD6pVt8lY3rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374201;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aNf4SaU/M+69lYMZauFEhXFQnQ5kFL5QYl3b8Au5lKk=;
	b=bQD4Vyj8LD7TbQa7JiDDkDPkqkNSunmJ2rGAhi52TfJwwS5Ng+iUqIl9RKPWmREHMDuo
	 vLXB/DmjqB4rFFIoA8deBOwIUW92oR+/a0JyS7zu/jNsXPT/eMEU/uQmsxN0kq3sFueZF
	 Y2AutCUnsFmFSZh6ysnjfS0wWqfbEJxI0315sDtDu9uCmsn7hLT8iiknbSMradxLb9+PI
	 KS+UEmUExvH3NScOLDqAAUywuwhlPRMAHFB4MIcXACw1jB51whXnC006nZfFGLpm7u4yb
	 n4DZBxUkrcT1EBw3TC3+xKhnkIYnw7fSwXCcIIe3FMOSgsyGTNc1COClo1DnUqqV4jg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374201;
	bh=aNf4SaU/M+69lYMZauFEhXFQnQ5kFL5QYl3b8Au5lKk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jvjv/lQoCVKnLW6FJcoTPDsm/Pp1UmxPQTAoQ41Tj5E9ifoyNwkN0bWI6cg4kiI9s
	 JGnt+muLnyVZz4DLHxwUF+iYDlLSnNwG6VA7iaEzN1hDIDJ3+PLVIb2Wu69RJIJHAD
	 QiT+kmbNEPGpS0pf0c+/4dx2IGY7CghACHDWTyO91Rgyw6AJZHjMwJ2fv46qKKGxk+
	 PQJ4bSstD5og1pDXmoEpJxzyC7wMur5KPHqSpH0uOPSqOsX0ifWI1CTfQETMTEy33B
	 IgzVbU5+4ntET87/q5/vdeBEwtyULtWlpqmSMQHn1nunDZExPXLIXjd2j4sFa5OMQ8
	 ADX98NHxbbukw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44B9840EAE;
	Fri, 30 Oct 2026 15:30:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E608235
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 200BB81A30
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NsjNNNOoACUf for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:29:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E67FB81A92
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374176;
 b=D6az9rqAUWrCNWhskzvUMmAfqLazltNPt2DTBKFVzcnqppgthIQSlt3p8gOv0TUxFYC2
 wiFtg/uXp9GH6mVysaGm/IFQzZrPISnHWXRKNRkK4pMRyysrkD65Hvo+4qfGPWgne3RTq
 pyXdENUbaUW8IMo8GELnw11vJTw4CefWnORJdnRwXIji3bLigBsLUX49NFOxgkM8YdIRG
 HmiT9jBIO9vdYhY6nbz3NkzIpva15+lDv7GnMLXYvSPiP5lxZpJztw8iXtUNWm0tPwuAG
 6QgeGUtIVARYJud9+vbZesldQAnqQl9LPa3hTBbQ6drevvsyX9fQLx67IUzCv3+0U/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374176;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=1BB+I5fph0Me2ezfycf5wXho1NGdMOB52ReKu9SDk3Q=;
 b=TdShVBpiJDv1+uCwxcja8uK5sxZ6ZaoVcrEmU2eDBKRLeFgfl2TMLk1t1Htk40ABXhsu
 KKTbc/Bi+DP6Do4yXh8AskHw2poUj3UEAK5Qzoi8PFWJ3E5HdVSp/p5otCok6xTzhnkhO
 XJ9tuEfpBK/S4CDEp06WPbCter4N4SJdc5XHRKzvKOSFdj6a1IF2SqY0jp7Dmr5e4ZxDp
 YUGxSzuheVqG7npMFrB+Ch+jm1+z+d/KGZWNz5LwuGdYJSckzfZsP0XF9waWpjTZhteVm
 Ij6Ar0cjzVocXEK2TMXUnQo6KYqFpCVYNVvftJdFgxnJC0MHBleUNhhEzVP45TGzJWA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dom80fUY; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E67FB81A92
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:29:35 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48c45111bebso387271f8f.0
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:29:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374174; x=1793978974;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=1BB+I5fph0Me2ezfycf5wXho1NGdMOB52ReKu9SDk3Q=;
 b=aiFuo8S3l4Q1xiThdb/SgaskGmTHy7twtptM1L1BTm3Z7x6eOwTY697ItzZEjthnwV
 F4yFdlFeaRrPzYmuUEGGc1FDI84Zogj1Ae6GdYAIPLNtuM/XLWgHgBjPd3ViSBh3wy/e
 GWyzY9n2L1c3hNQTnXmcI+zNmvoANE6I6fQFESDL9XWO8hwCuH2d77P2NQn+XauzB4Kc
 oElSkruMjGg3OFexhMNE40Ww61qgz2cfTo2xSbcoLiJiFvTqnecucy4eEy2zCvPxSNGf
 jYQeFDipLFjXgp/94lSwJsGsa1wWRBiFyHyPQQP5yhtqiVd0q7z9R1npIDQKlTV1C7Sx
 uDBQ==
X-Gm-Message-State: AFq9FYLvGBGmzmuxCkPcJbU8bHClVIaGuc5vJOujcnIbuNtHygDnhaIA
 TNIDv2JGCjaewpQ3D7tWmevoITCZlCZ9PHNCfy9rzYlToeIBQVLtDKmkLwD+gFWCiY9MoHk/+8z
 F0xm4Mpc=
X-Gm-Gg: AYBFou3PuW0UiVb6xySy70ghYtqGW5xXk9TfiQAvqHt/fQHxXAsLGc1X0qE2AtTp6sr
 aOByzlJrx+FP8B8btzpHaHqwvS+LB6JhkcR60iTQ7YlsPacGhe1e63eeqdZTOQ3hMCt5WLFc3db
 uJ61STaYxHKBPx3HObfrBUNbGOQ2wfwGDZZpXHjdKFmWtvKNsjdGiMHW+RPhGcjji1l0u9ABMKp
 zqsVZ012LjhzWwziwtPeBI8kD7xM4XXxB5o6J04uDDTTdZDQ090cSr62K1uxDC5J831Y1MU0AVC
 nyX58WIDb0XcKM5Fsvvi66d88LPqvHUGO4U0F32RMdYPjkQ4zauY+1vrWyj3zR5pERWC7XrCKJl
 qDNauN4Ir0sdVjKAG+vLiWCutKLRWfwwqfHEyVgLz54g6j/IMYIjBs2OebykmoPr7nVG5sNrA+4
 bOOfKCM23CQ3A/6MPCdew0fKnMM8DE/nmvTDRv15pGSalunamFsGye4jGCHIUMPR0B8aGLppj/o
 jA8Hw9Ay63HJXecUuhC/EsU3qZ4cX6VCdcV0TRBDpoFd0Mrh4DxVUvUl2VyskhLNU9dKXu0J5AL
 ZwUXle4ylajo5gPSm+HMRFXAgfagW7pObFfMJrEHqktYUAZnuwjdrtaVJl341z5D55M+qBfx6w=
 =
X-Received: by 2002:a05:6000:144f:b0:487:1575:ebef with SMTP id
 ffacd0b85a97d-48e6e513f5bmr6577823f8f.47.1793374173706; 
 Fri, 30 Oct 2026 08:29:33 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71a4d3cesm4096173f8f.7.2026.10.30.08.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:29:33 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:29:31 +0100
Message-ID: <20261030152932.1907976-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024082424.3219244-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/uclibc: declare wcsdup() for
 POSIX.1-2008
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
> hidapi fails to build with uClibc-ng and GCC >= 14:
> 
>   hid.c: In function 'utf8_to_wchar_t':
>   hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
>     116 |                         return wcsdup(L"");
>   hid.c:116:32: error: returning 'int' from a function with return type 'wchar_t *' {aka 'long int *'} makes pointer from integer without a cast [-Wint-conversion]
> 
> wcsdup() is part of POSIX.1-2008 and glibc declares it under
> __USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU. hidapi's
> Linux hidraw backend doesn't define _GNU_SOURCE, so wcsdup() is
> implicitly declared, which GCC 14 turned into an error. With older
> compilers, the returned pointer was silently truncated to int on 64-bit
> targets.
> 
> Backport the upstream commit moving the wcsdup() declaration under
> __USE_XOPEN2K8, which is enabled by default (_DEFAULT_SOURCE) and by
> _GNU_SOURCE. This fixes the issue for any package relying on the POSIX
> declaration, not only hidapi.
> 
> This issue has been present since commit 5eb0203cb05c ("package/gcc: add
> version 14.x"), as GCC 14 made implicit function declarations an error
> while uClibc-ng has always hidden wcsdup() behind _GNU_SOURCE. It
> therefore affects 2024.05 and later, including all maintained branches
> (2025.02.x, 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x).
> 
> Fixes:
> https://autobuild.buildroot.org/results/eba842f15d96e483e0d16b12028da2ce10dcdeb0
> 
> Fixes: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27 ("package/gcc: add version 14.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...ar.h-declare-wcsdup-for-POSIX.1-2008.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
> 
> diff --git a/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
> new file mode 100644
> index 0000000000..76c3039a4f
> --- /dev/null
> +++ b/package/uclibc/0007-wchar.h-declare-wcsdup-for-POSIX.1-2008.patch
> @@ -0,0 +1,41 @@
> +From 936a08b682e761afba98ef3800265add951201fc Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Thu, 22 Oct 2026 13:55:32 +0200
> +Subject: [PATCH] wchar.h: declare wcsdup() for POSIX.1-2008
> +
> +wcsdup() is part of POSIX.1-2008, and glibc declares it under
> +__USE_XOPEN2K8, but uClibc-ng only declares it under __USE_GNU.
> +
> +As a consequence, code that doesn't define _GNU_SOURCE (for example
> +hidapi's Linux hidraw backend) gets an implicit declaration of wcsdup().
> +With GCC >= 14 this is an error:
> +
> +  hid.c:116:32: error: implicit declaration of function 'wcsdup'; did you mean 'wcscmp'? [-Wimplicit-function-declaration]
> +
> +and with older compilers the returned pointer is silently truncated to
> +int on 64-bit targets.
> +
> +Move the declaration under __USE_XOPEN2K8, which is also enabled by
> +default (_DEFAULT_SOURCE) and by _GNU_SOURCE.
> +
> +Assisted-by: Claude:claude-opus-5-5
> +Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/936a08b682e761afba98ef3800265add951201fc
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + include/wchar.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/include/wchar.h b/include/wchar.h
> +index 2e6ff77c0..0056f93da 100644
> +--- a/include/wchar.h
> ++++ b/include/wchar.h
> +@@ -210,7 +210,9 @@ extern size_t wcsxfrm_l (wchar_t *__s1, const wchar_t *__s2,
> + libc_hidden_proto(wcsxfrm_l)
> + 
> + #endif /* __UCLIBC_HAS_XLOCALE__ */
> ++#endif
> + 
> ++#ifdef __USE_XOPEN2K8
> + /* Duplicate S, returning an identical malloc'd string.  */
> + extern wchar_t *wcsdup (const wchar_t *__s) __THROW __attribute_malloc__;
> + #endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
