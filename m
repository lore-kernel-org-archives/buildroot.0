Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EB6DC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 05:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A5BA60661;
	Mon, 18 Mar 2024 05:24:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zItoGdijJnRQ; Mon, 18 Mar 2024 05:24:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B418605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B418605C7;
	Mon, 18 Mar 2024 05:24:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8880A1BF368
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 05:24:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7619F605C7
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 05:24:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Agb7F2CnQ_ID for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 05:24:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=pieterjanca@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 309CB605C2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 309CB605C2
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 309CB605C2
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 05:24:45 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4141156f245so2337415e9.2
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 22:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710739483; x=1711344283;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3cE/0nRijy7R4m/jHNRAyudjdQIr5aFWU2Lvn+FoEfQ=;
 b=Z0bIyNEmPIqTv5dXYSbOP9KIW4RijZoYfNKIcf3L3Iz4D/5LkYfGWmM9zIRu/gVD0a
 sagPVUVHJRfjGJqVvyiZjrJvn7XsOHxiWaTqncOXg2jTik5lsTX2yOOC5ZDeumO9Az4Y
 CxwJOgN5DTtuliY8kqXDkmQoXuhvlND/cjZZ2mdCv0V75wpC67vnD2JDPStD2okhh8kf
 Q0YusJMGYEJJaHbuvszSWDh6SnfpEEl9NUlN2AqqFbF+0qIT/Crm2YtEqIlu+D8plj0o
 QTAv1ipgXAUGyCqLqjHdV6oqabplMGbLnXwAEN1JbzAYDnLl+RVnnz7w9T7VpLStwFra
 eTqA==
X-Gm-Message-State: AOJu0YxCG/hvVnUTYfAsuOMCL9t2nKmVktepW8BOxaKHnzz2xfYxL3m4
 GbVXTXwzMIWB2mrfL3oKAXO2NXLfloyYqsgZObwkAbgg33IUhD0=
X-Google-Smtp-Source: AGHT+IEQP5OWIbc/P843uwlxp+HH8gCLj3gHcpXNB3C2QC0uUEmyjSuAyYfDJ4Re+wtbOeH4YxKnug==
X-Received: by 2002:adf:fc08:0:b0:33e:749b:fa13 with SMTP id
 i8-20020adffc08000000b0033e749bfa13mr6252946wrr.69.1710739482566; 
 Sun, 17 Mar 2024 22:24:42 -0700 (PDT)
Received: from pca (ptr-dc5856q33dollhcf8mp.18120a2.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0:9c44:1b61:fc46:d971])
 by smtp.gmail.com with ESMTPSA id
 bo16-20020a056000069000b0033ecb111a5csm8771288wrb.83.2024.03.17.22.24.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 22:24:42 -0700 (PDT)
Date: Mon, 18 Mar 2024 06:24:39 +0100
From: Pieterjan Camerlynck <pieterjanca@gmail.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240318052439.22eb54hommuoadml@pca>
References: <20240317144701.1042537-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240317144701.1042537-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710739483; x=1711344283; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3cE/0nRijy7R4m/jHNRAyudjdQIr5aFWU2Lvn+FoEfQ=;
 b=WFY///4vq5s0OXzd9N7RnG5gfjk0TYRQ7ubHvUwB9/q2BCHGRjRxIuJcPcRLdVQRZs
 6FRD7mODXDKOu9IY8Og1QYRCKeMnqdW8zW+ksGFXWwLMq+d79acMY2kEKg4s4uFn4T2N
 fWM+f/HZpBeWidW4975C6Vap1P+zmhJiAV/jhv6ZMlTnxDLb3k29RuVSwlj6JV7+zQKK
 gK+i7AgfSimQaTgiGtLbSwWeZf5ZBgX5Nk43KMDSGYyd3NyJRcVev6uEuv3X6Y16800k
 zYnHJLx0EMJAZjJFBCJxN3AOlOlAj+a/cAcdmwH3xW8eTphbG+pK14buMEVEVSNx1KrZ
 IdgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=WFY///4v
Subject: Re: [Buildroot] [PATCH 1/1] package/mraa: fix build with musl >=
 1.2.5
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Mar 17, 2024 at 03:47:01PM +0100, Fabrice Fontaine wrote:
> Fix the following build failure with musl >= 1.2.5 (raised since commit
> f7f03445cf320adbbc41270a806b38c911d3454a):
> 
> /home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c: In function 'mraa_count_iio_devices':
> /home/autobuild/autobuild/instance-9/output-1/build/mraa-2.2.0/src/mraa.c:341:38: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Werror=implicit-function-declaration]
>   341 |     if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
>       |                                      ^~~~~~~~
>       |                                      rename
> 
> Fixes: f7f03445cf320adbbc41270a806b38c911d3454a
>  - http://autobuild.buildroot.org/results/1f16df70e49a9f8823a791c0fcc677de07136835
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Pieterjan Camerlynck <pieterjanca@gmail.com>

> ---
>  .../mraa/0002-mraa-Use-posix-basename.patch   | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/mraa/0002-mraa-Use-posix-basename.patch
> 
> diff --git a/package/mraa/0002-mraa-Use-posix-basename.patch b/package/mraa/0002-mraa-Use-posix-basename.patch
> new file mode 100644
> index 0000000000..3c5c99f031
> --- /dev/null
> +++ b/package/mraa/0002-mraa-Use-posix-basename.patch
> @@ -0,0 +1,45 @@
> +From 47c3850cddd63cebd9dc48e411963314449118f1 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Sun, 31 Dec 2023 19:16:35 -0800
> +Subject: [PATCH] mraa: Use posix basename
> +
> +Musl has removed the declaration from string.h [1] which exposes the
> +problem especially with clang-17+ compiler where implicit function
> +declaration is flagged as error. Use posix basename and make a copy of
> +string to operate on to emulate GNU basename behaviour.
> +
> +[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +Upstream: https://github.com/eclipse/mraa/commit/47c3850cddd63cebd9dc48e411963314449118f1
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/mraa.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/mraa.c b/src/mraa.c
> +index 653ea1fa7..b556d0455 100644
> +--- a/src/mraa.c
> ++++ b/src/mraa.c
> +@@ -12,6 +12,7 @@
> + #endif
> + 
> + #include <dlfcn.h>
> ++#include <libgen.h>
> + #include <pwd.h>
> + #include <sched.h>
> + #include <stddef.h>
> +@@ -341,9 +342,11 @@ static int
> + mraa_count_iio_devices(const char* path, const struct stat* sb, int flag, struct FTW* ftwb)
> + {
> +     // we are only interested in files with specific names
> +-    if (fnmatch(IIO_DEVICE_WILDCARD, basename(path), 0) == 0) {
> ++    char* tmp = strdup(path);
> ++    if (fnmatch(IIO_DEVICE_WILDCARD, basename(tmp), 0) == 0) {
> +         num_iio_devices++;
> +     }
> ++    free(tmp);
> +     return 0;
> + }
> + 
> -- 
> 2.43.0
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
