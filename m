Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F053C433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 05:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1FA461086;
	Thu, 27 Jan 2022 05:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DX7Sc_15BkxU; Thu, 27 Jan 2022 05:46:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E319B6106E;
	Thu, 27 Jan 2022 05:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DDA7C1BF8B4
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 05:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB91241C56
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 05:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sUThuxQrTD2J for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 05:46:30 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [84.110.109.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E959641C30
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 05:46:29 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.3])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 84910440150;
 Thu, 27 Jan 2022 07:46:12 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1643262372;
 bh=3rA+lAfdAlRHV55TzAG77esfm7yCYk0VDgAcAFr/JkM=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=CPrJkaiWM26KSY7STHEce3iABkNu5qq3QYyqJiu2UEjkQTnMytdb6ltQrD9qF8R2x
 JwCM1TVkLS9eWl9HnluzaHXKvrvW/vV9miNZN9ftNMVj5HQhjIdWnOALX2lIW4R6HL
 GVygQMg9nnm8XmNtU1rQjXXI9Je4yi3g100C+t6PxE+UUEqRDb+EerGLUnyvTXwLtT
 G6qchEnWoc1Xdk7Pw/uDrT5zb/ELX3dNPObYwFRNl/YZPL45Ebfj8HxnUna8NzxcKW
 RhxnHG2Ab00qSE4DBOLmCkrphP1ZHD22dF5TuSZHu+NaSLAtgi5vxIi+tJibLtvGlA
 x31IYN7I5m9FQ==
References: <20220126235652.25712-1-petr.vorel@gmail.com>
User-agent: mu4e 1.6.10; emacs 27.1
To: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 27 Jan 2022 07:39:23 +0200
In-reply-to: <20220126235652.25712-1-petr.vorel@gmail.com>
Message-ID: <87lez191e6.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ltp-testsuite: bump version
 to 20220121
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Petr,

On Thu, Jan 27 2022, Petr Vorel wrote:
> LTP now builds metadata directory as host target.
> It's mandatory, therefore adding HOST_CFLAGS and HOST_LDFLAGS to make
> (adding to configure does not work) to avoid adding -mlongcalls
> -mauto-litpools for some targets (e.g. bootlin-xtensa-uclibc).
>
> Drop patches from this release.
>
> Refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
> (still safe to carry it).
>
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
> Changes v1->v2:
> * Add missin g HOST_LDFLAGS to fix br-arm-full-static (cannot find -lc
> when compiling host target)

[...]

> diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
> index a9f3cfdfe1..bd648cbfdd 100644
> --- a/package/ltp-testsuite/ltp-testsuite.hash
> +++ b/package/ltp-testsuite/ltp-testsuite.hash
> @@ -1,5 +1,5 @@
> -# From: https://github.com/linux-test-project/ltp/releases/download/20210927/ltp-full-20210927.tar.xz.sha1
> -sha1 dad7737f609e358c4060cb446b9cae5c026fc137  ltp-full-20210927.tar.xz
> +# From: https://github.com/linux-test-project/ltp/releases/download/20220121/ltp-full-20220121.tar.xz.sha1
> +sha1 211935e901afea1010ec4f70369b782fbee93ed4  ltp-full-20220121.tar.xz
>  # Locally computed
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> -sha256  779e9e5cc9af4f2b3d4cb32f5439ebd635504d2c4591bf900f0942dac290ed15  ltp-full-20210927.tar.xz
> +sha256  ad002520616fac52362229ea0f1bb9d304fc03ff0096ccb5b1820cee9fc8413a  ltp-full-20220121.tar.xz
> diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
> index cc6d3c63b6..d9b7133b07 100644
> --- a/package/ltp-testsuite/ltp-testsuite.mk
> +++ b/package/ltp-testsuite/ltp-testsuite.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LTP_TESTSUITE_VERSION = 20210927
> +LTP_TESTSUITE_VERSION = 20220121
>  LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
>  LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
>  
> @@ -70,6 +70,10 @@ LTP_TESTSUITE_CONF_ENV += \
>  	LIBS="$(LTP_TESTSUITE_LIBS)" \
>  	SYSROOT="$(STAGING_DIR)"
>  
> +LTP_TESTSUITE_MAKE_ENV += \
> +	HOST_CFLAGS="$(HOST_CFLAGS)" \
> +	HOST_LDFLAGS="$(HOST_LDFLAGS)"

I think you should have TARGET_* on the right side of the assignment,
since this is a target package.

baruch

> +
>  # uclibc: bessel support normally not enabled
>  LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
>  	testcases/misc/math/float/bessel/ \


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
