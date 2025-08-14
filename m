Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A63FCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CFC6D80753;
	Thu, 14 Aug 2025 19:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RaPhPid6DGRG; Thu, 14 Aug 2025 19:56:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 570B880B53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 570B880B53;
	Thu, 14 Aug 2025 19:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 152721BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A29D440479
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMqgoMvJj2HG for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 722574047C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 722574047C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6FE5B875ED; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:26:03 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 01e97b6f5c327692b20ed0759d2eb463344d3d8c
X-Git-Newrev: c2a5677a5b503b54f759d3ab5219689315bb2222
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.6FE5B875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: security
 bump to version 2.41-70
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

commit: https://git.buildroot.net/buildroot/commit/?id=c2a5677a5b503b54f759d3ab5219689315bb2222
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issues:

- CVE-2025-5702: power10: strcmp fails to save and restore nonvolatile
  vector registers
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0003

- CVE-2025-5745: power10: strncmp fails to save and restore nonvolatile
  vector registers
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0004

Note: CVE-2025-5702 and CVE-2025-5745 are specific to the Power 10
hardware architecture, which is not supported in Buildroot at the time
of this commit. The highest target CPU supported in Buildroot is
Power 9. See the file `arch/Config.in.powerpc`.

- CVE-2025-8058: posix: Fix double-free after allocation failure in regcomp
  https://sourceware.org/cgit/glibc/tree/advisories/GLIBC-SA-2025-0005

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[Julien: add the note about power10 in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit feaf53585a12d97802a67fd557ffc7340bbe6e13)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 61af3d9488..0deba84dc7 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e  glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
+sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29617b9756..239e39a2ba 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
+GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
@@ -25,6 +25,15 @@ GLIBC_CPE_ID_VENDOR = gnu
 # allow proper matching with the CPE database.
 GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
 
+# Fixed by glibc-2.41-57-g84bdbf8a6f2fdafd3661489dbb7f79835a52da82
+GLIBC_IGNORE_CVES += CVE-2025-5745
+
+# Fixed by glibc-2.41-60-g0c76c951620f9e12df2a89b2c684878b55bb6795
+GLIBC_IGNORE_CVES += CVE-2025-5702
+
+# Fixed by glibc-2.41-64-g1e16d0096d80a6e12d5bfa8e0aafdd13c47efd65
+GLIBC_IGNORE_CVES += CVE-2025-8058
+
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 7a6c94bd2f..c76a8d82a0 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
+LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
