Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D204EC71153
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 03:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2476440116;
	Mon, 11 Sep 2023 03:52:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2476440116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ruGUKv9ylI9v; Mon, 11 Sep 2023 03:52:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1427040167;
	Mon, 11 Sep 2023 03:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1427040167
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F26BB1BF2BD
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 03:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE6D840167
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 03:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6D840167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D46sUd3Xqea8 for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 03:52:41 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2545940116
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 03:52:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2545940116
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.164.5]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mlw7V-1pxAY90PDP-00j2r9; Mon, 11 Sep 2023 05:52:38 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 05:52:02 +0200
Message-ID: <20230911035202.51266-2-dalang@gmx.at>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:AWT1npqFjtxK4gKHHUyjf9lkv6R/JziKA3wEgKtqXIe6mW5pk+t
 yqNzCLSqSDMSYTFOL4B/Be120roXxJxrMtDWnZdVmSbxX/FP3YUgMwBCvy71tRu2joek0Ag
 xsZ9PJMSa4Z8pdb2fu2XhsmjW6hduixCrYKoxxpvJQGQUi1DX/5NO3eMy6GutbBHH8ZfebS
 YaWcF6djD8vgp+fodjONw==
UI-OutboundReport: notjunk:1;M01:P0:1+bc6IcBGb8=;aXTPTzC5Nfo53+dyBHDEp8mEqTe
 9nS3Ln/6GySpsO8TXcmhN41CL7m9wh+GHM6zgj+QJxQ2AzTeXheieccuaNW2vfIHnqwV0PvXy
 kD3BWvwHpttZ/Rayl036QwURKz+isfAXi1N01Hfw1O0xDHL62V32uClX/WpgFF42a/Q/iStat
 /wHqlgJVWl5aSH7F6K64mKA8WJPFMxNpTxJDcQXqkraqwRXgQ4pSlSvDB5UJpH38EoaT4yZx0
 ZGDwXTeWrsKUBDdgHgFfnDMVLyl26CAS0Ujxb5UAFQr/3C7qTDfom6KUWSAemBpnckfgHLAy6
 3R51/znasIrTDTtPQq4ittTSMd6Z9vnkebbNdyeBYKidL9iqrvgZgjF7rE5UcPFI8TdBOjMVC
 HT4jCSGcd3/aPkzFkLkVrIpWmvQU9UgOyMXTbvrcL/LppGYayNAAT5qz66uoswu584ZhzCY6+
 DZQ/Pqu63UCuiB87+rnNNibSmgluzYKN3mc3uOhykrIqPXWIKZ8lk7l1cAzD/ewIChfKkvHMH
 Djo58onDwIGwoemiUY5sgozVhJZWbnbg49fo91Ev/2Lg3T9g+0PqwgvFM5UIxaECRW3ybFezq
 rxzMT695HTE17KnUHzIkj/fWrfn8PFvpkUVlMb3ALMsZl7YZTO5g9PNstygLERxcM7/ub7Wdf
 itudvcB7lRi4bkyrcX/GT5SnKmZWI8/OuObX2xE2QMmhR0MitlQRM8rbxRK2ac32UciM7b0Mh
 b83T3x5gG/b+FvZByPKbxyJl7WveeSYId1nzKbPS9i7EAQEG9Xh9Mcs+rQBxxyiuBFTjGVFMk
 wfwl06a0jFPK//ijQoowghQxclzDmntEYwILfHIS6vCaiUpsYrNxMqL+ay2fJp+bSmftZFwOC
 jqukJwYt3LdAEgJJjMoYp5KfUtTuPknGI3st9VCb3k/impjrK+XoSJBbVI0Wv0sARf1ps55v2
 8qFgRGFHQmzyW5dGrzKvrrHqh1k=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1694404358; x=1695009158; i=dalang@gmx.at;
 bh=MGEXR0d9aGKKQC8aZHDlhz7DuPMGutizmxNCdr8Ntxk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=uUsGrJEG20QpfDNBeBsAUcige7pn8wn7rcqU8TNi145NLqMXtb0WdoWkha0klGOH6aWsE/t
 LsCbgiViQnuvKmElWluyesx6OVJK/RO7EkvIVIteEgGQkWRc3qeu1VX31scJDzOZLKIQEtFp/
 i4hP1jILLqYOao8EZxrIrg0ERzyI1nUEnD5aioSHAla82STFSUWkWBxdjnK4h6THG6UL9Dkjc
 46SW8EiKA5voIODebtpjkaAFFus6SslS2M+Lq3wZzqwG/84wpOHZJnA2Ko7N4wULDleKat+GR
 B8FjUO22Z8R7vfu1rRaRCy0tXZiURiOiwACyUvyL0eb7yPvBrOrw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=uUsGrJEG
Subject: [Buildroot] [PATCH] package/libxcrypt: drop upstream patches
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches were backported (47b7947 and 7dd5233) before the 2023.08
release. Meanwhile the package was bumped on next (be5e4a1) to a version
containing these patches. Therefore they can be dropped.

Fixes:
- http://autobuild.buildroot.net/results/7f7ec74e80cd1ab782d87f5db3e4631c12611101/

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 ...ommon.pm-compatible-with-latest-perl.patch | 50 ---------------
 ...ve-smartmatch-usage-from-gen-crypt-h.patch | 61 -------------------
 2 files changed, 111 deletions(-)
 delete mode 100644 package/libxcrypt/0001-Make-BuildCommon.pm-compatible-with-latest-perl.patch
 delete mode 100644 package/libxcrypt/0002-Remove-smartmatch-usage-from-gen-crypt-h.patch

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
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
