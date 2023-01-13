Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA4FCC3DA78
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 23:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4073280E3F;
	Fri, 13 Jan 2023 23:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4073280E3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4pQOuABkyC3; Fri, 13 Jan 2023 23:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739C28086A;
	Fri, 13 Jan 2023 23:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 739C28086A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D39671BF399
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 23:03:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A75664033B
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 23:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75664033B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1VPURmrEnBDx for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 23:03:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 589A74032E
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 589A74032E
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 23:03:31 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 3C2AB20830;
 Fri, 13 Jan 2023 16:54:38 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 16:54:25 -0600
Message-Id: <20230113225425.3301420-2-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113225425.3301420-1-vfazio@xes-inc.com>
References: <20230113225425.3301420-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1673650478; bh=oflEE6NWm3jWagN7+199PBaSAPcG7SAKV1L46Fg43KU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hoqFROf9o/yQZVaoh3bVyt7TYoFFqvadDn8qS3hbQ45oUCj/OG2YVT1pNMcDrzXFy
 28gaDD1aRw8C9hn2UeLfwbGIGuFvpbX290mFvdRUCnyx2eWgT7HgiHSikvrz+8DuTg
 5M4CLQncC9jKClquY2BHOQ+iePo2vzKP/o7OicQ0=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=hoqFROf9
Subject: [Buildroot] [PATCH 2/2] package/ipmitool: use the standard github
 helper
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@xes-inc.com>, Vincent Fazio <vfazio@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
---
 package/ipmitool/ipmitool.hash | 2 +-
 package/ipmitool/ipmitool.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/ipmitool/ipmitool.hash b/package/ipmitool/ipmitool.hash
index bb0b0d80b0..c3b298e3ba 100644
--- a/package/ipmitool/ipmitool.hash
+++ b/package/ipmitool/ipmitool.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  IPMITOOL_1_8_19.tar.gz
+sha256  48b010e7bcdf93e4e4b6e43c53c7f60aa6873d574cbd45a8d86fa7aaeebaff9c  ipmitool-1_8_19.tar.gz
 sha256  b7e2382a8be43b5f6cb092f2d2bda163bf1a1938be9300f821a845cbcd535f56  COPYING
diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index f97d94693b..368660f131 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 IPMITOOL_VERSION = 1_8_19
-IPMITOOL_SOURCE = IPMITOOL_$(IPMITOOL_VERSION).tar.gz
-IPMITOOL_SITE = https://github.com/ipmitool/ipmitool/archive/refs/tags
+IPMITOOL_SITE = $(call github,ipmitool,ipmitool,IPMITOOL_$(IPMITOOL_VERSION))
 IPMITOOL_LICENSE = BSD-3-Clause
 IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VENDOR = ipmitool_project
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
