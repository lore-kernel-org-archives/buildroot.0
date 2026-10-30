Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF58606A31F
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hofd3UKC
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6D840BD0;
	Fri, 30 Oct 2026 15:27:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8kpi5yiGNKe; Fri, 30 Oct 2026 15:27:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D0DDA40C34
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374038;
	b=V50alOoXHQ7Wr/F4N2g5gzYttRvzvHGMXfhgsuk+8sgWO0kkrBOeH8lpdwedDaUlAoMM
	 kzI6/BVxty6YThkUjSZqA1zvzHoii90grnAkUDv9AIhxwt5zpAWm8C84R0pSAlBsjOQVz
	 y8SsDl5ENDPXu4jobmL566EL0dWnWVVd43mNFJ0l3XTTiEp8wjEMECOhIxKTEUVpnR7xc
	 tW9CwvcyLuKyYz3C318wbWFcN+9bykIXnudRf0eaG3YzqaQ23yf6+stS5UufSUajc4pKI
	 GHs03WlUOsVWsN3B+v/XW1JsQaQSxEpKNicthUliLCKHy12YI9qkaXXx2oOaPGOc4gQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374038;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Je8kmAUAeWxLo+pFkvLMXJVLEO+GH4muaAZTPBjcHCs=;
	b=LguvjY0iTDlS8h7HTxyytjBmUVQCX/TxL+BmGM8Lm7iTE3seblyC5cVUctCmjp9Kq1Zz
	 RwyocRpSD0HHSoan9BSrxeG/MaSPPmHvABV+iAgAz0zgqULXDN3DXHC/GsGpYilYFTNqM
	 WRIAQ/5xX+qu7U1HnQeIyBLHCOFzAZXjIHyupIT3v6el3vMQuH0tkL2kht3CloiFheFo8
	 k98RqU4emdZTM9gsIu5uTXY/9lvFfKcKnTKzSykZwtgtfFzROchEbCs+nTlOLU5LwA+D4
	 3PTvCKxyF3/nlFEpgAPEYyOJ5GaLLwgFoUjGej/M5Hce7wvJUxpLh4JbgmtEyebLg/w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374037;
	bh=Je8kmAUAeWxLo+pFkvLMXJVLEO+GH4muaAZTPBjcHCs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hofd3UKCtFUWvcSH5bvFcI6mA4Iqq6IAlVYIwBj7+tpzrxiswYWNAMuVAiJIp7WU9
	 +h/lNpE4GbrvBDWyTK0qY0TkwHsaVIg98WvxCzIWWIzVrAeOLevEQmRblLukGiRSlj
	 +J6zyDTBPjrxHgZMcizkraD7pl7SuXpaXou/gNngDQcVZKBLF9844G+TCghxQJBWPn
	 P6MsV8v3mGs/oCTXJ7An/f4abdADtfgp9qmJCaxaLN6WNq9F6xe6/KCF1puZwONyNT
	 NzpnnsoEw75JjhDe+XJI5y/BqjXn4pwIbHbZBW+uBZyzfoW/cmgup1ikjpaDXf40Hd
	 GHoiShb5nxgyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0DDA40C34;
	Fri, 30 Oct 2026 15:27:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 60333D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5199A814C9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ck3RSgpCFFI for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:26:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1933E81567
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374009;
 b=kxYePQDtJ1LNBiik8Zvs0JXiK5QBHJY7yfTfjIZ+YW/DvlrsisTs8QLN57HlcXcAMPDF
 3bVhPh9bSmnSpSfoDwlxFKyV2g4ABprzKOqnWF2vbQEXtGXo5cLDLDBHfwXchmZXNZktK
 +umK3x1G5yIuhxBpOyJkvyC3OJSrI+SvA9YBeT1k7B7RdJL0hebBlXqqbdjt6qccRkjxi
 aqKquklc087ZtA8aGSXT2mZW4Zibm9UVQBIWno85RFSM5OMJlhOrhHjqQitRmHEe40Wrn
 iq5u/VEQdY6Ji0x+mYqCJ7qAhJcFYjHMPTXSVTxJ/GfbX/VwDFlXhdNjdMqEjbVoP6g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374009;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=6JSpcQb4b8DeGNZMnn2tQh7Njx2Uf1svE8dhhvTJNDo=;
 b=gS2xopmAlQnRePFKjRWEZJPrJ/HaTNywHxLyiArjQCzEMLbzbtzwZdnCS1DXBU+G64i6
 9YMY4JFa1goVet3vIAt6LYiptEwodUylBClULkfSKWMHVPIW9CcgE4MzEg90ihwMUChlL
 1HSDYsYhEtj91nACLUh1dd3h5Pvrg3IsiqhdOmQ35j7esif8LwBiaF+cK547L84vb/+PA
 FjJwxaGl3Ng9uYyIQGnGrl9U0GIw2DpUwESJzNPNU+Q11ACk9vNEPzIEMcl/+xwV7XVli
 BnnoshXHLvLuVagOQFEHzuDpeO9DnuwpVoGicKMbxfpCuXRi10P2h/CuMpH9LijwMRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Mt4w3llT; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::331"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1933E81567
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:26:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso7511435e9.1
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374006; x=1793978806;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6JSpcQb4b8DeGNZMnn2tQh7Njx2Uf1svE8dhhvTJNDo=;
 b=as/BAbCXnGvlS2S395go16gMg3OMnmM/zJNnSXYhcPgSQglsthE6AqPAoztUTkoOw+
 3VziwVXfYBRJOgabbffr2A/M979uEppmj94GEXdgt/px/mTPUpC/yJPf45cOnN6VrQXq
 kYJDfrZ6dJQ2KbhFGeDjULbUUJFVprN0F67gMQrudOB59NeaYHViZ4sVlaJsywUrF9qp
 syIL2lxTZxRKpsjUW+e3EjQKVailJu7c7vLNOr58O/ZFsFA5K6B8sjBTFRNORrA3Vm3+
 B5cNmmKRBm8YaGvIMO1tjmdYnztmGMTaLvfT8RlCU+JFDRmOS78oQv8Mdqb7oYRMg60b
 QuKg==
X-Gm-Message-State: AFq9FYLmhjagORt02MGwczw7boMV9KUfj0btNVxX//q3EnBuhebHyoUP
 JesxHn7vlN+zNyJ+bVrIIBFTtjVKyCfXgVLf5bbfH5/TsmGASQ2qE+Bso51kVzN7Cw4y+P2CqVs
 J1lk7y8I=
X-Gm-Gg: AYBFou0DrTsBOfPc6rLBf4tAbI0nuN7jgIdQsySU56FOy9zIuA6gDvVDZTzayHnfTHj
 zD+vOoaj75Q5+zkbboMlF12EYw2p+KXObNOSoAJpgP35wQnIbHnkc8ihNEV74kop0t43VM87q97
 ETCoPKH8f4b7jYwYxF9kYKy2/pA+V/6bhCMlXoA6oqJtHg/Lde8D19eKgLMfyw3NiZoZB0FOF/a
 c9e4qTgYGQJ5FaLs/T8BuqRiUuNC5MVPfNUHaiTD1xKeXDbychKef0ZlLICwKmjTMdxh1tQqFXQ
 vRQLDDNWEK8Pm4lY5f8pHsYz1HGhavvfQkWA4ON7TbLihWstJNnZ8aNxMPnC1vEjn3e1LhJolYV
 4nfepADdlluEyG0OoxKJOX8oKe9H8xJEXsZQPatqN+7WR2PguzPSUpQ9vRCo3pjdjFOYZ1Ku3Cc
 uUT8BJ/EsAfn8iQMvav008penx8dEcMwr1lt+N52CEW7q7RrvIlfiKB6JgvBI/O8BNNOtdq70Gd
 UZQIOiDCd89tnes9g6nuy9VkhFBy3GJuPq/ySjZoHpqCiTj/aBauZGiYZrNXh5QJgTmIvOSu+A5
 czHyIL+0Xj0gRPB8eaHQLICHkDRfl927LWCNBJh/zKGWgNHSEzN5UncLZAoiuiaocrzCtP/N
X-Received: by 2002:a05:600c:a012:b0:4a3:59c9:a747 with SMTP id
 5b1f17b1804b1-4ac1793fb0fmr56576525e9.17.1793374006632; 
 Fri, 30 Oct 2026 08:26:46 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e71b78f95sm3446155f8f.28.2026.10.30.08.26.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:26:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:26:43 +0100
Message-ID: <20261030152645.1906363-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019135721.1648298-1-yegorslists@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/sysprof: fix build on 32-bit x86
 with AVX2
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
> The bundled CRoaring code enables its x64 specific code paths as soon
> as __AVX2__ (or __POPCNT__ and __SSE4_2__) is defined, which also
> happens on 32-bit x86 targets such as i686 with BR2_x86_haswell. This
> results in calls to 64-bit only intrinsics:
> 
>   roaring.h:260:18: error: implicit declaration of function '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'? [-Wimplicit-function-declaration]
> 
> Backport the upstream patch that defines DISABLE_X64 when building
> for 32-bit x86, so that the portable implementation is used instead.
> 
> This issue has been present since commit 0d57555407 ("package/sysprof:
> update to version 46.0"), which switched to the new sysprof code base
> bundling CRoaring in contrib/eggbitset. It therefore affects 2024.08
> and later.
> 
> Fixes:
> https://autobuild.buildroot.org/results/f00d523aa13923c9eb73ae4e1b1f04f297512351
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - mention the commit that introduced the issue (suggested by Thomas)
> 
>  ...disable-x64-code-paths-on-32-bit-x86.patch | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
> 
> diff --git a/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
> new file mode 100644
> index 0000000000..2b2c6cb6cb
> --- /dev/null
> +++ b/package/sysprof/0001-contrib-eggbitset-disable-x64-code-paths-on-32-bit-x86.patch
> @@ -0,0 +1,53 @@
> +From 22c10f0dbd3c357e96f83f430ebe05d24a25c536 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Sat, 17 Oct 2026 22:47:15 +0200
> +Subject: [PATCH] contrib/eggbitset: disable x64 code paths on 32-bit x86
> +
> +roaring.h enables USEAVX (and thus IS_X64) whenever __AVX2__ is defined,
> +and USESSE4 whenever __POPCNT__ and __SSE4_2__ are defined.  This also
> +happens on 32-bit x86 targets such as i686 built with -march=haswell,
> +where 64-bit only intrinsics like _mm_popcnt_u64() and
> +_mm256_extract_epi64() are not available, so the build fails with:
> +
> +  roaring.h:260:18: error: implicit declaration of function
> +    '_mm_popcnt_u64'; did you mean '_mm_popcnt_u32'?
> +    [-Wimplicit-function-declaration]
> +  roaring.h:1011:23: error: implicit declaration of function
> +    '_mm256_extract_epi64'; did you mean '_mm256_extract_epi8'?
> +    [-Wimplicit-function-declaration]
> +
> +Define DISABLE_X64 from the build system when building for 32-bit x86 so
> +that the portable implementation is used instead. This keeps the bundled
> +CRoaring sources unmodified, making future updates a plain copy.
> +DISABLE_X64 is only set for x86, as it also guards the NEON detection
> +used on ARM.
> +
> +Upstream: https://gitlab.gnome.org/GNOME/sysprof/-/commit/22c10f0dbd3c357e96f83f430ebe05d24a25c536
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + contrib/eggbitset/meson.build | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/contrib/eggbitset/meson.build b/contrib/eggbitset/meson.build
> +index 82cd8a40..f2f81685 100644
> +--- a/contrib/eggbitset/meson.build
> ++++ b/contrib/eggbitset/meson.build
> +@@ -6,9 +6,18 @@ libeggbitset_deps = [
> +   gio_dep,
> + ]
> + 
> ++libeggbitset_c_args = []
> ++
> ++# roaring.h enables its x64 code paths based on __AVX2__/__SSE4_2__ alone,
> ++# but they rely on intrinsics only available on 64-bit x86.
> ++if host_machine.cpu_family() == 'x86'
> ++  libeggbitset_c_args += ['-DDISABLE_X64']
> ++endif
> ++
> + libeggbitset_static = static_library('eggbitset', libeggbitset_sources,
> +   gnu_symbol_visibility: 'hidden',
> +            dependencies: libeggbitset_deps,
> ++                 c_args: libeggbitset_c_args,
> + )
> + 
> + libeggbitset_static_dep = declare_dependency(
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
