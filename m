Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB4EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB41E40328;
	Sun, 14 Aug 2022 19:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB41E40328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vh5caZKgOwDH; Sun, 14 Aug 2022 19:48:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C901F4029B;
	Sun, 14 Aug 2022 19:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C901F4029B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 979A51BF30C
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72B3960B78
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B3960B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IiKPBa6clJMp for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:48:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23F3660A6D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23F3660A6D
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:48:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6688B60132;
 Sun, 14 Aug 2022 21:48:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 21:48:51 +0200
Date: Sun, 14 Aug 2022 21:48:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814194851.GK2854108@scaer>
References: <20220814181234.2873747-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814181234.2873747-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660506533;
 bh=eDiVmFSG2939aOiRbgxrsUqdAsnb81k0ZZT5Q2my5j0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ptkjZXhILpPP9RiwRaWwms8BgsgO4zdNd8QsuppjQjWyMkYb/S90jjruVFjV/wYwN
 z/LxTOVDXHoOpc1Got50mdZwyoNtY0A7FcFgiW7ttI5G8JQuInRj6YHZmSvHKa/Zoh
 IY1/0wR6EMZKPtEl4afEQEnVtX/V5Q2Jg/gOr1czmsfsyrMBDnphIywfvJOkdOgv9n
 5bOaoZ4XGPejIM6//G0/I13h83G7cyDzkPqMSet7/qJraUT7N+YF5P4fRMRgFqtSk4
 veRhXjuPPZzsDuIuEW4tnbkCCPjWTq8ajka5GrBo522DTOM1Z0hpoVc3ZMX9VCS48x
 gHShRpN3O4/Ew==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ptkjZXhI
Subject: Re: [Buildroot] [PATCH v2,1/1] package/jose: disable man pages
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

On 2022-08-14 20:12 +0200, Fabrice Fontaine spake thusly:
> Disable man pages to avoid the following build failure if a non-working
> a2x is found on the system raised since bump to version 11 in commit
> b72b849ad597810823ecf9efe471a40e2427c8e8:
> 
> /usr/bin/a2x -f manpage -D /nvmedata/autobuild/instance-23/output-1/build/jose-11/build /nvmedata/autobuild/instance-23/output-1/build/jose-11/doc/man/jose.1.adoc
> /nvmedata/autobuild/instance-23/output-1/host/bin/python3: Error while finding module specification for 'asciidoc.a2x' (ModuleNotFoundError: No module named 'asciidoc')
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/ae69f7fd1258d99a5b08eeb8c67904be53eabf15
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Thomas Petazzoni):
>  - Fix typo: false -> true
> 
>  ...dd-option-to-skip-building-man-pages.patch | 65 +++++++++++++++++++
>  package/jose/jose.mk                          |  1 +
>  2 files changed, 66 insertions(+)
>  create mode 100644 package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> 
> diff --git a/package/jose/0002-man-add-option-to-skip-building-man-pages.patch b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> new file mode 100644
> index 0000000000..d9963d2504
> --- /dev/null
> +++ b/package/jose/0002-man-add-option-to-skip-building-man-pages.patch
> @@ -0,0 +1,65 @@
> +From 506132d3edc8d062f65fdacf007a15613d27e5c5 Mon Sep 17 00:00:00 2001
> +From: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +Date: Wed, 6 Apr 2022 09:49:48 -0300
> +Subject: [PATCH] man: add option to skip building man pages
> +
> +Add a 'skip_manpages' option to meson, so that man pages do not get
> +built.
> +
> +Signed-off-by: Eneas U de Queiroz <cotequeiroz@gmail.com>
> +[Retrieved from:
> +https://github.com/latchset/jose/pull/115/commits/506132d3edc8d062f65fdacf007a15613d27e5c5]

I've just shortened that to just the URL to the MR as a whole.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + meson.build       | 24 +++++++++++++-----------
> + meson_options.txt |  1 +
> + 2 files changed, 14 insertions(+), 11 deletions(-)
> + create mode 100644 meson_options.txt
> +
> +diff --git a/meson.build b/meson.build
> +index 1edfbe7..9b40efb 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -37,7 +37,6 @@ zlib = dependency('zlib')
> + threads = dependency('threads')
> + jansson = dependency('jansson', version: '>=2.10')
> + libcrypto = dependency('libcrypto', version: '>=1.0.2')
> +-a2x = find_program('a2x', required: false)
> + 
> + mans = []
> + 
> +@@ -63,14 +62,17 @@ pkg.generate(
> +   requires: 'jansson',
> + )
> + 
> +-if a2x.found()
> +-  foreach m : mans
> +-    custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
> +-      command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
> +-      install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
> +-      install: true
> +-    )
> +-  endforeach
> +-else
> +-  warning('Will not build man pages due to missing dependencies!')
> ++if not get_option('skip_manpages')
> ++  a2x = find_program('a2x', required: false)
> ++  if a2x.found()
> ++    foreach m : mans
> ++      custom_target(m.split('/')[-1], input: m + '.adoc', output: m.split('/')[-1],
> ++        command: [a2x, '-f', 'manpage', '-D', meson.current_build_dir(), '@INPUT@'],
> ++        install_dir: join_paths(get_option('mandir'), 'man' + m.split('.')[-1]),
> ++        install: true
> ++      )
> ++    endforeach
> ++  else
> ++    warning('Will not build man pages due to missing dependencies!')
> ++  endif
> + endif
> +diff --git a/meson_options.txt b/meson_options.txt
> +new file mode 100644
> +index 0000000..0885515
> +--- /dev/null
> ++++ b/meson_options.txt
> +@@ -0,0 +1 @@
> ++option('skip_manpages', type: 'boolean', value: false, description: 'Do not build manpages')
> diff --git a/package/jose/jose.mk b/package/jose/jose.mk
> index 8a60e20cc6..723ebe8bb9 100644
> --- a/package/jose/jose.mk
> +++ b/package/jose/jose.mk
> @@ -11,5 +11,6 @@ JOSE_LICENSE = Apache-2.0
>  JOSE_LICENSE_FILES = COPYING
>  JOSE_INSTALL_STAGING = YES
>  JOSE_DEPENDENCIES = host-pkgconf zlib jansson openssl
> +JOSE_CONF_OPTS = -Dskip_manpages=true
>  
>  $(eval $(meson-package))
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
