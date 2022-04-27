Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4448EC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 18:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0171F416EF;
	Wed, 27 Apr 2022 18:55:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wBBqP8UqK9dy; Wed, 27 Apr 2022 18:55:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A81241638;
	Wed, 27 Apr 2022 18:55:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D89031BF322
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C76EA82BC8
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 18:55:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0_4bRZ0CEY9U for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 18:55:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 956D183112
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 18:55:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id j6so5161989ejc.13
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 11:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=NePPtf1b69X6t8YRWbmTAGPbXBaWmjuS2J4tZrM6Oes=;
 b=hF+icJJAq73Bw+JJFPiC+AebkOHc++eVZ8wlNv6ZZx7lhfMZDr7GaBZNN7jA3e/m16
 ecRDGqGt27w4L62GgKgXPlXCaKVVeX1iifTKzpEP2ubRiUYj/V1kHIM8zNvJ5dZ0gbW7
 i5wF1V9+Z2MPsC5dToLL0VBWmMb1P/rVprmCVtxd6zx/L379miCyq29gkAt5U6tt2B+G
 0A4Bm6TutYDMBv3J0cOcGWSzEuLJmeOkO35Gda3SDXFYyn5TMsZwsW5XTyEiAiabVHpK
 nlpi/Aw4flp23+CrTuss4baZRmKzxIIDutdaJNUZSDwP77n5y62Eji8m0znwufnX3z7h
 7qhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=NePPtf1b69X6t8YRWbmTAGPbXBaWmjuS2J4tZrM6Oes=;
 b=6C7kYOJvbUrVQ9B09INx4cxgjPcbF3VD0vUa39KotPtdyGN94CkPFZHjh827gNYEiV
 Tr2OVbANpe2HPx7S3Yo1Yvj9LmC+EaN/f8J6GcyxiVVdAvFJ8CXxY3vxdGFY+wllpoJk
 iVO2pXHGMFn8mx25EPDstAV3pS6tS3YhFxXEfccLc6MLv2plCs+2qGNX0XqRzue1X+EN
 znb4+/1dHy2hISY8EpjeazpJcWtmvmklsgaj5+YFpvfx/fnMwKOZqk1MaXUNt589qaix
 wNI/U7HIF5gONvekNaRRuMceLC46UIl7/XhyX/0b+2JW9RdR6EZ/SH78PmRjSPTeHMSg
 DX3A==
X-Gm-Message-State: AOAM5312fEFB1yF0cckwrHsmQx81nXuZJbrnl5zf1FR3cBldA3GOB3Pj
 AAfeUgACLi4EepAug3bU3nCJQA==
X-Google-Smtp-Source: ABdhPJyIKULCCG15fD3g+FkWbK1qfHQF3SjVkBz5+IJ3Xtc6cneVlJCzN3Tq7mSVilXJQpLhyzgtgw==
X-Received: by 2002:a17:906:fad6:b0:6f3:9ea7:1d49 with SMTP id
 lu22-20020a170906fad600b006f39ea71d49mr14176772ejb.635.1651085737781; 
 Wed, 27 Apr 2022 11:55:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 u26-20020a170906b11a00b006f3c3a382b8sm1779478ejy.3.2022.04.27.11.55.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 11:55:37 -0700 (PDT)
Message-ID: <644210a2-2745-6490-fb88-9ce133c86a06@mind.be>
Date: Wed, 27 Apr 2022 20:55:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20220426172129.3189250-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220426172129.3189250-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/ltp-testsuite: fix static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/04/2022 19:21, Fabrice Fontaine wrote:
> Fix the following static build failure:
> 
> /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
> syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...nel-fs-declare-int-openlog-as-static.patch | 77 +++++++++++++++++++
>   1 file changed, 77 insertions(+)
>   create mode 100644 package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
> 
> diff --git a/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
> new file mode 100644
> index 0000000000..ae10bfcfdd
> --- /dev/null
> +++ b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
> @@ -0,0 +1,77 @@
> +From 002ca0320cd2c5e1515bf202f470d4becdf01532 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sun, 24 Apr 2022 21:56:36 +0200
> +Subject: [PATCH] testcases/kernel/fs: declare int openlog as static
> +
> +Declare int openlog as static to avoid the following build failure when
> +building statically (e.g. on buildroot):
> +
> +/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
> +syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
> +[Retrieved from:
> +https://github.com/linux-test-project/ltp/commit/002ca0320cd2c5e1515bf202f470d4becdf01532]
> +---
> + testcases/kernel/fs/fs-bench/random-access-del-create.c | 2 --
> + testcases/kernel/fs/fs-bench/random-access.c            | 2 +-
> + testcases/kernel/fs/fs-bench/random-del-create.c        | 2 +-
> + testcases/kernel/fs/scsi/ltpfs/main.c                   | 2 +-
> + 4 files changed, 3 insertions(+), 5 deletions(-)
> +
> +diff --git a/testcases/kernel/fs/fs-bench/random-access-del-create.c b/testcases/kernel/fs/fs-bench/random-access-del-create.c
> +index 1f62a76b5e..1878fd78b5 100644
> +--- a/testcases/kernel/fs/fs-bench/random-access-del-create.c
> ++++ b/testcases/kernel/fs/fs-bench/random-access-del-create.c
> +@@ -11,8 +11,6 @@
> + #define FAIL 0
> + #define SUCCESS 1
> +
> +-int openlog[2] = { 0, 0 };
> +-
> + #define MAXNUM 0x100000
> +
> + #define  MAXERROR 1024
> +diff --git a/testcases/kernel/fs/fs-bench/random-access.c b/testcases/kernel/fs/fs-bench/random-access.c
> +index cf41d6e81c..c2f32b86e7 100644
> +--- a/testcases/kernel/fs/fs-bench/random-access.c
> ++++ b/testcases/kernel/fs/fs-bench/random-access.c
> +@@ -11,7 +11,7 @@
> + #define FAIL 0
> + #define SUCCESS 1
> +
> +-int openlog[2] = { 0, 0 };
> ++static int openlog[2] = { 0, 0 };
> +
> + #define MAXNUM 0x100000
> +
> +diff --git a/testcases/kernel/fs/fs-bench/random-del-create.c b/testcases/kernel/fs/fs-bench/random-del-create.c
> +index 0a86f976f3..345031f283 100644
> +--- a/testcases/kernel/fs/fs-bench/random-del-create.c
> ++++ b/testcases/kernel/fs/fs-bench/random-del-create.c
> +@@ -11,7 +11,7 @@
> + #define FAIL 0
> + #define SUCCESS 1
> +
> +-int openlog[2] = { 0, 0 };
> ++static int openlog[2] = { 0, 0 };
> +
> + #define MAXNUM 0x100000
> +
> +diff --git a/testcases/kernel/fs/scsi/ltpfs/main.c b/testcases/kernel/fs/scsi/ltpfs/main.c
> +index 2c67c7a478..90a5531ac3 100644
> +--- a/testcases/kernel/fs/scsi/ltpfs/main.c
> ++++ b/testcases/kernel/fs/scsi/ltpfs/main.c
> +@@ -38,7 +38,7 @@ int startc = 0;
> + int showchar[] = { 124, 47, 45, 92, 124, 47, 45, 92 };
> +
> + int nullFileHandle;
> +-int openlog[2] = { 0, 0 };
> ++static int openlog[2] = { 0, 0 };
> +
> + int cFileCount, dFileCount, errorCount;
> + static int disk_space_pool = 0;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
