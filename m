Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19180ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 16:29:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBAE2403D6;
	Sun, 30 Oct 2022 16:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBAE2403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 20Cc6eyPgDDH; Sun, 30 Oct 2022 16:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE26240198;
	Sun, 30 Oct 2022 16:29:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE26240198
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DFFF1BF479
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46CD4403EA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 16:28:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46CD4403EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7n1TV94I0WYa for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 16:28:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 203D640198
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 203D640198
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 16:28:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6ffe:83e9:a65c:45ae])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5F0EF13F85A;
 Sun, 30 Oct 2022 17:28:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 30 Oct 2022 17:28:37 +0100
Date: Sun, 30 Oct 2022 17:28:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221030162837.GP1058960@scaer>
References: <20221029084455.97704-1-fontaine.fabrice@gmail.com>
 <20221029084455.97704-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221029084455.97704-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667147320;
 bh=9xxkLvojOHIRPNGl05qC1DqY3H3SlIxruQ9ANDPjdJo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S/H+2Q+qyLyPpOhOA4wxxo+aG9wFG22LfeCsc5cfPLzG31TSiXmnqCiVQDT7D2aH6
 e20DIQYrynvFL0jmA/5MO0+uLt5MvkS7Pf9rJod66XOUKbrrzxdmAakppyGwM1HEj8
 HvCa6q4kna0C0gNTs/wFQllNx9vANB7Qh5O2DmBkU1k0jw/O1zmUMgqf3pKoebOhdv
 9DmuRVo8jiIIdmlDqCtD/4t1v64dNNOkQwWiH64YADeALORAgbWYOdb2iKfM9hmeMR
 5fJk818Ww8VuXpu1S/WQWM3K7nWb+ORQ1ZJJthhqDxSD5/Qh7JWtaUNtPcKO+Z9b86
 6sLZWscANr/sA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S/H+2Q+q
Subject: Re: [Buildroot] [PATCH 2/2] package/numactl: bump to version 2.0.16
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-29 10:44 +0200, Fabrice Fontaine spake thusly:
> - Drop patches (already in version)
> - Use official tarball and so drop autoreconf
> 
> https://github.com/numactl/numactl/releases/tag/v2.0.15
> https://github.com/numactl/numactl/releases/tag/v2.0.16
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...0001-Do-not-stringify-SYMVER-symbols.patch | 25 ---------
>  .../0002-link-with-latomic-if-needed.patch    | 52 -------------------
>  package/numactl/numactl.hash                  |  2 +-
>  package/numactl/numactl.mk                    |  6 +--
>  4 files changed, 4 insertions(+), 81 deletions(-)
>  delete mode 100644 package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
>  delete mode 100644 package/numactl/0002-link-with-latomic-if-needed.patch
> 
> diff --git a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch b/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
> deleted file mode 100644
> index c6981aaf73..0000000000
> --- a/package/numactl/0001-Do-not-stringify-SYMVER-symbols.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -From f96c96af7fbf2779b15f66f03b10315a24fb4f5a Mon Sep 17 00:00:00 2001
> -From: Scott McMillan <smcmillan@nvidia.com>
> -Date: Fri, 9 Oct 2020 08:56:52 -0500
> -Subject: [PATCH] Do not stringify SYMVER symbols
> -
> -Upstream: f96c96af7fbf2779b15f66f03b10315a24fb4f5a
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - util.h | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/util.h b/util.h
> -index 99ada33..f2a20ac 100644
> ---- a/util.h
> -+++ b/util.h
> -@@ -22,5 +22,5 @@ extern char *policy_name(int policy);
> - #if HAVE_ATTRIBUTE_SYMVER
> - #define SYMVER(a,b) __attribute__ ((symver (b)))
> - #else
> --#define SYMVER(a,b) __asm__ (".symver " #a "," #b);
> -+#define SYMVER(a,b) __asm__ (".symver " a "," b);
> - #endif
> --- 
> -2.30.2
> -
> diff --git a/package/numactl/0002-link-with-latomic-if-needed.patch b/package/numactl/0002-link-with-latomic-if-needed.patch
> deleted file mode 100644
> index 6dff0cb233..0000000000
> --- a/package/numactl/0002-link-with-latomic-if-needed.patch
> +++ /dev/null
> @@ -1,52 +0,0 @@
> -From e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Thu, 6 May 2021 23:08:36 +0200
> -Subject: [PATCH] link with -latomic if needed
> -
> -numactl unconditionally uses __atomic_fetch_and but some architectures
> -(e.g. sparc) needs to link with -latomic to be able to use it. So check
> -if -latomic is needed and update numa.pc accordingly
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Retrieved from:
> -https://github.com/numactl/numactl/commit/e0de0d9e981ddb53bdeb4a4b9dc43046c9ff4ff9]
> ----
> - Makefile.am  | 1 +
> - configure.ac | 2 ++
> - numa.pc.in   | 1 +
> - 3 files changed, 4 insertions(+)
> -
> -diff --git a/Makefile.am b/Makefile.am
> -index 44d0d76..34f6815 100644
> ---- a/Makefile.am
> -+++ b/Makefile.am
> -@@ -151,6 +151,7 @@ SED_PROCESS = \
> -         -e 's,@exec_prefix\@,$(exec_prefix),g' \
> -         -e 's,@libdir\@,$(libdir),g' \
> -         -e 's,@includedir\@,$(includedir),g' \
> -+        -e 's,@LIBS\@,$(LIBS),g' \
> -         < $< > $@ || rm $@
> - 
> - %.pc: %.pc.in Makefile
> -diff --git a/configure.ac b/configure.ac
> -index 659a765..e3b0eb3 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -24,6 +24,8 @@ AM_CONDITIONAL([HAVE_TREE_VECTORIZE], [test x"${tree_vectorize}" = x"true"])
> - 
> - AC_CONFIG_FILES([Makefile])
> - 
> -+AC_SEARCH_LIBS([__atomic_fetch_and_1], [atomic])
> -+
> - # GCC tries to be "helpful" and only issue a warning for unrecognized
> - # attributes.  So we compile the test with Werror, so that if the
> - # attribute is not recognized the compilation fails
> -diff --git a/numa.pc.in b/numa.pc.in
> -index 8a0f202..cc04d50 100644
> ---- a/numa.pc.in
> -+++ b/numa.pc.in
> -@@ -8,3 +8,4 @@ Description: NUMA policy library
> - Version: @VERSION@
> - Cflags: -I${includedir}
> - Libs: -L${libdir} -lnuma
> -+Libs.Private: @LIBS@
> diff --git a/package/numactl/numactl.hash b/package/numactl/numactl.hash
> index a261eab9d0..757001b750 100644
> --- a/package/numactl/numactl.hash
> +++ b/package/numactl/numactl.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated
> -sha256  1ee27abd07ff6ba140aaf9bc6379b37825e54496e01d6f7343330cf1a4487035  numactl-2.0.14.tar.gz
> +sha256  1b242f893af977a1d31af6ce9d6b8dafdd2d8ec3dc9207f7c2dc0d3446e7c7c8  numactl-2.0.16.tar.gz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
>  sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
> diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
> index 6ff94091e9..b2f349255f 100644
> --- a/package/numactl/numactl.mk
> +++ b/package/numactl/numactl.mk
> @@ -4,12 +4,12 @@
>  #
>  ################################################################################
>  
> -NUMACTL_VERSION = 2.0.14
> -NUMACTL_SITE = $(call github,numactl,numactl,v$(NUMACTL_VERSION))
> +NUMACTL_VERSION = 2.0.16
> +NUMACTL_SITE = \
> +	https://github.com/numactl/numactl/releases/download/v$(NUMACTL_VERSION)
>  NUMACTL_LICENSE = LGPL-2.1 (libnuma), GPL-2.0 (programs)
>  NUMACTL_LICENSE_FILES = LICENSE.GPL2 LICENSE.LGPL2.1
>  NUMACTL_INSTALL_STAGING = YES
> -NUMACTL_AUTORECONF = YES
>  NUMACTL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -fPIC"
>  
>  $(eval $(autotools-package))
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
