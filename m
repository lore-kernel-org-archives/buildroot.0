Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F6AD5B15A
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8EC7480EED;
	Mon, 28 Oct 2024 22:13:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1crDU0kpq9TQ; Mon, 28 Oct 2024 22:13:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70C3780EF7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70C3780EF7;
	Mon, 28 Oct 2024 22:13:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 558A4AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:13:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 43AC9400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:13:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRlg-nVo7biv for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:13:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7907040015
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7907040015
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7907040015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:13:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3104A1BF206;
 Mon, 28 Oct 2024 22:13:35 +0000 (UTC)
Date: Mon, 28 Oct 2024 23:13:34 +0100
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Buildroot Development <buildroot@buildroot.org>, Edgar Bonet
 <bonet@grenoble.cnrs.fr>, Brandon Maier <brandon.maier@collins.com>, Dario
 Binacchi <dario.binacchi@amarulasolutions.com>, Ben Wolsieffer
 <Ben.Wolsieffer@hefring.com>
Message-ID: <20241028231334.30d80be8@windsurf>
In-Reply-To: <20241020092527.734923-3-bagasdotme@gmail.com>
References: <20241020092527.734923-3-bagasdotme@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730153615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1y2egtYBCgtLRy1Wg2aY5CK579XdjkvZLXSgUUjDDJs=;
 b=iw9ELFtHRm2Meo4itWGtJ1wOGrFIKyycU9b56XroSCDR0PQfuTIa5N/RwSfOFPmMJYjhJb
 Uw7DPmvWz8NoukPAYKzM9ARR+eanqsQV7xx280FhUZogltaYNjFoE+H5Pt+GqX2tyWaS5e
 O5o4kbOmvSt3QOJTE4isqnt0l5zifSRCwg808r+RhUMCorCJLZp+eXYscouYTJ5Ko0ab5i
 +X10lLEVkD78VuB4iVJH34tFTfi5ETCdyx+BAsYPVa4vaf9C3EhB/hyU9jRR8OoNrvZmBL
 A2ABGSbZKBtQITFnYu3keFwd2kQ6yUQkH8g7crUbqbfL2mCqH6bMHnw9Qht19g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iw9ELFtH
Subject: Re: [Buildroot] [PATCH] package/git: fix wchar-less uclibc build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sun, 20 Oct 2024 16:25:29 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> diff --git a/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch b/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch
> new file mode 100644
> index 0000000000..50e844f5d4
> --- /dev/null
> +++ b/package/git/0001-t-unit-tests-fix-clar-build-for-wchar-less-uclibc.patch
> @@ -0,0 +1,97 @@
> +From 3d24a1610bf5a84486c84526ded567a53e10b96f Mon Sep 17 00:00:00 2001
> +From: Edgar Bonet <bonet@grenoble.cnrs.fr>
> +Date: Fri, 18 Oct 2024 14:59:48 +0200
> +Subject: [PATCH] t/unit-tests: fix clar build for wchar-less uclibc
> +
> +Git fails to build on uclibc systems without wchar support:
> +
> +```
> +    CC t/unit-tests/unit-test.o
> +t/unit-tests/clar/clar.c: In function 'clar__assert_equal':
> +t/unit-tests/clar/clar.c:767:23: error: unknown type name 'wchar_t'
> +  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
> +      |                       ^~~~~~~
> +In file included from t/unit-tests/clar/clar.c:13:
> +t/unit-tests/clar/clar.c:767:58: error: unknown type name 'wchar_t'
> +  767 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
> +      |                                                          ^~~~~~~
> +t/unit-tests/clar/clar.c:768:23: error: unknown type name 'wchar_t'
> +  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
> +      |                       ^~~~~~~
> +t/unit-tests/clar/clar.c:768:58: error: unknown type name 'wchar_t'
> +  768 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
> +      |                                                          ^~~~~~~
> +t/unit-tests/clar/clar.c:769:65: warning: implicit declaration of function 'wcscmp' [-Wimplicit-function-declaration]
> +  769 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcscmp(wcs1, wcs2);
> +      |                                                                 ^~~~~~
> +t/unit-tests/clar/clar.c:784:23: error: unknown type name 'wchar_t'
> +  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
> +      |                       ^~~~~~~
> +t/unit-tests/clar/clar.c:784:58: error: unknown type name 'wchar_t'
> +  784 |                 const wchar_t *wcs1 = va_arg(args, const wchar_t *);
> +      |                                                          ^~~~~~~
> +t/unit-tests/clar/clar.c:785:23: error: unknown type name 'wchar_t'
> +  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
> +      |                       ^~~~~~~
> +t/unit-tests/clar/clar.c:785:58: error: unknown type name 'wchar_t'
> +  785 |                 const wchar_t *wcs2 = va_arg(args, const wchar_t *);
> +      |                                                          ^~~~~~~
> +t/unit-tests/clar/clar.c:787:65: warning: implicit declaration of function 'wcsncmp' [-Wimplicit-function-declaration]
> +  787 |                 is_equal = (!wcs1 || !wcs2) ? (wcs1 == wcs2) : !wcsncmp(wcs1, wcs2, len);
> +      |                                                                 ^~~~~~~
> +make[1]: *** [Makefile:2795: t/unit-tests/clar/clar.o] Error 1
> +```
> +
> +This is because on these systems, although there is #error macro
> +in uclibc source when __UCLIBC_HAS_WCHAR__ is not defined, somehow
> +the #error doesn't get triggered when wchar_t is used in clar.

When wchar support is disabled in uClibc, the wchar.h file that gets
installed is ./include/wchar-stub.h, and it doesn't have any #error.
See in the uClibc Makefile:

ifeq ($(UCLIBC_HAS_WCHAR),)
        $(Q)cd $(PREFIX)$(DEVEL_PREFIX)include && mv -f wchar-stub.h wchar.h
else
        $(Q)cd $(PREFIX)$(DEVEL_PREFIX)include && $(RM) -f wchar-stub.h
endif

> +
> +Fix the build failure by only using wchar_t when __UCLIBC_HAS_WCHAR__
> +is actually defined.

The solution isn't really nice, because it adds some uClibc specific
logic. Isn't there some configure.ac logic that runs to properly detect
the availability of wchar?

Otherwise, we could also make git depend on wchar, and be done with it.

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
