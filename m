Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AFBCCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 21:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19ED740DD0;
	Thu,  9 Oct 2025 21:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-8ddpbYIEuq; Thu,  9 Oct 2025 21:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DF0B40DD3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF0B40DD3;
	Thu,  9 Oct 2025 21:36:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6D050119
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 648A084221
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZQiOPfKd8vy for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 21:36:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.131;
 helo=smtpcmd04131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 61201841F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61201841F8
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 61201841F8
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:36:16 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 6yJ3vqxOicq1h6yJ3vU1Gc; Thu, 09 Oct 2025 23:36:14 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu,  9 Oct 2025 23:36:12 +0200
Message-ID: <20251009213612.1143019-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFAFWEJGqMJY/Nt73KLH1JQO+fNKVQU8T9GT255XtFCFkF8amk8xzEnSgTg20iPCXF9IvE5Bj0fBd8ZBZmqdUOog9h6BXvBOOo+YIxPA8RvixKiS6lkn
 Fsp4KJxmAJodYKuQsqaKTRt9hly/RsZCrYYvFA7bO3wOBxbrdT7QUHFzM06TAs4wBcpXsh9p/4RC2Prt2MmzsAs/zIiUB0upb5LEUkVmmtEaXhE8pN3uQmsu
 zd1UfA9pDwh1ARVJt/xOpPn/5vB+fHq1xdIEitWODgsffVx6AoUxkLiZ5yCFg4bRal5A9EYQLHbEdnaH9JZSNA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1760045774; bh=fzIersq24tLXJlfGv+2kroR/v1+hFzZuZg/vW+deOMY=;
 h=From:To:Subject:Date:MIME-Version;
 b=cD5nXBuyNKBpcpS0nByV/b2puxPKc/idxiQMLXhX6ddWsSM/PTkcRbFRK5SH95qtL
 3KR14yCbnD6tHaQ3jHVQgohZUX1kvRx2GoMMqGfwN3fBr34IjEb1ocUORYsimv3L7F
 6UuAC40SLhsybR6BfzWYZoMGKiYQm2mNoXA3x/BCjQ8MlVTBXWRRg1Iu4RV3dvrrng
 UMF1wu5oVVLpRmvjTD8K4jVZWiZHdrTs4SnjLgoF6238TzFly3AC3XX92HE3C1Joyx
 T8j/MRs8VNBVpxLRZ0baqp1brecmrtGgqnu9mmh32ZfCD/Cmd8idk5LsovvNrWq61K
 kuEcafbKxybuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=cD5nXBuy
Subject: [Buildroot] [PATCH v2] package/rtl8821cu: fix build failure with
 Linux 6.17
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

* Bump to version 2025-10-09
* Drop upstreamed local patch

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* pending patch has already been upstream so align with upstream version
---
 .../0001-Fix-build-for-kernel-6.16.patch      | 34 -------------------
 package/rtl8821cu/rtl8821cu.hash              |  2 +-
 package/rtl8821cu/rtl8821cu.mk                |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch

diff --git a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch b/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
deleted file mode 100644
index 311d4fcd4c..0000000000
--- a/package/rtl8821cu/0001-Fix-build-for-kernel-6.16.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 13f85e370c265b782a801cd22f86cea6f6cda876 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Mon, 8 Sep 2025 21:04:30 +0200
-Subject: [PATCH] Fix build for kernel 6.16
-
-With commit:
-https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=41cb08555c4164996d67c78b3bf1c658075b75f1
-from_timer() has been renamed to timer_container_of() so let's rename
-according to linux version >= 6.16.
-
-Upstream: https://github.com/morrownr/8821cu-20210916/pull/187
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- include/osdep_service_linux.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/include/osdep_service_linux.h b/include/osdep_service_linux.h
-index ed1e19b..c25f6a2 100644
---- a/include/osdep_service_linux.h
-+++ b/include/osdep_service_linux.h
-@@ -210,6 +210,10 @@ typedef void	*thread_context;
- typedef void timer_hdl_return;
- typedef void *timer_hdl_context;
- 
-+#if (LINUX_VERSION_CODE > KERNEL_VERSION(6, 16, 0))
-+#define from_timer     timer_container_of
-+#endif
-+
- #if (LINUX_VERSION_CODE > KERNEL_VERSION(2, 5, 41))
- 	typedef struct work_struct _workitem;
- #else
--- 
-2.43.0
-
diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index e7418b4cd0..b9869303de 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6b4bf57959d14ad1a2637a0385876c6fb319d6e4951986bbba18de3c0e65bb86  rtl8821cu-d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf.tar.gz
+sha256  3e7fc5b598b81006fb07a5a3534aa4288cb387ed531c71f3734e55e6cae729b0  rtl8821cu-3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index ac53b65fda..e1ef396110 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf
+RTL8821CU_VERSION = 3d1fcf4bc838542ceb03b0b4e9e40600720cf6ae
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
