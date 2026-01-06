Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33947D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7298341674;
	Wed,  7 Jan 2026 18:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kEy97Xe_qttQ; Wed,  7 Jan 2026 18:03:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F2C741621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809002;
	bh=UBVh0JF34RM6mhDHhvX3fiVq2QRNANGsBNrFTuO//lY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=kQro3xQCF8/+G4HAzjdtSMqPUKaBIvK42c2xG0q0k5ypl9YsMSjhy/QMnT4v3j3Ij
	 3ECfxgLKB3PmxLHXA6OYZySHHpMGnmC6+A5L3W6e9erzYyD+GAYUYYrI9ggrekUTXK
	 k4B+uULLKYPC6tpc+Yoxqddtz0eps7NRvZiYSM5h+fy4+EXovb2eL9l6gcCG82WlYq
	 dqsd/JZFK/TfFQb/NRJpuaDKj29M6zLFR76D4qJfaNkIa8LXqpxvR38LaMUgDeNMmb
	 wre3ncL8GP5FKfUOC35aKzLdCRGapkls527yCjlXuiha9IRHIflzPDZYTmeSV3HUpr
	 F7Ez/B+ggc7hA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2C741621;
	Wed,  7 Jan 2026 18:03:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E8FA58
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E090380E98
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4M2eRE9pdWW3 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89E2A80F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89E2A80F06
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88F3180333; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:59:34 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a3010c58cfdf1750d54f011123429b2ecb884090
X-Git-Newrev: eaae745b402dac7404411de617f363baad6f8e36
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.88F3180333@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-iowait:
 update tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=eaae745b402dac7404411de617f363baad6f8e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9b7399336e1e8e02a8c7976964d35033e2680cbe)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-iowait/python-iowait.hash | 3 ++-
 package/python-iowait/python-iowait.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
index fc10e180f3..35ad91cb69 100644
--- a/package/python-iowait/python-iowait.hash
+++ b/package/python-iowait/python-iowait.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/iowait/json
 md5  f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
 sha256  ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index 028001d7f3..d7738c7eb4 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
-PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
+PYTHON_IOWAIT_SITE = https://files.pythonhosted.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
 PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
