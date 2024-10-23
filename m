Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABA0CFA453
	for <buildroot@archiver.kernel.org>; Wed, 23 Oct 2024 17:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB2B80D99;
	Wed, 23 Oct 2024 17:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJNuYG7ZPUNt; Wed, 23 Oct 2024 17:11:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D6680DAE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84D6680DAE;
	Wed, 23 Oct 2024 17:11:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40BA02072
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2021740926
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pG8TuOufIS1a for <buildroot@buildroot.org>;
 Wed, 23 Oct 2024 17:11:56 +0000 (UTC)
X-Greylist: delayed 424 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 23 Oct 2024 17:11:55 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E2F3B40436
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E2F3B40436
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.132;
 helo=smtpdh18-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Received: from smtpdh18-1.aruba.it (smtpdh18-1.aruba.it [62.149.155.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E2F3B40436
 for <buildroot@buildroot.org>; Wed, 23 Oct 2024 17:11:55 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 3emutYi7ZY7T43emutpERM; Wed, 23 Oct 2024 19:04:49 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Pierre Floury <pierre.floury@gmail.com>
Date: Wed, 23 Oct 2024 19:04:47 +0200
Message-ID: <20241023170447.778547-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
References: <20241023170447.778547-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLY2cQ9B+oJasv+pMgeRDbdWbkSxMFMEDeDmppmjl0mz49Vm1fFkKp8AjtRHEbiuXnGI9xunhryC9PWrVaQoMs5f9Eg3mOT0Zj8Aq+6UMemvV/J+Ji6W
 E+pV5+i4YtB4BqtAcsYRA/Gk5m8NkIafTsAH3mbOmna4xNcxw0z/HMNDRl5EnuwVBHSmJW7n7CbQ3JMHPmp/6ma/MwRBvuT8D9v6Hm4oef9TrYDQGUAc5bbM
 q87gcashhpS+q2CnvfW1hrMrqxpTck3Z3tvHpJqO7IJN5HCRqV2i92So8xq545fzRZrsHS9ayyNF2npK9aESQZXz0PR6yrHL9WjHDGPzRBon5lCaW6lgpHfv
 BOZpYSWr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1729703089; bh=mQAPsyqGP5sIZnZKuLX0CgQZHL2nY+uwy05405Ga1hU=;
 h=From:To:Subject:Date:MIME-Version;
 b=jVD6N27g7vPyQxbgAjr70fZZNEZGdFH4ELhmwklJSWfMWJy7OAlBla8Xc0ro5Etzk
 +KJlD4lj4U9TGx0XogQj6uAZ1/qp6BO6bBBBKDLvme6iZ4xXZiztLhkpvcZ1XFyoy/
 pJxiMeUA/QSTLs6z7hjJAEOX7rCr1bKNuvdEN6W+Jd1ZHg6gJO70/SVe9otXzPsLfn
 5pKdAJxIUsVXfPOtH15W/yMNAeXqzu/SDqN8r3zR2NVWk9yMFf6b+p+cUq984iBCaj
 kn3Q5myP7zu4V8RAuyn1S9i0zqnrkqiUtFNGMOQ0TnkgslQBTlYWiVzakfXVSZUmKr
 la2agzMJkumyw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=jVD6N27g
Subject: [Buildroot] [PATCH] package/trace-cmd: bump to version 3.3.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/trace-cmd/trace-cmd.hash | 2 +-
 package/trace-cmd/trace-cmd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trace-cmd/trace-cmd.hash b/package/trace-cmd/trace-cmd.hash
index ac30eae85f..c1b52a5195 100644
--- a/package/trace-cmd/trace-cmd.hash
+++ b/package/trace-cmd/trace-cmd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0671048dd2b8abdb8b2d0eb9cc91335c997620a7da72f858381ff4206f32065f  trace-cmd-v3.3.tar.gz
+sha256  2efe103389367e93c764c4a788880ba51018a65dec21b0411965a5f06a6338c1  trace-cmd-v3.3.1.tar.gz
 sha256  b1d04b850c1c7471b0f0896f6c6f0fcfc9f07e2dd183a5f5826af269fe9e88fb  COPYING
 sha256  70f297763149e72306919c924e164f83041d5e512868d4c8c1826c171b3e49f9  COPYING.LIB
 sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  LICENSES/GPL-2.0
diff --git a/package/trace-cmd/trace-cmd.mk b/package/trace-cmd/trace-cmd.mk
index 14a59b2cc8..cf16ddcb17 100644
--- a/package/trace-cmd/trace-cmd.mk
+++ b/package/trace-cmd/trace-cmd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRACE_CMD_VERSION = 3.3
+TRACE_CMD_VERSION = 3.3.1
 TRACE_CMD_SOURCE = trace-cmd-v$(TRACE_CMD_VERSION).tar.gz
 TRACE_CMD_SITE = \
 	https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
