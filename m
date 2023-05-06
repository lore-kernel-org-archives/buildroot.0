Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04D2C77B7F
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 15:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C98381F21;
	Sat,  6 May 2023 15:37:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C98381F21
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fFv5Ba_rZXUV; Sat,  6 May 2023 15:37:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EAE8142A;
	Sat,  6 May 2023 15:37:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EAE8142A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 447511BF36C
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A59D60F7B
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 15:37:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A59D60F7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pW9QBpKkCbxU for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 15:37:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59DE860804
 for <buildroot@buildroot.org>; Sat,  6 May 2023 15:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59DE860804
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 473D285E39; Sat,  6 May 2023 15:37:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 17:37:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d1ee7d624b71009ff61d4fa5ed860c52eb89b47
X-Git-Newrev: a85f4b53466c609bb121e2a021b643283e1849c6
X-Patchwork-Hint: ignore
Message-Id: <20230506153738.473D285E39@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: change/remove some of
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a85f4b53466c609bb121e2a021b643283e1849c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
