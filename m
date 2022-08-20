Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E45C32772
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 08:30:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF0B4417CF;
	Sat, 20 Aug 2022 08:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF0B4417CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4SrMlMX2xkmK; Sat, 20 Aug 2022 08:30:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2651141601;
	Sat, 20 Aug 2022 08:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2651141601
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09C001BF36A
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9AF582D40
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 08:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AF582D40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sn4VsKRLGRJK for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 08:30:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A814A82CB7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A814A82CB7
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 08:30:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1D31160130;
 Sat, 20 Aug 2022 10:30:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 10:30:27 +0200
Date: Sat, 20 Aug 2022 10:30:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220820083027.GF2167049@scaer>
References: <20220817223612.218840-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220817223612.218840-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660984231;
 bh=UGHPHBFXp16TpgxasuzR8wcarnoQ5TNEPB79uk3jZZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GfAECo3k1kuEaLv77WILJY2PYehZvtz95KKB4aXYwEOepYsRdgk/kdZUEGArFfroR
 B5YLPkEFZLA8pcZrfnEwjbiTeB2PhG43rUYFM1J8q9Z6AikY9wiWrXpI8UGjZTUSnO
 AIanjT40it0IS04wKhwhkmFqj42lczqzbD6uQ5VX8kkozhtuTPTYNp0XkBmLV++3YF
 BnQyG8CPN7OaBuCEuk4xs/NX/fuCtIADphDAnFRNSTskbJ8HO0DOY01bThcrZr9vFR
 aWlRarcOkLGtOyUch6j0BoPRRb39+LSLjEAiJ3DIc8xTvhHsVzqtD6gdBVFEUOl4OE
 sWwjP+RF9TXLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GfAECo3k
Subject: Re: [Buildroot] [PATCH 1/1] package/syslog-ng: fix libressl build
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-18 00:36 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with libressl raised since bump to
> version 3.37.1 in commit 2546a31ccef6fed6c3bd40d6a1f13f4d0898cea9 and
> https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:
> 
> /nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
> /nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...-lib-tlscontext.c-fix-libressl-build.patch | 85 +++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
> 
> diff --git a/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
> new file mode 100644
> index 0000000000..2c438627a4
> --- /dev/null
> +++ b/package/syslog-ng/0002-lib-tlscontext.c-fix-libressl-build.patch
> @@ -0,0 +1,85 @@
> +From 6f93484cea81ff8d45df213d5d2b4cffc4eadcad Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 16 Jul 2022 18:09:25 +0200
> +Subject: [PATCH] lib/tlscontext.c: fix libressl build
> +
> +Fix the following build failure with libressl raised since version
> +3.37.1 and
> +https://github.com/syslog-ng/syslog-ng/commit/c7ba645918480da06b9e065c62ebd630312b0c7f:
> +
> +/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_client_sigalgs_list'
> +/nvmedata/autobuild/instance-5/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: ./lib/.libs/libsyslog-ng.so: undefined reference to `SSL_CTX_set1_sigalgs_list'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/84cf9f6a0f6de831a685b73c42eab868952c8b15
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status: https://github.com/syslog-ng/syslog-ng/pull/4081]
> +---
> + cmake/openssl_functions.cmake | 4 +++-
> + configure.ac                  | 2 ++
> + lib/tlscontext.c              | 4 ++++
> + syslog-ng-config.h.in         | 2 ++
> + 4 files changed, 11 insertions(+), 1 deletion(-)
> +
> +diff --git a/cmake/openssl_functions.cmake b/cmake/openssl_functions.cmake
> +index afd7b96bfe..319dcc2e23 100644
> +--- a/cmake/openssl_functions.cmake
> ++++ b/cmake/openssl_functions.cmake
> +@@ -42,7 +42,9 @@ function (openssl_set_defines)
> +     DH_set0_pqg
> +     BN_get_rfc3526_prime_2048
> +     SSL_CTX_set_num_tickets
> +-    SSL_CTX_set_ciphersuites)
> ++    SSL_CTX_set_ciphersuites
> ++    SSL_CTX_set1_sigalgs_list
> ++    SSL_CTX_set1_client_sigalgs_list)
> + 
> +   foreach (symbol ${symbol_list})
> +     string(TOUPPER ${symbol} SYMBOL_UPPERCASE)
> +diff --git a/configure.ac b/configure.ac
> +index 8cfab2251e..ecffb84f06 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1055,6 +1055,8 @@ AC_CHECK_DECLS([ASN1_STRING_get0_data], [], [], [[#include <openssl/asn1.h>]])
> + AC_CHECK_DECLS([DH_set0_pqg], [], [], [[#include <openssl/dh.h>]])
> + AC_CHECK_DECLS([BN_get_rfc3526_prime_2048], [], [], [[#include <openssl/bn.h>]])
> + AC_CHECK_DECLS([SSL_CTX_set_num_tickets],[], [], [[#include <openssl/ssl.h>]])
> ++AC_CHECK_DECLS([SSL_CTX_set1_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
> ++AC_CHECK_DECLS([SSL_CTX_set1_client_sigalgs_list],[], [], [[#include <openssl/ssl.h>]])
> + 
> + CPPFLAGS="$CPPFLAGS_SAVE"
> + 
> +diff --git a/lib/tlscontext.c b/lib/tlscontext.c
> +index ddde21dcaf..dedcf1ce5a 100644
> +--- a/lib/tlscontext.c
> ++++ b/lib/tlscontext.c
> +@@ -598,11 +598,15 @@ tls_context_setup_cipher_suite(TLSContext *self)
> + static gboolean
> + tls_context_setup_sigalgs(TLSContext *self)
> + {
> ++#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
> +   if (self->sigalgs && !SSL_CTX_set1_sigalgs_list(self->ssl_ctx, self->sigalgs))
> +     return FALSE;
> ++#endif
> + 
> ++#if SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
> +   if (self->client_sigalgs && !SSL_CTX_set1_client_sigalgs_list(self->ssl_ctx, self->client_sigalgs))
> +     return FALSE;
> ++#endif
> + 
> +   return TRUE;
> + }
> +diff --git a/syslog-ng-config.h.in b/syslog-ng-config.h.in
> +index 1817deea50..004b0a7be6 100644
> +--- a/syslog-ng-config.h.in
> ++++ b/syslog-ng-config.h.in
> +@@ -57,6 +57,8 @@
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_ASN1_STRING_GET0_DATA
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_GET0_PARAM
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET_CIPHERSUITES
> ++#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_SIGALGS_LIST
> ++#cmakedefine01 SYSLOG_NG_HAVE_DECL_SSL_CTX_SET1_CLIENT_SIGALGS_LIST
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_STORE_CTX_GET0_CERT
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_X509_GET_EXTENSION_FLAGS
> + #cmakedefine01 SYSLOG_NG_HAVE_DECL_DH_SET0_PQG
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
