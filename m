Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E85C27C53
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 14:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 261A940433;
	Sun, 16 Jun 2024 14:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i0SPfOXqnZNe; Sun, 16 Jun 2024 14:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C3A0F40177
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3A0F40177;
	Sun, 16 Jun 2024 14:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF96F1BF36E
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:21:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BA3440177
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:21:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS8H7NsypAyb for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 14:21:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4F56F40156
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4F56F40156
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F56F40156
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 14:20:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 101EC1C0002;
 Sun, 16 Jun 2024 14:20:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sIqkZ-004Cd8-1L;
 Sun, 16 Jun 2024 16:20:55 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 16:20:48 +0200
Message-Id: <20240616142048.1001850-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH-2024.02.x] package/glibc: security bump to
 2.38-81 for post-2.38 security fixes
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

Fixes the following security issues:

GLIBC-SA-2024-0004:
  ISO-2022-CN-EXT: fix out-of-bound writes when writing escape
  sequence (CVE-2024-2961)

GLIBC-SA-2024-0005:
  nscd: Stack-based buffer overflow in netgroup cache (CVE-2024-33599)

GLIBC-SA-2024-0006:
  nscd: Null pointer crash after notfound response (CVE-2024-33600)

GLIBC-SA-2024-0007:
  nscd: netgroup cache may terminate daemon on memory allocation
  failure (CVE-2024-33601)

GLIBC-SA-2024-0008:
  nscd: netgroup cache assumes NSS callback uses in-buffer strings
  (CVE-2024-33602)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 15 ++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 15ae55b9e6..9f404afeaf 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  e38f4284d6909c6b5db7d79c6e450daeaf136a67e547290eec0b063a55eaaa42  glibc-2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0.tar.gz
+sha256  f36243d2500f714e1333a93f0d029f92d6b0e2e8e80ccb3936b7b40ceeb36d54  glibc-2.38-81-gc8cb4d2b86ece572793e31a3422ea29e88d77df5.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index d198d6f04c..104c844907 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
+GLIBC_VERSION = 2.38-81-gc8cb4d2b86ece572793e31a3422ea29e88d77df5
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
@@ -52,6 +52,19 @@ GLIBC_IGNORE_CVES += CVE-2023-6779
 # 2.38 and the version we're really using.
 GLIBC_IGNORE_CVES += CVE-2023-6780
 
+# Fixed by glibc-2.38-66-ge1135387deded5d73924f6ca20c72a35dc8e1bda
+GLIBC_IGNORE_CVES += CVE-2024-2961
+
+# Fixed by glibc-2.38-72-g5968aebb86164034b8f8421b4abab2f837a5bdaf
+GLIBC_IGNORE_CVES += CVE-2024-33599
+
+# Fixed by glibc-2.38-73-g541ea5172aa658c4bd5c6c6d6fd13903c3d5bb0a +
+# glibc-2.38-74-g2ae9446c1b7a3064743b4a51c0bbae668ee43e4c
+GLIBC_IGNORE_CVES += CVE-2024-33600
+
+# Fixed by glibc-2.38-75-g71af8ca864345d39b746d5cee84b94b430fad5db
+GLIBC_IGNORE_CVES += CVE-2024-33601 CVE-2024-33602
+
 # All these CVEs are considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c017c0e00e..bade28fdcb 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.38-44-gd37c2b20a4787463d192b32041c3406c2bd91de0
+LOCALEDEF_VERSION = 2.38-81-gc8cb4d2b86ece572793e31a3422ea29e88d77df5
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
