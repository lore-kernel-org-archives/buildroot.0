Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93C2C4332F
	for <buildroot@archiver.kernel.org>; Sat, 11 Nov 2023 19:52:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25FDC61153;
	Sat, 11 Nov 2023 19:52:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25FDC61153
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F8y7QJQDLZ1G; Sat, 11 Nov 2023 19:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CE9F61150;
	Sat, 11 Nov 2023 19:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6CE9F61150
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 123BD1BF3BD
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 19:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD9EA41491
 for <buildroot@lists.busybox.net>; Sat, 11 Nov 2023 19:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD9EA41491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FmdoQZm4TWIW for <buildroot@lists.busybox.net>;
 Sat, 11 Nov 2023 19:52:33 +0000 (UTC)
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F50340C2D
 for <buildroot@buildroot.org>; Sat, 11 Nov 2023 19:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F50340C2D
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 1u1srKgJSwTXC1u1trFXQD; Sat, 11 Nov 2023 20:52:29 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 11 Nov 2023 20:52:24 +0100
Message-Id: <20231111195224.821851-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfHS9CAMsZh/zsoQM4EMVe7KIgtkBa2s4iA4+1uN7/Yv/bvWqhtKE4QFkkrxVTI26hell+UAv5AJjvTWcycQPKFgqx2FujSD526mlw+v2x3efgDyAKzuE
 wusYLPkK3a6IjMBczrlb8CuB5RBzk/remGQZ+JmmpgFB4dB+uqlTa5cWCxmPY9DdcTRQCqHo1LBvRjR0dR1NNUxJi89TlNJpPtI0A59WdP5Mh+6IZR04pcXx
 dSV7Gl6s9GUDqm5yDMDv039KcX+PkiwI8H7iSjHZ9IE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1699732349; bh=OtR5OLE8D1dpZMJvD4uZu297Ldf7rDjofhvSnw9rqxE=;
 h=From:To:Subject:Date:MIME-Version;
 b=UxIEkS3khEnb0g0Z/kX4J3OC8MML+o4VXBWOn1LY8byS0Gp1qtv3fFBunwYMrreXb
 xoaEuBqBqBovScS+eUnXh1uBBZG3qdv27FYKicgWDoxINI4+lWiCADojOFgozamVMy
 kmNTzAwhMY5EJtOwy7YNiSeTRWMCLxdRWbGuS4CQ5LPL+HOiBAcMnW8GpKcW1C45E1
 wOvaZLyKwFmf6Y1BVXaR5gvpm2kAuabS1Ap4ca/jbSUwIP8FAJPphIjJ36MgbhHRYg
 3/dCTqSapXxGb2YUvKlKxy9A/EFIrtCHIvivABkzqxU61w351IyO3k9+CUm2UYBppH
 okErdrrnjuEQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UxIEkS3k
Subject: [Buildroot] [PATCH] package/harfbuzz: bump to version 8.3.0
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
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 69926f8c6a..fbe890910a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e433ad85fbdf57f680be29479b3f964577379aaf319f557eb76569f0ecbc90f3  harfbuzz-8.2.2.tar.xz
+sha256  109501eaeb8bde3eadb25fab4164e993fbace29c3d775bcaa1c1e58e2f15f847  harfbuzz-8.3.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 0dfe1b2056..4435cbb736 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.2.2
+HARFBUZZ_VERSION = 8.3.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
