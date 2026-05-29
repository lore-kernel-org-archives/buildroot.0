Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE77ECD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96F1660A50;
	Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNOz6Ouwo6zZ; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9974F60A61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663050;
	bh=aWLgGWOH/p1GcuXFjxYsOAS+0cZMbfecpZHBVzbSfVo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Ttc5wN8mDsPr89g80NTX6X3NQMfU+7NEDxPe/dFQPU2VE8vvCg0igOSrWlr0uKWrf
	 qChLWpRHaCVA7jbOBhTt8WdduYZVbQ89uumDT5K3u3ERovphRAkf9AAQx6jOVq+tfu
	 CRFMC0RF4UbVfw+FKmAlXOuroKACUhJr8dRLCXu5jvb05YTvt/8uGjWkOpLe5k9tl8
	 AliNab2BC5VmirUt5mA89m4ZqqbJHj+ZLozBtgl68vKVt2X5FsZ5Pjrz0NA6znWNdZ
	 29MFAFQcV5Jd+1+d3y7q7p2XGfshwBQqVIkQRSUzvlfykEwRwjj0532CJL/Jymz4WB
	 fUWSPMcNNnDBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9974F60A61;
	Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E8E4F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 74BA660A61
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_0YFxZ3j6nh for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 261F160A50
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 261F160A50
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 422CA87B40; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 17:12:19 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cc7f50bb22e408b43c02ddd4c7ef81bff8c0c0a4
X-Git-Newrev: e3def894fc941da0039cd654869eeba21b69b6a4
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.422CA87B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/heimdal: bump
 version to 8c3c97bdf6c06200418f1a85aa22beaa441c6b23
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3def894fc941da0039cd654869eeba21b69b6a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The current version was more than 3 years old and had known CVEs (see
CVE-2023-36328). Since this is a host only package, we don't consider
this as a security bump.

This upgrade allows the removal of the two patches currently applied:

- The commit 1b57b62, which fixes the build with autoconf 2.72, is
  already included upstream.

- We no longer need to use the JSON-PP module, as it is now
  optional (commit 13d3bcf).

Also, since the latest version of Heimdal no longer depends on
e2fsprogs, the host-e2fsprogs dependency has been removed.

Signed-off-by: Guillaume Chaye <guillaume.chaye@zeetim.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 573ecbd44cd16b2ca4ce71b40459bcecf8c8e98c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...dule-JSON-PP-part-of-core-instead-of-JSON.patch | 57 ----------------------
 ...largefile.m4-Fix-build-with-autoconf-2.72.patch | 27 ----------
 package/heimdal/heimdal.hash                       |  2 +-
 package/heimdal/heimdal.mk                         | 21 ++++----
 4 files changed, 11 insertions(+), 96 deletions(-)

diff --git a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch b/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
deleted file mode 100644
index 7323ac70df..0000000000
--- a/package/heimdal/0001-Use-perl-module-JSON-PP-part-of-core-instead-of-JSON.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From f6fdb0a28e3bfcb3fd0aa1c81ad59c5411c0d660 Mon Sep 17 00:00:00 2001
-From: Andrew Sim <andrewsimz@gmail.com>
-Date: Sat, 10 Jun 2023 09:00:24 +0200
-Subject: [PATCH] Use perl module JSON:PP, part of core, instead of JSON
- package
-
-This patch removes the need for an external package.
-
-Ported from
-https://github.com/openwrt/packages/blob/master/net/samba4/patches/105-perl-json-pp.patch
-https://github.com/openwrt/packages/commit/402f4ba4eff65b80a9deaa6085256112bec4d67b#diff-208d4e0345c9d29fbec23d6f655ba794afd3052f5cb8dd73944db72ce81b847b
-
-Upstream: https://github.com/heimdal/heimdal/pull/1176
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cf/make-proto.pl | 4 ++--
- configure.ac     | 1 -
- 2 files changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/cf/make-proto.pl b/cf/make-proto.pl
-index 36a040ce6..4af21916b 100644
---- a/cf/make-proto.pl
-+++ b/cf/make-proto.pl
-@@ -4,7 +4,7 @@
- use Getopt::Std;
- use File::Compare;
- 
--use JSON;
-+use JSON::PP
- 
- my $comment = 0;
- my $doxygen = 0;
-@@ -70,7 +70,7 @@ if($opt_x) {
-     my $EXP;
-     local $/;
-     open(EXP, '<', $opt_x) || die "open ${opt_x}";
--    my $obj = JSON->new->utf8->decode(<EXP>);
-+    my $obj = JSON::PP->new->utf8->decode(<EXP>);
-     close $EXP;
- 
-     foreach my $x (keys %$obj) {
-diff --git a/configure.ac b/configure.ac
-index cedb4c01f..cecd030e6 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -56,7 +56,6 @@ if ! test -f "$srcdir/lib/asn1/der-protos.h" ||
-     AC_KRB_PROG_PERL
-     AC_KRB_PERL_MOD(Getopt::Std)
-     AC_KRB_PERL_MOD(File::Compare)
--    AC_KRB_PERL_MOD(JSON)
- fi
- 
- AC_KRB_PROG_YACC
--- 
-2.39.2
-
diff --git a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch b/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
deleted file mode 100644
index 5b36c5a784..0000000000
--- a/package/heimdal/0002-cf-largefile.m4-Fix-build-with-autoconf-2.72.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1b57b62d82a478c1fade350f0fb1d57031a8734e Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sat, 10 Feb 2024 09:33:48 +0100
-Subject: [PATCH] cf/largefile.m4: Fix build with autoconf-2.72
-
-Fixes https://github.com/heimdal/heimdal/issues/1201
-
-Upstream: https://github.com/heimdal/heimdal/commit/1b57b62d82a478c1fade350f0fb1d57031a8734e
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- cf/largefile.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/cf/largefile.m4 b/cf/largefile.m4
-index 5c54897be4..cdbbc55431 100644
---- a/cf/largefile.m4
-+++ b/cf/largefile.m4
-@@ -10,7 +10,7 @@ dnl with generated code, such as lex
- if test "$enable_largefile" != no -a "$ac_cv_sys_large_files" != no; then
- 	CPPFLAGS="$CPPFLAGS -D_LARGE_FILES=$ac_cv_sys_large_files"
- fi
--if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no; then
-+if test "$enable_largefile" != no -a "$ac_cv_sys_file_offset_bits" != no && test -n "$ac_cv_sys_file_offset_bits"; then
- 	CPPFLAGS="$CPPFLAGS -D_FILE_OFFSET_BITS=$ac_cv_sys_file_offset_bits"
- fi
- ])
diff --git a/package/heimdal/heimdal.hash b/package/heimdal/heimdal.hash
index 250ddbbd4d..5575b52f86 100644
--- a/package/heimdal/heimdal.hash
+++ b/package/heimdal/heimdal.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  2576c5e2d793db53c86e108fd117b278437bb02d6c6db2bec4d1b86958f1980a  heimdal-f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17.tar.gz
+sha256  aa679a6ad0349e266ec8a886b6be8085564f959183e948551a8e7d782ffaf623  heimdal-8c3c97bdf6c06200418f1a85aa22beaa441c6b23.tar.gz
 sha256  0c4b07bf5b98f7a1d01f8e60722d6c6747ef052c2aa6d2043daf690d4e1b0a7f  LICENSE
diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index ed8826a741..6bba641e2c 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -4,14 +4,12 @@
 #
 ################################################################################
 
-HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
+HEIMDAL_VERSION = 8c3c97bdf6c06200418f1a85aa22beaa441c6b23
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
-HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
+HOST_HEIMDAL_DEPENDENCIES = host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
 HOST_HEIMDAL_AUTORECONF = YES
-# static because of -fPIC issues with e2fsprogs on x86_64 host
+
 HOST_HEIMDAL_CONF_OPTS = \
-	--disable-shared \
-	--enable-static \
 	--without-openldap \
 	--without-capng \
 	--with-db-type-preference= \
@@ -33,13 +31,14 @@ HEIMDAL_LICENSE = BSD-3-Clause
 HEIMDAL_LICENSE_FILES = LICENSE
 HEIMDAL_CPE_ID_VALID = YES
 
-# We need compile_et for samba4
-define HOST_HEIMDAL_INSTALL_COMPILE_ET
-	$(INSTALL) -m 0755 $(@D)/lib/com_err/compile_et \
-		$(HOST_DIR)/bin/compile_et
+# We need compile_et for samba4 and slc for target version of heimdal
+# By default compile_et is not installed so we install it to bin
+# By default slc is installed in libexec directory so we just link it
+define HOST_HEIMDAL_INSTALL_BINARIES
+	$(INSTALL) -m 0755 $(@D)/lib/com_err/compile_et $(HOST_DIR)/bin/compile_et
+	ln -sf $(HOST_DIR)/libexec/heimdal/slc $(HOST_DIR)/bin/slc
 endef
 
-HOST_HEIMDAL_POST_INSTALL_HOOKS += \
-	HOST_HEIMDAL_INSTALL_COMPILE_ET
+HOST_HEIMDAL_POST_INSTALL_HOOKS += HOST_HEIMDAL_INSTALL_BINARIES
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
