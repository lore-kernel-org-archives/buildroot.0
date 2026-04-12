Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9DCE937EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 929A960C10;
	Sun, 12 Apr 2026 17:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gisMTZ7IdUJv; Sun, 12 Apr 2026 17:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A6EB616D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776016575;
	bh=yxK2cWIjqpMVNUQOlHK9beDYJYU2KWHKrUnwutwqNGg=;
	h=To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VNK5ac8nfR7LPCSmlLVlJUVtejIc4sDcoTbba4y1xXVFQbjEJPAnQrXIqPXg/ZTMK
	 m+Prcn1vL2dBmPtlzuDXOZToEMaBhKQg4HhTvxqz1UBD5ZEM5Ft/Hs9XyIGavoPwll
	 SIZVu4a5w/8qDY4YZUDLL9TQJFgsgvc1CavV05yQutm7KxdFdY6JKUiYaMQCu9+4ST
	 WbhYH9tlATraq5eHgeF9aX1tj4hj9xo6rrReasDqr86sdYx4olu/2PmsBvwDKTRQPN
	 ScmqTmw37KbwuEvTSuzenRFxKYYN7w2FmZlFm9pMuRhYsKflBc/qcDNJ1UIvJ0McuL
	 1aYdIxfbBMq2w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A6EB616D4;
	Sun, 12 Apr 2026 17:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CD1E194
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AAFE4068F
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0vS7bi1ylq2 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 637524009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 637524009A
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 637524009A
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:56:10 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id ED518440A40;
 Sun, 12 Apr 2026 20:55:25 +0300 (IDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Sergio Prado <sergio.prado@e-labworks.com>
In-Reply-To: <20260411102917.2045764-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sat, 11 Apr 2026 12:29:17 +0200")
References: <20260411102917.2045764-1-bernd@kuhls.net>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Sun, 12 Apr 2026 20:56:02 +0300
Message-ID: <875x5wdpvx.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1776016525;
 bh=XceQUHZ9x4eO1bT57AL0r9jWzbcniEoqkpIO9rSKzuQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=osFGk7hSSf1c7c2JXt732EfGOxV2+lEgiBp22H0+a58kJKIxeirxbUBAusud4SOvI
 1xVb+e0KSEgrGE21QQeAtVKEzQKE8Vn95UZKJBwCiXSxqlMjpKguWOkmNMA7WLe1Ph
 X+eOho6iR3Fu8ln26shTdWjhh13mh9K37zUU2aOho2Jqj1uVkN0YGLJBlQchtZ45fN
 VNcRo9WqENyjpmI4bngnyx+2CPZ3B/6pveywsIySTwC8Q3K5/UNGKRncJ7jsRS8A3u
 0nvTOnuvcwgRggIHvz8XDR3mzGyFiMgBWM1DvgXtsHMJtpvT803z8q531iOAJG6oa7
 mgthHtI3CSbmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=osFGk7hS
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: fix build with libcurl
 >= 8.19.0 on 32bit archs
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On Sat, Apr 11 2026, Bernd Kuhls wrote:
> wolfssl requires definition of SIZEOF_LONG_LONG. Commit 3a5e071e4f9
> ("package/libcurl: security bump to version 8.19.0") removed
> SIZEOF_LONG_LONG definitions from libcurl autotools build system,
> breaking build with wolfssl.
>
> Fixes:
> https://autobuild.buildroot.net/results/baa/baa74a47464ed3e21d0adad64dd0c7c708c9ef85/
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Please note that Baruch sent a fix to libcurl:
> https://patchwork.ozlabs.org/project/buildroot/patch/ec612e55099118043d351762107b9c1a18387130.1775471071.git.baruch@tkos.co.il/

Your suggestion is better than mine for Buildroot, IMO.

Tested-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> although the problem should be fixed in wolfSSL instead, see
> https://bugs.freebsd.org/bugzilla/show_bug.cgi?id=294287
> https://github.com/wolfSSL/wolfssl/issues/9936
> for details.
>
>  ...TS_H-in-options.h-rather-than-config.patch | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
>
> diff --git
> a/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> new file mode 100644
> index 0000000000..67f9672c2a
> --- /dev/null
> +++ b/package/wolfssl/0001-Define-HAVE_LIMITS_H-in-options.h-rather-than-config.patch
> @@ -0,0 +1,60 @@
> +From b54173fc402c30e81d66b84e2f9725cb6d944b40 Mon Sep 17 00:00:00 2001
> +From: Kareem <kareem@wolfssl.com>
> +Date: Fri, 27 Mar 2026 17:01:02 -0700
> +Subject: [PATCH] Define HAVE_LIMITS_H in options.h rather than config.h since
> + types.h depends on this definition and config.h isn't consistently available
> + at runtime. Fixes #9936.
> +
> +Upstream: https://github.com/wolfSSL/wolfssl/pull/10097
> +
> +[Bernd: rebased for 5.7.2]
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +---
> + cmake/config.in    | 3 ---
> + cmake/options.h.in | 3 +++
> + configure.ac       | 4 +++-
> + 3 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/cmake/config.in b/cmake/config.in
> +index f2524e41e43..6054b6dbe7b 100644
> +--- a/cmake/config.in
> ++++ b/cmake/config.in
> +@@ -19,9 +19,6 @@
> + /* Define to 1 if you have the `gmtime_r' function. */
> + #cmakedefine HAVE_GMTIME_R @HAVE_GMTIME_R@
> + 
> +-/* Define to 1 if you have the <limits.h> header file. */
> +-#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> +-
> + /* Define to 1 if you have the <pcap/pcap.h> header file. */
> + #cmakedefine HAVE_PCAP_PCAP_H @HAVE_PCAP_PCAP_H@
> + 
> +diff --git a/cmake/options.h.in b/cmake/options.h.in
> +index 985b54241d6..c46ada8045d 100644
> +--- a/cmake/options.h.in
> ++++ b/cmake/options.h.in
> +@@ -31,6 +31,9 @@ extern "C" {
> + #endif
> + 
> + #ifndef WOLFSSL_OPTIONS_IGNORE_SYS
> ++/* Since types.h depends on HAVE_LIMITS_H, we must define it in options.h. */
> ++#undef HAVE_LIMITS_H
> ++#cmakedefine HAVE_LIMITS_H @HAVE_LIMITS_H@
> + #undef _GNU_SOURCE
> + #cmakedefine _GNU_SOURCE
> + #undef _POSIX_THREADS
> +diff --git a/configure.ac b/configure.ac
> +index bce600f2ecc..c5cf9f320c7 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -116,7 +116,9 @@
> +     AM_CCASFLAGS="$AM_CCASFLAGS -DWOLFSSL_EXPERIMENTAL_SETTINGS"
> + fi
> + 
> +-AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h netdb.h netinet/in.h stddef.h
> time.h sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> ++AC_CHECK_HEADERS([arpa/inet.h fcntl.h netdb.h netinet/in.h stddef.h time.h
> sys/ioctl.h sys/socket.h sys/time.h errno.h sys/un.h])
> ++# Special case: Since types.h depends on HAVE_LIMITS_H, we must define it in options.h.
> ++AC_CHECK_HEADER([limits.h], [AM_CPPFLAGS="$AM_CPPFLAGS -DHAVE_LIMITS_H=1"], [])
> + AC_CHECK_LIB([network],[socket])
> + AC_C_BIGENDIAN
> + AC_C___ATOMIC

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
