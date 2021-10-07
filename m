Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83463C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 04:51:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 618DD611C1
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 04:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 618DD611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED04940967;
	Thu,  7 Oct 2021 04:51:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wv9VZLoQvOc2; Thu,  7 Oct 2021 04:51:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC184095A;
	Thu,  7 Oct 2021 04:51:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 023791BF3D2
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 04:51:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E50304018A
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 04:51:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=tkos.co.il
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vUJiPLLsm1n for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 04:51:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx.tkos.co.il (guitar.tcltek.co.il [192.115.133.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EBD2B4035C
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 04:51:02 +0000 (UTC)
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id C7D3B44073B;
 Thu,  7 Oct 2021 07:50:15 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
 s=default; t=1633582216;
 bh=fsNQeGOvvVtdN5G4k1wdRLHO8lSnWDJlfhoO6y9ClCE=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=eZsJU9pq4eNsk5kOJo1Dx2z+7BAMD6tAH1ZrI0imiA4gffcwPRruXkPL5TC/JtMr2
 cH/Tj8RkNDf9QfIb+9L7I4I60U9huSkjsOzEJKecd13wZY8WWYdmSSbj/t8EYKtdhK
 DD16RKG6+lYugzvfdjkv5SUeijSj881i6g3q2fs9NZ9IR44A/tqJ9GFMMbQug19Zaz
 nsncMgz22n88zB8+4sDpNeogYBxUNlvmGyTPvD2mjU9c4IOaKJJ2w+FsWn/G2GwI07
 D4x/QYv2vOd/qAjpUG1uVDF5Al08gpPvBFk7sPb9JgY2IJGhu1jffZO1/EbNeY8kw0
 XrPoQ1GMEpBsA==
References: <20211006202045.3113262-1-fontaine.fabrice@gmail.com>
User-agent: mu4e 1.6.6; emacs 27.1
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 07 Oct 2021 07:48:22 +0300
In-reply-to: <20211006202045.3113262-1-fontaine.fabrice@gmail.com>
Message-ID: <87ee8x5tfy.fsf@tarshish>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-tss: fix build with
 autoconf >= 2.70
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fabrice,

On Wed, Oct 06 2021, Fabrice Fontaine wrote:

> Fix the following build failure raised since bump of autoconf to version
> 2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:
>
> ./configure: line 14636: syntax error near unexpected token `newline'
> ./configure: line 14636: `    '''
> package/pkg-generic.mk:273: recipe for target
> '/home/buildroot/autobuild/instance-3/output-1/build/tpm2-tss-3.0.3/.stamp_configured'
> failed
>
> It should be noted that this patch is included in version 3.1:
> https://patchwork.ozlabs.org/project/buildroot/patch/RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com
>
> Fixes:
>  - http://autobuild.buildroot.org/results/5d4ca70ebf30463aa7e8a96a90effa6282f57e21

We have a pending bump to version 3.1.0 in patchwork that should include
this fix:

  http://patchwork.ozlabs.org/project/buildroot/patch/RnUd7kxUKLWeLZSMoM1dFtpAD4Qfe3R-67gu27eAGtE6yrgC1oHzq1GwiOoE9Gmk6uZZ-c6k6LUVxdMqKhUro4_bM4zZKPhsbN5e9BV8SV4=@protonmail.com/

baruch

>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...fix-compatibility-with-autoconf-2-70.patch | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
>  create mode 100644 package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
>
> diff --git
> a/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
> b/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
> new file mode 100644
> index 0000000000..f21aa179f8
> --- /dev/null
> +++ b/package/tpm2-tss/0002-configure-ac-fix-compatibility-with-autoconf-2-70.patch
> @@ -0,0 +1,48 @@
> +From 03cca78d24d716eec792f86f5b0bc69886fad981 Mon Sep 17 00:00:00 2001
> +From: Patrick McCarty <patrick.mccarty@intel.com>
> +Date: Fri, 18 Dec 2020 01:54:05 +0000
> +Subject: [PATCH] configure.ac: fix compatibility with autoconf 2.70
> +
> +With autoconf 2.70, not quoting the second argument to one of the AS_IF
> +macro expansions leads to generation of invalid shell code affecting the
> +first nested ERROR_IF_NO_PROG expansion.
> +
> +The invalid shell code leads to an error resembling:
> +
> +  ./configure: line 18826: syntax error near unexpected token `newline'
> +  ./configure: line 18826: `    '''
> +
> +Fix the issue by quoting the second argument to the affected AS_IF,
> +similar to the quoting found elsewhere in configure.ac.
> +
> +Signed-off-by: Patrick McCarty <patrick.mccarty@intel.com>
> +
> +[Retrieved from:
> +https://github.com/tpm2-software/tpm2-tss/commit/03cca78d24d716eec792f86f5b0bc69886fad981]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + configure.ac | 4 ++--
> + 1 file changed, 2 insertions(+), 2 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index ff59dd7ce..3049032bc 100755
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -285,7 +285,7 @@ AC_ARG_ENABLE([integration],
> +         [build and execute integration tests])],,
> +     [enable_integration=no])
> + AS_IF([test "x$enable_integration" = "xyes"],
> +-     AS_IF([test "$HOSTOS" = "Linux"],
> ++     [AS_IF([test "$HOSTOS" = "Linux"],
> +            [ERROR_IF_NO_PROG([ss])],
> +            [ERROR_IF_NO_PROG([sockstat])])
> +        ERROR_IF_NO_PROG([echo])
> +@@ -335,7 +335,7 @@ AS_IF([test "x$enable_integration" = "xyes"],
> +              [AC_MSG_ERROR([No simulator executable found in PATH for testing TCTI.])])
> +        AC_SUBST([INTEGRATION_TCTI], [$integration_tcti])
> +        AC_SUBST([INTEGRATION_ARGS], [$integration_args])
> +-       AC_SUBST([ENABLE_INTEGRATION], [$enable_integration]))
> ++       AC_SUBST([ENABLE_INTEGRATION], [$enable_integration])])
> + AM_CONDITIONAL([ENABLE_INTEGRATION],[test "x$enable_integration" = "xyes"])
> + #
> + # sanitizer compiler flags


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
