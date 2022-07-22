Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E13AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 06:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5275409DA;
	Fri, 22 Jul 2022 06:27:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5275409DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s45hX-gY-xcZ; Fri, 22 Jul 2022 06:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2BA9409F3;
	Fri, 22 Jul 2022 06:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A2BA9409F3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEAE1BF855
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83ACD41952
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 06:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83ACD41952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jLKKBQzW4kzW for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 06:25:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9418141858
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 06:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9418141858
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 988FC840F1; Fri, 22 Jul 2022 06:12:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 08:18:46 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: 9e40974572452ebbb2688cda3fb712a2d10a91ef
X-Git-Newrev: 4e0f1b1f80a34a4d4d429888b5b564c3218e5b37
X-Patchwork-Hint: ignore
Message-Id: <20220722061210.988FC840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/cups: security
 bump to version 2.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=4e0f1b1f80a34a4d4d429888b5b564c3218e5b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Fixes CVE-2022-26691
https://github.com/OpenPrinting/cups/blob/master/CHANGES.md

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 433fd541eaa37db3241eed16df6ae1f51d81335b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.hash | 2 +-
 package/cups/cups.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 8308b7b803..ba220e903e 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  c7339f75f8d4f2dec50c673341a45fc06b6885bb6d4366d6bf59a4e6c10ae178  cups-2.4.1-source.tar.gz
+sha256  f03ccb40b087d1e30940a40e0141dcbba263f39974c20eb9f2521066c9c6c908  cups-2.4.2-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  7a7bd639e3a8457ae40b0dcfb74ea3cc6a8132b06c726142e993625d33eb6de5  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 298a6ed879..ab56b23bcd 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.1
+CUPS_VERSION = 2.4.2
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
