Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59EEFC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA61F828BA;
	Tue,  6 Feb 2024 17:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wR7RE1Z8tHU7; Tue,  6 Feb 2024 17:31:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 491CF82726
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 491CF82726;
	Tue,  6 Feb 2024 17:31:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 65B881BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F2A160F26
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:31:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F2A160F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id okvHAl_TZ8-g for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:31:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F08B60BBF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:31:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F08B60BBF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AC3C8730F; Tue,  6 Feb 2024 17:31:13 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:29:52 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 95cbe9cc60c460291fbe6a3a680816c75bb6f35f
X-Git-Newrev: 90f69f4277d037e30c32c4b2503acbbbf963cbbd
X-Patchwork-Hint: ignore
Message-Id: <20240206173113.4AC3C8730F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/{glibc,
 localedef}: security bump to version
 glibc-2.36-128-gb9b7d6a27aa0632f334352fa400771115b3c69b7
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

commit: https://git.buildroot.net/buildroot/commit/?id=90f69f4277d037e30c32c4b2503acbbbf963cbbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

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
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 15 ++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index dcff16d465..b2eee2e9af 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  d7d829f90f03e00d42d7d34ff7e972a59b14e2b70fa2e852893018349aafa5f7  glibc-2.36-118-g22955ad85186ee05834e47e665056148ca07699c.tar.gz
+sha256  30cdd65d82b6d53d4470e4bf89cab7c5cc1a8edaf8830358d8542e1c847e2d0b  glibc-2.36-128-gb9b7d6a27aa0632f334352fa400771115b3c69b7.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 98e7db7b4b..324fb0de9a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,8 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.36-118-g22955ad85186ee05834e47e665056148ca07699c
+GLIBC_VERSION = 2.36-128-gb9b7d6a27aa0632f334352fa400771115b3c69b7
+
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -44,6 +45,18 @@ GLIBC_IGNORE_CVES += CVE-2023-4911
 # 2.36 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-5156
 
+# Fixed by d1a83b6767f68b3cb5b4b4ea2617254acd040c82, which is between
+# 2.36 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6246
+
+# Fixed by 2bc9d7c002bdac38b5c2a3f11b78e309d7765b83, which is between
+# 2.36 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6779
+
+# Fixed by b9b7d6a27aa0632f334352fa400771115b3c69b7, which is between
+# 2.36 and the version we're really using.
+GLIBC_IGNORE_CVES += CVE-2023-6780
+
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 51d3ddc932..c755f59b34 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.36-118-g22955ad85186ee05834e47e665056148ca07699c
+LOCALEDEF_VERSION = 2.36-128-gb9b7d6a27aa0632f334352fa400771115b3c69b7
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
