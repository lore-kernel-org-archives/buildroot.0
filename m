Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1562A606A323
	for <buildroot@archiver.kernel.org>; Mon, 16 Nov 2026 15:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EUKM5QhA
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 598614072C;
	Mon, 16 Nov 2026 15:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KOtZG7hEjMXT; Mon, 16 Nov 2026 15:38:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F34E40705
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794843533;
	b=G6wCmNMoVVytZcvoAualZ/53bTKSAE4XlmDsYfa+822kxadnOasSYbz5LLJEQz3ze/9c
	 9iV+JBmp92iOh15296dm74JKKmem85g4sLo05JA2cnHl5Qrc3y1jpH4YhbEC3wWt11fa7
	 Et0RbZs4eBGzuMwqFfWMpWR91cIEQvsnYRIAMiWZ8mKNbrfY9al7L+aiUyMlINQpXXRvt
	 FU3BXAd+Ik358Jkl+uyeob382N38dlQ3MOWkBhIJuNi7i37M7rnVZ0ysqliS0z3tU06sU
	 KAOjsDOJ2qBUoqzJuq37oH9kjpXa5tVe14DSnlzapMPvMgbdDGTgnTUDqrnbq/k+hjw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794843533;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uksuwKBE6e1t6ae1Z4aDtnlXe/xXfZZbwqhAWEhYdus=;
	b=kNvZC0ZWylitQHZ6SoJTw6+LCGyCr10U5w2pPsPW5IGhRY5Wd8AsdBUufBlecY5vb/v3
	 baRrtJDVe9ldrExCH4UqPAs/vrf36YmMrF1+rymnwo19lxQyLReIal5KXkSzCAqnxWAtz
	 NJ5ehaK4AOckTAJmIjEr5hE1TApbaCTreLS/BwLGxVun/T4YEGmVCf1oCdc1Y0bxy2YJw
	 aywGV+3oF3z+95zXefvywhmuVb5J2zXlfNg274IXvmMLjnNsuCzy/hvT3cNOUqWeKlgBP
	 /Sg+b+fixHsKz3r1regHNvJR9T4FR8CdmgFUTaHnGdVJgbZLAGjUw3d5vpp2VjncA1g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794843533;
	bh=uksuwKBE6e1t6ae1Z4aDtnlXe/xXfZZbwqhAWEhYdus=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EUKM5QhAqpYNlkA92+VIg5K36Sq61hQHJBjsutBs29h9GBBj9thNjQdoGW8xzpo8Q
	 AG0/zpx65uREXvCXK3R53iQ4Aky72qf5N982r7eAqBhH90UyqW3C4YZbsZbqNf3Owr
	 jds0FPJGAhBPWGFCCdAVD3JOlO94NBHpiDYFDLreXynOj/3o1/sb66vXxUzM6NsGFc
	 JlE0/3La/WmMt9XBnpsHvRL2IFDB8w9rHRsJ9Gsf0A2FlRfRPDOH/gJDoNIBAppLxw
	 VlHgQ7lXHoIipFsjUrU11IE4qzmsAYiWt3Zi2RBIo12cwP/92XCm+gphoH3Ejsto8G
	 6ZNGC7coT1BPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F34E40705;
	Mon, 16 Nov 2026 15:38:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ED772FE
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D380607EB
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZd3hjtN4cjp for <buildroot@buildroot.org>;
 Mon, 16 Nov 2026 15:38:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 082D5607FD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 082D5607FD
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 15:38:47 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-492f563d1c6so1448741f8f.3
 for <buildroot@buildroot.org>; Mon, 16 Nov 2026 07:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794843526; x=1795448326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=oDLUXb8XT8D5T41slyTwyCo6nF49mqo3Xsk1v5vaQ9s=;
 b=QePk4yoml/yOtYb8gjcaSidSBvw90oUbFgzsiJvUf9jKLjOdCzz5uKQCtk48PughQI
 r0GkhGp0uk26RfLlmk6SIwJHT353lWU7ZvEfX0glwBhZ4dOYqNyEtii2Q/f3rDAyYNHP
 QANsJquJMgwKcWICj3z2YAMTnzSQehrKcOC2+iJhEZCirbbYIdeDwvrsv2pogvCEMMyR
 4Gljd3E76Tq3q0nfAMmLi58ACLcAclbN2vIko8z16NbJErnKRS8pQz3eegvoG0MEGikd
 zG8x53Rh5KKkGfBKYJmk3PqMBz8jGTS1m2OYp2Dk7YsEkqogJIDwO22y8ySrQrCYtdsq
 zU1w==
X-Gm-Message-State: APuU4Z+wHjjfMPCjOc8rQK1RK1o/2xJcizF4ETLUTStLo48pQKyeuuUL
 aG2/9jAf5q4QBAm7q+j1iiLuxwkxSCrud02TygizNNbxWvF6/dWjbjBaOQ6CqI9/hsvqAThPole
 zfLNWpUw=
X-Gm-Gg: AZFdTZf/Qc6gvgQzW40MRPkJ56Qdp4MZGz8TDP8UbncXBPKUjPK4dNk2RybPQamJkqg
 kGbGisd+ApWBtLfMwKRladi7HuXv0IwpU5SL548jUOhAP8pLSOGas/NRmoxexLMis+fb4aisytQ
 ESwcx5AnhxWkUVv1i5m6UgLP/LD5uMEQDYk2Epha86zuasC0r27wkS70pOxYsmHMLVrB4lP22oC
 6PSeDNeNUQqEqVgetczbFbM7T8e/osAZk+el2iJ1FK8hcIaVrkDICYKcThLVYnxSdiHw9HupmZY
 aWdGGhyUIr+Dw0gdbwGCSg1U27YXoJstCm6nd4qbAVbvZ86RQKe9bCr/Aoh+nY/1/VRMxhrgj8O
 PLidzavw6Xyz0BuBB9qNmfX+EQQ5zh7lET3zxxJTtPT2vI7aBiMvfoM394IpYI1r/3mrzRC8iQY
 WPaT74DqTQH4h4O8bqbap3oHqIKnjdyHFEPyCJKGH2p/81A/n0D6uH1yuUcN12v8jnO2cIyhdzB
 +Rq0Y/revRSysJNInyBxpMgTrV/qHuoXSS5jfIm3423bNb46ubZthZr/sOIL7j0r1iFO4nESo7K
 XTA5JoTa68uqBuwV7ViBjG1SrZ1hIW8=
X-Received: by 2002:a05:6000:29ce:b0:48f:bb92:c5a7 with SMTP id
 ffacd0b85a97d-49c70ed9029mr17334453f8f.9.1794843525654; 
 Mon, 16 Nov 2026 07:38:45 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c5f1c1968sm23279869f8f.10.2026.11.16.07.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2026 07:38:45 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Mon, 16 Nov 2026 16:38:42 +0100
Message-ID: <20261116153844.724960-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927221958.864086-1-yegorslists@gmail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/libsoup3: fix static build
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
> Since the bump to 3.7.3, libsoup unconditionally includes <dlfcn.h>
> in soup-init.c to detect whether libsoup2 is loaded in the same
> process. Static-only toolchains such as uClibc-ng without shared
> library support don't provide this header, so the build fails:
> 
> ../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory
> 
> Add a patch, submitted upstream, that checks for dlfcn.h at configure
> time and skips the libsoup2 detection when it is not available.
> 
> Fixes:
> https://autobuild.buildroot.org/results/4effebe5fc12146749e704dd56f695363cc8fbc3
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> Assisted-by: Claude:claude-opus-5

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  ...use-dlopen-when-dlfcn.h-is-available.patch | 67 +++++++++++++++++++
>  1 file changed, 67 insertions(+)
>  create mode 100644 package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch
> 
> diff --git a/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch b/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch
> new file mode 100644
> index 0000000000..e2caa3c52b
> --- /dev/null
> +++ b/package/libsoup3/0001-soup-init-only-use-dlopen-when-dlfcn.h-is-available.patch
> @@ -0,0 +1,67 @@
> +From 9dae8238db84a1ce2aeb61cce41af4718157172b Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Sun, 27 Sep 2026 12:03:53 +0200
> +Subject: [PATCH] soup-init: only use dlopen() when dlfcn.h is available
> +
> +Commit 1296cbf983f0 ("soup-init: Use libdl instead of gmodule in
> +`soup2_is_loaded` check") unconditionally includes <dlfcn.h> on
> +non-Windows platforms. Static-only toolchains (e.g. uClibc-ng built
> +without shared library support) don't provide this header, so the
> +build fails:
> +
> +../libsoup/soup-init.c:21:10: fatal error: dlfcn.h: No such file or directory
> +
> +Check for dlfcn.h at configure time and skip the libsoup2 detection
> +when it is not available. Without dynamic loading, libsoup2 cannot be
> +loaded into the process at runtime anyway.
> +
> +Upstream: https://gitlab.gnome.org/GNOME/libsoup/-/merge_requests/571
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +Assisted-by: Claude:claude-opus-5
> +---
> + libsoup/soup-init.c | 9 ++++++---
> + meson.build         | 4 ++++
> + 2 files changed, 10 insertions(+), 3 deletions(-)
> +
> +diff --git a/libsoup/soup-init.c b/libsoup/soup-init.c
> +index 3392e8e..a57db6e 100644
> +--- a/libsoup/soup-init.c
> ++++ b/libsoup/soup-init.c
> +@@ -17,7 +17,7 @@
> + #include <windows.h>
> + 
> + HMODULE soup_dll;
> +-#else
> ++#elif defined (HAVE_DLFCN_H)
> + #include <dlfcn.h>
> + #endif
> + 
> +@@ -26,8 +26,11 @@ soup2_is_loaded (void)
> + {
> + 	gboolean result = FALSE;
> + 
> +-	/* Skip on PE/COFF, as it doesn't have a flat symbol namespace */
> +-#ifndef G_OS_WIN32
> ++	/* Skip on PE/COFF, as it doesn't have a flat symbol namespace,
> ++	 * and on platforms without dlopen() support (e.g. static-only
> ++	 * toolchains).
> ++	 */
> ++#if !defined (G_OS_WIN32) && defined (HAVE_DLFCN_H)
> + 	gpointer handle;
> + 	gpointer func;
> + 
> +diff --git a/meson.build b/meson.build
> +index 4422215..3140ceb 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -167,6 +167,10 @@ libpsl_required_version = '>= 0.20'
> + libpsl_dep = dependency('libpsl', version : libpsl_required_version,
> +   fallback : ['libpsl', 'libpsl_dep'])
> + 
> ++if cc.has_header('dlfcn.h')
> ++    cdata.set('HAVE_DLFCN_H', '1')
> ++endif
> ++
> + if cc.has_function('gmtime_r', prefix : '#include <time.h>', args : default_source_flag)
> +     cdata.set('HAVE_GMTIME_R', '1')
> + endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
