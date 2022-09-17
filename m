Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01760ECAAD3
	for <buildroot@archiver.kernel.org>; Sat, 17 Sep 2022 14:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99FDD81763;
	Sat, 17 Sep 2022 14:48:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 99FDD81763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iRPWS7jsighm; Sat, 17 Sep 2022 14:48:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D309581380;
	Sat, 17 Sep 2022 14:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D309581380
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4805E1BF575
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:48:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E19460A83
 for <buildroot@lists.busybox.net>; Sat, 17 Sep 2022 14:48:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E19460A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y_jyF03CyCdP for <buildroot@lists.busybox.net>;
 Sat, 17 Sep 2022 14:48:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4252C60ACA
 for <buildroot@buildroot.org>; Sat, 17 Sep 2022 14:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4252C60ACA
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2EFA984452; Sat, 17 Sep 2022 14:48:27 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 17 Sep 2022 16:46:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f797baba2b09262fb113bf41067a5f24ea49b3fd
X-Git-Newrev: 7c39958ba1ad9f0b760c72004ceb445e72d7ef86
X-Patchwork-Hint: ignore
Message-Id: <20220917144827.2EFA984452@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unzip: update security patches
 from Debian
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c39958ba1ad9f0b760c72004ceb445e72d7ef86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2022-0529 and CVE-2022-0530.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unzip/unzip.hash |  2 +-
 package/unzip/unzip.mk   | 10 ++++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
index 8b3f275533..bbf4f7d71f 100644
--- a/package/unzip/unzip.hash
+++ b/package/unzip/unzip.hash
@@ -1,6 +1,6 @@
 # From https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip/unzip_6.0-26.dsc
 sha256  036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37  unzip_6.0.orig.tar.gz
-sha256  88cb7c0f1fd13252b662dfd224b64b352f9e75cd86389557fcb23fa6d2638599  unzip_6.0-26.debian.tar.xz
+sha256  67bde7c71d52afd61aa936d4415c8d12fd90ca26e9637a3cd67cae9b71298c12  unzip_6.0-27.debian.tar.xz
 
 # Locally computed:
 sha256  7469b81d5d29ac4fd670f7c86ba0cb9fa34f137a2d4d5198437d92ddf918984b  LICENSE
diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index e8c9366a1b..44cc2013fb 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -6,13 +6,13 @@
 
 UNZIP_VERSION = 6.0
 UNZIP_SOURCE = unzip_$(UNZIP_VERSION).orig.tar.gz
-UNZIP_PATCH = unzip_$(UNZIP_VERSION)-26.debian.tar.xz
-UNZIP_SITE = https://snapshot.debian.org/archive/debian/20210110T204103Z/pool/main/u/unzip
+UNZIP_PATCH = unzip_$(UNZIP_VERSION)-27.debian.tar.xz
+UNZIP_SITE = https://snapshot.debian.org/archive/debian/20220916T090657Z/pool/main/u/unzip
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
 UNZIP_CPE_ID_VENDOR = unzip_project
 
-# unzip_$(UNZIP_VERSION)-26.debian.tar.xz has patches to fix:
+# unzip_$(UNZIP_VERSION)-27.debian.tar.xz has patches to fix:
 UNZIP_IGNORE_CVES = \
 	CVE-2014-8139 \
 	CVE-2014-8140 \
@@ -24,6 +24,8 @@ UNZIP_IGNORE_CVES = \
 	CVE-2016-9844 \
 	CVE-2018-18384 \
 	CVE-2018-1000035 \
-	CVE-2019-13232
+	CVE-2019-13232 \
+	CVE-2022-0529 \
+	CVE-2022-0530
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
