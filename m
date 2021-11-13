Return-Path: <SRS0=SOkI=QA=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B60FC433EF
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90284610F7
	for <buildroot@archiver.kernel.org>; Sat, 13 Nov 2021 10:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90284610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60276606C9;
	Sat, 13 Nov 2021 10:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JD0qsSf6iEc9; Sat, 13 Nov 2021 10:20:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85FB9606DB;
	Sat, 13 Nov 2021 10:20:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BF91BF2F0
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0F7504064B
 for <buildroot@lists.busybox.net>; Sat, 13 Nov 2021 10:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ff6JDiciwMMy for <buildroot@lists.busybox.net>;
 Sat, 13 Nov 2021 10:20:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1AD984064A
 for <buildroot@buildroot.org>; Sat, 13 Nov 2021 10:20:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D97C319F59E;
 Sat, 13 Nov 2021 11:20:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636798819;
 bh=nMo9fggwhA2YCQ9HdjekIIsWgLmLHwfk+pehNbKn9bM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ICSUKUdSIO4u07JJ3pNQ5gwRUL8HViI5PyvM7uAP67nhPDgr8ZCKDRNzN4BlbA0kq
 PogKY6KzG8mgbRBQQlOJUf3V0kSDh1CpIGA3IKXsK9HyQlnvQ1zg3iAUuVgmR2N4NW
 wQl6k2AY2Uo3MmZG3f0Biq8Du/mnLA6QCUNEi7NxfYbqIaNj+QO4PfB5jHILPEi/a9
 8DR/wbEjvPL/R3hh5+Zpu2ubHazGNvMeWz68o406JXIr0WlM17hfHWKCEV9TKvKzIF
 69TNCDV+MFD92nWMgV8hDuf6a+guT7dBMxE+p7K0i+tmWhUiRj1WAkQk2p1dx9NP83
 PfVTYN4ipoFcg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 Nov 2021 11:20:12 +0100
Date: Sat, 13 Nov 2021 11:20:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211113102011.GS247986@scaer>
References: <20211112100749.2893614-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211112100749.2893614-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/sg3_utils: bump to version 1.47
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
Cc: Marek Belisko <marek.belisko@open-nandra.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-12 11:07 +0100, Fabrice Fontaine spake thusly:
> - Drop patch (already in version) and so autoreconf
> - Update hash of COPYING (upodate in date and author's email:
>   https://github.com/doug-gilbert/sg3_utils/commit/f0195003bb0c66ba55084b2f7e0fe982f08c5675)
> - Fix the following build failure raised on musl since bump to version
>   1.46 in commit a00ed30780819c72174ae959bdd6f15ed961e938:
> 
> sg_dd.c: At top level:
> sg_dd.c:179:28: error: storage size of 'drand' isn't known
>   179 | static struct drand48_data drand;/* opaque, used by srand48_r and mrand48_r */
>       |                            ^~~~~
> 
> https://github.com/doug-gilbert/sg3_utils/blob/r1.47/ChangeLog
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/adc20fd52052daadfe1f16ee3f62c30e518cbd16
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Since this fixes a build issue, removes a patch, and drops autoreconf,
and even though this is a version bump: applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0001-support-uclinux-as-a-linux.patch        | 16 ----------------
>  package/sg3_utils/sg3_utils.hash                 |  4 ++--
>  package/sg3_utils/sg3_utils.mk                   |  5 +----
>  3 files changed, 3 insertions(+), 22 deletions(-)
>  delete mode 100644 package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> 
> diff --git a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch b/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> deleted file mode 100644
> index d9106cd9f8..0000000000
> --- a/package/sg3_utils/0001-support-uclinux-as-a-linux.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Recognise uclinux as a linux
> -
> -Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> -
> -diff -durN sg3_utils-1.42.orig/configure.ac sg3_utils-1.42/configure.ac
> ---- sg3_utils-1.42.orig/configure.ac	2015-10-21 01:10:59.000000000 +0200
> -+++ sg3_utils-1.42/configure.ac	2016-08-14 19:30:37.841766149 +0200
> -@@ -71,7 +71,7 @@
> - 
> - # Define platform-specific symbol.
> - AM_CONDITIONAL(OS_FREEBSD, [echo $host_os | grep 'freebsd' > /dev/null])
> --AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep '^linux' > /dev/null])
> -+AM_CONDITIONAL(OS_LINUX, [echo $host_os | grep -E '^(uc)?linux' > /dev/null])
> - AM_CONDITIONAL(OS_OSF, [echo $host_os | grep '^osf' > /dev/null])
> - AM_CONDITIONAL(OS_SOLARIS, [echo $host_os | grep '^solaris' > /dev/null])
> - AM_CONDITIONAL(OS_WIN32_MINGW, [echo $host_os | grep '^mingw' > /dev/null])
> diff --git a/package/sg3_utils/sg3_utils.hash b/package/sg3_utils/sg3_utils.hash
> index 39510b4dc2..ff2ef55180 100644
> --- a/package/sg3_utils/sg3_utils.hash
> +++ b/package/sg3_utils/sg3_utils.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated from download (no sig, hash)
> -sha256  59c268b10b93ce31a517af13e19c88f285c12b7dd065f50e36b16a7b6fa7b9a0  sg3_utils-1.46.tar.xz
> +sha256  ddb0cab85fedd8b0db020f3e3f02f6967a055616bf16ea9d5c7408cde41472b2  sg3_utils-1.47.tar.xz
>  
>  # Hash for license files
> -sha256  256ec2d7e4e79faabb105ed1ddf32aec11d830c3dadb955a4ab2616eb87439ba  COPYING
> +sha256  d212debdb0a5d7754c977f6dc53bb6c88b4ace7ab784ddbccd06bb970adb1a37  COPYING
>  sha256  8ddd1d82f2be2f5cbd5b5c3b5c2ee94a90d2ca7112958448da74dd78384fd96a  BSD_LICENSE
> diff --git a/package/sg3_utils/sg3_utils.mk b/package/sg3_utils/sg3_utils.mk
> index 1983a12261..055f7befb9 100644
> --- a/package/sg3_utils/sg3_utils.mk
> +++ b/package/sg3_utils/sg3_utils.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SG3_UTILS_VERSION = 1.46
> +SG3_UTILS_VERSION = 1.47
>  SG3_UTILS_SOURCE = sg3_utils-$(SG3_UTILS_VERSION).tar.xz
>  SG3_UTILS_SITE = http://sg.danny.cz/sg/p
>  SG3_UTILS_LICENSE = BSD-2-Clause (library)
> @@ -14,9 +14,6 @@ SG3_UTILS_LICENSE += , GPL-2.0+ (programs), BSD-2-Clause (programs)
>  endif
>  SG3_UTILS_LICENSE_FILES = COPYING BSD_LICENSE
>  
> -# Patching configure.ac/Makefile.am
> -SG3_UTILS_AUTORECONF = YES
> -
>  # install the libsgutils2 library
>  SG3_UTILS_INSTALL_STAGING = YES
>  
> -- 
> 2.33.0
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
