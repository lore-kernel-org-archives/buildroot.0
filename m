Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481AC606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G8FwICMx;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=BvmJvtUj
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C330405CB;
	Wed, 25 Nov 2026 16:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FzdjywmjrT5M; Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2995C405B7
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795623271;
	b=pAnvi6M/1m2GpfAocuYo9Qhq1QwKWQVqGW8FbwNqSGgbDHFQs33LjvVXBNCNYdYbUmzq
	 rP5pdTLmYxkXbBxiAe46SvQUc95pShuoiTtANfxuU6BHHfx8u/dfxpIilKWIbzSOOZihu
	 XLidGgOKvWSadodPrr7iOxN6hUb/Xl2wY8CG7Kq9CzC/WmRHy8cgaNr949LS++H7J556A
	 K8Yb+vMntnwUDV8leKnydCPdL2mrQjTYHZCaIZ/5AC3oOdyAAeSYxxa+jAIhXVMNpBQE/
	 BG4BKJZLY9rHLuE5R/RIiTj8w2hMvwkg/Ioqr17KPhhZ+deeMV6K0EIRWpoK7ebCKRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795623271;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=EJddFW3pJRcj73/XUXfRSWtXTzip2aRl1sdB5BAvaFk=;
	b=tBVb8/NbhdnYA+7JipuzHjdkuiY55rStbBkCmb+V8B0JweVxvahbJ+yi8kEkbuCEh2+0
	 hkDjjd6vQh1xW6bSBaTvG+Y/gx/C4jB82LNbNPTxTHzayjaxt0YhpoDPmtXmQ414n4GPv
	 +3eC9iKgd4+uHHtYpVucWVM0T4m5vx3eoiw4SdAr8au5hc0AdUjAxBTFY32hjs9BslfIu
	 xwhLihPn3XC4iXU3pMMhof0yLBlnw/xrdXDdKuMeIWK42rYor0+B27cbMvZrsXO5VhljD
	 HKFv17cC+fl2EaN8bauYBqWVwsruJ/svQ9Seh3cjahmdfyV2D3FIqww4otc4BsYkhIg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795623271;
	bh=EJddFW3pJRcj73/XUXfRSWtXTzip2aRl1sdB5BAvaFk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G8FwICMxFdXOxuibDopv3xY2jvatT3h7VZz+v17wKRSyp/GrwY1elVzwYjaqMqWj1
	 iEUBXFXkmCZVHEDjoN0pO1xApEMrZIqXT+SitoKQuIwIvKsJwYlTQsdBOiTUhCbD5n
	 ifNeOh0iGvln5el7UA/BX1Ozmt8KUBAI8RzDDfpCafiRi+fyJ0dSyCZooAR500nZn7
	 c+PWBtJ7E4RrLRpLiSVx5ghQrYP89MFthzN9oEcbr+0U1gCXlyLQlTGLBampw2yIzb
	 C04EZhygkuB/0N7ZSovaBfRKEZee8Z8wfWqPjACFf4PYeyKFuOr8s0b3ik71b6qsGO
	 t/aCAjoRt9rZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2995C405B7;
	Wed, 25 Nov 2026 16:14:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACB7826D
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 930FF6088F
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7GduLOhfa2T8 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 16:14:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 819C7606DA
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=BvmJvtUj
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 819C7606DA
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 16:14:27 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb6ba3b244so61567005e9.3
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 08:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1795623265; x=1796228065;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=aj5AQUmKN8uDLIH8Ju3LsTAI1iFg9MZ7v0Mos97dY0A=;
 b=BvmJvtUjrstF3ObI6Xv6EDSSMjXTy8jarmDwk8+rpf1m/yeGBj4kzhV4hgUjMoyJT1
 rqzwMDK1WbGkifq0Zrw2/OSz+eU7uZES6+1XjfRm5Ela6iWVdgz/jg1/KEjVU1jUtJr7
 KHyI8WbCSHOAU7Fp3kUIkOqvUboNfOduM77Ow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795623265; x=1796228065;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=aj5AQUmKN8uDLIH8Ju3LsTAI1iFg9MZ7v0Mos97dY0A=;
 b=W2EyPFNJn1rq41zfXxfyYeOcHMcPTEdald4ZOjb6kUdOnRTFfPXq2kmeQBaw84HzIm
 DeT53PpcSv9INUdTBVlmaKIVysA6yeaZ/ujIPtyELk3NR3sI07QjPAwi0tbCkNaGUy/O
 mqIiY3uBoAWbTWwHSlwcyP6WACW7RFv6QsCCh+CX0YYKTT53l2r1hbMcrGG7E5jf1yFl
 Uq3EdTWj/hXh+BP9jX3q/Vb739vABMv8Se6JhGHSa/meuP5KSzOCOO25MyMzBvq+Wu1Q
 RjPkJT9Chb7cXhUMDcg2YaI8fZrssy8HBZU9cI1xr4JaVLiANnQKpFzCLfrjf/53Ej5U
 9WdQ==
X-Gm-Message-State: APuU4Z+zhbNaORDW6RNNdnjMe1y/oDiv3BsOeEq9o2Ews5fj2URkSpYI
 AMtci/Gp+UDgw9LGg/P8upUQkcWBRB5MV/M/mZBH/6S4k4JbQ7XhSCwppOKosz1asysDapKSxXb
 MbZ+G
X-Gm-Gg: AZFdTZfKf4k3fXp0l54BUN5J9K5W4J5XnSY8bcjXU8A2KuZm8PjpsDj67G7VJrVkixm
 MmnwOIx9XEuI+gJGoHdJAFD5ca+r86G6KJtF3cKKJSjBjbuVaMRy/Jh4CX1oATlFO1aI2h3Fdw+
 CTMU/ceD5NbsF/lN8C2LMDzeBuKLw5OC70QptAPTpDDkg7zAFx8HfcPLjPNdTeXiJ5VPpj+3ylO
 pNu8zRiUzu1r61Sxdijxpn850acrF8ZiMnTfarYIgOa/GkH1IkJapXKWYhelSEKcH1JKuIscCix
 d3cbPlLM4aiB/dqSYTy+uD5oLl17w9Kl4jBOpbs++j+51HvI5xo6Rve4Rahc3+rJH/Xzi1hhtWw
 hxkqQVppuX9il0YYIjQV8vDf+EgI4tOQgpcfFvvH237nlLhOlnGJPPbjy4f3/gth0jNzAk7CWQ1
 +dyWzhatMfU3mJpz5OWVvbrGp9eUUXryj/8g1OBNwspurSzwgNCxIb24kRIkpeADVoJ7KruxhOJ
 sOUbRn2N7IK1jbJkdXFDIsRq4oWiTI4ug/TGpWL83k6mKjRnWpKv2KMItmrRSi7PkI/+kxi4LXi
 IgkQ4jzlGvq761CYL8CqN9CBPFgJYmKQA4XFD+inDxrHtXckLKMKFIU0ZKFp9o6WB/XwjgM5LVs
 pRAwLGRB/CsVhHTp9u4NdFL8//0pG2q1+DKcFpQJrmilJeNNEeGlb3Fnm4Tb4fyRL9bt7DOlkZQ
 zfA1bTG2zLN5iZGCrcXYAK8AobuhU/zD+WMz+Vvz3Svw==
X-Received: by 2002:a05:600c:4e0c:b0:4bb:875b:f23f with SMTP id
 5b1f17b1804b1-4bb88827f0bmr354286435e9.33.1795623265277; 
 Wed, 25 Nov 2026 08:14:25 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb88402ce9sm430741055e9.0.2026.11.25.08.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 08:14:24 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 25 Nov 2026 17:14:00 +0100
Message-ID: <20261125161404.859000-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
References: <20261125161404.859000-1-dario.binacchi@amarulasolutions.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 1/5] package/sdl3: disable m68k builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SDL_alignment_test has a static assertion to ensure that its size is
2 * sizeof(void *), as SDL relies on this layout for its ABI.

Testing the SDL3 package by running:

  $ utils/test-pkg -p sdl3 -T bootlin-m68k-68040-uclibc

raised the following error:

  In file included from src/libm/k_sin.c:1:
  include/SDL3/SDL_stdinc.h:230:42: error: static assertion failed: "sizeof(SDL_alignment_test) == (2 * sizeof(void *))"
    230 | #define SDL_COMPILE_TIME_ASSERT(name, x) _Static_assert(x, #x)
        |                                          ^~~~~~~~~~~~~~
  include/SDL3/SDL_stdinc.h:1187:1: note: in expansion of macro 'SDL_COMPILE_TIME_ASSERT'
   1187 | SDL_COMPILE_TIME_ASSERT(struct_alignment, sizeof(SDL_alignment_test) == (2 * sizeof(void *)));

Since the m68k ABI results in a different structure size, disable m68k
builds.

Fixes: 2dd13e328f11 ("package/sdl3: new package")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/sdl3/Config.in | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/sdl3/Config.in b/package/sdl3/Config.in
index 7bce4ceaba9c..f5ba8b6a016b 100644
--- a/package/sdl3/Config.in
+++ b/package/sdl3/Config.in
@@ -1,5 +1,12 @@
+config BR2_PACKAGE_SDL3_ARCH_SUPPORTS
+	bool
+	default y
+	# Invalid size of the SDL_alignment_test struct on m68k
+	depends on !BR2_m68k
+
 config BR2_PACKAGE_SDL3
 	bool "sdl3"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -78,4 +85,5 @@ comment "OpenGL ES support needs an OpenGL ES provider"
 endif
 
 comment "sdl3 needs a toolchain w/ dynamic library, threads, wchar"
+	depends on BR2_PACKAGE_SDL3_ARCH_SUPPORTS
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
