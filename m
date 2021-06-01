Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C42C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB93160525
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:53:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB93160525
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90031608E2;
	Tue,  3 Aug 2021 22:53:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id THirOpuBJX_x; Tue,  3 Aug 2021 22:53:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 459C76088B;
	Tue,  3 Aug 2021 22:53:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 105C71BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D684C4056E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ecdwscHGUqT9 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA1FD405F6
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4C36B85F62; Tue,  3 Aug 2021 21:09:47 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 22:50:20 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc86b866ac8ddfe41679334526040f5426fa25b1
X-Git-Newrev: 2df1c10ba76fa9d8d40a438d16c40cba15ec5db6
X-Patchwork-Hint: ignore
Message-Id: <20210803210947.4C36B85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lttng-tools: disable
 tests
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=2df1c10ba76fa9d8d40a438d16c40cba15ec5db6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disabling tests will fix the following build failures on riscv32:

select_poll_epoll.c:408:16: note: each undeclared identifier is reported only once for each function it appears in
select_poll_epoll.c: In function 'ppoll_fds_ulong_max':
select_poll_epoll.c:440:16: error: 'SYS_ppoll' undeclared (first use in this function); did you mean 'SYS_tkill'?
  440 |  ret = syscall(SYS_ppoll, ufds, ULONG_MAX, NULL, NULL);
      |                ^~~~~~~~~
      |                SYS_tkill
select_poll_epoll.c: In function 'pselect_invalid_fd':
select_poll_epoll.c:488:16: error: 'SYS_pselect6' undeclared (first use in this function); did you mean 'SYS_semctl'?
  488 |  ret = syscall(SYS_pselect6, fd + 1, &rfds, NULL, NULL, NULL, NULL);
      |                ^~~~~~~~~~~~
      |                SYS_semctl

Fixes:
 - http://autobuild.buildroot.org/results/dd39188a7191efa512a51f18f4c34d9ee711a6a7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-configure.ac-add-disable-tests.patch      | 37 ++++++++++++++++++++++
 package/lttng-tools/lttng-tools.mk                 |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/lttng-tools/0001-configure.ac-add-disable-tests.patch b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
new file mode 100644
index 0000000000..f569c7ec70
--- /dev/null
+++ b/package/lttng-tools/0001-configure.ac-add-disable-tests.patch
@@ -0,0 +1,37 @@
+From 8c3a5d0921090e2fc3c4e2561509d23eb9ffa6dd Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Fri, 2 Apr 2021 21:07:07 +0200
+Subject: [PATCH] configure.ac: add --disable-tests
+
+Allow the user to explicitly disable tests
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/lttng/lttng-tools/pull/162]
+---
+ configure.ac | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 04f9cef4..372cdf3d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -862,6 +862,8 @@ AC_ARG_ENABLE([bin-lttng-sessiond], AS_HELP_STRING([--disable-bin-lttng-sessiond
+ 	      [Disable the build of lttng-sessiond binaries]))
+ AC_ARG_ENABLE([extras], AS_HELP_STRING([--disable-extras],
+ 	      [Disable the build of the extra components]))
++AC_ARG_ENABLE([tests], AS_HELP_STRING([--disable-tests],
++	      [Disable the build of the test components]))
+ 
+ 
+ # Always build libconfig since it a dependency of libcommon
+@@ -1027,6 +1029,7 @@ AM_CONDITIONAL([BUILD_BIN_LTTNG_SESSIOND], [test x$enable_bin_lttng_sessiond !=
+ 
+ # Export the tests and extras build conditions.
+ AS_IF([\
++test "x$enable_tests" != "xno" && \
+ test "x$enable_bin_lttng" != "xno" && \
+ test "x$enable_bin_lttng_consumerd" != "xno" && \
+ test "x$enable_bin_lttng_crash" != "xno" && \
+-- 
+2.30.2
+
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 8789ded333..fdc5c33bd2 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -11,8 +11,11 @@ LTTNG_TOOLS_INSTALL_STAGING = YES
 LTTNG_TOOLS_LICENSE = GPL-2.0, LGPL-2.1 (include/lttng/*, src/lib/lttng-ctl/*)
 LTTNG_TOOLS_LICENSE_FILES = LICENSE $(addprefix LICENSES/,BSD-2-Clause BSD-3-Clause GPL-2.0 LGPL-2.1 MIT)
 LTTNG_TOOLS_DEPENDENCIES = liburcu libxml2 popt util-linux
+# We're patching configure.ac
+LTTNG_TOOLS_AUTORECONF = YES
 LTTNG_TOOLS_CONF_OPTS = \
 	--disable-man-pages \
+	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
 
 ifeq ($(BR2_PACKAGE_LTTNG_LIBUST),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
