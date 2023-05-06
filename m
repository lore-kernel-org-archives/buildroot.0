Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2E8C77B75
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDAE682234;
	Sat,  6 May 2023 15:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EDAE682234
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cwQArhRCVNkP; Sat,  6 May 2023 15:59:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E84E482236;
	Sat,  6 May 2023 15:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E84E482236
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BBAD51BF27C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F05417CD
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:59:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F05417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1Yo3lhAre1Np for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:59:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB8F41758
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDB8F41758
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:59:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 988DAB0054C;
 Sat,  6 May 2023 17:59:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:59:33 +0200
Date: Sat, 6 May 2023 17:59:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230506155933.GK252090@scaer>
References: <SN4P221MB0682718D84B7ABFF32345345A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682718D84B7ABFF32345345A0729@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683388775;
 bh=XwjUHZ9muEoX6r8R5E8sEMVNDZCIbrPvgAAG0noiJic=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SjmppSZrOy2w6+XTGePKgfqse0lC1vp4BUTB0qf4aU/yOrOPDh4+RPYDdocVvF0m1
 24dM5KqqTG7yg0GzCiqmJx3nlhAU1YnDYcsDAlHuF/C6BX7ITgM6mSXHNQ9q9LL7yh
 WLhiYnaNG2gwpKb0o8cBFNXAEkrdq2PSXcNfZYJ1+CgT8LGaRhdOjDVEAXsBTEU0BR
 SJsOdUXf3idRUXD/fbpk17S47eSy09qjp5Z8e5Fr7/z2PIsOKX1OpJXsVUg7xyxRzJ
 rdGs/OyvInUcWcLyP9JggArwQ+6ivdEaP6ZCkCrHOtNT85bYSn110CJ/1zFrs6Oqff
 v2gbM/ryzyMAQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SjmppSZr
Subject: Re: [Buildroot] [PATCH] package/rpm: bump to version 4.18.1
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

James, All,

On 2023-05-05 00:11 -0400, James Knight spake thusly:
> The most recent release of RPM is v4.18.1 [1].
> 
> - When Python 3 support is detected, enable Python 3-related support.
> - When readline support is detected, enable readline support.
> - Adding a series of feature-disable configurations of options
>    introduced over the recent versions, but where never added.
> - Adding an upstream patch to prevent build failures for certain
>    toolchains (0001-fix-var-declare-in-label-error.patch). Fix should be
>    available next release.
> - Drops the use of `RPM_CFLAGS`, which their use has been obsolete when
>    this package bumped to v4.17 [2].

These should have been separate patches, one for each semantic change
done, in a series:

    package/rpm: drop remnants of custom CFLAGS
    package/rpm: add more disabling options
    package/rpm: bump to version 4.18.1
    package/rpm: add python support
    package/rpm: add readline support

The patch fixing the build of the newer version should of course be
added with the bump).

Care to split and respin, please?

Regards,
Yann E. MORIN.

> [1]: https://rpm.org/wiki/Releases/4.18.1
> [2]: 429e247b869027f6ecd4efa0f31bccd2765e3875
> 
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  .../0001-fix-var-declare-in-label-error.patch | 40 +++++++++++++++++++
>  package/rpm/rpm.hash                          |  4 +-
>  package/rpm/rpm.mk                            | 23 +++++++++--
>  3 files changed, 61 insertions(+), 6 deletions(-)
>  create mode 100644 package/rpm/0001-fix-var-declare-in-label-error.patch
> 
> diff --git a/package/rpm/0001-fix-var-declare-in-label-error.patch b/package/rpm/0001-fix-var-declare-in-label-error.patch
> new file mode 100644
> index 0000000000000000000000000000000000000000..648040c66307d1f896680e79c3fd96fe180c9fa2
> --- /dev/null
> +++ b/package/rpm/0001-fix-var-declare-in-label-error.patch
> @@ -0,0 +1,40 @@
> +From b960c0b43a080287a7c13533eeb2d9f288db1414 Mon Sep 17 00:00:00 2001
> +From: Florian Festi <ffesti@redhat.com>
> +Date: Thu, 16 Mar 2023 19:05:04 +0100
> +Subject: [PATCH] Fix compiler error on clang
> +
> +Turns out variable declarations are not allowed after a label, even in
> +C99. And while some compilers don't seem to care others do.
> +
> +Moving the declaration of mayopen to the start of the function to avoid
> +this problem.
> +
> +Resolves: #2435
> +
> +Upstream: b960c0b43a080287a7c13533eeb2d9f288db1414
> +Signed-off-by: James Knight <james.d.knight@live.com>
> +---
> + lib/fsm.c | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
> +
> +diff --git a/lib/fsm.c b/lib/fsm.c
> +index 5671ac642d..183293edb0 100644
> +--- a/lib/fsm.c
> ++++ b/lib/fsm.c
> +@@ -879,6 +879,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
> +     int nodigest = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOFILEDIGEST) ? 1 : 0;
> +     int nofcaps = (rpmtsFlags(ts) & RPMTRANS_FLAG_NOCAPS) ? 1 : 0;
> +     int firstlinkfile = -1;
> ++    int mayopen = 0;
> +     char *tid = NULL;
> +     struct filedata_s *fdata = xcalloc(fc, sizeof(*fdata));
> +     struct filedata_s *firstlink = NULL;
> +@@ -1016,7 +1017,7 @@ int rpmPackageFilesInstall(rpmts ts, rpmte te, rpmfiles files,
> + 
> + setmeta:
> + 	    /* Special files require path-based ops */
> +-	    int mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
> ++	    mayopen = S_ISREG(fp->sb.st_mode) || S_ISDIR(fp->sb.st_mode);
> + 	    if (!rc && fd == -1 && mayopen) {
> + 		int flags = O_RDONLY;
> + 		/* Only follow safe symlinks, and never on temporary files */
> diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
> index dfe50303f7db47e34a42d6d0f17bf2c097455e1c..fd03f062bc7da37519e4bc95da37c70a17ba7d82 100644
> --- a/package/rpm/rpm.hash
> +++ b/package/rpm/rpm.hash
> @@ -1,5 +1,5 @@
> -# From https://rpm.org/wiki/Releases/4.18.0.html
> -sha256  2a17152d7187ab30edf2c2fb586463bdf6388de7b5837480955659e5e9054554  rpm-4.18.0.tar.bz2
> +# From https://rpm.org/wiki/Releases/4.18.1.html
> +sha256  37f3b42c0966941e2ad3f10fde3639824a6591d07197ba8fd0869ca0779e1f56  rpm-4.18.1.tar.bz2
>  
>  # Hash for license file
>  sha256  171d94d9f1641316bff7f157a903237dc69cdb5fca405fed8c832c76ed8370f9  COPYING
> diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
> index fc57a14fd6518ddcd65a90f294ecabbca8057f67..c66ce6992d9b29d0463a66b43d278b269610c79f 100644
> --- a/package/rpm/rpm.mk
> +++ b/package/rpm/rpm.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  RPM_VERSION_MAJOR = 4.18
> -RPM_VERSION = $(RPM_VERSION_MAJOR).0
> +RPM_VERSION = $(RPM_VERSION_MAJOR).1
>  RPM_SOURCE = rpm-$(RPM_VERSION).tar.bz2
>  RPM_SITE = http://ftp.rpm.org/releases/rpm-$(RPM_VERSION_MAJOR).x
>  RPM_DEPENDENCIES = \
> @@ -27,9 +27,11 @@ RPM_SELINUX_MODULES = rpm
>  # --enable-openmp is provided and OpenMP is < 4.5:
>  # https://github.com/rpm-software-management/rpm/pull/1433
>  RPM_CONF_OPTS = \
> -	--disable-python \
>  	--disable-rpath \
> -	--with-gnu-ld
> +	--with-gnu-ld \
> +	--without-fapolicyd \
> +	--without-fsverity \
> +	--without-imaevm
>  
>  ifeq ($(BR2_PACKAGE_ACL),y)
>  RPM_DEPENDENCIES += acl
> @@ -80,6 +82,20 @@ else
>  RPM_CONF_OPTS += --without-selinux
>  endif
>  
> +ifeq ($(BR2_PACKAGE_PYTHON3),y)
> +RPM_DEPENDENCIES += python3
> +RPM_CONF_OPTS += --enable-python
> +else
> +RPM_CONF_OPTS += --disable-python
> +endif
> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +RPM_DEPENDENCIES += readline
> +RPM_CONF_OPTS += --with-readline
> +else
> +RPM_CONF_OPTS += --without-readline
> +endif
> +
>  ifeq ($(BR2_PACKAGE_SQLITE),y)
>  RPM_DEPENDENCIES += sqlite
>  RPM_CONF_OPTS += --enable-sqlite
> @@ -104,7 +120,6 @@ endif
>  # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
>  RPM_CONF_ENV = \
>  	ac_cv_prog_cc_c99='-std=gnu99' \
> -	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
>  	LIBS=$(TARGET_NLS_LIBS)
>  
>  $(eval $(autotools-package))
> -- 
> 2.40.1.windows.1
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
