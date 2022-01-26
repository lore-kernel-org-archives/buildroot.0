Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B93C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 21:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B05D440A51;
	Wed, 26 Jan 2022 21:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxFkDQd3S0jv; Wed, 26 Jan 2022 21:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B84CA40A52;
	Wed, 26 Jan 2022 21:28:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5BFCF1BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4AFE960DC2
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 21:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9WrtAd0PNDlE for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 21:28:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A577A60784
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 21:28:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 39E0682707; Wed, 26 Jan 2022 21:21:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 22:23:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 935bd589a356f51e5c97d111877bd2052f0c9da5
X-Git-Newrev: 37097d6d60d8edb08e226e64401fe055521de676
X-Patchwork-Hint: ignore
Message-Id: <20220126212131.39E0682707@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/delve: bump to version 1.8.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=37097d6d60d8edb08e226e64401fe055521de676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christian Stewart <christian@paral.in>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index 3d117813c6..04ea4954cc 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e73f7fc063632268d3bdf53486aeafd98cceb8f86f4af56903dedfebaefe690d  delve-1.6.1.tar.gz
+sha256  086106a4776fa155bf20c37d27b9caed55255be6359c7f0bda1893d3adbb614e  delve-1.8.0.tar.gz
 sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index 6c346552a4..984d90a03c 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.6.1
+DELVE_VERSION = 1.8.0
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
