Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECE6C7EE26
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 18:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EB63B405D9;
	Wed,  3 May 2023 18:52:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB63B405D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TrISHLbIYPqV; Wed,  3 May 2023 18:52:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B4CE41D3A;
	Wed,  3 May 2023 18:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B4CE41D3A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C4021BF861
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0411F41D95
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 18:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0411F41D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gYAb5l5k2rUR for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 18:51:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A362D40450
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A362D40450
 for <buildroot@buildroot.org>; Wed,  3 May 2023 18:51:48 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.209.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6UZv-1psMhs1ilF-006ywn; Wed, 03
 May 2023 20:51:45 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  3 May 2023 20:51:44 +0200
Message-Id: <20230503185144.13679-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230503185144.13679-1-ps.report@gmx.net>
References: <20230503185144.13679-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:K5t+SihpuRC3kQSHVzGwf5TFzLrRlwUwynnxvoKJRmdBAujY+n0
 89TDjdpylT+kKJbnFM5yzKT0BstWhl2BaKMnpJtb8R23nLmknPQ3TttdQxJo9OylcFW3ATm
 TMA9hj2M+srjXArLAR1yItQFtZLdugqrtnlKHQ6feAvqQaNUDcRpLqhxF4hRlt+eOOjouPp
 vcgV2DQsHtuCcz9SqbVYg==
UI-OutboundReport: notjunk:1;M01:P0:KXekt7jYjzA=;yVULpJG3s+NolPgx5im9In5q/UE
 CYFV9bznMuRg7B+/n5gjl9StNzQ452pft1mfQnZbyBc8BU8v7BI37pRjUzoo6wr5XJ/mzbIvb
 YHudrwRJ2TO5+ojBcf5NWuyc35yXW81x8gdXhaSuDDIoGrAKpU21a85G32gHzWxlhh/vxALir
 aNjYoVxla1nqrUqu1ZD8bpb7hphnqzZIjWoTGdckqB+z7isDhbExe4vU+zTsyS9SVs/chtyoU
 JFX/XLKcC8n85PV9mT6+1Fi7wJAaQYZGiHqn6Pgj8qylfrlFJrGEgFM2ezHROXszA1Thy6EvD
 cTCAHstEG1HzgAoFTh75TR+e9Kex7z0zYS7oqu9HMItPbRJjarljKb8GwBM9nn7PZlYqRmSUk
 952U+6CIhAMdScqeRQWvwKNd1b2QKAz/cUQuSauowDpgMGqxDCk40yvDb2fhLm7dRxY8aS5Jt
 LL15mXZc8Jy2/UifxR+ynNd6Ct8UD6+60fy9poxaVDcpTXDBz8osfm56JB2JA8IyHBYj2Ez4+
 3WvziVNYRFdc+z54aGNtUTgLO9CD2oWVwQX95uPbHs64OkpzYXhezSfQwRAttKgT0/+E4yKzX
 wXNTpsPLTcIJjSAir/S2M5i+z+O4aI8tQNvikvR5Y4mQsmaWDXP3/MbILpKSs1JsPzTAh6yPd
 kUxd9N6FXqnRumBOvszk7a2U9yGsmlto2fhSOUT8mMOxHRCjpJeeW8DIOkD+6svPEgpNpVb7l
 rEY7hii4LaBQ9mFZYVTYKIrZyzMGbmrav8HTTmGeYQ/KTP01atnwQs/RNEoJWzwcXkI9w96M0
 hADuD/o0Lh4SKTv35rG6Q8InzEORyZOTx4PFkFxKnOFevGjCnfXotyxyddfj+bTk1ppp2ygMQ
 UFG6Hdcn051pWQWVM1It45dY7sudjq3ZBOUzbShPtJhPX09ZNKFIpHwV05EgFXggXA9FUJpdb
 peXtLzWr2McmZNr7mqrFv4S9UFo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1683139905; i=ps.report@gmx.net;
 bh=IL4bRgZU/9woroXRN1m8H5fGIqkHD4NjYzPUzfMU4x0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=fSVYUDrsE1DLV4cCU0/tX6zp8Jfeg+5O1CHyfI2EvpxXReTkJqEW5gBlsJR//7YoF
 s4GB9udiZzwxkG6kCT3+aqgwi8zyr468Z+qieM2Aw4Ms/CDP1AlWuja5qbQpOg7rle
 GwVGqag9fBs86wXKgz3JGSxilFSmgUlMoZYx6yunoWC+Gv1AFEXjCPlH8/VoIoqHz6
 ktN/2yFgd1QcncTlMp89pnkpauC8wSN6gG2MmNTZHmVIhV7opWJG9YOOwg6lonimSW
 EUNIimrCeEUsp2fMwEi/blJDjfvtdP+fseDn2L9fVDCyRzhFvSxg78sttY98XvQ1qU
 PURe2huMZwh2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=fSVYUDrs
Subject: [Buildroot] [PATCH v1 2/2] package/coreutils: change/remove some of
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
Cc: Christian Stewart <christian@aperture.us>
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
 package/coreutils/coreutils.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index cf42a8aff8..7ee729ef48 100644
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
@@ -44,15 +39,12 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	fu_cv_sys_stat_statfs2_bsize=yes \
 	gl_cv_func_getcwd_null=yes \
 	gl_cv_func_getcwd_path_max=yes \
-	gl_cv_func_gettimeofday_clobber=no \
 	gl_cv_func_link_follows_symlink=no \
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
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
