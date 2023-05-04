Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC6BC77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 20:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F128641E3D;
	Thu,  4 May 2023 20:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F128641E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Nir38OTuGqeT; Thu,  4 May 2023 20:25:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD78E40913;
	Thu,  4 May 2023 20:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD78E40913
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 275871BF3B8
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5E341E3D
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 20:25:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B5E341E3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oS7TxEi5f2lS for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 20:25:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F169418C7
 for <buildroot@buildroot.org>; Thu,  4 May 2023 20:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F169418C7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B59485D83; Thu,  4 May 2023 20:25:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 22:19:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 773a6fb1b21caa01b209a81abe531d23e53e7b58
X-Git-Newrev: cd57580729e4d5ac1fe1ed67fdfb7723a9fddece
X-Patchwork-Hint: ignore
Message-Id: <20230504202549.0B59485D83@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coreutils: fix cross-compile (add
 gl_cv_macro_MB_CUR_MAX_good=yes)
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

commit: https://git.buildroot.net/buildroot/commit/?id=cd57580729e4d5ac1fe1ed67fdfb7723a9fddece
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- add 'gl_cv_macro_MB_CUR_MAX_good=yes' to COREUTILS_CONF_ENV to fix
  cross-compile failure since bump to 9.3

Fixes:

  checking whether MB_CUR_MAX is correct... configure: error: in '.../build/coreutils-9.3':
  configure: error: cannot run test program while cross compiling
  See 'config.log' for more details

Reported-by: Christian Stewart <christian@aperture.us>
Link: https://lore.kernel.org/buildroot/CA+h8R2qSe6OepJMJr+KOUOAOqCRD9EX690Y+Yq4kx-M6x4uQBw@mail.gmail.com/
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/coreutils/coreutils.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 2c12e8ef2f..cf42a8aff8 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -51,6 +51,7 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_tzset_clobber=no \
 	gl_cv_func_working_mkstemp=yes \
 	gl_cv_func_working_utimes=yes \
+	gl_cv_macro_MB_CUR_MAX_good=yes \
 	gl_getline_needs_run_time_check=no \
 	gl_cv_have_proc_uptime=yes \
 	utils_cv_localtime_cache=no \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
