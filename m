Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A113E95A82
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 15:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9958B4188C;
	Sun,  8 Oct 2023 15:59:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9958B4188C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qiqoUgFncqtr; Sun,  8 Oct 2023 15:59:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF4441880;
	Sun,  8 Oct 2023 15:59:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF4441880
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 589461BF25B
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 15:59:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 289BD41880
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 15:59:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 289BD41880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xjOTL1Cnbjzr for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 15:59:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 978CA4187F
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 15:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 978CA4187F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ADFC8431C; Sun,  8 Oct 2023 15:59:22 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 17:58:55 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 505b8ac335f9a225963e2318e3723487b2446dd4
X-Git-Newrev: d6d032fc1efc8cb7bf870987023b196425cab445
X-Patchwork-Hint: ignore
Message-Id: <20231008155922.7ADFC8431C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/{glibc,
 localedef}: security bump to version
 glibc-2.36-118-g22955ad85186ee05834e47e665056148ca07699c
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

commit: https://git.buildroot.net/buildroot/commit/?id=d6d032fc1efc8cb7bf870987023b196425cab445
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

CVE-2023-4911: If a tunable of the form NAME=NAME=VAL is passed in the
  environment of a setuid program and NAME is valid, it may result in a
  buffer overflow, which could be exploited to achieve escalated
  privileges.  This flaw was introduced in glibc 2.34.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 1a66b66984..dcff16d465 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  a4351e60a33e84236c1866c39eeab321f419dfdc274411b7d2615c9382ace351  glibc-2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d.tar.gz
+sha256  d7d829f90f03e00d42d7d34ff7e972a59b14e2b70fa2e852893018349aafa5f7  glibc-2.36-118-g22955ad85186ee05834e47e665056148ca07699c.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 42de53ffc5..a3a84e86ec 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d
+GLIBC_VERSION = 2.36-118-g22955ad85186ee05834e47e665056148ca07699c
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e71424490b..51d3ddc932 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-117-g32957eb6a86acdbeec9f38a60a7d5a0ff32db03d
+LOCALEDEF_VERSION = 2.36-118-g22955ad85186ee05834e47e665056148ca07699c
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
