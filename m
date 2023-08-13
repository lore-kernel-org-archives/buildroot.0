Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC21C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 07:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 79BF281A5F;
	Sun, 13 Aug 2023 07:59:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79BF281A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4DvKxU-PsXn8; Sun, 13 Aug 2023 07:59:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AABB081A50;
	Sun, 13 Aug 2023 07:59:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AABB081A50
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D2AF91BF21A
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABAC781A50
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 07:59:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABAC781A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rqhy6cmYO-Mu for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 07:59:29 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CA4C8194A
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 07:59:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CA4C8194A
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A03E8780304;
 Sun, 13 Aug 2023 09:59:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 09:59:23 +0200
Date: Sun, 13 Aug 2023 09:59:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francis Laniel <flaniel@linux.microsoft.com>
Message-ID: <20230813075923.GW421096@scaer>
References: <20230811152710.43564-1-flaniel@linux.microsoft.com>
 <20230811152710.43564-3-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230811152710.43564-3-flaniel@linux.microsoft.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691913566;
 bh=nj2CFXYC/2XVQM3iqosejz3/MGJMxiZNjGN22oTZjrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RPkfVvmNe0LYZUN4MDZuY8G5XU1niO+/9TuSb4sdHQoaXn0EqKkrQNm/6jSgFxa7j
 +3hdD+eFWJlkoXSqXqIEgqsSlfFyCKnjE7b5ehFKP/6fvYrZ4jgPKn1Qua5TxZ5plE
 2RmtRWZQjzWqp4JZcRWSeJRzJCety0zcFPVzmm+t/lDLX6ung0yaRc2Ah+c1mv4aOs
 sxDpPk0RYZLkNW5/wLVdy/CyK2W+9jsfWARFptHOINYWE/cvSjswVs4WiTRsNmkZ6o
 4XQK/ykQ41zIChtLjtUhSzgNKesblYdHbrN/IaJd6dTNlmqYSX4qvxunyqPyJsiIxL
 zHR2mfJ0Tep/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RPkfVvmN
Subject: Re: [Buildroot] [RFC PATCH v2 2/3] package/sysdig: bump to version
 0.31.4
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Francis, All,

On 2023-08-11 17:27 +0200, Francis Laniel spake thusly:
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>

Ditto, please expand on the commit log.

> ---
>  package/sysdig/sysdig.hash | 2 +-
>  package/sysdig/sysdig.mk   | 9 +++++++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> index cda3de5e7c..902f6f2b82 100644
> --- a/package/sysdig/sysdig.hash
> +++ b/package/sysdig/sysdig.hash
> @@ -1,3 +1,3 @@
>  # sha256 locally computed
> -sha256  6b96797859002ab69a2bed4fdba1c7fe8064ecf8661621ae7d8fbf8599ffa636  sysdig-0.29.3.tar.gz
> +sha256  b8f43326506f85e99a3455f51b75ee79bf4db9dc12908ef43af672166274a795  sysdig-0.31.4.tar.gz
>  sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index bafe534a16..fe725a8064 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SYSDIG_VERSION = 0.29.3
> +SYSDIG_VERSION = 0.31.4
>  SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
>  SYSDIG_LICENSE = Apache-2.0
>  SYSDIG_LICENSE_FILES = COPYING
> @@ -26,13 +26,18 @@ SYSDIG_DEPENDENCIES = \
>  # grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
>  # one there.
>  SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
> +	-DDRIVER_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR)/driver \

Why do you need to peek into the source tree of falcsecurity-libs?

And if you need the already built driver, then you need to peek into the
build dir, nto the source dir.

>  	-DBUILD_DRIVER=OFF \
>  	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
>  	-DDRIVER_NAME=$(FALCOSECURITY_LIBS_DRIVER_NAME) \
>  	-DENABLE_DKMS=OFF \
>  	-DUSE_BUNDLED_DEPS=OFF \
> +	-DUSE_BUNDLED_TBB=OFF \
> +	-DUSE_BUNDLED_B64=OFF \
> +	-DUSE_BUNDLED_JSONCPP=OFF \
> +	-DUSE_BUNDLED_VALIJSON=OFF \
> +	-DUSE_BUNDLED_RE2=OFF \

If the bundled copies are disabled, don't you instead need to add
dependencies to the unbundled copies? I.e.

    SYSDIG_DPENDENCIES = \
        [...]
        tbb \
        libb64 \
        jsoncpp \
        valijson \
        re2

>  	-DWITH_CHISEL=ON \
> -	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \

Urk, this was so wrong... There was no dependnecy to valijson, and the
version is hard-coded so it has not been correct since 2022-10-22 when
valijson was bumped to 0.7...

Good that you get rid of it...

Could you look into master and see at fixing it there?

Regards,
Yann E. MORIN.

>  	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
>  
>  $(eval $(cmake-package))
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
