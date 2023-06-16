Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938A2EB64D8
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 08:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40E4D6148F;
	Fri, 16 Jun 2023 08:41:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E4D6148F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NyJUu_x4VTO3; Fri, 16 Jun 2023 08:41:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F2656147C;
	Fri, 16 Jun 2023 08:41:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F2656147C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748E11BF5E6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E5EC40181
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 08:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E5EC40181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uAKcICNOPirc for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3D694063F
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3D694063F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A321983A1B; Fri, 16 Jun 2023 08:41:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 10:33:08 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4fa90a2f6dd39ab18ff4da103fac44bb3ddec531
X-Git-Newrev: 206dda4f2b177029fb81f4b96f4c239ddeba431b
X-Patchwork-Hint: ignore
Message-Id: <20230616084116.A321983A1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cups: security
 bump to version 2.4.4
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
Content-Type: multipart/mixed; boundary="===============4709341371655795110=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4709341371655795110==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=206dda4f2b177029fb81f4b96f4c239ddeba431b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fixes the following security issues:

- CVE-2023-32324: Heap buffer overflow in cupsd
  https://github.com/OpenPrinting/cups/security/advisories/GHSA-cxc6-w2g7-69p7

And a number of other fixes, see the release notes for details:
https://github.com/OpenPrinting/cups/releases/tag/v2.4.3

In addition, 2.4.4 fixes a segfault regression in 2.4.3:
https://github.com/OpenPrinting/cups/releases/tag/v2.4.4

Update NOTICE hash for a change in copyright years:
-Copyright © 2020-2022 by OpenPrinting
+Copyright © 2020-2023 by OpenPrinting

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 38bef5fbc8c609241bb0fbcde310f5eb296537ae)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 4 ++--
 package/cups/cups.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index ba220e903e..cc6fe25446 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9f2521066c9c6c908  cups-2.4.2-source.tar.gz
+sha256  209259e8fe8df9112af49f4e5765f50dad6da1f869296de41d6eaab1b98003cb  cups-2.4.4-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
-sha256  7a7bd639e3a8457ae40b0dcfb74ea3cc6a8132b06c726142e993625d33eb6de5  NOTICE
+sha256  5320b6e3c252423e4153eb2dd63e57e3b630afb21139f44e43b02d85fe33e279  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index fed2aa809f..7bbea9a218 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.2
+CUPS_VERSION = 2.4.4
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception

--===============4709341371655795110==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4709341371655795110==--
