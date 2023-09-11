Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB359C71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 20:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C50181ED4;
	Mon, 11 Sep 2023 20:07:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C50181ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XDRBlO6mdf6h; Mon, 11 Sep 2023 20:07:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9636D81EDE;
	Mon, 11 Sep 2023 20:07:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9636D81EDE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9CFC91BF357
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F1281EDE
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 20:07:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83F1281EDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6oskZUS_m6zn for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 20:07:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8DFE881ECD
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 20:07:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DFE881ECD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C82C86D15; Mon, 11 Sep 2023 20:07:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 22:07:32 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 076974bae6297c2cab18ba784011bafe6da70c61
X-Git-Newrev: 5ee7c76823f7a58a5d8fcff0b3a445ff9cc04ff2
X-Patchwork-Hint: ignore
Message-Id: <20230911200742.7C82C86D15@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxcrypt: drop upstream patches
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ee7c76823f7a58a5d8fcff0b3a445ff9cc04ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These patches were backported (47b7947 and 7dd5233) before the 2023.08
release. Meanwhile the package was bumped on next (be5e4a1) to a version
containing these patches. Therefore they can be dropped.

Fixes:
- http://autobuild.buildroot.net/results/7f7ec74e80cd1ab782d87f5db3e4631c12611101/

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...uildCommon.pm-compatible-with-latest-perl.patch | 50 ------------------
 ...-Remove-smartmatch-usage-from-gen-crypt-h.patch | 61 ----------------------
 2 files changed, 111 deletions(-)

diff --git a/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch b/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
deleted file mode 100644
index 7a17fa5c12..0000000000
--- a/package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c Mon Sep 17 00:00:00 2001
-From: Leon Timmermans <fawaka@gmail.com>
-Date: Tue, 6 Jun 2023 17:03:57 +0200
-Subject: [PATCH] Make BuildCommon.pm compatible with latest perl
-
-It was previously using an experimental feature that has since been dropped.
-This removes the use of that feature.
-
-Upstream: https://github.com/besser82/libxcrypt/commit/ce562f4d33dc090fcd8f6ea1af3ba32cdc2b3c9c
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- build-aux/scripts/BuildCommon.pm | 9 ++++-----
- 1 file changed, 4 insertions(+), 5 deletions(-)
-
-diff --git a/build-aux/scripts/BuildCommon.pm b/build-aux/scripts/BuildCommon.pm
-index 0e6f2a31..c38ba21b 100644
---- a/build-aux/scripts/BuildCommon.pm
-+++ b/build-aux/scripts/BuildCommon.pm
-@@ -11,7 +11,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
- use warnings FATAL => 'all';
- use utf8;
- use open qw(:utf8);
--no  if $] >= 5.018, warnings => 'experimental::smartmatch';
- no  if $] >= 5.022, warnings => 'experimental::re_strict';
- use if $] >= 5.022, re       => 'strict';
-
-@@ -519,19 +518,19 @@ sub parse_symver_args {
-     my $COMPAT_ABI;
-     local $_;
-     for (@args) {
--        when (/^SYMVER_MIN=(.+)$/) {
-+        if (/^SYMVER_MIN=(.+)$/) {
-             $usage_error->() if defined $SYMVER_MIN;
-             $SYMVER_MIN = $1;
-         }
--        when (/^SYMVER_FLOOR=(.+)$/) {
-+        elsif (/^SYMVER_FLOOR=(.+)$/) {
-             $usage_error->() if defined $SYMVER_FLOOR;
-             $SYMVER_FLOOR = $1;
-         }
--        when (/^COMPAT_ABI=(.+)$/) {
-+        elsif (/^COMPAT_ABI=(.+)$/) {
-             $usage_error->() if defined $COMPAT_ABI;
-             $COMPAT_ABI = $1;
-         }
--        default {
-+        else {
-             $usage_error->() if defined $map_in;
-             $map_in = $_;
-         }
diff --git a/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch b/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
deleted file mode 100644
index 444896b53f..0000000000
--- a/package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 95d6e03ae37f4ec948474d111105bbdd2938aba2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20K=2E=20H=C3=BCttel?= <dilfridge@gentoo.org>
-Date: Sun, 25 Jun 2023 01:35:08 +0200
-Subject: [PATCH] Remove smartmatch usage from gen-crypt-h
-
-Needed for Perl 5.38
-
-Upstream: https://github.com/besser82/libxcrypt/commit/95d6e03ae37f4ec948474d111105bbdd2938aba2
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- build-aux/scripts/gen-crypt-h | 31 ++++++++++++++-----------------
- 1 file changed, 14 insertions(+), 17 deletions(-)
-
-diff --git a/build-aux/scripts/gen-crypt-h b/build-aux/scripts/gen-crypt-h
-index 12aecf6d..b113b791 100644
---- a/build-aux/scripts/gen-crypt-h
-+++ b/build-aux/scripts/gen-crypt-h
-@@ -12,7 +12,6 @@ use v5.14;    # implicit use strict, use feature ':5.14'
- use warnings FATAL => 'all';
- use utf8;
- use open qw(:std :utf8);
--no  if $] >= 5.018, warnings => 'experimental::smartmatch';
- no  if $] >= 5.022, warnings => 'experimental::re_strict';
- use if $] >= 5.022, re       => 'strict';
-
-@@ -37,22 +36,20 @@ sub process_config_h {
-     local $_;
-     while (<$fh>) {
-         chomp;
--        # Yes, 'given $_' is really required here.
--        given ($_) {
--            when ('#define HAVE_SYS_CDEFS_H 1') {
--                $have_sys_cdefs_h = 1;
--            }
--            when ('#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
--                $have_sys_cdefs_begin_end_decls = 1;
--            }
--            when ('#define HAVE_SYS_CDEFS_THROW 1') {
--                $have_sys_cdefs_throw = 1;
--            }
--            when (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
--                $substs{XCRYPT_VERSION_STR}   = $1;
--                $substs{XCRYPT_VERSION_MAJOR} = $2;
--                $substs{XCRYPT_VERSION_MINOR} = $3;
--            }
-+
-+        if ($_ eq '#define HAVE_SYS_CDEFS_H 1') {
-+            $have_sys_cdefs_h = 1;
-+        }
-+        elsif ($_ eq '#define HAVE_SYS_CDEFS_BEGIN_END_DECLS 1') {
-+            $have_sys_cdefs_begin_end_decls = 1;
-+        }
-+        elsif ($_ eq '#define HAVE_SYS_CDEFS_THROW 1') {
-+            $have_sys_cdefs_throw = 1;
-+        }
-+        elsif (/^#define PACKAGE_VERSION "((\d+)\.(\d+)\.\d+)"$/) {
-+            $substs{XCRYPT_VERSION_STR}   = $1;
-+            $substs{XCRYPT_VERSION_MAJOR} = $2;
-+            $substs{XCRYPT_VERSION_MINOR} = $3;
-         }
-     }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
