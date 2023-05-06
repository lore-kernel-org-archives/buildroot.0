Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5DDC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B27384048;
	Sat,  6 May 2023 15:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B27384048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwzBHWYeBVvf; Sat,  6 May 2023 15:37:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F30F81F21;
	Sat,  6 May 2023 15:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F30F81F21
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40D0C1BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1875F41F44
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1875F41F44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id npqHPahmMEEK for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:37:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE48C41F19
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE48C41F19
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:37:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C2626B0053D;
 Sat,  6 May 2023 17:37:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 17:37:50 +0200
Date: Sat, 6 May 2023 17:37:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230506153750.GI252090@scaer>
References: <20230505100810.1195-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230505100810.1195-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683387472;
 bh=EHQ/bwiOmQ3JSj3MJZOKhwG48jYHMxVOUTMjbIg7ius=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VfYV2cde/tvIrVMecfAB5RyRySUMRCbF/M/YrcM8x80s1IHxqvDhvXlcc5q9kTMFN
 EiqVNnpkzc0UhMfPmJzffboE8BIU6X0pkPGOVquMAO62M0mDZ9kljSZxOI3fMaBcZG
 493nn+0mEHv6sNJQH47co9cHeFm49NF6SkbSS5+ZBdj39pY06pVtWgIpjZejSRIZzP
 gpCsYzxMtGRmlYfY6D2+uNZUDHqYr0wRD2nVYXef2F27M/w2E+sw7drsLiMxtPp7Bx
 C0wz4cvVMVSr1uthIHur0MlCzHxlXqv+tPGz9i0nM1cvQmh6i8WULAe+J6ytWFtCsy
 eYfXgwsHhd4ow==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VfYV2cde
Subject: Re: [Buildroot] [PATCH v2] package/coreutils: change/remove some of
 the configure environmental variables
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

Peter, All,

On 2023-05-05 12:08 +0200, Peter Seiderer spake thusly:
> - remove ac_cv_func_euidaccess=no (no longer used)
> - rename ac_cv_func_lstat_dereferences_slashed_symlink=yes to
>   gl_cv_func_lstat_dereferences_slashed_symlink=yes
> - remove ac_cv_func_lstat_empty_string_bug=no (no longer used)
> - remove ac_cv_func_strtod=yes (no longer used)
> - remove ac_cv_func_working_mktime=yes (no longer used)
> - remove gl_cv_func_gettimeofday_clobber=no (no longer used)
> - remove gl_cv_func_tzset_clobber=no (no longer used)
> - remove gl_getline_needs_run_time_check=no (no longer used)
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 - > v2:
>   - add missing 'gl_cv_func_lstat_dereferences_slashed_symlink=yes'
>     (Yann E. MORIN)
> ---
>  package/coreutils/coreutils.mk | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index cf42a8aff8..e9cb7b67cb 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -22,18 +22,13 @@ endif
>  
>  COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>  	ac_cv_func_chown_works=yes \
> -	ac_cv_func_euidaccess=no \
>  	ac_cv_func_fstatat=yes \
>  	ac_cv_func_getdelim=yes \
>  	ac_cv_func_getgroups=yes \
>  	ac_cv_func_getgroups_works=yes \
>  	ac_cv_func_getloadavg=no \
> -	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
> -	ac_cv_func_lstat_empty_string_bug=no \
>  	ac_cv_func_strerror_r_char_p=no \
>  	ac_cv_func_strnlen_working=yes \
> -	ac_cv_func_strtod=yes \
> -	ac_cv_func_working_mktime=yes \
>  	ac_cv_have_decl_strerror_r=yes \
>  	ac_cv_have_decl_strnlen=yes \
>  	ac_cv_lib_getloadavg_getloadavg=no \
> @@ -44,15 +39,13 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>  	fu_cv_sys_stat_statfs2_bsize=yes \
>  	gl_cv_func_getcwd_null=yes \
>  	gl_cv_func_getcwd_path_max=yes \
> -	gl_cv_func_gettimeofday_clobber=no \
>  	gl_cv_func_link_follows_symlink=no \
> +	gl_cv_func_lstat_dereferences_slashed_symlink=yes \
>  	gl_cv_func_re_compile_pattern_working=yes \
>  	gl_cv_func_svid_putenv=yes \
> -	gl_cv_func_tzset_clobber=no \
>  	gl_cv_func_working_mkstemp=yes \
>  	gl_cv_func_working_utimes=yes \
>  	gl_cv_macro_MB_CUR_MAX_good=yes \
> -	gl_getline_needs_run_time_check=no \
>  	gl_cv_have_proc_uptime=yes \
>  	utils_cv_localtime_cache=no \
>  	PERL=missing \
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
