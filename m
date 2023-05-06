Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6DDDC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 14:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 756B761362;
	Sat,  6 May 2023 14:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756B761362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SSp3AtDvv5Wk; Sat,  6 May 2023 14:44:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 864376129A;
	Sat,  6 May 2023 14:44:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 864376129A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 520611BF36E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29C9341F8F
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 14:41:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29C9341F8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vEcxKfjdxEJh for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 14:41:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DEAD841FD7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DEAD841FD7
 for <buildroot@buildroot.org>; Sat,  6 May 2023 14:41:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3039BB005A1;
 Sat,  6 May 2023 16:41:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 16:41:42 +0200
Date: Sat, 6 May 2023 16:41:42 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Message-ID: <20230506144142.GE2661@scaer>
References: <20230505144917.6077-1-nicolas.cavallari@green-communications.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230505144917.6077-1-nicolas.cavallari@green-communications.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683384105;
 bh=VoQ+qoJi+jjcDPpWl4+6e2LVmP9N7exOCkw+Qw9zNew=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HVsR/OEeSP3PDktThmKiBdJPVa2yb8MXc8UPwZ1WZgug17hy133YGAProVOHi/0VP
 jfT9SZdE/w1fNAeD9vZL8LDD7+IRHBLLXGi/YgElrjp8LEr4PJACtJFU96uzlDFh7c
 mBZkdRTOGYI1ScHzaJTDgGHOVR0GchwcRztYUgRB0VbOIgTBdKfnM1ALLo7eWk5QTY
 fjwfWzMTntqNcDoP9tCcdBPXq8lTAL+sukwBQJjbN+2Z1D6XlFkvqzm9Go1wT8GPS3
 bpZ799dBKZTUri3czWFvttFJNxPIfEBoESLiLXSwlGC9xSITQpNo0SEpl2jJ4iiLOw
 OsUwFDsjyJRsg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HVsR/OEe
Subject: Re: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.6.4
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

Nicolas, All,

On 2023-05-05 16:49 +0200, Nicolas Cavallari spake thusly:
> * Remove patch applied upstream.
> * Upstream fixed building inside the source tree, but still does not
>   recommend it, so keep LIBGIT2_SUPPORTS_IN_SOURCE_BUILD = NO
> 
> Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...clare-win32-functions-on-non-win32-p.patch | 35 -------------------
>  package/libgit2/libgit2.hash                  |  2 +-
>  package/libgit2/libgit2.mk                    |  2 +-
>  3 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
> 
> diff --git a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch b/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
> deleted file mode 100644
> index 6be66ffee3..0000000000
> --- a/package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -From 20811c5aa9c528405eaa3f88ff22a9adebafa9e6 Mon Sep 17 00:00:00 2001
> -From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> -Date: Wed, 8 Mar 2023 14:00:52 +0100
> -Subject: [PATCH] sysdir: Do not declare win32 functions on non-win32 platforms
> -
> -These declaration poses problems on some embedded or retro Linux systems
> -that deliberately disable support for wchar_t from their libc.
> -
> -Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
> -[Retrieved from:
> -https://github.com/libgit2/libgit2/commit/20811c5aa9c528405eaa3f88ff22a9adebafa9e6]
> ----
> - src/libgit2/sysdir.h | 2 ++
> - 1 file changed, 2 insertions(+)
> -
> -diff --git a/src/libgit2/sysdir.h b/src/libgit2/sysdir.h
> -index 1d15bbf43..03f59e1de 100644
> ---- a/src/libgit2/sysdir.h
> -+++ b/src/libgit2/sysdir.h
> -@@ -134,10 +134,12 @@ extern int git_sysdir_set(git_sysdir_t which, const char *paths);
> -  */
> - extern int git_sysdir_reset(void);
> - 
> -+#ifdef GIT_WIN32
> - /** Sets the registry system dir to a mock; for testing.  */
> - extern int git_win32__set_registry_system_dir(const wchar_t *mock_sysdir);
> - 
> - /** Find the given system dir; for testing. */
> - extern int git_win32__find_system_dirs(git_str *out, const char *subdir);
> -+#endif
> - 
> - #endif
> --- 
> -2.39.2
> -
> diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
> index baf43c66f7..4dd6519ca3 100644
> --- a/package/libgit2/libgit2.hash
> +++ b/package/libgit2/libgit2.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  d557fbf35557bb5df53cbf38ae0081edb4a36494ec0d19741fa673e509245f8f  libgit2-1.6.2.tar.gz
> +sha256  d25866a4ee275a64f65be2d9a663680a5cf1ed87b7ee4c534997562c828e500d  libgit2-1.6.4.tar.gz
>  sha256  6f3c2cd59b057e366c1acc073b038135c52d77892bb33bd4d931c5369d3f062b  COPYING
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index b31f5199e1..9ddf2374bb 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBGIT2_VERSION = 1.6.2
> +LIBGIT2_VERSION = 1.6.4
>  LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
>  LIBGIT2_LICENSE = \
>  	GPL-2.0 with linking exception, \
> -- 
> 2.40.1
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
