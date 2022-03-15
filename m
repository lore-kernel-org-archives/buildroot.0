Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C02EC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF8D6404F0;
	Tue, 15 Mar 2022 21:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EY7x7HdKTX95; Tue, 15 Mar 2022 21:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7795240154;
	Tue, 15 Mar 2022 21:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6268F1BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5183340880
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:20:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCP59D_FH4gs for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:20:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 168674056A
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:20:43 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id b15so450234edn.4
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 14:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iMFbwFtZjkD+3GTBi2TUUxNjyVHzQjBxJUzZXjf2jkE=;
 b=eW6CLKIOpHw1BcsjvNrwHZxtwvzn1yJt1taw8GQA6CpLVIXWYGQYvS2cg1+LSvMawg
 8EsGUnMbFQ2rrA+tlgX6J2BLg0KOADA6806rVIgeCFPH0DVWQOOTC/SMuquchQ/d/3U0
 ZJL0u4C4tyVkhXgspxR30e2DTNFI4L2wSDfY3Se8wr/qUdRZvm7wHJicGVTkWDTxjvtj
 LVT4rkLw9CCM7WdBEg1DjPEyZpG4ENhCLypbNnjc6k1i7uew6vm8DkMgX44fwOMLfft+
 /2UCN0sWNrK9hkz/1TuVMbygmY/zibHn8dnMVAXOKQJyye1eYXvPW9xZU/DFrp96JfQY
 CafQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iMFbwFtZjkD+3GTBi2TUUxNjyVHzQjBxJUzZXjf2jkE=;
 b=7lBhpFJ5b/V/BfO3hKkg6xSQq06mWQxRYG5siuqL4amUfhYlbRIEhVV2g/pKPUl7HL
 2W7nxuerjZj3CytQB0Xvpw/SQ7hw8AEND7zUAQXKH5er0ojC2u1SaC6ZNjSeA/PEK9+K
 rrQsGjl6g3niUlKoQJrLK8ZnnEvlAUU16HXPXxEpwNj9rkf4A1wLznfEfXeML6QJ9LDL
 a8qh6IS4KQregNX+6SoO0DEZnQKyFR9DVxSuPUyYQslFBi7uz81+Gkx74Dvs1TZ47aer
 vdOvclrAEnqOtmRXv5LtxyrtXHeFq5elGw0VUvop010IcYMshR7F7es/9R9rmdxgOvKM
 VqbA==
X-Gm-Message-State: AOAM533+x+8OLmXunJu2pIvcuv6FuNE6SnjvsQ1O84kmypxgpk58zYb0
 ZkQC4Es74WRPF+nOU/7k7t59rw==
X-Google-Smtp-Source: ABdhPJyWw54uwxPM4joxW0bIpXY60OzWltjGRhqWWnmhoZOHwcSYnxaRW9EpIPhUGee7Rc+TdltoOw==
X-Received: by 2002:a05:6402:27cb:b0:416:c67f:c03d with SMTP id
 c11-20020a05640227cb00b00416c67fc03dmr23338194ede.316.1647379241975; 
 Tue, 15 Mar 2022 14:20:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 sh42-20020a1709076eaa00b006df78692a9csm72707ejc.94.2022.03.15.14.20.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:20:41 -0700 (PDT)
Message-ID: <312e14e4-4f32-98c2-ed42-0e40e18ff7c5@mind.be>
Date: Tue, 15 Mar 2022 22:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-GB
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20220305175041.2225915-1-ju.o@free.fr>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220305175041.2225915-1-ju.o@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.20
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



On 05/03/2022 18:50, Julien Olivain wrote:
> This commit dropped a patch included upstream. The other patch was
> rebased.
> 
> For change log since v0.3.18, see:
> - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.19
> - https://github.com/xianyi/OpenBLAS/releases/tag/v0.3.20
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
> Tested with:
> 
>      make check-package
>      ...
>      0 warnings generated
> 
>      ./utils/test-pkg -p openblas -a
>      ...
>      45 builds, 25 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
> ---
>   ...nsider-Os-when-determining-LAPACK_NO.patch | 31 -------------------
>   ...on-t-specify-optimization-level-bui.patch} |  9 +++---
>   package/openblas/openblas.hash                |  2 +-
>   package/openblas/openblas.mk                  |  2 +-
>   4 files changed, 6 insertions(+), 38 deletions(-)
>   delete mode 100644 package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
>   rename package/openblas/{0002-Makefile.system-don-t-specify-optimization-level-bui.patch => 0001-Makefile.system-don-t-specify-optimization-level-bui.patch} (86%)
> 
> diff --git a/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch b/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
> deleted file mode 100644
> index f9278bd099..0000000000
> --- a/package/openblas/0001-Makefile-also-consider-Os-when-determining-LAPACK_NO.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From ced08de1ad74811bc23d74121751537bfd8e9556 Mon Sep 17 00:00:00 2001
> -From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> -Date: Fri, 5 Mar 2021 11:15:52 +0100
> -Subject: [PATCH] Makefile: also consider -O, -Og and -Os when stripping flags
> -
> -gcc also supports -O, -Og and -Os as optimization flags.
> -They may be given on the make command-line by users.
> -
> -For the calculation of LAPACK_NOOPT, all such flags should be considered.
> -
> -Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index a22e16ba..fc5fe3f5 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -32,7 +32,7 @@ export NOFORTRAN
> - export NO_LAPACK
> - endif
> -
> --LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast,$(LAPACK_FFLAGS))
> -+LAPACK_NOOPT := $(filter-out -O0 -O1 -O2 -O3 -Ofast -O -Og -Os,$(LAPACK_FFLAGS))
> -
> - SUBDIRS_ALL = $(SUBDIRS) test ctest utest exports benchmark ../laswp ../bench cpp_thread_test
> -
> ---
> -2.26.2
> -
> diff --git a/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> similarity index 86%
> rename from package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
> rename to package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> index bcc3e0eb6a..e0c738748a 100644
> --- a/package/openblas/0002-Makefile.system-don-t-specify-optimization-level-bui.patch
> +++ b/package/openblas/0001-Makefile.system-don-t-specify-optimization-level-bui.patch
> @@ -1,4 +1,4 @@
> -From 6d1c1350977d74fb2239f765bd92a5763cd3bb73 Mon Sep 17 00:00:00 2001
> +From d8ec4e4c6ef69165179f376e365034de10e6fee3 Mon Sep 17 00:00:00 2001
>   From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
>   Date: Fri, 5 Mar 2021 14:09:23 +0100
>   Subject: [PATCH] Makefile.system: don't specify optimization level
> @@ -12,16 +12,15 @@ The CFLAGS/FFLAGS would e.g. contain '-Os -O2' in which -O2 survives.
>   Remove the optimization level specified in openblas itself.
>   
>   Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> -
>   ---
>    Makefile.system | 4 ++--
>    1 file changed, 2 insertions(+), 2 deletions(-)
>   
>   diff --git a/Makefile.system b/Makefile.system
> -index 1e30d05a..04b0be16 100644
> +index 438a8148..9de1bbd5 100644
>   --- a/Makefile.system
>   +++ b/Makefile.system
> -@@ -1216,11 +1216,11 @@ FCOMMON_OPT += -g
> +@@ -1519,11 +1519,11 @@ FCOMMON_OPT += -g
>    endif
>    
>    ifndef COMMON_OPT
> @@ -36,5 +35,5 @@ index 1e30d05a..04b0be16 100644
>    
>    override CFLAGS     += $(COMMON_OPT) $(CCOMMON_OPT) -I$(TOPDIR)
>   --
> -2.26.2
> +2.35.1
>   
> diff --git a/package/openblas/openblas.hash b/package/openblas/openblas.hash
> index a1e35f4fc4..71fc4d34c5 100644
> --- a/package/openblas/openblas.hash
> +++ b/package/openblas/openblas.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  1632c1e8cca62d8bed064b37747e331a1796fc46f688626337362bf0d16aeadb  openblas-0.3.18.tar.gz
> +sha256  8495c9affc536253648e942908e88e097f2ec7753ede55aca52e5dead3029e3c  openblas-0.3.20.tar.gz
>   sha256  190b5a9c8d9723fe958ad33916bd7346d96fab3c5ea90832bb02d854f620fcff  LICENSE
> diff --git a/package/openblas/openblas.mk b/package/openblas/openblas.mk
> index 4d506fa618..608c2f24ea 100644
> --- a/package/openblas/openblas.mk
> +++ b/package/openblas/openblas.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -OPENBLAS_VERSION = 0.3.18
> +OPENBLAS_VERSION = 0.3.20
>   OPENBLAS_SITE = https://github.com/xianyi/OpenBLAS/releases/download/v$(OPENBLAS_VERSION)
>   OPENBLAS_LICENSE = BSD-3-Clause
>   OPENBLAS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
