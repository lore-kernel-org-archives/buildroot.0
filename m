Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83EA5CD3438
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 04:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E55B822BF;
	Tue, 19 Sep 2023 04:11:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E55B822BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZ7jGKBE-B5k; Tue, 19 Sep 2023 04:11:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 500CA822A9;
	Tue, 19 Sep 2023 04:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 500CA822A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6D31BF23B
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5442F822A9
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 04:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5442F822A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gf72V5kbDZfc for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 04:11:32 +0000 (UTC)
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A799E822A7
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 04:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A799E822A7
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 549004402E9;
 Tue, 19 Sep 2023 07:11:18 +0300 (IDT)
References: <20230918205255.2850663-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.9.21; emacs 29.1
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 19 Sep 2023 07:10:13 +0300
In-reply-to: <20230918205255.2850663-1-fontaine.fabrice@gmail.com>
Message-ID: <871qeun6oi.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1695096678;
 bh=yr5+jXahZ1JtG7bLiJqk0VNIJp5fVgMjNwm3d7mmKy8=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=YyFQCFwivHiGhDeqQnLdB7jj/LRYSxQ5stFrQl0ziEQLbG5IBTf4klJzUtfFYeEET
 lVT3rp72po3MuEbwu7V2Dgb/bSa99osbgFdU3j2I1EMKdXDDWGTtYorq0g7M+mut8z
 riSHRNQFIl0599QvRaaHYeyvL/xqGSoOR661NjBEgpBZy9d4rYtYfrBsnuk/5wCE6H
 GdMovXj/5tDB+YyZj5RXSd10BNVAfrBPIslzKOAL+fU0Y86X1pMkXx07gNxrb8aCiJ
 85TzV7AbmZXpu8zHIYevDaiASEabLuQAM28WcCtPhC0dTpTfPwADTOQMatRCExCGsI
 ZkeqDo+a6O4Gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=YyFQCFwi
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: fix install of
 libstrace
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Mon, Sep 18 2023, Fabrice Fontaine wrote:
> Fix the following build failure with oprofile raised since bump of
> binutils to version 2.40 in commit
> 35656482d3b74ab12a6c2395ac9ca61b60a2fd49:
>
> configure: error: bfd library not found
>
> [...]
>
> configure:17928: checking for bfd_openr in -lbfd
> configure:17953: /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -lbfd  -liberty -lpopt  -ldl -lintl >&5
> /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: warning: libsframe.so.0, needed by /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.so, not found (try using -rpath or -rpath-link)
>
> Indeed, in this case, libsframe is not installed even after applying
> commit 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45 because
> BR2_BINUTILS_VERSION_2_40_X is not selected by anyone (binutils package
> is selected by oprofile and the toolchain is not generated by buildroot)
>
> To fix this issue, invert the logic: install libsframe by default (i.e.
> when binutils is selected or with a buildroot toolchain). libsframe will
> not be installed only if binutils < 2.40 is detected.

Typo in subject: s/libstrace/libsframe/.

baruch

>
> Fixes:
>  - http://autobuild.buildroot.org/results/af9a2d52823a332b48e6df14d2708b6a4b3833a4
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/binutils/Config.in.host | 6 +++---
>  package/binutils/binutils.mk    | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index 36436c0b27..bc7dc4443c 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -5,7 +5,7 @@ config BR2_PACKAGE_HOST_BINUTILS_SUPPORTS_CFI
>  	default y
>  	depends on !BR2_microblaze
>  
> -config BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
> +config BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
>  	bool
>  
>  choice
> @@ -17,18 +17,18 @@ choice
>  
>  config BR2_BINUTILS_VERSION_2_39_X
>  	bool "binutils 2.39"
> +	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
>  
>  config BR2_BINUTILS_VERSION_2_40_X
>  	bool "binutils 2.40"
> -	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
>  
>  config BR2_BINUTILS_VERSION_2_41_X
>  	bool "binutils 2.41"
> -	select BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME
>  
>  config BR2_BINUTILS_VERSION_ARC
>  	bool "binutils arc (2.34.50)"
>  	depends on BR2_arc
> +	select BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME
>  
>  endchoice
>  
> diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
> index ecb00077d6..4bc1b69fa0 100644
> --- a/package/binutils/binutils.mk
> +++ b/package/binutils/binutils.mk
> @@ -105,7 +105,7 @@ endif
>  # our TARGET_CONFIGURE_ARGS are taken into consideration for those
>  BINUTILS_MAKE_ENV = $(TARGET_CONFIGURE_ARGS)
>  
> -ifeq ($(BR2_PACKAGE_BINUTILS_HAS_LIBSFRAME),y)
> +ifeq ($(BR2_PACKAGE_BINUTILS_HAS_NO_LIBSFRAME),)
>  define BINUTILS_INSTALL_STAGING_LIBSFRAME
>  	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libsframe DESTDIR=$(STAGING_DIR) install
>  endef


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
