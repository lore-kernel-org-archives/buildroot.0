Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F11FC77B73
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 21:05:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFC17427AE;
	Thu,  4 May 2023 21:05:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFC17427AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cHZTSNJNuY3j; Thu,  4 May 2023 21:05:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DA4B4204F;
	Thu,  4 May 2023 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DA4B4204F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8929F1BF3AF
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 614E54204F
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 21:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 614E54204F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yc-zzGTvZYDo for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 21:05:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1948842039
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1948842039
 for <buildroot@buildroot.org>; Thu,  4 May 2023 21:05:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:3f23:63cb:29e9:f8d4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6765A1A62F9;
 Thu,  4 May 2023 22:24:13 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 04 May 2023 22:24:13 +0200
Date: Thu, 4 May 2023 22:24:13 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230504202413.GM2696@scaer>
References: <20230503185144.13679-1-ps.report@gmx.net>
 <20230503185144.13679-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503185144.13679-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683231861;
 bh=K+LrFG4jiB1ZWkBQB7KtgQEkVyKQmZ3vnY0rUeEShVU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uvL2fpjWSXD0F8ON3xjB1IGteDEmPj4iQCifHBIBLy4SMAfYibwjpmi07RcmrLR5V
 Tp5mHrveJbiiG5g9o5/g5V4oMGVL6JkpCtGC6DPy/kvUYduM76n/Vw8VIJodYQMuCV
 701HnzyI2S/BVOL7qVE52M9SJMgCCuQnij6bxcf8f5Td1JgV36M5YdzKdSFmpmVMtM
 v2OHoBa2Pn++YaHX/in0C2scH06u6xI4STFWiK2Rb1ZK50cXSITaUe9plFUx5111Aj
 q6wFl5Dw2a3I5LGWq1Joi6oadWmeoYudVPJoffsAYIJrbmj6qTXNze5woVjRHgYfJM
 /RUGp8ffl1Jzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uvL2fpjW
Subject: Re: [Buildroot] [PATCH v1 2/2] package/coreutils: change/remove
 some of the configure environmental variables
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-05-03 20:51 +0200, Peter Seiderer spake thusly:
> - remove ac_cv_func_euidaccess=no (no longer used)
> - rename ac_cv_func_lstat_dereferences_slashed_symlink=yes to
>   gl_cv_func_lstat_dereferences_slashed_symlink=yes

I did not find this rename in your commit...

> - remove ac_cv_func_lstat_empty_string_bug=no (no longer used)
> - remove ac_cv_func_strtod=yes (no longer used)
> - remove ac_cv_func_working_mktime=yes (no longer used)
> - remove gl_cv_func_gettimeofday_clobber=no (no longer used)
> - remove gl_cv_func_tzset_clobber=no (no longer used)
> - remove gl_getline_needs_run_time_check=no (no longer used)

It is a bit sad that core autotools packages like gnulib and coreustils
can't natively cross-comple because of AC_TRY_RUN, and needs so much
feeding of results...

Care to check the rename, and respin, please?

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/coreutils/coreutils.mk | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index cf42a8aff8..7ee729ef48 100644
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
> @@ -44,15 +39,12 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
>  	fu_cv_sys_stat_statfs2_bsize=yes \
>  	gl_cv_func_getcwd_null=yes \
>  	gl_cv_func_getcwd_path_max=yes \
> -	gl_cv_func_gettimeofday_clobber=no \
>  	gl_cv_func_link_follows_symlink=no \
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
> 2.40.0
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
