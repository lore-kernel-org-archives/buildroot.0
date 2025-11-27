Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30B3D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BCA24140B;
	Thu, 27 Nov 2025 20:00:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUQ5h6_TEk3n; Thu, 27 Nov 2025 20:00:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4FE541409
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4FE541409;
	Thu, 27 Nov 2025 20:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7BF8F708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6263B404CD
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRdKSyF8JtPF for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:00:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 216224023A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 216224023A
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 216224023A
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:00:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11D44B979CE5; Thu, 27 Nov 2025 21:00:06 +0100 (CET)
Message-ID: <fd0356f8-21ed-4b32-af6e-82f923eda965@rnout.be>
Date: Thu, 27 Nov 2025 21:00:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20251115113347.183802-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251115113347.183802-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273606; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=h0xDb58Vze0VtejMO5nTBQQS4BaqxJLV7CoEFYj+8Bk=;
 b=TW6wKF7UZJshXNuAceEAhMpZIZuWF7CL7ZIObvf0uWKhq2nCPRwIjkMRxqPJK/7bhagsWC
 GNOTJX+bporOhsKodYLXLk0ukHn4KgmFtdkF+Qbws/THz9d+dF00SyB+TiKHi/56ZL4KCb
 /A8/2Kq3MyVIdMX9Itlh3E5LBvd8iXLOnAiWmRDidCXkQyY/zNUqRuO7trcdmeuyAjTPCT
 CyR4QYvVOH1P5ux50eDYMfT+mTkRJaHVlHuGZTQV/eYD/cuyeIzlpj1QjZOtYTujqhoF7M
 mPQaTmdT40dBLBWnYEvaEbBuIruQ9rI7deni4VNS5U0VtRVRnc6fUEKSfbo3JQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=TW6wKF7U
Subject: Re: [Buildroot] [PATCH 1/1] package/libroxml: fix musl build errors
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 15/11/2025 12:33, Bernd Kuhls wrote:
> Fixes:
> https://autobuild.buildroot.net/results/0ff/0ff4394319d2014884328c347ef495da327a562e/
> 
> Added Upstream tag to patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   .checkpackageignore                           |  1 -
>   ...1-src-roxml_mem.h-add-missing-extern.patch |  3 +-
>   .../libroxml/0002-Fix-musl-build-errors.patch | 69 +++++++++++++++++++
>   3 files changed, 71 insertions(+), 2 deletions(-)
>   create mode 100644 package/libroxml/0002-Fix-musl-build-errors.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 42a04d2a6b..4821f41cce 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -596,7 +596,6 @@ package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
>   package/libp11/0001-src-p11_attr.c-fix-build-with-gcc-4.8.patch lib_patch.Upstream
>   package/libpthsem/0001-fix-build-on-linux-3.x-host.patch lib_patch.Upstream
>   package/libressl/0001-always-expose-SSL_OP_NO_TLSv1_3.patch lib_patch.Upstream
> -package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch lib_patch.Upstream
>   package/librsvg/0001-gdk-pixbuf-loader-Makefile.am-set-GDK_PIXBUF_MODULED.patch lib_patch.Upstream
>   package/librtlsdr/0001-Makefile.am-respect-DESTDIR-with-install-udev-rules.patch lib_patch.Upstream
>   package/libselinux/0001-Do-not-use-PYCEXT-and-rely-on-the-installed-file-nam.patch lib_patch.Upstream
> diff --git a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
> index 6f63d7b546..12e67f9c91 100644
> --- a/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
> +++ b/package/libroxml/0001-src-roxml_mem.h-add-missing-extern.patch
> @@ -13,8 +13,9 @@ libtool: link: /home/peko/autobuild/instance-0/output-1/host/bin/arm-buildroot-l
>   Fixes:
>    - http://autobuild.buildroot.org/results/b6ac3664d61ad826515b57c4d057b6f001b5167d
>   
> +Upstream: https://github.com/blunderer/libroxml/commit/34257124eefe0ca095ed54681c818381070ed549
> +
>   Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/blunderer/libroxml/pull/79]
>   ---
>    src/roxml_mem.h | 2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
> diff --git a/package/libroxml/0002-Fix-musl-build-errors.patch b/package/libroxml/0002-Fix-musl-build-errors.patch
> new file mode 100644
> index 0000000000..4931f12d5b
> --- /dev/null
> +++ b/package/libroxml/0002-Fix-musl-build-errors.patch
> @@ -0,0 +1,69 @@
> +From abf4404c6c0213666f3fce73cff6e51435eac923 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Sat, 15 Nov 2025 12:29:33 +0100
> +Subject: [PATCH] Fix musl build errors
> +
> +src/roxml_cat.c: In function 'display_usage':
> +src/roxml_cat.c:21:22: error: implicit declaration of function 'basename'; did you mean 'rename'? [-Wimplicit-function-declaration]
> +   21 |         char *name = basename(prgname);
> +      |                      ^~~~~~~~
> +      |                      rename
> +src/roxml_cat.c:21:22: error: initialization of 'char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
> +
> +src/roxml_mem.c: In function 'roxml_malloc':
> +src/roxml_mem.c:138:18: error: assignment to 'long unsigned int' from 'pthread_t' {aka 'struct __pthread *'} makes integer from pointer without a cast [-Wint-conversion]
> +  138 |         cell->id = pthread_self();
> +
> +src/roxml_utils.h:51:16: error: returning 'pthread_t' {aka 'struct __pthread *'} from a function with return type 'long unsigned int' makes integer from pointer without a cast [-Wint-conversion]
> +   51 |         return pthread_self();
> +
> +Upstream: https://github.com/blunderer/libroxml/pull/86
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + src/roxml_cat.c   | 1 +
> + src/roxml_mem.c   | 2 +-
> + src/roxml_utils.h | 2 +-
> + 3 files changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/roxml_cat.c b/src/roxml_cat.c
> +index 11e42d9..4320efd 100644
> +--- a/src/roxml_cat.c
> ++++ b/src/roxml_cat.c
> +@@ -5,6 +5,7 @@
> + #include <getopt.h>
> + #include <string.h>
> + #include <errno.h>
> ++#include <libgen.h>
> + #include "roxml.h"
> +
> + static struct option long_options[] =
> +diff --git a/src/roxml_mem.c b/src/roxml_mem.c
> +index 91b5db2..bf757bb 100644
> +--- a/src/roxml_mem.c
> ++++ b/src/roxml_mem.c
> +@@ -135,7 +135,7 @@ ROXML_INT void *roxml_malloc(int size, int num, int type)
> + 	cell->next->prev = cell;
> + 	cell = cell->next;
> + 	cell->type = type;
> +-	cell->id = pthread_self();
> ++	cell->id = (unsigned long)pthread_self();
> + 	cell->occ = size;
> + 	cell->ptr = calloc(num, size);
> + 	head_cell.prev = cell;
> +diff --git a/src/roxml_utils.h b/src/roxml_utils.h
> +index 3f50976..f5fc582 100644
> +--- a/src/roxml_utils.h
> ++++ b/src/roxml_utils.h
> +@@ -48,7 +48,7 @@ ROXML_STATIC_INLINE ROXML_INT int roxml_unlock(node_t *n)
> + #else /* CONFIG_XML_THREAD_SAFE==1 */
> + ROXML_STATIC_INLINE ROXML_INT unsigned long int roxml_thread_id(node_t *n)
> + {
> +-	return pthread_self();
> ++	return (unsigned long)pthread_self();
> + }
> +
> + ROXML_STATIC_INLINE ROXML_INT int roxml_lock_init(node_t *n)
> +--
> +2.47.3
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
