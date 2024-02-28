Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4F5C5478C
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 21:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B44641633;
	Wed, 28 Feb 2024 21:27:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m4GTYMGWEcgW; Wed, 28 Feb 2024 21:27:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E0B6641805
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0B6641805;
	Wed, 28 Feb 2024 21:27:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 157151BF955
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8C7E416B3
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 21:25:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5w_dG12Hw_F for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A4D1403FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A4D1403FB
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 288D387CE3; Wed, 28 Feb 2024 21:25:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 22:03:09 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: efa40febd9bb7dbbd6cd86cbdde5c3d0ffec3947
X-Git-Newrev: decf0cd91bc77242426fe91cb75975a68c5b9376
X-Patchwork-Hint: ignore
Message-Id: <20240228212552.288D387CE3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/{glibc,
 localedef}: security bump to version
 glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
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

commit: https://git.buildroot.net/buildroot/commit/?id=decf0cd91bc77242426fe91cb75975a68c5b9376
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Fixes the following security issues:

CVE-2023-6246: syslog: Fix heap buffer overflow in __vsyslog_internal
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0001;hb=HEAD

CVE-2023-6779: syslog: Heap buffer overflow in __vsyslog_internal
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0002;hb=HEAD

CVE-2023-6780: syslog: Integer overflow in __vsyslog_internal
https://sourceware.org/git/?p=glibc.git;a=blob_plain;f=advisories/GLIBC-SA-2024-0003;hb=HEAD

For details, see the Qualys advisory:
https://www.openwall.com/lists/oss-security/2024/01/30/6

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 75e7c7ba8cddb2644350a7f59c943f5c4e99b3b0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 14 +++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 00d9f1c985..15ae55b9e6 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fd991e43997ff6e4994264c3cbc23fa87fa28b1b3c446eda8fc2d1d3834a2cfb  glibc-2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701.tar.gz
+sha256  e38f4284d6909c6b5db7d79c6e450daeaf136a67e547290eec0b063a55eaaa42  glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d49da6457c..d198d6f04c 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701
+GLIBC_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -40,6 +40,18 @@ GLIBC_IGNORE_CVES += CVE-2023-4911
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-5156
 
+# Fixed by 23514c72b780f3da097ecf33a793b7ba9c2070d2, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6246
+
+# Fixed by d0338312aace5bbfef85e03055e1212dd0e49578, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6779
+
+# Fixed by d37c2b20a4787463d192b32041c3406c2bd91de0, which is between
+# 2.38 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6780
+
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ed6d4b4968..c017c0e00e 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701
+LOCALEDEF_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
