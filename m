Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CA2CC433FE
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D27961040
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D27961040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E032605AC;
	Thu, 14 Oct 2021 21:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gpt-9vJrgJ-l; Thu, 14 Oct 2021 21:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FD7E605A2;
	Thu, 14 Oct 2021 21:09:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 488F31BF9D1
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2EEC240469
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 63eZQUhK1c0r for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 202D8400BA
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EC12194EAD; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:58:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 446d9f510255dda094d2ea89ad4f24a334b0ecc7
X-Git-Newrev: 243948cb877667ca8bf42170aa138622bde3d916
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.EC12194EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/oracle-mysql: fix build with
 autoconf >= 2.70
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

commit: https://git.buildroot.net/buildroot/commit/?id=243948cb877667ca8bf42170aa138622bde3d916
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da:

autoheader: warning: missing template: CRAY_STACKSEG_END
autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed

Fixes:
 - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...acros-alloca.m4-Remove-obsolete-Cray-supp.patch | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
new file mode 100644
index 0000000000..492e01bffe
--- /dev/null
+++ b/package/oracle-mysql/0011-config-ac-macros-alloca.m4-Remove-obsolete-Cray-supp.patch
@@ -0,0 +1,51 @@
+From 0d8ab9b020870c62c216fca77e7f8bd3eeb710c3 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 9 Oct 2021 19:23:46 +0200
+Subject: [PATCH] config/ac-macros/alloca.m4: Remove obsolete Cray support
+
+Remove obsolete Cray support to avoid the following build failure since
+autoconf >= 2.70 and
+http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=15edf7fd8094fd14a89d9891dd72a9624762597a:
+
+autoheader: warning: missing template: CRAY_STACKSEG_END
+autoheader: warning: Use AC_DEFINE([CRAY_STACKSEG_END], [], [Description])
+autoreconf: error: /home/buildroot/autobuild/instance-2/output-1/host/bin/autoheader failed with exit status: 1
+package/pkg-generic.mk:273: recipe for target '/home/buildroot/autobuild/instance-2/output-1/build/oracle-mysql-5.1.73/.stamp_configured' failed
+
+Fixes:
+ - http://autobuild.buildroot.org/results/e5329bcf166d46b2eb17f2bc727c0307bef5ed02
+
+Upstream: switched to CMake a very long time ago, so not sent upstream
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ config/ac-macros/alloca.m4 | 14 --------------
+ 1 file changed, 14 deletions(-)
+
+diff --git a/config/ac-macros/alloca.m4 b/config/ac-macros/alloca.m4
+index 8c730dd671f..eecb8249573 100644
+--- a/config/ac-macros/alloca.m4
++++ b/config/ac-macros/alloca.m4
+@@ -46,20 +46,6 @@ then
+    ALLOCA=alloca.o
+    AC_DEFINE(C_ALLOCA, 1)
+  
+- AC_CACHE_CHECK(whether alloca needs Cray hooks, ac_cv_os_cray,
+- [AC_EGREP_CPP(webecray,
+- [#if defined(CRAY) && ! defined(CRAY2)
+- webecray
+- #else
+- wenotbecray
+- #endif
+- ], ac_cv_os_cray=yes, ac_cv_os_cray=no)])
+- if test "$ac_cv_os_cray" = "yes"; then
+- for ac_func in _getb67 GETB67 getb67; do
+-   AC_CHECK_FUNC($ac_func, [AC_DEFINE_UNQUOTED(CRAY_STACKSEG_END, $ac_func)
+-   break])
+- done
+- fi
+  fi
+  AC_SUBST(ALLOCA)dnl
+ else
+-- 
+2.33.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
