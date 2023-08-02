Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 636FCC001E0
	for <buildroot@archiver.kernel.org>; Wed,  2 Aug 2023 14:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF10F40AFC;
	Wed,  2 Aug 2023 14:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF10F40AFC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AZcxEK_wa2Sv; Wed,  2 Aug 2023 14:27:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 403FE414CA;
	Wed,  2 Aug 2023 14:27:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 403FE414CA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 344351BF982
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4DFC781431
 for <buildroot@lists.busybox.net>; Wed,  2 Aug 2023 14:27:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DFC781431
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4_l5sqE4vUh1 for <buildroot@lists.busybox.net>;
 Wed,  2 Aug 2023 14:27:02 +0000 (UTC)
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7E34820F6
 for <buildroot@buildroot.org>; Wed,  2 Aug 2023 14:27:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7E34820F6
Received: from localhost.localdomain ([146.241.116.57])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RCoTqTOSIsBdlRCoTqx3hg; Wed, 02 Aug 2023 16:26:57 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 16:16:36 +0200
Message-Id: <20230802141636.528011-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJkNEM0y/mBrZ6Na70I5TVygy3Zqjq+sylRHc+UX4jqfOu7lhYCXjxQz5hgZCmOJ3zl4jwqTCVcLH1n49Id2+nLm+n8xpTuzkc2bXOHMNMguKE5oiDpn
 PbaCCEDftCt278q9OuLTZE6LlbMVYnmmdeQl6hD3KWP67uosNNAI+Oqjt0kxEz921aZWcArNvmzBQz6EqnGWv6P/Rmbq2FHDRmIUDiZickh6GwFPSqkGGl1J
 P7glWxMfTNBi4nkCmrJ0Egedx6VgGtoYisXb/ReWQ2/q9afGRZkK/20+4KKSaEIF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690986417; bh=QXxmRlqwhljkWkK1A+MSYmnIPGQDrX65uoa+fgSbSPo=;
 h=From:To:Subject:Date:MIME-Version;
 b=N8bl7TexVaXC+zjSMbSw+IVxwdNpZY6xdSyKHQ9MPNhlMpjkAWTWiXNPYR0e22UQJ
 LNTI9wiTpkAE0wsRDFAw5wN6ehfPUFO8YMvYsHyjB6+FOzlq8cnQIvcQJjUbntx085
 wWoe0belqt29PWFc9AIvqCfqbCcn4NLjwN3csW67mBTFR3KqtZQtQ/9lUkuyfyD901
 vLJdd+dG0SgX5LcydZEvjxu+p0zf35bzxZZyQ/J9+FTfJG/0fYQ/An1XQBcx4tca74
 8191I2mfclaByn0x6qVhDA6a7v641oLgw1cGetReo9sHgmFvZXJuAXei+qm0f8Ni+u
 5f9x/R/pGSrJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=N8bl7Tex
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 8.1.0
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

Release notes: https://github.com/harfbuzz/harfbuzz/blob/main/NEWS

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/harfbuzz/harfbuzz.hash | 2 +-
 package/harfbuzz/harfbuzz.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 6b71e3819c..72210a78f9 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c1ce780acd385569f25b9a29603d1d5bc71e6940e55bfdd4f7266fad50e42620  harfbuzz-8.0.1.tar.xz
+sha256  639596da7c26cc503b16b3bf4dfdca77fe832d3c9e06004ef63a7ce53cafbac9  harfbuzz-8.1.0.tar.xz
 sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 3118ec62c9..ce3573c10d 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 8.0.1
+HARFBUZZ_VERSION = 8.1.0
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
