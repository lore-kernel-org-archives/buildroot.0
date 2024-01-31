Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC52C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 08:13:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A983640860;
	Wed, 31 Jan 2024 08:13:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A983640860
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvPnWwBTEJCe; Wed, 31 Jan 2024 08:13:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D7C5941F40;
	Wed, 31 Jan 2024 08:13:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C5941F40
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D73D81BF846
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:13:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEC084355F
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 08:13:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEC084355F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RiYZLKvcQCVA for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 08:13:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 98E0740533
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 08:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 98E0740533
Received: by mail.gandi.net (Postfix) with ESMTPSA id 90C7960003;
 Wed, 31 Jan 2024 08:12:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rV5iK-000jbA-2t;
 Wed, 31 Jan 2024 09:12:56 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 31 Jan 2024 09:12:54 +0100
Message-Id: <20240131081254.175261-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240131081254.175261-1-peter@korsgaard.com>
References: <20240131081254.175261-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixed the following security issues:

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
