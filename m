Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693BCC433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Dec 2021 21:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7B184164D;
	Wed, 15 Dec 2021 21:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGL9Xd3kZBsy; Wed, 15 Dec 2021 21:32:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4E358410A7;
	Wed, 15 Dec 2021 21:32:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 475731BF39F
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3595160F85
 for <buildroot@lists.busybox.net>; Wed, 15 Dec 2021 21:32:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8hSz9EFvE4KF for <buildroot@lists.busybox.net>;
 Wed, 15 Dec 2021 21:32:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id A083960F55
 for <buildroot@buildroot.org>; Wed, 15 Dec 2021 21:32:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id xbsrm9hExIMuKxbssmdsuz; Wed, 15 Dec 2021 22:32:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639603942; bh=pzDtLW3F8KwzM443l48lqO+UMvTyGfYj7wxhWr9WyVk=;
 h=From:To:Subject:Date:MIME-Version;
 b=btI5oAnH8SYG1JyNV1hpaFgnfRmnTlKfDSRt+K0oQjXyxevcOdXvONjry67Vdn2rB
 NHd9w3BI4eRd+C8RkZ1fpdrlcVx1rIDqwLdGCvGlSHSxKsN7XV+/Ia4E76U4h5rDTx
 s99S+rkQBKRIWYvwgPC70ppu8S86vWdmy0MLt2t2Vmvs8smDGdlyIeOX/zuKN3MIyx
 np/AQ33JAdlInrXYnoPb0MeKjJAflKKtG0Jphdiu8VGaWIEkNlrT1HtPywQ6OD2udF
 jDrjmTYPuLmW2IKpOG5A+I3z791OGpEj1nZh8RjxroGqC8KeqjWjFIxLfAOoP9mM/c
 /winWqDeLDJPg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 15 Dec 2021 22:32:21 +0100
Message-Id: <20211215213221.790491-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfEzqX0REDcb3oJtyf4bqYgMzod6sLVZuhPfb7v4BLBRpBN43MxMHgjIgmcqLeC7x7Ak8IjHh2nu2/yJLGi+9bUYAIaH3Bkwx/pRPPPj29uojhjL+yXMv
 Xu5JG5VLTzeruoNn1AvAKDCfdWB9VFO/44XtstQ+cm0tetXwlW9HEDlV+IFbDnQVEuxNvuBzt69cLe5aSEqSC+9g6I3l4z3yRIdb/irtYAjqReEToQhh7LFn
 A6PQbtAJY+7DNKfmrvJu+B6iCIL7G1PHfEYFmhAKjdLs2/1BC2DsifLRAjmvI854
Subject: [Buildroot] [PATCH] package/libnss: bump to version 3.73.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 803b234c83..100d2d7870 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_RTM/src/SHA256SUMS
-sha256  566d3a68da9b10d7da9ef84eb4fe182f8f04e20d85c55d1bf360bb2c0096d8e5  nss-3.73.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_73_1_RTM/src/SHA256SUMS
+sha256  c768f9fe3129e8bcc2e9679456d7edd9453a225784a8fc7dc4501806f1fe9abe  nss-3.73.1.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 2e26abdfc0..e2f7521b47 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.73
+LIBNSS_VERSION = 3.73.1
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
