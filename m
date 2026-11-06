Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800A3606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cKZWjVXE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E24B81E74;
	Fri,  6 Nov 2026 16:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pDNwlHuMf0B8; Fri,  6 Nov 2026 16:11:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4E50681E5F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981469;
	b=dgE3ov2iFziYULKGCFAiiWMmZN72QYETCSyEXs5BJCJpdkU6ohtHjY2TyO3eOEpfAh71
	 XcTAKOAgrG6ciauD4ge3Z1oGPcS91+jvAPl7+9sk80fGoPwK+q78dnaeJId7v+yQj+8vY
	 eJ+hKCG+RVHtpxNXQHzYlc84+CmFLLlzqIeLTjs+nYtYVIzqbwHnnf0Ii11x7GCns6Uu3
	 hJpbYuXJy5WIVWrLurvzUl8AS6W8i1gBFffyVmEkTNXHfh3xCkHJoxVAQQet4T6AsfYhG
	 mYcoCjAuhdbbxNe/HsB9og0mzXyeI2NTcIveXdzHFk3kcA2nAQELmw5RC6Ycznkg+Kg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981469;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=PbKq/F+udHvqOKziouUNyLWIfQrzB4kdW77ofOSGInQ=;
	b=pBB1qSO4939ARSoqKPY3dFMsuAtJoa2kweoKPwrFUeSI9RLR/cBBJbzTCXoba2QzS/n/
	 rOVkSfOmZ6dYjMDE8vKqiUwdw538lHoEATJfLETojUvHAoMfabUKUKvuJAt6vR9qi/ddg
	 3RFkFx+GYuVg1qYLFXHnJUFtvv8XxH6uQvCPpVkpPc8etCJ1jB0gDkjRArlcmuTjHYI4y
	 6tCbtRdJnqr2sEixoMATVKqB5zml+CXtGRb92qNs5lWy1ZP/xccUMC0cmget9hoTb+ux3
	 S5oJ5Px9BBdSVkmP0IyeF99kwDFDNLHk6CVcHUwyiCFA6zbeU+SRYfUD9p2eugkPRFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981469;
	bh=PbKq/F+udHvqOKziouUNyLWIfQrzB4kdW77ofOSGInQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cKZWjVXE3yGfv6BD3f3YyHCDrS6ahHtHErPr/UN2rUYBo8m5QX8t5liHET0kV0MjE
	 JgBauJffS1+GWJ/pmVuom1jFze2dMGYlWpyZrpWMglnob2T3iqLjgaHlQziJXSTz/a
	 5L7CSCfwN73ddJ5HSdOJp6/JrCUu+urgX3ttEfVq7R4w8fdk4sOYEOQRav1sv6twYO
	 uPDYyJ7UoXUY9BZigQcLzjS5RQNAQ9TahrTHQ+b6g5Ql+EjItk9eWM1N0cCbpvNikN
	 /5h9OukOgIZwGfFLOW7Nul3UPW2PifGjqdwVcrazjCkLFyr0tEzB8iAdQ0bej0fai7
	 UmdhY02vAFN4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E50681E5F;
	Fri,  6 Nov 2026 16:11:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 641454B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 559EC403FB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1IV42cbR7Sc for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:11:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 15F5C403D8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15F5C403D8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:11:05 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4a2d6d01ecbso5272685e9.0
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:11:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981463; x=1794586263;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SYvry4ipQfx/xY6NGlQj5LgzpmNyfN+/PF9e45BH/KI=;
 b=xNGw1Jnku58tE8z7zsI1KHTU5jHYsYWDgLIYVz5d8hJZFFvg9GbFNj0pLAkMiy13BH
 GQEJMiYMmZwu4ektaopIqPyjw3P1FTTGefkZnoujeDsr5c5gPZdaVYqNjNJmPrXzfYvu
 IxLIh4oOtv/IztEM2IZj4EiXyiLrnNMbj6vg1T+6EQaDhw4tqzyKZ33KYIzX3es/E9qo
 Ibrgioza2NVZVAO+b+x4Q2x96UHOtbPMBB7cVSp5fuSV55bvTwtarTKLqpmQe22Gz/gl
 JB4Gu8bJc/FtwBkC8qP95PqOaeFkXHsuDSy3L4WzplvtwISbVocREiyVT22zmx682G2z
 n0Uw==
X-Gm-Message-State: APuU4Z9kAA00LDpJvc1+oskWPpd3fwe+FCu/S3ChKy48RjF20j2NxrkG
 lmjgVPp6euRwm5AgiNvvabeY7kg5t6s2EXzW9tAVf/7jCq5Nxa5ehLVxmg5KXgKIoJTwxzaG9U0
 r2z3ECec=
X-Gm-Gg: AYBFou1ju2l7GjjNZdYhuSpn/3yJ11oOdcbcKXexdeTtVrEZP6CJtXiAKcErPNv5h9w
 bsmcDKrcyCjyvs2XAcj2CfH4tXYI3BRjvPii3y1LBdCftOqsbnbvPAKcZuV1w1cUEIgyQVHX13g
 AWY1jZzl30gVtkBqrstni3jTY1jN52r+cYfsuwKSMRayy+fNWE1eTx43KdLrvobOHVkp27/tZxz
 3idtnWPf5griACcywSwYYgaTM5+T18CkjqvXThSGtd9/pjqkhEQXSLQPhSBOx7AyrGMeA8Gskj8
 B095YLmbAYMJnaflqhqGuaNOSdd/o2Hnzaw/SWjVtftSzsGpXHMWE901PjZPfcwfL2d3+T11wVH
 wI48St2xbkAt3rWtPZZ2aiTLBMrcEM9yqCaVvF9lRSJVp8QfFT9s+SXDFu5FPM5VmuEX0j6OCOP
 lWzVMqMgCbYc64bZgdTyj7SWMIKdvF1dM8cuETHY1hmta/f6aiXR653NXAULpep0QyvPKxPgica
 +PbLz81Qb0lCt+/3+oPSIG5edGPm/mjQWrHu2JpxQfmVb6BcgBAsh7SAkqTT1k3iPf95IzPI/iO
 vJ0Y+QFAyUhA3RUyhhAFhzVcqVOXKtE=
X-Received: by 2002:a05:6000:455c:b0:48c:466e:9d08 with SMTP id
 ffacd0b85a97d-49276c581e8mr4047613f8f.43.1793981463414; 
 Fri, 06 Nov 2026 08:11:03 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-492d3d609c8sm4722265f8f.6.2026.11.06.08.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:11:02 -0800 (PST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:11:00 +0100
Message-ID: <20261106161101.607909-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261031143626.1831225-1-thomas.perale@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/libselinux: fix
 python bindings with pip 25.3
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
> Since the pip bump to 25.3 on 2025.02.x [1], the build of the Python
> bindings of libselinux is broken for both the host and target variants.
> 
> This can be reproduced with the following defconfig:
> 
> ```
> BR2_aarch64=y
> BR2_cortex_a72=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_LIBSELINUX=y
> ```
> 
> This has already been fixed on the master branch with Buildroot commit
> [2].
> At the time this commit has been cherry-picked on 2025.02.x [3] and
> later reverted has pip version 25.3 was not present at the time on
> 2025.02.x [4].
> 
> This commit cherrypick and backport again the fix present on master to
> fix libselinux build.
> 
> [1] 6615c3ad30 package/python-pip: bumpp version to 25.3
> [2] 0e5eef911c package/libselinux: allow pip to use system-provided packages
> [3] 32d1d7c367104d23cc9eec2762a7e543afdafd9e
> [4] ae7e57a9622474534f5e67af7750c1b0ccb9ff4f
> 
> Fixes: 6615c3ad30 package/python-pip: bumpp version to 25.3
> Fixes: https://autobuild.buildroot.org/results/6b893f3b01c51079af618e43893c6f46ec866378
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> (alternative to commit 0e5eef911c9b313fddd9912128bf09d605b5f6ae)

Applied to 2025.02.x. Thanks

> ---
>  ...akefile-build-python-module-without-.patch | 52 +++++++++++++++++++
>  package/libselinux/libselinux.mk              |  4 ++
>  2 files changed, 56 insertions(+)
>  create mode 100644 package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> 
> diff --git a/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> new file mode 100644
> index 0000000000..9ca87f0b49
> --- /dev/null
> +++ b/package/libselinux/0003-libselinux-src-Makefile-build-python-module-without-.patch
> @@ -0,0 +1,52 @@
> +From 17a9372391ad2c9bf0e440391d6fd13cb8cfdaf3 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Christian=20G=C3=B6ttsche?= <cgzones@googlemail.com>
> +Date: Sat, 27 Dec 2025 15:39:11 +0100
> +Subject: [PATCH] libselinux/src/Makefile: build python module without
> + isolation
> +
> +The "pip install" logic in libselinux/src/Makefile tries to get
> +setuptools from the network, which is not correct as during the
> +build/installation, there shouldn't be any network access, or
> +downloading of arbitrary resources from the network.
> +
> +This causes build issues in Debian:
> +
> +  https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1121121
> +
> +And in Buildroot:
> +
> +  https://autobuild.buildroot.net/results/0e9/0e9de0c0d8b6ec57eea9f8834f02076b296ba4f1/build-end.log
> +
> +To fix this, we use the --no-build-isolation pip install argument so
> +that pip install is allowed to use the system-provided setuptools,
> +instead of wanting to download this one.
> +
> +This patch is derived from
> +https://sources.debian.org/src/libselinux/3.9-4/debian/patches/Build-python-module-without-isolation-Closes-1119155.patch,
> +with the change that --no-build-isolation is passed unconditionally,
> +regardless of whether $(DESTDIR) is empty or not.
> +
> +Acked-by: James Carter <jwcart2@gmail.com>
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +Upstream: https://github.com/SELinuxProject/selinux/commit/17a9372391ad2c9bf0e440391d6fd13cb8cfdaf3
> +---
> + src/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile b/src/Makefile
> +index e9141bb9..9bc10606 100644
> +--- a/src/Makefile
> ++++ b/src/Makefile
> +@@ -190,7 +190,7 @@
> + 	ln -sf --relative $(DESTDIR)$(SHLIBDIR)/$(LIBSO) $(DESTDIR)$(LIBDIR)/$(TARGET)
> + 
> + install-pywrap: pywrap
> +-	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> ++	CFLAGS="$(CPPFLAGS) $(CFLAGS) $(SWIG_CFLAGS)" $(PYTHON) -m pip install --no-build-isolation --prefix=$(PREFIX) `test -n "$(DESTDIR)" && echo --root $(DESTDIR) --ignore-installed --no-deps` $(PYTHON_SETUP_ARGS) .
> + 	install -m 644 $(SWIGPYOUT) $(DESTDIR)$(PYTHONLIBDIR)/selinux/__init__.py
> + 	ln -sf --relative $(DESTDIR)$(PYTHONLIBDIR)/selinux/_selinux*.so $(DESTDIR)$(PYTHONLIBDIR)/
> + 
> +-- 
> +2.52.0
> +
> diff --git a/package/libselinux/libselinux.mk b/package/libselinux/libselinux.mk
> index 360ab063ca..7bc33392d5 100644
> --- a/package/libselinux/libselinux.mk
> +++ b/package/libselinux/libselinux.mk
> @@ -35,8 +35,12 @@ LIBSELINUX_DEPENDENCIES += \
>  	python3 \
>  	python-setuptools \
>  	host-python-pip \
> +	host-python-setuptools \
>  	host-swig
>  
> +LIBSELINUX_MAKE_ENV += \
> +	$(PKG_PYTHON_SETUPTOOLS_ENV)
> +
>  LIBSELINUX_MAKE_OPTS += \
>  	$(PKG_PYTHON_SETUPTOOLS_ENV) \
>  	PYTHON=python$(PYTHON3_VERSION_MAJOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
