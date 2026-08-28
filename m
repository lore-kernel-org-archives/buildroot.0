Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFF8C61DCB
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 14:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E150060831;
	Fri, 28 Aug 2026 14:25:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8viHh-cPom4C; Fri, 28 Aug 2026 14:25:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787927157;
	bh=s/yG2L0zn2vY4/7E+302/DRl2PQqfJVL7/ZCvkxidyw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=euD6pIlCKNt6OsNBenBMFBHzEEqRzTK9+CU6EWl56/gfVWcpraEFj+Lu64fYLC9ME
	 uhGED64NtpSKRSWBaUF38yuuF6iIvT8y0J4RikTPOAXyecUZ345MU/e9bbHLzL7PNH
	 XcGzW/bV/C9r3QEWHVfIDO1RJhwgPtCfmvYAZkdOuosaQDVSbIdSwwk+RDVvZrmoQA
	 jPBfMXlIQU0nEVdVrwsAo9+vdT6pHlkNyB3wecivrsnRT4Nb8IKQXCoop4d2nd6hRS
	 7vZxIhIlDZ7qNnUmUP8PUJNj4IH0zg4av5N6/xIMZg4BU8HvfOCngThJ/S6tiQZCcO
	 4ccEjjjk57nug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DEA60873;
	Fri, 28 Aug 2026 14:25:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC5C5D28
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E930660841
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hPaNkL1TPlOv for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2098E6081A
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 14:25:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E90E921F9; Fri, 28 Aug 2026 14:24:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Aug 2026 15:58:04 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d485b0677cee471b0b0699e40e002b81c5503060
X-Git-Newrev: d4463612924d3a8a4bd8cfe49a7e0d12d1f13e88
X-Patchwork-Hint: ignore
Message-Id: <20260828142442.1E90E921F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/netsnmp: add
 upstream patch to fix build of depending packages
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d4463612924d3a8a4bd8cfe49a7e0d12d1f13e88
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Buildroot commit ed27a33ba04fafdb28d5c74a53798c86aecd50e1 bumped the
package from 5.9.4 to 5.9.5.2 which includes upstream commit
https://github.com/net-snmp/net-snmp/commit/7536a8d6d363898e0f511aa81cf2dc000c452b89
that breaks the build of other packages depending on netsnmp like ntp:

ntpSnmpSubagentObject.c: In function 'init_ntpSnmpSubagentObject':
./ntpSnmpSubagentObject.h:51:1: error: ISO C90 forbids mixed
 declarations and code [-Werror=declaration-after-statement]
   51 | static oid oidname##_oid [] = { __VA_ARGS__ };

For details see https://github.com/net-snmp/net-snmp/issues/1035

Fixes:
https://autobuild.buildroot.net/results/395/395a3b18719e4ec0c0b94b0692caaa9566ee57c6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 139025f79328e1a93be972ed46d75366449c6695)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...or-declaration-after-statement-to-only-fo.patch | 80 ++++++++++++++++++++++
 package/netsnmp/netsnmp.mk                         |  4 ++
 2 files changed, 84 insertions(+)

diff --git a/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch b/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch
new file mode 100644
index 0000000000..64192b0993
--- /dev/null
+++ b/package/netsnmp/0001-moving-Werror-declaration-after-statement-to-only-fo.patch
@@ -0,0 +1,80 @@
+From 6facf270a6b9850846f015e64b8347319069fd57 Mon Sep 17 00:00:00 2001
+From: Wes Hardaker <opensource@hardakers.net>
+Date: Mon, 29 Dec 2025 13:38:59 -0800
+Subject: [PATCH] moving -Werror=declaration-after-statement to only for
+ developers
+
+Upstream: https://github.com/net-snmp/net-snmp/commit/0f19435ecc8fd6c3ef9cf2a391bd7bca25539e80
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ configure.d/config_os_progs | 39 +++++++++++++++++++------------------
+ 1 file changed, 20 insertions(+), 19 deletions(-)
+
+diff --git a/configure.d/config_os_progs b/configure.d/config_os_progs
+index b3ecf556cc..b029de6017 100644
+--- a/configure.d/config_os_progs
++++ b/configure.d/config_os_progs
+@@ -110,24 +110,6 @@ AC_SUBST(LIBTOOL_DEPS)
+ #   Build environment:
+ ##
+ 
+-for opt in -Werror=declaration-after-statement
+-do
+-    AC_MSG_CHECKING([whether the compiler supports $opt])
+-    netsnmp_save_CFLAGS="$CFLAGS"
+-    if test x$opt != x-Wstrict-prototypes; then
+-      CFLAGS="-Werror $opt $CFLAGS"
+-    else
+-      CFLAGS="$opt $CFLAGS"
+-    fi
+-    AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])], [
+-      AC_MSG_RESULT([yes])
+-      CFLAGS="$opt $netsnmp_save_CFLAGS"
+-    ], [
+-      AC_MSG_RESULT([no])
+-      CFLAGS="$netsnmp_save_CFLAGS"
+-    ])
+-done
+-
+ #   developer build 
+ #       (enabled by default when building from SVN checkout)
+ #
+@@ -135,7 +117,7 @@ if test "x$developer" != "xno" -a -f $srcdir/remove-files; then
+     developer="yes"
+ fi
+ if test "x$developer" = "xyes" -a "x$GCC" = "xyes"; then
+-    AC_MSG_CHECKING([for developer gcc flags])
++    AC_MSG_NOTICE([Checking for developer compiler flags])
+     #       WWWXXX - strict type checking
+     #
+     netsnmp_save_CFLAGS="$CFLAGS"
+@@ -159,6 +141,25 @@ if test "x$developer" = "xyes" -a "x$GCC" = "xyes"; then
+       CFLAGS="$netsnmp_save_CFLAGS"
+     done
+     AC_MSG_RESULT($DEVFLAGS)
++
++    for opt in -Werror=declaration-after-statement
++    do
++        AC_MSG_CHECKING([whether the compiler supports $opt])
++        netsnmp_save_CFLAGS="$CFLAGS"
++        if test x$opt != x-Wstrict-prototypes; then
++          CFLAGS="-Werror $opt $CFLAGS"
++        else
++          CFLAGS="$opt $CFLAGS"
++        fi
++        AC_LINK_IFELSE([AC_LANG_PROGRAM([], [])], [
++          AC_MSG_RESULT([yes])
++          CFLAGS="$opt $netsnmp_save_CFLAGS"
++        ], [
++          AC_MSG_RESULT([no])
++          CFLAGS="$netsnmp_save_CFLAGS"
++        ])
++    done
++
+ else
+     DEVFLAGS=""
+ fi
+-- 
+2.47.3
+
diff --git a/package/netsnmp/netsnmp.mk b/package/netsnmp/netsnmp.mk
index 0ec4cfaa76..55e5997734 100644
--- a/package/netsnmp/netsnmp.mk
+++ b/package/netsnmp/netsnmp.mk
@@ -13,6 +13,10 @@ NETSNMP_CPE_ID_VENDOR = net-snmp
 NETSNMP_CPE_ID_PRODUCT = $(NETSNMP_CPE_ID_VENDOR)
 NETSNMP_SELINUX_MODULES = snmp
 NETSNMP_INSTALL_STAGING = YES
+
+# 0001-moving-Werror-declaration-after-statement-to-only-fo.patch
+NETSNMP_AUTORECONF = YES
+
 NETSNMP_CONF_ENV = \
 	ac_cv_NETSNMP_CAN_USE_SYSCTL=no \
 	ac_cv_path_PSPROG=/bin/ps
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
