Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D57ECAAD2
	for <buildroot@archiver.kernel.org>; Sun, 28 Aug 2022 09:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61E2181DB2;
	Sun, 28 Aug 2022 09:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61E2181DB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gxbiWdWRXJXn; Sun, 28 Aug 2022 09:42:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BD3B81D4D;
	Sun, 28 Aug 2022 09:42:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BD3B81D4D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 060E21BF5AE
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:42:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2FD1409BC
 for <buildroot@lists.busybox.net>; Sun, 28 Aug 2022 09:42:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2FD1409BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZUsj6QWwQ7w for <buildroot@lists.busybox.net>;
 Sun, 28 Aug 2022 09:42:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A2F9408F7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5A2F9408F7
 for <buildroot@buildroot.org>; Sun, 28 Aug 2022 09:42:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9DACE780515;
 Sun, 28 Aug 2022 11:41:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 28 Aug 2022 11:41:59 +0200
Date: Sun, 28 Aug 2022 11:41:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220828094159.GI37358@scaer>
References: <20220827213558.476660-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220827213558.476660-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661679721;
 bh=61SWO4hRsemZHmpWXCIuUKIdY8TUVLWpMgQqDf3/alo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FZTtRT1ONiubELaDbBCjOc9ixK3kuUzRRD8/UwVpPqvDrNGRZtoJpdE2yCoyi17az
 3wGDwflw0ddvmtRZuQamt5iiE0OZD29FzaIo3jY2scctytl7YodVhvdeelzHKWdj7d
 zDEvCLgWVx5kZmw7h8tCru3R/7cda1lf9nTobE/1caK/ZZDpYtdCTvXHKfkllxwGec
 B9H6x8U7Ha3lIqVoPX7Mk+JvPjxr6DYGb4asA544JePxO9f8rayG3hiyyHgSoeYjY4
 hjQ/5ikZez55G7pGDqi8r4qOcrCLpR5R9tGx5h/JgfelDQQ0UzpKIhXUoqY9odSYZd
 XEyMS2mZ7E/EQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FZTtRT1O
Subject: Re: [Buildroot] [PATCH 1/1] package/libgpgme: fix build without
 threads
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

Fabrice, All,

On 2022-08-27 23:35 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without threads raised since bump to
> version 1.17.1 in commit 3f121357ae225be9ac2fbf4505027c2cc690626b and
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=f3177d3ee0a1d30e15f33ff226b5e4c96b7610db:
> 
> run-wkdlookup.cpp: In function 'int main(int, char**)':
> run-wkdlookup.cpp:130:18: error: 'std::this_thread' has not been declared
>   130 |             std::this_thread::sleep_for(std::chrono::milliseconds{250 * cnt});
>       |                  ^~~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2915f6105bae595274fabaa12de7cc53926d22d0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-Fix-build-without-threads.patch      | 59 +++++++++++++++++++
>  package/libgpgme/libgpgme.mk                  |  3 +
>  2 files changed, 62 insertions(+)
>  create mode 100644 package/libgpgme/0001-Fix-build-without-threads.patch
> 
> diff --git a/package/libgpgme/0001-Fix-build-without-threads.patch b/package/libgpgme/0001-Fix-build-without-threads.patch
> new file mode 100644
> index 0000000000..caa4ed7d78
> --- /dev/null
> +++ b/package/libgpgme/0001-Fix-build-without-threads.patch
> @@ -0,0 +1,59 @@
> +From fc1b821c80c78f4ae635639c7fce5bad754edda7 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 27 Aug 2022 23:24:44 +0200
> +Subject: [PATCH] Fix build without threads
> +
> +Allow the user to disable cpp tests to avoid the following build failure
> +without threads raised since version 1.17.1 and
> +https://git.gnupg.org/cgi-bin/gitweb.cgi?p=gpgme.git;a=commit;h=f3177d3ee0a1d30e15f33ff226b5e4c96b7610db
> +
> +run-wkdlookup.cpp: In function 'int main(int, char**)':
> +run-wkdlookup.cpp:130:18: error: 'std::this_thread' has not been declared
> +  130 |             std::this_thread::sleep_for(std::chrono::milliseconds{250 * cnt});
> +      |                  ^~~~~~~~~~~
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/2915f6105bae595274fabaa12de7cc53926d22d0
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://dev.gnupg.org/T6165]
> +---
> + configure.ac         | 5 +++++
> + lang/cpp/Makefile.am | 6 +++++-
> + 2 files changed, 10 insertions(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index e7fe04a7..d1c87486 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -553,6 +553,11 @@ AC_ARG_ENABLE(g13-test,
> +          run_g13_test=$enableval)
> + AM_CONDITIONAL(RUN_G13_TESTS, test "$run_g13_test" = "yes")
> + 
> ++run_cpp_test="yes"
> ++AC_ARG_ENABLE(cpp-test,
> ++  AS_HELP_STRING([--disable-cpp-test],[disable CPP regression test]),
> ++         run_cpp_test=$enableval)
> ++AM_CONDITIONAL(RUN_CPP_TESTS, test "$run_cpp_test" = "yes")
> + 
> + # Checks for header files.
> + AC_CHECK_HEADERS_ONCE([locale.h sys/select.h sys/uio.h argp.h stdint.h
> +diff --git a/lang/cpp/Makefile.am b/lang/cpp/Makefile.am
> +index 724da6ca..243c463d 100644
> +--- a/lang/cpp/Makefile.am
> ++++ b/lang/cpp/Makefile.am
> +@@ -18,6 +18,10 @@
> + # License along with this program; if not, see <https://gnu.org/licenses/>.
> + # SPDX-License-Identifier: LGPL-2.1-or-later
> + 
> +-SUBDIRS = src tests
> ++SUBDIRS = src
> ++
> ++if RUN_CPP_TESTS
> ++SUBDIRS += tests
> ++endif
> + 
> + EXTRA_DIST = README
> +-- 
> +2.35.1
> +
> diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
> index 1b57b18872..2120ee8e3c 100644
> --- a/package/libgpgme/libgpgme.mk
> +++ b/package/libgpgme/libgpgme.mk
> @@ -14,6 +14,8 @@ LIBGPGME_CPE_ID_PRODUCT = gpgme
>  LIBGPGME_INSTALL_STAGING = YES
>  LIBGPGME_DEPENDENCIES = libassuan libgpg-error
>  LIBGPGME_CONFIG_SCRIPTS = gpgme-config
> +# We're patching configure.ac
> +LIBGPGME_AUTORECONF = YES
>  
>  LIBGPGME_LANGUAGE_BINDINGS = cl
>  # C++ bindings require a C++11 capable gcc, and -Wsuggest-override support
> @@ -28,6 +30,7 @@ LIBGPGME_CONF_OPTS = \
>  	--disable-gpgconf-test \
>  	--disable-g13-test \
>  	--disable-gpg-test \
> +	--disable-cpp-test \
>  	--enable-languages=$(subst $(space),$(comma),$(LIBGPGME_LANGUAGE_BINDINGS))
>  
>  # Handle argp-standalone or it errors out during build
> -- 
> 2.35.1
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
