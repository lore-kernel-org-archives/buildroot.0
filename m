Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04E4E95A82
	for <buildroot@archiver.kernel.org>; Sun,  8 Oct 2023 16:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B892418D7;
	Sun,  8 Oct 2023 16:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B892418D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fhYR8zvpYbDv; Sun,  8 Oct 2023 16:01:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032A1418C5;
	Sun,  8 Oct 2023 16:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 032A1418C5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E58EB1BF422
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 16:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BDA1C40BFC
 for <buildroot@lists.busybox.net>; Sun,  8 Oct 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDA1C40BFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kK3xnIvjUEHK for <buildroot@lists.busybox.net>;
 Sun,  8 Oct 2023 16:01:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0923408F1
 for <buildroot@buildroot.org>; Sun,  8 Oct 2023 16:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0923408F1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBDF88435A; Sun,  8 Oct 2023 16:01:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 8 Oct 2023 17:59:22 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 6374f0c527c3a15e8c7041551453ce447d9e309a
X-Git-Newrev: 03b44ac6d6a681e64cef2312187cccbd0b5b7958
X-Patchwork-Hint: ignore
Message-Id: <20231008160116.BBDF88435A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/{glibc,
 localedef}: security bump to version
 glibc-2.37-45-gb4e23c75aea756b4bddc4abcf27a1c6dca8b6bd3
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

commit: https://git.buildroot.net/buildroot/commit/?id=03b44ac6d6a681e64cef2312187cccbd0b5b7958
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Fixes the following security issues:

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
index ab310498b8..2b8f49ea6b 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  7129dfadea29e8f20865186a7fdec3dc3e65d055a81dc8fc399189491bba493c  glibc-2.37-43-g94ef70136587c40a357f775677997c753b3de56c.tar.gz
+sha256  19d874f03dadbccaca8ae88a0e96d38435066badfe6ed606c2ad1e525454dece  glibc-2.37-45-gb4e23c75aea756b4bddc4abcf27a1c6dca8b6bd3.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 666d9e4a8c..319028b058 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.37-43-g94ef70136587c40a357f775677997c753b3de56c
+GLIBC_VERSION = 2.37-45-gb4e23c75aea756b4bddc4abcf27a1c6dca8b6bd3
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index d368121a1a..18f040d7c2 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.37-43-g94ef70136587c40a357f775677997c753b3de56c
+LOCALEDEF_VERSION = 2.37-45-gb4e23c75aea756b4bddc4abcf27a1c6dca8b6bd3
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
