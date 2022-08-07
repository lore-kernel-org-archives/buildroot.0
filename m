Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CF5C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 611CC60AF0;
	Sun,  7 Aug 2022 12:56:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 611CC60AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V1wyP-5P6DUi; Sun,  7 Aug 2022 12:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2B760ADF;
	Sun,  7 Aug 2022 12:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E2B760ADF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF511BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7996060ADF
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7996060ADF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lfTHaLIA93XZ for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:56:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AC5CF60AC1
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC5CF60AC1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7774A86F34; Sun,  7 Aug 2022 12:42:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:56:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b25c3f1d43a44c9edd87d2497874c3536a9b300d
X-Git-Newrev: b69207971326bc8c23387b941f7e8f3200e924dc
X-Patchwork-Hint: ignore
Message-Id: <20220807124221.7774A86F34@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnspr: bump to version 4.34.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b69207971326bc8c23387b941f7e8f3200e924dc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately local patch is still pending upstream. I've pinged them
again after 3 months with no answer:
https://bugzilla.mozilla.org/show_bug.cgi?id=1765100

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 4795b52aaf..a368f02c54 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.34/src/SHA256SUMS
-sha256  beef011cd15d8f40794984d17014366513cec5719bf1a78f5e8a3e3a1cebf99c  nspr-4.34.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.34.1/src/SHA256SUMS
+sha256  c5b8354c48b632b8f4c1970628146c0e0c0ca8f32c7315d7d5736c002e03774f  nspr-4.34.1.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 5d64d110ef..fcb2a1db49 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.34
+LIBNSPR_VERSION = 4.34.1
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
