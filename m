Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783AAC7619A
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 07:47:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8A0F4136C;
	Wed,  5 Apr 2023 07:47:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8A0F4136C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s6kbVnOwp0R6; Wed,  5 Apr 2023 07:47:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B054641754;
	Wed,  5 Apr 2023 07:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B054641754
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE0E1C2A08
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 07:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 762B481E90
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 07:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 762B481E90
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q80s5R7g_Irh for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 07:47:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E24F081489
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E24F081489
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 07:47:18 +0000 (UTC)
Received: from allenwind.lan (unknown [IPv6:2a02:169:3df5:10::ed4])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id EAD4B5C2101;
 Wed,  5 Apr 2023 09:47:15 +0200 (CEST)
From: Stefan Agner <stefan@agner.ch>
To: buildroot@buildroot.org
Date: Wed,  5 Apr 2023 09:47:01 +0200
Message-Id: <fbe678c521be19c519bb86f7b86528b43266f8b0.1680680807.git.stefan@agner.ch>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1680680836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:in-reply-to:
 references; bh=BCOP7vsNXnK6pApEG0/lULDhXjJK2v+MAFW++Gvtay0=;
 b=M1dGmAayGzTrVwenuK3qE2Xlbmh0TqbCPIqsnwpiqbcmxLsKCBWk5szmGEcpzdIT02JD7j
 NkE3hnlykt6wUy+DglR6xIvTnf1A5d4wuEQzg7Er+BkZ6CQO7wvCVL1/4B0lP92YDmDFQx
 vd1lamwhHVTQbYoBkOctrZ4NAimnGMM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=M1dGmAay
Subject: [Buildroot] [PATCH] package/containerd: security bump to version
 1.6.20
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
Cc: Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Various bugfixes and improvements. Noteable security fixes:

- Fix OCI image importer memory exhaustion
  https://github.com/containerd/containerd/security/advisories/GHSA-259w-8hf6-59c2
- Fix supplementary groups not being set up properly
  https://github.com/containerd/containerd/security/advisories/GHSA-hmfx-3pcx-653p

https://github.com/containerd/containerd/releases/tag/v1.6.20

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 16474089d1..65a87f25fa 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  e0a893cf67df9dfaecbcde2ba4e896efb3a86ffe48dcfe0d2b26f7cf19b5af3a  containerd-1.6.16.tar.gz
+sha256  819086ccdca44cfc5f108e226c7a9294d8fad3eb32031a621623da80dedbfb11  containerd-1.6.20.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 4a0d6ec38b..bc1dd58611 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.16
+CONTAINERD_VERSION = 1.6.20
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
