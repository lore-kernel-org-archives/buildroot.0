Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131FE606A320
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 09:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=grtmMSFm
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DDA80E6F;
	Fri, 20 Nov 2026 09:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0ejmMZOj0EL; Fri, 20 Nov 2026 09:59:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E7EA5812F1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795168767;
	b=V/kPEXIeVA0HxmNjsAPMYNJlXxRRUU7OUp5Idyu0Cd9Np7dm6J7IN+UDxZ5K+UY2N+Yf
	 JNvQZsi2QnBB9DmGNTm5LqHUEqMZkIGMzp7WiAhbQEqX0DV8grXvenQXAcX6n3HIrNni0
	 zcALTJMHhmQBn9jeYEDoGDZOlOjTYyhEN+bWhS2L5QKCHGp34ovqJV2vzZqJarFDc7Ytw
	 JSP50R2kHjr8gCW9F2SbSQ2N7UexczMBcZrxrfyEvE9//LxXmRXAQmpc0mjCqtpEFjtvU
	 dWoCK8/W54EoNKz5Faet/yp9nG+8bcbHcY4AbuHwd2kyyC+8d6BD75qN3TIl/8V796A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795168767;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PSfdN+37PsBpIB7863Qn6sk91ZfLPb26efcpGL2mUIE=;
	b=YnOl8S/+RFCQVZGY0AVjeFAsKwo9Ir1snu+/pyjRhFEGR8XVdkyVpMQy98YgXUnWPWnS
	 Y5v1PMvKZ3nvPt+KdoSzHrWh+LZsIxFGR3pz5nSP/639ZfC/BLDtu1rT2JIwXuG0SJTHk
	 XcWgJdNhcpxpKZnKWtxV8xReKGYY1g3hSVe3Rha/j1X2aPqSc3bN6Nkn+qTPAZ16vuY+O
	 Jj24lpMVXDhPS1ezMT122fE73BdY7LN08jmETDyLMqyN3TbmX2R10V//hSXJTCVITi1UN
	 PnziaDpJTmCw8D4L67I8Fm4Hc0mVBpw62cwvvcYgsoYZF6tvG+NKS0CzlwvdG0Aukag==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795168767;
	bh=PSfdN+37PsBpIB7863Qn6sk91ZfLPb26efcpGL2mUIE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=grtmMSFmrJHG8vRfLD9jCSUqv1bkyj/N5S1Uvm/lh+y/UvBgRnbBTLaDydFE4kxng
	 vHSkb7QBFgn4YMQ3pyoLt1Mc7ZkbIczyC1kH5nCfoKhARo28jJcd6N8TztCfOLY3nF
	 uqWGYjW+jqzYRosgg2RtW2A1Kow5wIx7OTzSi5e10IOmLafKbtsxtt5W4PyYnMAKhH
	 DAcSChJkTTyxJvmnchlN+ab2pbUMvmanLuAnXrP2xFLZlr8yEZMCWKwqs19P3zYinz
	 5D8hpB5KJuR+pZ8fvmPmzkJCIqYPJNc9F91mkmflkTliBtJRR6mnSK1ElXVMsEg9ZE
	 cKpMwzGp068nA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7EA5812F1;
	Fri, 20 Nov 2026 09:59:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97DCC169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F1444016D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VHQRhSVdhKb9 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 09:59:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 933654020D
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 933654020D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 09:59:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4bb64c99d2fso7069255e9.3
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 01:59:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795168758; x=1795773558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=7aKUd6oo4ocoxbX6ieFv/JyXft6Bs6MVG5t2y8ZcauQ=;
 b=1cChVnFjvZf56Fyt4/9oMRuZjYCGcLOtaggx4dwEAtXZfEuNF9+ejRjwbgv4ccdmFY
 JoW6i6+Q02TR9ZyBz9NN+iM7wwK7/1xukq1ja1VWg359eVmO487HbGf1Rhf12lTaa6X4
 NFXOGqbmYkGDdstN51kBaiExQoa4gF9P2JKKDuxNtZ4UsWYlWULCTfokg62gjbvQKOMX
 uNsKvO5j3vOnKJzra/RENyYakgpOR9monhoE5NZo+t6gN0wll8HCYj8gVADvSdsSHztK
 3XLfyk5P5ndpnbl5SuIfkb3VzFP/8fj+qdj/hKMDHhS+61VACJ/vxJH2IudXOxFNIxyy
 AzHw==
X-Gm-Message-State: APuU4Z+rM0DYG+M/47bIX/AsfwaoVDFM6YaIW6BAeDAnRj1B3phjOWtO
 6qRjKi7B7a+qIy0IFPH5H2fmKFTwDRSVB/xK9TmTzq1E7dhKRkGQwkh+PP22dLuuy1iSLFlIeMK
 4tdb/BsZiXg==
X-Gm-Gg: AYBFou1oDwxSY9WxjyLZgluQGa7Vd4JXfQGlwZhaiSPnEv/S+t3QLtyPDdKSlX8UOES
 NRO2sgegJkCWrR+ZYYNvWRGjgwtmzkn/aCskbpucgm4APW8gUhP8Ye4cwJL1r+6FqQVOOGwuOoR
 yYCs4P0VuBhD/eHyqEW2k/LbDMzgcwIbBdtb5hGaaGQpUUXkiV+nZSnQbKizOk/wdacbqLYtiSW
 Wyb42jZXWzSNnRY25NzQBJzE5VtA/Lhy5edOqTdvkvYUtdlb3BIZprSeeyKha468+cNqj5Hmh11
 ZwoONPVMldzXZNgUasX+XojRuWnvSgyxZB+jDcgyKVFyflOPioy3n9jc336pX48C25qipwu+3rh
 yJ0fSj8pc8psjx202O2puCazVneCvtZZWnvufKiRZYI0vcwkS5PICw2f6V2i8cbgv3aOINHm2xW
 X/qw9HJ2+sjk8tMudv7Ilq7NfxfLKSNudeI5hGSDs/OiYJvscrjdNA4p7ARYUJLnz2g6j8EVxQZ
 6QcWMg3cMs7YxXTCbwbSs6wfYQ5Lhs+XISyTpoC+XYXGUO9lNLWnwJAUza+LLYYEYRGIHwrl1V6
 UNy2pmz04/FMUXopbUmxifyl2moZmmgaUAKzWVMhb75T
X-Received: by 2002:a05:600c:a085:b0:4a2:a9:ed87 with SMTP id
 5b1f17b1804b1-4bb88811c75mr61689465e9.19.1795168758475; 
 Fri, 20 Nov 2026 01:59:18 -0800 (PST)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a9846sm118212495e9.11.2026.11.20.01.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 01:59:18 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 20 Nov 2026 10:59:12 +0100
Message-ID: <20261120095916.539749-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111080006.3832953-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libecoli: fix uninitialized width
 build failure with -Ofast
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
> libecoli builds with -Werror. With GCC 15 and BR2_OPTIMIZE_FAST, the
> build fails with:
> 
>   ../src/editline.c: In function 'ec_editline_complete':
>   ../src/editline.c:304:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
>   ../src/editline.c: In function 'ec_editline_interact':
>   ../src/editline.c:657:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
> 
> This is a real bug: ec_editline_term_size() only writes its width
> output when both el_get(EL_GETTC) calls succeed, and these two callers
> neither check its return value nor initialize width beforehand.
> 
> Add a patch, submitted upstream, that defaults width to 80 columns, as
> the other ec_editline_term_size() callers already do.
> 
> This issue has been present since commit 5638ee04c8dd ("package/libecoli:
> bump version to 0.11.3"), as upstream commit bc90312a4285 ("editline:
> split in 2 files"), first released in v0.11.0, dropped the width
> initialization. It therefore affects 2026.08 and later. The 2026.02.x
> LTS branch still has libecoli 0.10.1 and is not affected.
> 
> Fixes:
> https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69
> 
> Fixes: 5638ee04c8dddb9ebfb7b047efb574f657e1b052 ("package/libecoli: bump version to 0.11.3")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...-width-before-querying-terminal-size.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch
> 
> diff --git a/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch b/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch
> new file mode 100644
> index 0000000000..e2b833473e
> --- /dev/null
> +++ b/package/libecoli/0001-editline-initialize-width-before-querying-terminal-size.patch
> @@ -0,0 +1,56 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Tue, 10 Nov 2026 23:53:35 +0100
> +Subject: [PATCH] editline: initialize width before querying terminal size
> +
> +ec_editline_term_size() only writes the width and height outputs when
> +both el_get(EL_GETTC) calls succeed. ec_editline_complete() and
> +ec_editline_interact() ignore its return value and do not initialize
> +width beforehand, so an indeterminate value is used (clamped to 50..100)
> +when the terminal capabilities cannot be retrieved.
> +
> +With GCC 15 and -Ofast, this is detected and breaks the build because
> +of -Werror:
> +
> +  ../src/editline.c: In function 'ec_editline_complete':
> +  ../src/editline.c:304:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
> +  ../src/editline.c: In function 'ec_editline_interact':
> +  ../src/editline.c:657:22: error: 'width' may be used uninitialized [-Werror=maybe-uninitialized]
> +
> +Default width to 80 columns, as the other ec_editline_term_size()
> +callers already do.
> +
> +Link: https://autobuild.buildroot.org/results/a0a7e17f1a76588932a8a7f8db35a832d540cc69
> +Fixes: bc90312a4285 ("editline: split in 2 files")
> +Upstream: https://github.com/rjarry/libecoli/pull/43
> +Assisted-by: Claude:claude-opus-5-5
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/editline.c | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/editline.c b/src/editline.c
> +index d286135..0751194 100644
> +--- a/src/editline.c
> ++++ b/src/editline.c
> +@@ -301,7 +301,7 @@ int ec_editline_complete(struct editline *el, int c)
> + 	struct ec_comp *cmpl = NULL;
> + 	char *append = NULL;
> + 	unsigned int height;
> +-	unsigned int width;
> ++	unsigned int width = 80;
> + 	size_t comp_count;
> + 	void *clientdata;
> + 	char *line = NULL;
> +@@ -654,7 +654,7 @@ int ec_editline_interact(
> + 	const struct ec_node *node;
> + 	size_t char_idx = 0;
> + 	unsigned int height;
> +-	unsigned int width;
> ++	unsigned int width = 80;
> + 	char *line = NULL;
> + 	ssize_t n;
> + 	FILE *out;
> +-- 
> +2.34.1
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
