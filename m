Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2DCD2FEF4
	for <buildroot@archiver.kernel.org>; Tue, 27 Jan 2026 22:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D700407C9;
	Tue, 27 Jan 2026 22:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLmOXcF5Suwe; Tue, 27 Jan 2026 22:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 775BE4097B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769553475;
	bh=megfnugi9KuYa63EN09Ms/K4nIwuEqKIqi27Qeo/55U=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=onEhDXth6DIGLS64vh0S4RPihwe7kU82gk7DyODlHL/geiBmWyGwqf1rIs/cx/dQ3
	 rBBeQwn0xUEpSt6PY5FXPXyB3tnB5GVEdFSiQx9jEFtuz+rZda57IpM83vMyswF1/u
	 NnxSbQ0BGXHPScZqDo90Wk8In1ZiKSUWGs03BW6fmp5WgsGwAz5zo2/MAmqx0AzUsS
	 tC4PBgeJLAnGWIP02GiBCV3TZhbnzAchh1O1MhD4BvoxV+w1iGIgFJrsuPGoR81v7T
	 IWRiNe0iUvABYiO7gjA+g6do6Ky7pWTKe9CtzK6oKl5L0PrvSs1rGg4jdtFpZKocp4
	 LfH6dZqrLuWgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 775BE4097B;
	Tue, 27 Jan 2026 22:37:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 105351AD
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BF9A607BA
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZS5VxfwHprc for <buildroot@buildroot.org>;
 Tue, 27 Jan 2026 22:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3736F60783
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3736F60783
 for <buildroot@buildroot.org>; Tue, 27 Jan 2026 22:37:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 242B18777B; Tue, 27 Jan 2026 22:37:53 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jan 2026 23:37:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22137df16bb03900f2801a7b4c2f2cf6c8574760
X-Git-Newrev: 2caf72537a7a860ee0143ba9efd78f0adb5dd277
X-Patchwork-Hint: ignore
Message-Id: <20260127223753.242B18777B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/syslog-ng: fix non-c++ build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=2caf72537a7a860ee0143ba9efd78f0adb5dd277
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 18630db8e822120d0d4b9f37fa7c0d901f55d8e9 bumped the
package from 4.7.1 to 4.8.1. Upstream version 4.8.0 includes commit
https://github.com/syslog-ng/syslog-ng/commit/163c894563c9f5536c5e91222c9efda64031b08c
which causes build errors with non-c++ toolchains:
https://github.com/syslog-ng/syslog-ng/issues/5040

Fixes:
https://autobuild.buildroot.net/results/70c/70ca3364da15383a8270d180cd2bf67977d9cb56/

The earliest build error recorded by the autobuilders dates back to
2025-04-23 so a backport should be considered:
https://autobuild.buildroot.net/results/dd2/dd2b1dedbd92280dac01ae4d6454ef7eb08cc539/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-Revert-grpc-fix-C-standard-lib-linkage.patch | 30 ++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk                     |  2 ++
 2 files changed, 32 insertions(+)

diff --git a/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
new file mode 100644
index 0000000000..9acb7f9f5f
--- /dev/null
+++ b/package/syslog-ng/0001-Revert-grpc-fix-C-standard-lib-linkage.patch
@@ -0,0 +1,30 @@
+From 1b93cb5890d502ab3fd7623306a7feaa09c4d8ff Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Sun, 25 Jan 2026 13:07:29 +0100
+Subject: [PATCH] Revert "grpc: fix C++ standard lib linkage"
+
+This partially reverts commit 163c894563c9f5536c5e91222c9efda64031b08c.
+
+Upstream: https://github.com/syslog-ng/syslog-ng/issues/5040#issuecomment-3796535385
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ modules/examples/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/examples/Makefile.am b/modules/examples/Makefile.am
+index fe1a08feb..5914e5273 100644
+--- a/modules/examples/Makefile.am
++++ b/modules/examples/Makefile.am
+@@ -35,7 +35,7 @@ EXTRA_modules_examples_libexamples_la_DEPENDENCIES = $(MODULE_DEPS_LIBS) $(EXAMP
+ modules_examples_libexamples_la_LDFLAGS = $(MODULE_LDFLAGS)
+ 
+ if ENABLE_CPP
+-nodist_EXTRA_modules_examples_libexamples_la_SOURCES = force-cpp-linker-with-default-stdlib.cpp
++modules_examples_libexamples_la_LIBADD += -lstdc++
+ endif
+ 
+ EXTRA_DIST += modules/examples/CMakeLists.txt
+-- 
+2.47.3
+
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fa405ca5cb..7bf77da205 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -11,6 +11,8 @@ SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-n
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
 SYSLOG_NG_CPE_ID_VENDOR = oneidentity
+# 0001-Revert-grpc-fix-C-standard-lib-linkage.patch
+SYSLOG_NG_AUTORECONF = YES
 SYSLOG_NG_DEPENDENCIES = host-bison host-flex host-pkgconf \
 	json-c libglib2 openssl pcre2
 SYSLOG_NG_CONF_OPTS = --disable-manpages --localstatedir=/var/run \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
