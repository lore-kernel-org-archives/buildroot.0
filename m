Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357BEC5DF81
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 22:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B912F80B63;
	Thu, 20 Aug 2026 22:15:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RDXnPh1aS0yM; Thu, 20 Aug 2026 22:15:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787264136;
	bh=ScVVLp6h/vIiM2w/uiYsOeaN4nAQsYYORV7qX1PM8fI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OT+8MgRv/T+x6HofdTUP1Tp521WHAhWOKfvL6zJmLHFVImsLLGII3LkvSlKrtTPvo
	 nJRHQG36RfAdIaNScTc3r8D7dfq7+PQzuMdy9RW6TOYixatJCMOc7FNH1t8A2qE2S3
	 LM7WZvEKcnTymfzXn09Rbwjg/0nDiHxXB4RSIu7PqGej8FebsX5xnIYN/vEbDcjjpV
	 q5E9fhI22Obaun7k3GSUCh2Pd++OgHnnt+IB0NKB6ms5rnaNPB9a/iR8aKOMZU4jzm
	 N+PokaK99vEx2+5QMdj6dNS+12Npm7UCYckD5BKqWcmu5e6cNvyTqex/KOICuEvP4k
	 ePxbZ4kiJzbmA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9548F80C41;
	Thu, 20 Aug 2026 22:15:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D5406EA3
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3D07607EC
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0-80p4PSc4HO for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 22:15:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17757607E6
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 22:15:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDF3C8E074; Thu, 20 Aug 2026 22:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 23:10:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88c353351ad4dd0fda97d1a7e2e683db012759d6
X-Git-Newrev: 139025f79328e1a93be972ed46d75366449c6695
X-Patchwork-Hint: ignore
Message-Id: <20260820221440.DDF3C8E074@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netsnmp: add upstream patch to fix
 build of depending packages
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/139025f79328e1a93be972ed46d75366449c6695
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
