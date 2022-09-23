Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05DAC04A95
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 871DF404AE;
	Fri, 23 Sep 2022 21:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 871DF404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PO6ehi2cl2MI; Fri, 23 Sep 2022 21:36:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A954340151;
	Fri, 23 Sep 2022 21:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A954340151
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CCF51BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1510D841A2
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1510D841A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vwAzzGzpvjLp for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EA5E82591
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EA5E82591
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2CBC185F1B; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:33:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 094e87c805e37c3981d3ef0b4e7431a25181a6c2
X-Git-Newrev: 5e42232b0549c273fe3c475c9e93561d141ac6ec
X-Patchwork-Hint: ignore
Message-Id: <20220923213617.2CBC185F1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/modem-manager: bump version to
 1.18.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=5e42232b0549c273fe3c475c9e93561d141ac6ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release fixes a few very critical issues that happpen when using a glib2 newer or equal
than 2.73.2 (after the pcre1->pcre2 update)

Signed-off-by: Michael Fischer <mf@go-sys.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/modem-manager/modem-manager.hash | 4 ++--
 package/modem-manager/modem-manager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/modem-manager/modem-manager.hash b/package/modem-manager/modem-manager.hash
index 33098609d9..40c8ad703f 100644
--- a/package/modem-manager/modem-manager.hash
+++ b/package/modem-manager/modem-manager.hash
@@ -1,4 +1,4 @@
-# Locally computed
-sha256  16255f8229eeeb2dfecb8dd1370360d46f1015ec85e6fba5c1cbd9f4371d65eb  ModemManager-1.18.10.tar.xz
+#Locally calculated after checking https://www.freedesktop.org/software/ModemManager/ModemManager-1.18.12.tar.xz.asc
+sha256  b464e4925d955a6ca86dd08616e763b26ae46d7fd37dbe281678e34065b1e430  ModemManager-1.18.12.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/modem-manager/modem-manager.mk b/package/modem-manager/modem-manager.mk
index 8c53216874..d0c9b7377b 100644
--- a/package/modem-manager/modem-manager.mk
+++ b/package/modem-manager/modem-manager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MODEM_MANAGER_VERSION = 1.18.10
+MODEM_MANAGER_VERSION = 1.18.12
 MODEM_MANAGER_SOURCE = ModemManager-$(MODEM_MANAGER_VERSION).tar.xz
 MODEM_MANAGER_SITE = http://www.freedesktop.org/software/ModemManager
 MODEM_MANAGER_LICENSE = GPL-2.0+ (programs, plugins), LGPL-2.0+ (libmm-glib)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
