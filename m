Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9245606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EUW73Qo+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8BD660886;
	Fri, 23 Oct 2026 13:21:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-N1tNU3iSLg; Fri, 23 Oct 2026 13:21:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AC921608CD
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792761691;
	b=Mes9enTy8hFYKWg2yU2Bn6/WCacTEhzQDNSaFSmpQJh3XwIBkGej/G+nDz1n9cQ2Yn+g
	 WyDSnlq4PasT5HnoUsmN1eRvGwoLPKdqO2v9UNFQwCTHw2xoGVFdHIvvkdYBWeW6DtsFg
	 0o1m9kZrGLapN+YImUat88Aqt/a3z+aEkdaVQwiA+71gRR+B1I7bFZ1iuUXd+YYiuHKRi
	 l3AQak763+TuEi5aygXjU6xm9WldB6rPimfqvXgsr79ghYYrAjRaD0DZky6CHDo+W2dvT
	 NNYHe1DiWPrgo6cMhIaKwfnACssjgknXjAseNxo5m/sH8bFRdrVchrptyClz8Ee+h/w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792761691;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=xE0Om1PvEhpDsfl0rpL6jChnX74v2M+OcIFdyzECIbo=;
	b=juMkuoZQqEvAZykhdyLIlCkA4fOFlVkpzVg6HDr7argvCNmTox2621VQ9HjPrdTGDmAJ
	 onr6n9cBSmv8qxSgAk71ytEeI0UKk0K7FTUdW4rFzWsFQB73OiVDp9CfA3kW8jdlxf4zQ
	 SpMsRVT8CRCDyUVcNVyo01J0sOxnzyXWDWNPgi5MxzYcBM6IAL8jjEGSnUtGEg2y9rbRX
	 J8I2e2idA78ulYi9hOaIaXnsh/MW4yyz3EVY04IQNO71WpHnO0uAAaNai3Cv13xZOcFml
	 ZeACZCQ9+rDTicBMIdqzv4lM3t9KlsjlI9AlviUHMfgYz5v7zZBdyJOzZGQa/jc3X8Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792761691;
	bh=xE0Om1PvEhpDsfl0rpL6jChnX74v2M+OcIFdyzECIbo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUW73Qo+vkcYP3o7R6yxKowtsy6O/L1DhKzgjHoaohIkZ7zE3nvfcHOJddYzHHIo8
	 PgxjLkrW5y6QZnc/9MXwx73nAt5p26K0RjhTkg+YpLBvuKsaTT5/vZWMbKxUwPkOfk
	 iAyWcuGu07vE0f4a/XHmhSHb4nnddikfmzVPCnhdm9HhVUTGWGngNAEMihDhO0AZzB
	 zF6CgIGlzXKY5CbnLe6jJatYIuOQfbKUtOOE+N7Awy/JS4ucleccvBPV8CaPMtX7Gh
	 Zg7ScNYfZ7ei0sDg+u3JZVc2MVCFphWy3HOVe6N/pSYlxAFu99P/j2SFv29DSC1PDE
	 /goQ0BEdwEyCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC921608CD;
	Fri, 23 Oct 2026 13:21:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DDE53C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0405F400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pxO0d9xPEodt for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:21:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BD25B401CC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792761688;
 b=CLNKEB73ZzLGnku7CWNM3EAV2es79o/xH+w/N7zSvxR8Kn/DzodxB5SPjmZor6jdvtmZ
 UVTGYLDFzyrgdxIlyk9pnmRRGcVDTjzysfBj7jf29O/JgELdRdxtHoO7h5zWQFZiMjSCa
 whj8MD6g1fiMcwsAL9wMBCHmVk2mwUr2womyHjHaTkfo9MIHblyR5Bsedkbuu2b7RBfTO
 duoMpV6aYIZjHhQ4dBv9pmsCSr8wn3SOF2K3WD7oyNcF8XDXn7nvapzN8f436KXrIfAAK
 y68Fn2Yhr2PA65g2UmYR/mN55a/wm9ibjCuc+2iNMDob3fMWc4/+OwEPahWtNeshDbg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792761688;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=VXzCaPZNIyoGyfIRgkdte/MLtmT4kv1VKMk4V0sYkcM=;
 b=YGfPosTQ41qjnZZQW0tAu7TgGsz4fF1O5umsC502TaBOAgYmHnpsOl6T87MJvx7QjS4h
 KLxyZM/uSEs9ylILKxhRF/YDcUKy68xvCh/2gpM/JhWf3roOTBfCL2R9j2WU7eE2tOnOa
 oHRBDU9HQLZ045BIP1ANmjTYdvL2F2FVpfWrM/YP8VactpDnXY6SFmyM8+bcSI9fqEWru
 nt/fupemrXLfYtQTTEIXkf7O0QVh6lBq3uSxn1ELj9zpVjte6noB5OMV1VVa4UEY6VCSH
 HVsa42hdnHOpxEOAw06Jz33WoXz6cw5Q2ZmPqzgweBX2a/VOLXnoZt7VK+ham/mEhuA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=VfMNixAG; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BD25B401CC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:21:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4a20bdaf39cso9645285e9.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792761685; x=1793366485;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VXzCaPZNIyoGyfIRgkdte/MLtmT4kv1VKMk4V0sYkcM=;
 b=znc19VQe6Ilv7jDnwxAfADqe5ZnRapcstV50iyEEhLpB6RJuj5J/k9G/D/7Ed8FE4b
 YBh8UuNVgcNzwx8AJRWvt5FMSOebKG4xPcA8nUt9IBPNVs1r8LiVBHKd5ooefD1z9C2t
 CFxGWeWTJTWuChR8t7k+vLAqMS1DG5v4y7OCvG2wvFysnAwVJrjd+7/hGcWiJNtBk8ni
 FldgXUnHGPLBe6t5Q0PcVFHDluuW3uqsbQFxq+Ox8XvtxpQK4f1sgNma2Lxy+nywo9qD
 aI9ETOge2WuirUa+w983I+Q73w5kc9P5aQ/WIye52ofJWBAa91g6wdgkNhXeTr94/B/d
 W+5w==
X-Gm-Message-State: AFq9FYKbg7ftysmsQ4fX1HdNWH8IT87WMLm2GomCb2azn23CcXvt3FSY
 Zrmi4SxOtbnlv8f6ZiZO1I6XykJ6fNEhsxys5OWqnLcauhfRxu92LWDrYD2960gjKb3pSL6ulYg
 Q3vC0cIY=
X-Gm-Gg: AYBFou3nm+MBSZLKBlMptv6KUw0VJPVIgRUnAZwbUTCxLwhidO/ad4wThqUDTX9aeLK
 pOP8kddkEHnD5WTCQhOirBmaQcSpmtvwp/e1G/DO5MCuTpd6ZltFyc0r6dYPCYWvniHD9A5h2FS
 X8U1P6EQLLnn3bhxRfzyByZB7Cb3QYOJa1UvUUKmrFbQflTcLN6EbYaLvZX8pdIkQy9URWSI+aC
 czvfbGRVfqG6EysSD2PtcOhcTp7s2gp5Ri5EGfCmB/3WHv53PBy0gkxIfLgmgSpkv1ZhpFSrSMJ
 TE98ZZFANdqJGhxotjJv+GC7QvElaV0kbRbFdeM6ZhbsduRo3E6FobXJm+tVsXNyZ3RwVU5yoq7
 KRd96Q4ClzrQTbsIws3rRChzzoum+DfJxUMizhgOOaXaTNxBVuacqns0oqoii5AWCG67KjhecTT
 sWHRly2N4FB+DF8z4UdZhDNhVQ2BrYLu4aGyq+8slRlue8re1zDvTLIGu5VWqtPxMHvyBi0b9oN
 wHJOzHuQvjDPNyF8nSp0vuw58HcEDLiIAKxtT2ZQgCQQwnA4whHcMT1/g==
X-Received: by 2002:a05:600c:a405:b0:49c:d019:70c5 with SMTP id
 5b1f17b1804b1-4a211bb862amr33002965e9.0.1792761685450; 
 Fri, 23 Oct 2026 06:21:25 -0700 (PDT)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a21544730dsm17778685e9.2.2026.10.23.06.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:21:25 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 23 Oct 2026 15:21:21 +0200
Message-ID: <20261023132123.1607921-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261020064409.179420-3-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 3/3] package/python-numpy: fix
 meson configuration with LAPACK
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In reply of:
> Building numpy with the LAPACK package enabled (like when building
> python-scipy) would result in the following error during configuration:
> 
> ```
> numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
> and no default provided for <PkgConfigDependency lapack: True None>
> ```
> 
> This is reproducible with the following defconfig:
> 
> cat >.config <<EOF
> BR2_arm=y
> BR2_cortex_a7=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_NUMPY=y
> BR2_PACKAGE_LAPACK=y
> EOF
> make oldefconfig
> make python-numpy
> 
> The variable that triggered that error got assigned a default value in
> upstream commit [1] which is available in python-numpy v2.0.0, which fix
> this error.
> 
> This commit backport the part of the upstream commit that assign the
> value by default.
> 
> [1] https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125191093
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  ...implement-BLAS-LAPACK-auto-detection.patch | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
> 
> diff --git a/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
> new file mode 100644
> index 0000000000..f7822ef852
> --- /dev/null
> +++ b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
> @@ -0,0 +1,77 @@
> +From 34afbb97cc9915ad5976ddc869a539e897545722 Mon Sep 17 00:00:00 2001
> +From: Ralf Gommers <ralf.gommers@gmail.com>
> +Date: Tue, 10 Oct 2023 00:27:02 +0200
> +Subject: [PATCH] ENH: meson: implement BLAS/LAPACK auto-detection and many CI jobs [wheel build]
> +
> +This reimplements the auto-detection and many of the switches that
> +`numpy.distutils` offered. Beyond that, it implements several new
> +features:
> +
> +- Auto-detect the symbol suffix for ILP64 OpenBLAS (can be none or
> +  `64_`)
> +- MKL ILP64 support, threading control, and use of the layered library
> +  model for MKL >=2023.0
> +- FlexiBLAS support (LP64 and ILP64)
> +- Support for the upcoming standard in Reference LAPACK for `_64` ILP64
> +  symbol suffix convention.
> +- A test suite for BLAS/LAPACK libraries, covering:
> +
> +    - OpenBLAS: LP64, ILP64 detected via pkg-config and with a "system
> +                dependency" (i.e., custom code inside Meson)
> +    - MKL: LP64, ILP64 (layered) and LP64 (SDL)
> +    - Accelerate: LP64, ILP64 on macOS >=13.3
> +    - FlexiBLAS: LP64, ILP64 on Fedora
> +    - ATLAS (LP64, via pkg-config only)
> +    - BLIS (LP64, via pkg-config only)
> +    - plain libblas/liblapack (Netlib, LP64 only)
> +
> +The list of libraries that is tried with the default 'auto' setting
> +excludes a couple of libraries, because they're either no longer
> +developed (ATLAS), not mature (libflame), or can't be tested and
> +may be re-added later (ArmPL, ssl2). Those libraries can still be
> +quite easily used via pkg-config.
> +
> +The new CI jobs are running by default right now. Once things settle
> +down, the plan is to disable them by default and allow triggering
> +them via a `[blas ci]` command in the commit message (just like for
> +wheel builds).
> +
> +Docs will be included in a separate PR with the pending rewrite of
> +all the build/install docs. For now, the CI jobs and the
> +`meson_options.txt` file serve as guidance for how to use this.
> +
> +Note that the test suite contains a few hacks, because of packaging
> +bugs for MKL on PyPI (broken .pc files) and BLIS (missing .pc file in
> +Debian).
> +
> +Upstream: https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722
> +[thomas: backport subset of upstream commit.
> +  Only the part that fix the 2025.02.x scipy version LAPACK detection.
> +
> + Fixes:
> +    numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
> +    and no default provided for <PkgConfigDependency lapack: True None>
> +]
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + numpy/meson.build | 8 ++++----
> + 1 file changed, 4 insertions(+), 4 deletions(-)
> +
> +diff --git a/numpy/meson.build b/numpy/meson.build
> +--- a/numpy/meson.build
> ++++ b/numpy/meson.build
> +@@ -198,10 +198,10 @@
> +   if dep.found()
> +     conf_data.set(name + '_VERSION', dep.version())
> +     conf_data.set(name + '_TYPE_NAME', dep.type_name())
> +-    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir'))
> +-    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir'))
> +-    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config'))
> +-    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir'))
> ++    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir', default_value: 'unknown'))
> ++    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir', default_value: 'unknown'))
> ++    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config', default_value: 'unknown'))
> ++    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir', default_value: 'unknown'))
> +   endif
> + endforeach
> + 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
