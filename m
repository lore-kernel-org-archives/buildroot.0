Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1FC606A334
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XT+IE+su
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A823660A86;
	Fri,  6 Nov 2026 16:09:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLFJ3JVJiGou; Fri,  6 Nov 2026 16:09:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A151760A79
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981389;
	b=RzcVER0f9F2amVX29APTLc/C3zwT62IRlGlVC2fPja1gv5o46FROd1yGUbE03eacznEU
	 T+3AVvtF/Kl5IFJqPh9ucBfuRhsow8Lz7SQbdkXmlQgflqe09dend2tVOoeZ7SWmRmQ+K
	 5mFe6ySc00GIS8P3LhhafIgHQv8FeE62R+WOR7QF8vfJ2J6Yv8KzHkoJS4GiksVctRaQL
	 uw3cjQCGTMS2n63H2tiEwN1ZhICB7Jrg9WyXmtIBryLIBXAGWEzfEQbAgAuRQPrSHfmpv
	 1AIIIzJ3RkJpYfA6PXD4w436x1wrBckboO75nxu6r007IBPjA71S0ZL75efoBKjuLjg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981389;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Y3I3WrC4P2x/m55hiVLMpxKXmvB2ZzDsqzYloJBs5OM=;
	b=keLlKmBUZAItF8u4CBTb2m1vQ6HZTkWQ4KulfRBQcuQyvPlzeDNugXC/pspQ3K4St4s+
	 MyEKtEX7sOvNQOjTXWfy40ziJe4JTkbCZFi418kVi4vkJcpf3mvO+Th3ylz29RKLDn6qd
	 Xl0gMJzZk/vfAvc1k2TfI6NLlPkHNF2ALi09yE9udk+6KeyWTAPpYnRaatm29emhVBMMN
	 WaciqJZTpcc6dNeudDPnZsh3HnFH9hZv9XG3fR0kllB1gp6Pm0pyYWb+fftRoIZsRb40J
	 X/k2sgGELymuj81Pl9zzkGevZ7qyX3E+5q0vNkbXcSuNo76SJu2RkCHs2u2nwiV5YWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981389;
	bh=Y3I3WrC4P2x/m55hiVLMpxKXmvB2ZzDsqzYloJBs5OM=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=XT+IE+sub2qkRMHGOGyfN+nh6rOJDTof4jEnf4XTc58sG0wAQeEWHytrEDa7+gKIR
	 EONjYegk0o/Kit4ZCdzBXWEuMsD2UIndtFyruwhwSIjJitViOUsWYJaxNUeTJX4Wwb
	 ljU7eHNIUTwOaJhBGfB/bB10GbZu36/7AgD4sqfJLlnaTVkoi6zsJsRfoyUf0NNuDM
	 L0aPp4NYEioJVjKWMifjJLhmLkwpnPiLAX61Dk0D/uP6m5uXaacAsjbdWNSLgF7zYI
	 A81i8ekrZ1s7T8N72HOZ24DkUH+yj3tzg2ReugJf36c0e0yJRS8XoZHsroIDe9Niex
	 ZPHnCI3QSiMXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A151760A79;
	Fri,  6 Nov 2026 16:09:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D21AE2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C4108400AF
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lp39YWj-PyWQ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:09:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 93839403CB
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93839403CB
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:09:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a35d5d4a20so8386055e9.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 08:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793981361; x=1794586161;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=0mCLUd3R7CLQ63MqDPEp4gZ2kcW2OmVgXI+eI4H3JfE=;
 b=Kec+5wrtG/tqtVLqP0BOPPe49AX8Ix5SRyyMo28k5CebPWp3lRGnkur/UzHRz1LyEA
 K8V/p8ZdkJxDpTqmkZhEOKSzPj69V/zc+ocQNkhvT3EFyqaOX1AEYW72q5o5wGKuAEzK
 3n8qiFmLx4l7aB39pkg7R8zPeDgAGt/eeAT0T3EW1tKmWGc/OZvLkjq4TmWP/Bt3Y0dw
 UXA3tv9Y1i2qFEqw9UIzkQtInbRrKsViHViW2BrmbPgKg53mZIbNYL2RAh+Nv1gshXpF
 1PcEi1A/jfV6NeIGyUhLD13/+A6/aR+sE0uORB91Qgub9WTZoZgFf7vvxnvtf5QFLEND
 5Fbw==
X-Gm-Message-State: APuU4Z+plkzpUMdoyKtk4f4k7vtyBtmqqmSywimNQ5FbBKKXixwmp6wx
 IBU69Pn8OCIkXkKvif2jFwhHpzhuDrTCxJ1sbAqToLWW69eLMt1RhpBfmddAnDNv+cvYr4V7i5D
 3DCyoDpc=
X-Gm-Gg: AYBFou0C7eWrsYbMFkee047XCyYKwnKv8s6yDWZ6W+amM4JTLKYShipFbC3fmlQwUP6
 tDDbeYRL2lhPckeSmVLiRR4BAizvCPsA+7+XiR9d5KrSJFZlfBK2gia2LpZSe3e7VV6yBIbAgZo
 gBvrbeLO1SJw73HCjpZ49HJf/YkssXeSBEGdGEYVS/IJdI8C0yryJ6rEoSKnbugYD3GKdA+VujR
 oIY29AwYYloe4YLHgaFdp2hy6Ax7AtvKKrQ/gt2gl2awYPlvmaunF9JzqiYZdqioh+wabgPLfg9
 U0VUmpOZ6w3YgeW7AM9JJY6V7o12nc0qHUkFzo7SBZabw+eUDcQ5nwjIgkciUToQNM8HffC/ggb
 NA5mUL/0PNBqa7pI48+pxf2BxgwVA6aCuZhLNZxbD3a3YXfefqaprX/HfzpX04MdfM53Cfyj2/J
 eXU6PNm4yNO6mqB9OuNt2dnbaTCCf3E0t9/fktTc6qPaJf78OWtX9Y/YuB4NndnwQzM5C6lASeL
 cxDNx9cDld677TofbSE4mIMRJhEQZpYWrlc7P0Njm8L/QZQCVjEdyDAWxW4vo7KjXa/c7f9BevS
 HsmpNU8IVy/rRuP1SndM+e0PCRXAOOY=
X-Received: by 2002:a05:600c:8114:b0:4a3:5991:719 with SMTP id
 5b1f17b1804b1-4b6e0267f25mr48178915e9.31.1793981361329; 
 Fri, 06 Nov 2026 08:09:21 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b6e1b5d745sm63956915e9.6.2026.11.06.08.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 08:09:20 -0800 (PST)
To: buildroot@buildroot.org,
	Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  6 Nov 2026 17:09:17 +0100
Message-ID: <20261106160919.607109-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026135226.1614907-1-yegorslists@googlemail.com>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/ccrypt: fix build with GCC 15 on
 musl
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
> When cross-compiling, ccrypt's configure can't run its getopt_long
> test and always falls back to the bundled getopt. Its getopt.h only
> prototypes getopt() when __GNU_LIBRARY__ is defined (glibc, uClibc),
> so on musl it declares "extern int getopt ();", and getopt.c declares
> "extern char *getenv ();". GCC 15 defaults to C23, where an empty
> parameter list means (void), so the build fails:
> 
>   unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
>   ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
>   getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
> 
> Add a patch that always uses the full POSIX prototype for getopt()
> and gives getenv() its standard prototype.
> 
> This issue has been present since commit 75891397abe6 ("package/gcc:
> add support for GCC 15.x"), which made a C23-by-default compiler
> available. It therefore affects 2025.08 and later, including the
> 2026.02.x LTS branch.
> 
> Fixes:
> https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e
> 
> Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to 2026.08.x. Thanks

> ---
>  ...h-C23-compilers-on-non-glibc-systems.patch | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
> 
> diff --git a/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
> new file mode 100644
> index 0000000000..002d011062
> --- /dev/null
> +++ b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
> @@ -0,0 +1,56 @@
> +From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
> +From: Yegor Yefremov <yegorslists@googlemail.com>
> +Date: Mon, 26 Oct 2026 14:41:24 +0100
> +Subject: [PATCH] Fix build with C23 compilers on non-glibc systems
> +
> +C23 (the default since GCC 15) treats an empty parameter list as
> +(void). The bundled getopt only prototypes getopt() when
> +__GNU_LIBRARY__ is defined and declares getenv() without parameters,
> +so building against e.g. musl fails:
> +
> +  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
> +  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
> +  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
> +
> +Always use the full POSIX prototype for getopt() and give getenv() its
> +standard prototype.
> +
> +Upstream: https://sourceforge.net/p/ccrypt/patches/7/
> +Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> +---
> + src/getopt.c                | 2 +-
> + src/include/getopt/getopt.h | 7 -------
> + 2 files changed, 1 insertion(+), 8 deletions(-)
> +
> +diff --git a/src/getopt.c b/src/getopt.c
> +index 23ab9c3..9974486 100644
> +--- a/src/getopt.c
> ++++ b/src/getopt.c
> +@@ -209,7 +209,7 @@ static char *posixly_correct;
> +    whose names are inconsistent.  */
> + 
> + #ifndef getenv
> +-extern char *getenv ();
> ++extern char *getenv (const char *);
> + #endif
> + 
> + static char *
> +diff --git a/src/include/getopt/getopt.h b/src/include/getopt/getopt.h
> +index 1abae0f..d8b4edd 100644
> +--- a/src/include/getopt/getopt.h
> ++++ b/src/include/getopt/getopt.h
> +@@ -141,14 +141,7 @@ struct option
> +    `getopt'.  */
> + 
> + #if defined __STDC__ && __STDC__
> +-# ifdef __GNU_LIBRARY__
> +-/* Many other libraries have conflicting prototypes for getopt, with
> +-   differences in the consts, in stdlib.h.  To avoid compilation
> +-   errors, only prototype getopt for the GNU C library.  */
> + extern int getopt (int argc, char *const *argv, const char *__shortopts);
> +-# else /* not __GNU_LIBRARY__ */
> +-extern int getopt ();
> +-# endif /* __GNU_LIBRARY__ */
> + 
> + # ifndef __need_getopt
> + extern int getopt_long (int argc, char *const *argv, const char *shortopts,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
