Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE164606A32F
	for <buildroot@archiver.kernel.org>; Wed, 28 Oct 2026 05:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hAWFEWP0;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=yRFOylK5
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3ECE4031B;
	Wed, 28 Oct 2026 05:04:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QdkwKJfKz99P; Wed, 28 Oct 2026 05:04:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DEF0640368
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793163855;
	b=n0w1VKVfmN3c2S3f+Bn6dhVcJfshUl6MeNLC9nBlnt10BHER+B0KJRIav1u3koDMTfQy
	 fp/cKsjTvi2gHMkdLxJR7MUm3s6/Bxtp5guc63rboY7OEyNNdIuRvwpPp5WyCa/HUBpjS
	 81Cyv7c4W6Nc0us+s+ce5dJ5xqcJN8e8IJPuGZo/BEQAN6rb84bgE2ZQUpsRlLUjlYAp9
	 +cauInWyQITCyo/vXMrEyVhS3NVVgagIHUgTVv+9yivV4hPHqgqjNS8WGk3zH0JCxicdB
	 +Jr4LT0bMlpUlqjA2uHIob7Iw0M0NbeFK7Y1YDdD8lZENJm2RiUKQi09p2w1ypWV+8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793163855;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=2TUu0ayDMnX6qeykglH2bOtgGHGXUligehzSDhO4NLQ=;
	b=FKc5z0tckvn9ylb25z3v5YwqEQFasvPma2cav4OLvqubP9SKhpRX6HAAkDVK127j3TLl
	 kUM+A8IMWZ43QKRO2CIrKyTXW55aB56CxTlR0wjjw2bLr8WRMX/RS6PuiiLahvJXxfML8
	 mYLrlO1Yz5FvKeEOUAjRdELkqHGpRlU7MAy1udpHsV5Aq2ocWNTcMTQ588diGC03xqkmw
	 fgZ9mV6FovcLZSIZuoD+KxfZ5iOobl6Dfir50Z3hoMx+chp6vJAl9YaGIiIEdV9wPNllF
	 fkyApaVj3GZ2TrGNpN+38kKJFA9J7O/RI3uR1k9klVuv9bC3xwALl1JgN73KJY+NLmw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793163855;
	bh=2TUu0ayDMnX6qeykglH2bOtgGHGXUligehzSDhO4NLQ=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=hAWFEWP0okccQGpOpcIOg48xIw7c94tqJwqOYevbm+u39Q5MKY+vGl/YfEk27Xr2p
	 hZ0SJfdcEivM/CnnWgDxv2kK99vbG+RkRd5nRD6KBypOWKDl/ABHE+nV7vRF6yJ7x1
	 P+evC03RJU3/gxDzNLFnCrgZnEZzJLzaZMW9dq5+XaoDiexmVzQnBjsGYc0517p4HT
	 11gpGPjhotrW36ZlcQigXcDOBuKY2viZXGQIehgfp/ZvDKIxqO9QzRheNCsmRln2X8
	 0/L0pkj8C4Xu1L6SJUClRvtbwx8JdDYZK1Ftcm8PX8bEaFpFZPd6DajIYEYQrEHxMz
	 7FMS4PAVww3zQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF0640368;
	Wed, 28 Oct 2026 05:04:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EF1E529
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 05:04:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C3B6605D5
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 05:04:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5N713AjhmLYn for <buildroot@buildroot.org>;
 Wed, 28 Oct 2026 05:04:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 62C7E60632
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793163853;
 b=B7fE7zi7Rcnut/Fc5kpw8nGcb9TZvSSNY64kI0+AyJEArt7+a0o/bvh5vauHDW/K9Dx8
 61fqCm6fsiA837+AwW9zro+uwABXa6amV3fC7ZruAr6TbU4Pweaj2y/ti9FbaI25FXOJ0
 zFpZbQ2Qz6/M+iqMrCaPwn3g2TjQb7tTWxqy3mKWfy5W1XDKoud4uLSgKVnyj+oT3y/82
 vQ8OKWrTHidcsGP2muncv6VS1cdCD9pB2lnZ1FQt6psynUlSieO8qln/NiNf0EXPfXneJ
 dS6JCtPYxIlTgiEFlvx0qAh/kAxrLoMVGgFoccwrjG+jrI/U8Zx76FAXu83/RAsf6FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793163853;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=XEgMll5vJgeQdXmqz2nFJQ2UgskKVqGq4zjwtoU6ZlQ=;
 b=tCObHCKcaGsGEvV+lzU7mqDba63t7BItHNhZN9Sp9m5KFg0nKFzyDv7620bUNLpgyRiv
 eMLOiUmqSML+xZSwuxXLgnVH2/XKsq6EAL25B5lcfUzRn4SGImMzwbx48ohqmS5/zhAIv
 GgeI8gck1FYc6GdCNjeYpHHHkMrQ4oPbFb2hhPFml5a5CA7C4jRYiAMhAUrjedF21DlnV
 1x0ixaQcrKblmc4wQD9QYr3ce5q0RrBujmHCxNOqMmp1lfh4jj1e4ZNa639nQ4RTX+Y3I
 Gkw2WmmY9oDzW6oV8FMZFD5h7lja/Zhe3Udt43ShOXs/U0IRefhCCIrY+D+setPZF/g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=yRFOylK5; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::636"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=yRFOylK5
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62C7E60632
 for <buildroot@buildroot.org>; Wed, 28 Oct 2026 05:04:13 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c434376dbebso97123466b.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793163851; x=1793768651; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=XEgMll5vJgeQdXmqz2nFJQ2UgskKVqGq4zjwtoU6ZlQ=;
 b=yRFOylK5B5lOXn8AVORDRyauEBTBcdj6qRX0UA/anUx/q4ds+t81gIsIteDbSpCC1w
 8nxWR503gVFbcB5MEW31lfnh99VY8ZHrgOEOmcWzq5vJbZJluyIiNaP1EsCyvT9EHe8q
 G9Nsck8j1rxfTeUQCF28Xq/yxlhUDCkkgVitP9QA6MNit1fPxckiugrtvUyrcQHJvU64
 wLFnSyQFN7q6nQc+8DyC1uPlA4otGVeLElqOxpV2+/srB6Btmv+pkSdvaVlIRd4Cb8iB
 nD+z9ULrcUQ8EGqnae4N+eBFEqWuopExqEvZgvH8SRgQfi3PmwomjtCRu1rd0Hy6NPyr
 8/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793163851; x=1793768651;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=XEgMll5vJgeQdXmqz2nFJQ2UgskKVqGq4zjwtoU6ZlQ=;
 b=yNiQImSPJRbJmVodO2UhsQ3cdik91tJVAMa1b3EjVk7EdGY4MzjGLyzRz7Ql7CTZeg
 9YexbVfv3XZAbRSAJ2Gig3/Z0tofVGHOHCfKRL30aESTHVlMBTixioEmEEfe0GS0E3lH
 BWq1evgMNlzJ92XnMLWTui2JSJjUtXWoWWBo/2dxWa7/po5mAA6sJlf7swOWO46e1QRD
 /UQ51oIrnJJiaPWRDaSjccHSkEWZGvkJV3eX4kzAJpb0ZrBos7p1LdKAcEwkXqcAaqwW
 mzHtsWp7b1CJ/LGlT6vAU9n+9/1dS2Qvv1oGPuY8yTEtVOBsMnBM4lujjFIkDpvbptvE
 aqkQ==
X-Gm-Message-State: AFq9FYIbgbDpfgKJdF/I+a09I6d5sjjNg9zMBzpMugGxcMnBYczn1Nll
 HDbcsIrTBBR82usfLKRajwKz3du2ggiReObcDudncj7QaaQfLnPplROrBeXycQ==
X-Gm-Gg: AYBFou2dsz6Y8AoAWoq7FtWWwGY/5+D0uJJm0cCDbIBvD66RWfFtkcMUDGNIEYBvnOI
 azDCf2Gra4dN7ICMrmC3oBSePf230pHrdASdFNw6TbLqqES0oWqTAHJZDy19nwHwTXiHuHY5jGr
 TkmVrnzOnTH56pnEplT5gjb7OOlkukeGKaKpKlFQoe/RHERMTh0s3eXA2nvf3joQYG7d3KrD/Bf
 1N3Gq+WWIHEM0x7RH6XVVbTkqPMkNfrq46/y5mwfTVzjGXLUPivEBIE+xdxKR4WUlq7PjbbjFq1
 vdoidLKibTX7FlHwlCH1F7bzo2ZvfG5zMXbFCdgTJkrz05ygor2ygSybu6NEddOyhlEpzEsXSSN
 69y3EuZUmci6wY/7wBk+RRT+yrKGrsKPE1H8lWoVGodZNPC0SMJb701suvVIZQhGzt2QzbtXkCY
 Yc1GXyOG+T3+RWxoM5U14YTh3IZjs7EToCvYs7SUGkVHHsftZlO2ArdMdlZCIe5RuGzrAvnTv8Z
 PWzEF5vPjaWdUrRBhkP6ranI8hkCEQdpWtPkD7gjhyZou2hVYTEkdpIt+ICghOfnvBHYFyqffqh
 N/ipPDybqIoqgBV3SO5jnCFSSPU2OZOndiWEMmX6l+B5/U8JHlTn2o24ABWbSjBBQysqJYmY3KH
 hKKCdEuu+
X-Received: by 2002:a17:906:7312:b0:c2e:2275:1168 with SMTP id
 a640c23a62f3a-c49a741fae3mr405483566b.19.1793163851092; 
 Tue, 27 Oct 2026 22:04:11 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c49a53bdcdcsm228745466b.53.2026.10.27.22.04.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2026 22:04:10 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Oct 2026 06:04:09 +0100
Message-Id: <20261028050409.2567957-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/go: fix cgo linking with uClibc
 linuxthreads
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since Go 1.21, the cgo runtime gets the stack bounds of the current
thread with pthread_getattr_np() whenever __GLIBC__ is defined, which
is also the case with uClibc-ng. However, uClibc-ng only implements
pthread_getattr_np() with NPTL, not with linuxthreads (its declaration
is under "#if 0 /* Not yet implemented in uClibc! */"), so building
any cgo package fails with BR2_PTHREADS:

pthread_unix.c: In function 'x_cgo_getstackbound':
pthread_unix.c:96:9: error: implicit declaration of function 'pthread_getattr_np'; did you mean 'pthread_attr_init'? [-Werror=implicit-function-declaration]

Make BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS depend on
BR2_TOOLCHAIN_HAS_THREADS_NPTL instead of BR2_TOOLCHAIN_HAS_THREADS.
glibc and musl toolchains always select BR2_TOOLCHAIN_HAS_THREADS_NPTL,
so only uClibc linuxthreads toolchains are affected: Go is then built
without cgo, and packages that need cgo (e.g. delve) can no longer be
selected.

This issue has been present since commit 06b2e496a0c4 ("package/go:
bump to version 1.21.0"), as Go 1.21 is the first version calling
pthread_getattr_np() in its cgo runtime. It therefore affects 2023.11
and later, including all the current maintenance branches.

Fixes:
https://autobuild.buildroot.org/results/4dfe6753dab5d7b016210cbc11f0e137ecba09f9

Fixes: 06b2e496a0c47b1fef55b0daccac1e62b41d7aac ("package/go: bump to version 1.21.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/go/Config.in.host | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 47c7e5d075..8304b5aa1d 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -33,8 +33,9 @@ config BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on !BR2_mips64 && !BR2_mips64el
 	# go uses dlfcn.h + cgo for its plugin module
 	depends on !BR2_STATIC_LIBS
-	# cgo supports uses threads
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# cgo supports uses threads, and its runtime needs
+	# pthread_getattr_np(), which uClibc's linuxthreads lacks
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 # CGO linking for the host. Since we use the same compiler for target
 # and host, if the target can't do CGO linking, then the host can't.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
