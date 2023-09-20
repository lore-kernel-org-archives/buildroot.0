Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA01C04ABA
	for <buildroot@archiver.kernel.org>; Wed, 20 Sep 2023 17:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF9DC60DDF;
	Wed, 20 Sep 2023 17:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF9DC60DDF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VrsLdq5zqt8z; Wed, 20 Sep 2023 17:33:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BD76134D;
	Wed, 20 Sep 2023 17:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BD76134D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F23171BF95F
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB49440280
 for <buildroot@lists.busybox.net>; Wed, 20 Sep 2023 17:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB49440280
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kG7I-qoolh5i for <buildroot@lists.busybox.net>;
 Wed, 20 Sep 2023 17:33:32 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B27F40131
 for <buildroot@buildroot.org>; Wed, 20 Sep 2023 17:33:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B27F40131
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:a117:66c:8b6b:25fb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 622BE6013A;
 Wed, 20 Sep 2023 19:33:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 20 Sep 2023 19:33:26 +0200
Date: Wed, 20 Sep 2023 19:33:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230920173326.GD512384@scaer>
References: <20230920170711.3901-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230920170711.3901-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695231209;
 bh=Vh4XWKNn/uQoLXm8p2LgNtrRMOdR5LFGw7XODAYNjHg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rnbjn1Zezw4/sPe5hZ8/viaJQfj4YadgMwue1MdA+pSVdqCukMYSB/9KSW9uCTGmP
 Keb1rOab9h9Yf3NAExrmY9VnT2vodf+8HdqYZFRc6O+E5SKJSl0RMPcEUAl09ksbSU
 x9cEf/GcG5dBeBPA7SrBqe/d/onc0kprZBXeI4/LzRMz8IC/yT3ss9gnYQCpznWXsB
 N5IAdDpyqSQargY3UlgrdRVywNtVNBer5ccaufwr9HuMpWSi5vlZwmbY/h/uVHWm3i
 Js2KDUaZpK+2YqEa5vaca+cpTp/0mg4+TYh4l87xS7RTGodklFEbyVAvdjWv/xDgAL
 SyJTJfoABErKQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rnbjn1Ze
Subject: Re: [Buildroot] [PATCH 1/1] package/ghostscript: security bump to
 version 10.02.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-20 19:07 +0200, Fabrice Fontaine spake thusly:
> - Fix CVE-2023-36664: Artifex Ghostscript through 10.01.2 mishandles
>   permission validation for pipe devices (with the %pipe% prefix or the |
>   pipe character prefix).
> - Fix CVE-2023-38559: A buffer overflow flaw was found in
>   base/gdevdevn.c:1973 in devn_pcx_write_rle() in ghostscript. This
>   issue may allow a local attacker to cause a denial of service via
>   outputting a crafted PDF file for a DEVN device with gs.
> - Fix CVE-2023-38560: An integer overflow flaw was found in
>   pcl/pl/plfont.c:418 in pl_glyph_name in ghostscript. This issue may
>   allow a local attacker to cause a denial of service via transforming a
>   crafted PCL file to PDF format.
> 
> https://ghostscript.readthedocs.io/en/gs10.02.0/News.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-Fix-build-without-BUILD_PDF.patch    | 34 +++++++++++++++++++
>  package/ghostscript/ghostscript.hash          |  4 +--
>  package/ghostscript/ghostscript.mk            |  2 +-
>  3 files changed, 37 insertions(+), 3 deletions(-)
>  create mode 100644 package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
> 
> diff --git a/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
> new file mode 100644
> index 0000000000..af69cd3670
> --- /dev/null
> +++ b/package/ghostscript/0001-Fix-build-without-BUILD_PDF.patch
> @@ -0,0 +1,34 @@
> +From 088f3cd6e58cff5fa51e072d1829f7691a5f6681 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Wed, 20 Sep 2023 13:44:28 +0100
> +Subject: [PATCH] Fix build without BUILD_PDF
> +
> +The PDFSetParams PostScript extension operator was missing a stub function definition
> +when the PDF interpreter is not built in.
> +
> + Author:    Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=088f3cd6e58cff5fa51e072d1829f7691a5f6681
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + psi/zpdfops.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/psi/zpdfops.c b/psi/zpdfops.c
> +index e7e0a42ee..271687a18 100644
> +--- a/psi/zpdfops.c
> ++++ b/psi/zpdfops.c
> +@@ -1507,6 +1507,11 @@ static int zPDFdrawannots(i_ctx_t *i_ctx_p)
> +     return_error(gs_error_undefined);
> + }
> + 
> ++static int zPDFSetParams(i_ctx_t *i_ctx_p)
> ++{
> ++    return_error(gs_error_undefined);
> ++}
> ++
> + static int zPDFInit(i_ctx_t *i_ctx_p)
> + {
> +     return_error(gs_error_undefined);
> +-- 
> +2.34.1
> +
> diff --git a/package/ghostscript/ghostscript.hash b/package/ghostscript/ghostscript.hash
> index 2e4b6ac750..77c8faccbe 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10012/SHA512SUMS
> -sha512  ee20f0e12f553a3d04578e71a0d45defebc71117ce4dc2c14043985bfe7348ad7f8b2fe98fc9b4f5b935ecb32e50dc340be67d6ef58190542ec6d0f9da1de380  ghostscript-10.01.2.tar.xz
> +# From https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10020/SHA512SUMS
> +sha512  c49344151063e915add55a0a842c2a645d8362a5cbca663bd07638f4bd3699a08cade37a9efe905ad5a41e014353e5e1b1268b7925e43128ad30d5b031396b71  ghostscript-10.02.0.tar.xz
>  
>  # Hash for license file:
>  sha256  8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  LICENSE
> diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
> index 8a39d4b695..161521f970 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GHOSTSCRIPT_VERSION = 10.01.2
> +GHOSTSCRIPT_VERSION = 10.02.0
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
> -- 
> 2.40.1
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
