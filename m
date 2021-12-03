Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB16AC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Dec 2021 07:56:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E34A60666;
	Fri,  3 Dec 2021 07:56:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RCk2GrYJITT7; Fri,  3 Dec 2021 07:56:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E508060661;
	Fri,  3 Dec 2021 07:56:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8568D1BF2F9
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7431B40437
 for <buildroot@lists.busybox.net>; Fri,  3 Dec 2021 07:56:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LvQ1e10lyHBF for <buildroot@lists.busybox.net>;
 Fri,  3 Dec 2021 07:56:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0CF44030A
 for <buildroot@buildroot.org>; Fri,  3 Dec 2021 07:56:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 10D45923A3; Fri,  3 Dec 2021 07:51:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 3 Dec 2021 08:55:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef98158a2d4f5af00501072c10c2e057fe80dd65
X-Git-Newrev: a8e227ae6078dc4a7cf6b88d39bd1710bc439571
X-Patchwork-Hint: ignore
Message-Id: <20211203075135.10D45923A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libnss: security bump to version
 3.73
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8e227ae6078dc4a7cf6b88d39bd1710bc439571
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2021-43527: Heap overflow in NSS when verifying DSA/RSA-PSS
  DER-encoded signatures

For more details, see the advisory:
https://www.mozilla.org/en-US/security/advisories/mfsa2021-51/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 3dc6cb185a..803b234c83 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_72_RTM/src/SHA256SUMS
-sha256  6ea60a9ff113e493ea2ab25f41ea75a9fbd10af7903f26f703dac8680732d02e  nss-3.72.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_RTM/src/SHA256SUMS
+sha256  566d3a68da9b10d7da9ef84eb4fe182f8f04e20d85c55d1bf360bb2c0096d8e5  nss-3.73.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2d880d2336..6504f30d31 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.72
+LIBNSS_VERSION = 3.73
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
