Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5460C433F5
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 18:27:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 866076114B;
	Fri, 17 Dec 2021 18:27:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qk6dx537aGZK; Fri, 17 Dec 2021 18:27:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF17961147;
	Fri, 17 Dec 2021 18:27:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7E7F81BF28C
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:27:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E56741FBB
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 18:27:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaTFFhHIM4wV for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 18:27:11 +0000 (UTC)
X-Greylist: delayed 00:07:03 by SQLgrey-1.8.0
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTP id E8C6841F61
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 18:27:10 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id yHptmQk4NTHgOyHptmJpfb; Fri, 17 Dec 2021 19:20:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1639765205; bh=p61bxp8pQUHFNZyY9YP00HGNBHGws8qKefY/ybGUUC4=;
 h=From:To:Subject:Date:MIME-Version;
 b=WtQ4JHs9tyEIhjevMgnqnQ5GNBrKYzAkLA/mBnv9LJ4PQj+LkE+QKNhuz1gaJU1j7
 UnbrhAvNVlSwadSzGCzYPQ12MquT0U8snStxqsRqcl5AnNZ3m8wRvZgGkLBkFWQi6E
 FlwW3RLFqpixOCDwnaxeCWIFyW+GoFq9gWl/tK4EyKPXJ6M0bckhI36bpT5Vi4HIKt
 JRrm6HFodqv1nK+DnjxHwYJSJ9DIS5DxkMyaqx9uK2q6ufFLzRtCP2cEcVw7hrQIBk
 hAlRPL1IWU+9KGx7OzHDv0u/HNwQojbO7C85Zl2WQncOX+zbdgimbxKy4zruMGmhQc
 ZJ8fQh7aYnyrQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 19:20:04 +0100
Message-Id: <20211217182004.2399542-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOn0O5scaEWFZMD58SiVGo2wBnMX8c4WUG+aepZSRpn0cAh9y7e4eNRDgER+WCX4mFb6yT630/6wNhxbbKoy7CrUmp0FfUTd7eVuTo0IvCd1ihJC206j
 PxYFsYjn1iOIfIhpKXTgKSz72hTVmM1h1X+pLSXsWEm0FG9Ep0gRvyvbskw9xL5djwhO4X1Y/yAxu1a8zIvuZc5So9uwFCMe645FMRWytZYlL7JBL3qMMPq2
 oVrCUlyKCtfckRwrCOKt5AcIzdprviF6cF74hLB9Qtg=
Subject: [Buildroot] [PATCH] package/libnspr: bump to version 4.33
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 13d3958735..0064a9b279 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.32/src/SHA256SUMS
-sha256  bb6bf4f534b9559cf123dcdc6f9cd8167de950314a90a88b2a329c16836e7f6c  nspr-4.32.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.33/src/SHA256SUMS
+sha256  b23ee315be0e50c2fb1aa374d17f2d2d9146a835b1a79c1918ea15d075a693d7  nspr-4.33.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 8f16a8076f..7491d18884 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.32
+LIBNSPR_VERSION = 4.33
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
