Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D671EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 19:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC94610EF;
	Tue, 25 Jul 2023 19:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FC94610EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fEo-UaP9UKHb; Tue, 25 Jul 2023 19:18:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65A82610F5;
	Tue, 25 Jul 2023 19:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 65A82610F5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82F681BF25B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:18:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CDE682097
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 19:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CDE682097
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d2P1aOCV9tWg for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 19:18:06 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C42982060
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 19:18:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C42982060
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:c1a3:ebab:98d8:8372])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0B16778033D;
 Tue, 25 Jul 2023 21:18:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 25 Jul 2023 21:18:00 +0200
Date: Tue, 25 Jul 2023 21:18:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230725191800.GI3544423@scaer>
References: <20230724204439.1526127-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230724204439.1526127-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690312683;
 bh=sp4TRPpdiBFmHQ2XNrYxfS7fzvTv4+BDMw+TgkGbGS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J+lByegYn1RL8ZdSFMhBIABOwf8gVv96aYP9yYwmFZl0VOocP+JxWC0uSDkyIBtCX
 DqeceJRNpUk0ZlaJcJ+BQjQ/+rjUPEtmMl96VcXqBXsfWrOfLdBF1zVOQ5mwDXVFVH
 4l3rIcdJUpd1sg+VLCzW2U7FuN1Vl9ZhdkMSvbqOa4HVjqDefJImbxNn9wVWtZgI5K
 RWDDDqgxEFSMFAFn5M/jxAxnZkU89eWYs84AmClBnRuHWVolfw5RIvY4tG9GixsoVx
 sHtFGdowG7hgamAauFF5seoK3xK5mM3HZC0PqOcsY6ru2sDcTH59H9SN7KblsLXiqL
 pTIQ2bT8WYQ/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=J+lByegY
Subject: Re: [Buildroot] [PATCH 1/1] package/opensc: disable tests
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

Bernd, All,

On 2023-07-24 22:44 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/50b/50b6962ccd884a91391d13ee75852dd0e9ea1a84/
> 
> This error only occurs when building with BR2_SHARED_STATIC_LIBS=y, it
> fails for src/tests/fuzzing/fuzz_pkcs15init which is only available when
> static linking is enabled:
> https://github.com/OpenSC/OpenSC/blob/master/src/tests/fuzzing/Makefile.am#L14
> 
> The upstream build system has no support to extract the correct ldflags
> for libatomic.so provided by libcrypto.pc. Because we do not need the
> tests anyway we just disable them to "fix" the build error for us.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...onfigure-add-option-to-disable-tests.patch | 67 +++++++++++++++++++
>  package/opensc/opensc.mk                      |  4 +-
>  2 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 package/opensc/0003-configure-add-option-to-disable-tests.patch
> 
> diff --git a/package/opensc/0003-configure-add-option-to-disable-tests.patch b/package/opensc/0003-configure-add-option-to-disable-tests.patch
> new file mode 100644
> index 0000000000..29342026c1
> --- /dev/null
> +++ b/package/opensc/0003-configure-add-option-to-disable-tests.patch
> @@ -0,0 +1,67 @@
> +From 3c3ed2ecbf31d41b6e5406da55971b9d9eaa3388 Mon Sep 17 00:00:00 2001
> +From: Bernd Kuhls <bernd@kuhls.net>
> +Date: Mon, 24 Jul 2023 22:28:11 +0200
> +Subject: [PATCH] configure: add option to disable tests
> +
> +Upstream: https://github.com/OpenSC/OpenSC/pull/2822
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + configure.ac    | 9 +++++++++
> + src/Makefile.am | 6 +++++-
> + 2 files changed, 14 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 0a90445b..9b7543da 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -272,6 +272,13 @@ AC_ARG_ENABLE(
> + 	[enable_doc="no"]
> + )
> + 
> ++AC_ARG_ENABLE(
> ++	[tests],
> ++	[AS_HELP_STRING([--enable-tests],[enable tests @<:@enabled@:>@])],
> ++	,
> ++	[enable_tests="yes"]
> ++)
> ++
> + AC_ARG_ENABLE(
> + 	[dnie-ui],
> + 	[AS_HELP_STRING([--enable-dnie-ui],[enable use of external user interface program to request DNIe pin@<:@disabled@:>@])],
> +@@ -1119,6 +1126,7 @@ AM_CONDITIONAL([ENABLE_NOTIFY], [test "${enable_notify}" = "yes"])
> + AM_CONDITIONAL([ENABLE_CRYPTOTOKENKIT], [test "${enable_cryptotokenkit}" = "yes"])
> + AM_CONDITIONAL([ENABLE_OPENCT], [test "${enable_openct}" = "yes"])
> + AM_CONDITIONAL([ENABLE_DOC], [test "${enable_doc}" = "yes"])
> ++AM_CONDITIONAL([ENABLE_TESTS], [test "${enable_tests}" = "yes"])
> + AM_CONDITIONAL([WIN32], [test "${WIN32}" = "yes"])
> + AM_CONDITIONAL([CYGWIN], [test "${CYGWIN}" = "yes"])
> + AM_CONDITIONAL([ENABLE_MINIDRIVER], [test "${enable_minidriver}" = "yes"])
> +@@ -1213,6 +1221,7 @@ XSL stylesheets:         ${xslstylesheetsdir}
> + 
> + man support:             ${enable_man}
> + doc support:             ${enable_doc}
> ++tests:                   ${enable_tests}
> + thread locking support:  ${enable_thread_locking}
> + zlib support:            ${enable_zlib}
> + readline support:        ${enable_readline}
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 3ce465bf..bf71b61f 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -3,7 +3,11 @@ EXTRA_DIST = Makefile.mak
> + 
> + # Order IS important
> + SUBDIRS = common scconf ui pkcs15init sm \
> +-		  libopensc pkcs11 tools minidriver tests
> ++		  libopensc pkcs11 tools minidriver
> ++
> ++if ENABLE_TESTS
> ++SUBDIRS += tests
> ++endif
> + 
> + if ENABLE_SM
> + SUBDIRS += smm
> +-- 
> +2.39.2
> +
> diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
> index 253b6b26f8..32f0fdaa8b 100644
> --- a/package/opensc/opensc.mk
> +++ b/package/opensc/opensc.mk
> @@ -9,8 +9,10 @@ OPENSC_SITE = https://github.com/OpenSC/OpenSC/releases/download/$(OPENSC_VERSIO
>  OPENSC_LICENSE = LGPL-2.1+
>  OPENSC_LICENSE_FILES = COPYING
>  OPENSC_CPE_ID_VENDOR = opensc_project
> +# 0003-configure-add-option-to-disable-tests.patch
> +OPENSC_AUTORECONF = YES
>  OPENSC_DEPENDENCIES = openssl pcsc-lite
>  OPENSC_INSTALL_STAGING = YES
> -OPENSC_CONF_OPTS = --disable-cmocka --disable-strict
> +OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
>  
>  $(eval $(autotools-package))
> -- 
> 2.39.2
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
