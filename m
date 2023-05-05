Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D515C77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 10:08:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 020EF616F5;
	Fri,  5 May 2023 10:08:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 020EF616F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mGEd4hHbgANB; Fri,  5 May 2023 10:08:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E045616E8;
	Fri,  5 May 2023 10:08:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E045616E8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF44B1BF392
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 10:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AE65B4030F
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 10:08:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE65B4030F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0qfLTRVTDrbQ for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 10:08:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E11C402CC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E11C402CC
 for <buildroot@buildroot.org>; Fri,  5 May 2023 10:08:13 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mr9Bu-1qXngr2N1i-00oDxv; Fri, 05
 May 2023 12:08:11 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Fri,  5 May 2023 12:08:10 +0200
Message-Id: <20230505100810.1195-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:k1LnVNPpTrEBLkFE6usCFN7ZvhwbE3rSpc1QK9AJq2UhEC2nv4t
 6+DUcUPonS0jxIV9vudnTpOjLcm4L95MnNqlz+9BdoYI4kN3eSTD9hGd+FtUqbvUtFDoH4e
 7fwoqukGMeDNVDauyV5KM+UkRbiQSasrjUwjCevTa6ZU7gmsw1ErlB/QzhD8CVCk5IzfPd+
 Qes10Lw6efinOeiCRIryg==
UI-OutboundReport: notjunk:1;M01:P0:4rQxkqlNXU4=;8g7XO4kudO9BJcu402/kopFjIl3
 Ii5KIz9R+qLorWyrhPAyyRMicBL1RsICqUxF2TPnh2b1z6R8Mmd1HbrPz+91FTNCvAdwBqdyt
 A+IeN/JFoaD9qIOSFm+je8yy18gZyqN+iL9XNZ/NRmjD39H9yBJNg+Ply+BzzqXh5pNfS/olF
 597fIndzMT8CXgAuOxx35MY9dvhy+C7j7XgyXV6ok48eQXuGd9ZUWtCJp16NDrGfDStjQB/QZ
 vOo5aYYHwYfCNyDhrtz1i70o7iFGyXFB8tUKMRdN/EoxGFCfpNN6h60XuN3sUO9BebJKAMr87
 rwsm4gL/Tae65hdz8zmnq3kxsMgrj8ePQqlM+Y492DrQYPd96O1s3rI4BcMWoOICNTq3mF0P+
 Vd8zvgp3qTmTc8hEoh0pnis4UhVi7Lv3tCQG8kQPWCtO5JnXt0tYWavn2cFpKDOQpQr0hzoKB
 Az8Ee00ssiKwK3t+xxzm18OzO2l1KxT2zBVbdqodZg/f/bcREtejipq6NRdVMWldmCYgHPI20
 x01zOMmvvoYp5wvn9G88bNsdAC0VTLuz+c2XuFWhZYrbcAYj6EEXnyJiQZ7LNky0Gnn+QyOnr
 gnlDnItWM8YRKfSKUAu33eJPMXFgWnKrlcD4DWpfG7SgfrDDUpMrCp5NqZMjxANEBi90jeOI9
 485evl5w2cnTuSdMNh8N66Dy0fymNXKlEbEU/XskQjSvqVt1WIq8drxXeakPWZDmSZ1vmYHqR
 jC7dKLDxiR7S4dxmfsnch3OpNP8vKqIoswf55sQuBvEHwn+xnWa47CwYMfvFeNWRRRnBrSRMv
 a+itZLd/9cp6S/A3DD6X21XQ3U87SECalkgaGIjvRllNGwaAsdvxdwxgTt+9QlsNJG02aSr/+
 8gjvrgwyZNSRM+FpOib6AJrnGyPcj/kGVViIqL4a5ZygbgLJTVJnUw5gkSReNH/Klifa0q8NR
 Juz6IN6YHn8TOEPbsq9t452X4wE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683281291; i=ps.report@gmx.net;
 bh=w76IYxVUIrWYfS5c8trJ7bAFYJ+IuHnww/i1RJCgnX4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=h1ZegoSWPIoCxiMgGNCfOk1XlDRZCKv20KaICClZsPxl/G70MEUi0FPB6725aOD98
 icdE4cy9F+Jfbea0SIgtzJXnEzzJuNZO+1tZSPPfuXQG15pxxij8DUOtFMYecHOoPZ
 Sr3nnNZio+C6ThVGyXZczpla9YBwb+Cj1jBnwaY3TFOANO8Idwk3qohHIuKj4ULRk4
 q4rJeyf1GlLVfFfEu5d1popM3cGIIgNsMltCgCnPNvn/ClnlBYEBbRna7XKTXmOTDF
 l9w7f3Itc/7j1QRWal1ZQeXrMvlD/6/+hmEzowo4muZpaw/zHw/rpTWxYyBUuEgLrg
 FYPN0K1AWxChw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=h1ZegoSW
Subject: [Buildroot] [PATCH v2] package/coreutils: change/remove some of the
 configure environmental variables
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- remove ac_cv_func_euidaccess=no (no longer used)
- rename ac_cv_func_lstat_dereferences_slashed_symlink=yes to
  gl_cv_func_lstat_dereferences_slashed_symlink=yes
- remove ac_cv_func_lstat_empty_string_bug=no (no longer used)
- remove ac_cv_func_strtod=yes (no longer used)
- remove ac_cv_func_working_mktime=yes (no longer used)
- remove gl_cv_func_gettimeofday_clobber=no (no longer used)
- remove gl_cv_func_tzset_clobber=no (no longer used)
- remove gl_getline_needs_run_time_check=no (no longer used)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 - > v2:
  - add missing 'gl_cv_func_lstat_dereferences_slashed_symlink=yes'
    (Yann E. MORIN)
---
 package/coreutils/coreutils.mk | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index cf42a8aff8..e9cb7b67cb 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -22,18 +22,13 @@ endif
 
 COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_chown_works=yes \
-	ac_cv_func_euidaccess=no \
 	ac_cv_func_fstatat=yes \
 	ac_cv_func_getdelim=yes \
 	ac_cv_func_getgroups=yes \
 	ac_cv_func_getgroups_works=yes \
 	ac_cv_func_getloadavg=no \
-	ac_cv_func_lstat_dereferences_slashed_symlink=yes \
-	ac_cv_func_lstat_empty_string_bug=no \
 	ac_cv_func_strerror_r_char_p=no \
 	ac_cv_func_strnlen_working=yes \
-	ac_cv_func_strtod=yes \
-	ac_cv_func_working_mktime=yes \
 	ac_cv_have_decl_strerror_r=yes \
 	ac_cv_have_decl_strnlen=yes \
 	ac_cv_lib_getloadavg_getloadavg=no \
@@ -44,15 +39,13 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	fu_cv_sys_stat_statfs2_bsize=yes \
 	gl_cv_func_getcwd_null=yes \
 	gl_cv_func_getcwd_path_max=yes \
-	gl_cv_func_gettimeofday_clobber=no \
 	gl_cv_func_link_follows_symlink=no \
+	gl_cv_func_lstat_dereferences_slashed_symlink=yes \
 	gl_cv_func_re_compile_pattern_working=yes \
 	gl_cv_func_svid_putenv=yes \
-	gl_cv_func_tzset_clobber=no \
 	gl_cv_func_working_mkstemp=yes \
 	gl_cv_func_working_utimes=yes \
 	gl_cv_macro_MB_CUR_MAX_good=yes \
-	gl_getline_needs_run_time_check=no \
 	gl_cv_have_proc_uptime=yes \
 	utils_cv_localtime_cache=no \
 	PERL=missing \
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
