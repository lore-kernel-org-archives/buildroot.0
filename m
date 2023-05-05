Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51654C77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 10:08:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA27D60A93;
	Fri,  5 May 2023 10:08:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA27D60A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sa08akSNuj8p; Fri,  5 May 2023 10:08:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD139616F0;
	Fri,  5 May 2023 10:08:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD139616F0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17CB11BF392
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 10:08:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EC46B616F0
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 10:08:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC46B616F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5mCoubQBEk3 for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 10:08:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8439D6059D
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8439D6059D
 for <buildroot@buildroot.org>; Fri,  5 May 2023 10:08:33 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([62.216.209.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MSc1B-1poWay1GDB-00SyYk; Fri, 05
 May 2023 12:08:29 +0200
Date: Fri, 5 May 2023 12:08:28 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20230505120828.6c0650fc@gmx.net>
In-Reply-To: <20230504202413.GM2696@scaer>
References: <20230503185144.13679-1-ps.report@gmx.net>
 <20230503185144.13679-2-ps.report@gmx.net>
 <20230504202413.GM2696@scaer>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:77xDXexQUy2xJ954vTRevQh40/Y1joxpqPjdqzsq/xrFJOPVb5C
 dnwmcE4Gatp3yABRLnuew/y9rjJrOdaJyyv8Xw8P4+s4eksXZ8WgMx/X13ubCbTlShqsEV/
 9Ug2SNTojenlTpV2/PXItcshLdtkGnMIGvznfCJtOwMTMuFlGZy1vsWLLztq08c9gkbcz96
 aqrbVRRQT2rbli5nKAoag==
UI-OutboundReport: notjunk:1;M01:P0:J6dxo2T3ld8=;+6cUE/Uhw47iX67UbIlUekgTR3d
 skgYR+5ZyAEdME9eqMQKK9yR8+6ErqFgi8n0BHG/COeMCKDF4MZTitw/VHd7aFE9/B4vZJSR5
 XqNQFHY7Nam3N21BvMNTPs0uVvAIIyIl3oX2IgViaro73Nz8AntMimQeFdyqYGByxns0BW6cd
 tKX30kFy6YNTomP+ugu52RkTgmjMMuhOBvPbwgNIOTt9q/ocdwKM6w/BuKiiJeHb2o7UIqzkF
 Dhj6GH2WbDUSHrscceKFxkNNpJjUGWdxFGskjeQP3G/LfoaxrrTJGDmNtaGNLz6jmh9brsmlj
 fDuorhyoog2DFWPcd2/HrRXmAkM6RhYqBSHOOic0ZtRo0c7BOLOTF5el7G43QlaFLEvz0F/i+
 QNFjFvq/A1CqSSI+z/timX3dZBZ9MdQ2yNfg7/CMf7LMsJhDZDg/oN4h/2sWM6W3lIUTbdpxO
 GVT8V6PUvAvZmN7MnhlCIbJPj0RktFLNFoemnuINk4E61HqyX0VkE5mqmBbvJ8r3zwh86Yv45
 ShvYTTtiQdaKZ6zCSPlIfUgtbNhajfW9AKbTLPcBcN7XsG8KywttpmoyExJESHbLD/PYSTPH+
 SmzxnWctsM5Zhzw5bYs8dNxPKr3vKrobhlBCQstO5a0/02LuLYak6dGd0OVydkhIEXne6xUDs
 lM4DjGtebYldMUhpnW5u/5d4QaMXcN/VRsVV39FM57fYVA/DF7R5hfpknPbt/wsX6TgEBBfIT
 Vg8plCX9f9+hQ3oAnB48qUdfQvZqElY9NaIPz3DZ/GfIMgnYh9FnjJBkzvXIKpvSviGB9dm6n
 UWaEuGhOWpQRoYopR85RY+ZBH8QzGxOPKSOqa2C5grv+8XFcFJC5pPM1XWjCq0wemYFlfhYfd
 +DhCs+Vpp54q47M7/rjTZxjVvTmVE+F5+Z+oRVV4z3zw6lF2jynHyNsSmxwUWwd01D9gK4uyF
 b63i4qtXIpEdXl6nmGIIUwa9S/s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683281309; i=ps.report@gmx.net;
 bh=eMyaqz+sHP/cxQT0FRDqY2WJhZYRrdGoaFDt41ydngI=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=Id7w9o2G2CWLTmJ5hEgVZlwXrtbFZdA33l6298XgktAqXysndwRM6nqhcq5FbMdrF
 Bp6UdDoAMZsu6N/57wRBEfGgDEpBlMbT/v3XUxeflHqGKYea9aMTqPjdd2dfS9A1+h
 X0rve8tesw0xes8AZd7TTQvak2D7D2N1RpmAAwTiLMTN53OTLuXRR9dqVHY9EnKUd0
 bZQFCtHBaw2yHnbLamvFvRafy7QR45CpPcijwiVgS3IZ3jJRtyTWBWy++50BNoj/gm
 2mblhg4ZBy3Iy1BTJwDmINn8K2N1LTz13AYe/w25IGhcaP2Begt9B8mgfyEdFYW6El
 bX1Ua2BbKTJ7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=Id7w9o2G
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

Hello Yann,

On Thu, 4 May 2023 22:24:13 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Peter, All,
>
> On 2023-05-03 20:51 +0200, Peter Seiderer spake thusly:
> > - remove ac_cv_func_euidaccess=no (no longer used)
> > - rename ac_cv_func_lstat_dereferences_slashed_symlink=yes to
> >   gl_cv_func_lstat_dereferences_slashed_symlink=yes
>
> I did not find this rename in your commit...

Ups, you are right, seems to get lost..., thanks for careful review!

>
> > - remove ac_cv_func_lstat_empty_string_bug=no (no longer used)
> > - remove ac_cv_func_strtod=yes (no longer used)
> > - remove ac_cv_func_working_mktime=yes (no longer used)
> > - remove gl_cv_func_gettimeofday_clobber=no (no longer used)
> > - remove gl_cv_func_tzset_clobber=no (no longer used)
> > - remove gl_getline_needs_run_time_check=no (no longer used)
>
> It is a bit sad that core autotools packages like gnulib and coreustils
> can't natively cross-comple because of AC_TRY_RUN, and needs so much
> feeding of results...
>
> Care to check the rename, and respin, please?

Updated patch will follow...

Regards,
Peter

>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  package/coreutils/coreutils.mk | 8 --------
> >  1 file changed, 8 deletions(-)
> >
> > diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> > index cf42a8aff8..7ee729ef48 100644
> > --- a/package/coreutils/coreutils.mk
> > +++ b/package/coreutils/coreutils.mk
> > @@ -22,18 +22,13 @@ endif
> >
> >  COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
> >  	ac_cv_func_chown_works=yes \
> > -	ac_cv_func_euidaccess=no \
> >  	ac_cv_func_fstatat=yes \
> >  	ac_cv_func_getdelim=yes \
> >  	ac_cv_func_getgroups=yes \
> >  	ac_cv_func_getgroups_works=yes \
> >  	ac_cv_func_getloadavg=no \
> > -	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
> > -	ac_cv_func_lstat_empty_string_bug=no \
> >  	ac_cv_func_strerror_r_char_p=no \
> >  	ac_cv_func_strnlen_working=yes \
> > -	ac_cv_func_strtod=yes \
> > -	ac_cv_func_working_mktime=yes \
> >  	ac_cv_have_decl_strerror_r=yes \
> >  	ac_cv_have_decl_strnlen=yes \
> >  	ac_cv_lib_getloadavg_getloadavg=no \
> > @@ -44,15 +39,12 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
> >  	fu_cv_sys_stat_statfs2_bsize=yes \
> >  	gl_cv_func_getcwd_null=yes \
> >  	gl_cv_func_getcwd_path_max=yes \
> > -	gl_cv_func_gettimeofday_clobber=no \
> >  	gl_cv_func_link_follows_symlink=no \
> >  	gl_cv_func_re_compile_pattern_working=yes \
> >  	gl_cv_func_svid_putenv=yes \
> > -	gl_cv_func_tzset_clobber=no \
> >  	gl_cv_func_working_mkstemp=yes \
> >  	gl_cv_func_working_utimes=yes \
> >  	gl_cv_macro_MB_CUR_MAX_good=yes \
> > -	gl_getline_needs_run_time_check=no \
> >  	gl_cv_have_proc_uptime=yes \
> >  	utils_cv_localtime_cache=no \
> >  	PERL=missing \
> > --
> > 2.40.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
