Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DD8C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 14:49:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A2B0419E1;
	Wed, 20 Jul 2022 14:49:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A2B0419E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QFXXq467pVbp; Wed, 20 Jul 2022 14:49:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4284D415CB;
	Wed, 20 Jul 2022 14:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4284D415CB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AED541BF5A6
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 14:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9790282437
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 14:49:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9790282437
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id odI5zAHBXsCU for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 14:49:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A700882435
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A700882435
 for <buildroot@busybox.net>; Wed, 20 Jul 2022 14:49:38 +0000 (UTC)
Received: from tarshish.tkos.co.il (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.tkos.co.il (Postfix) with ESMTPS id 9B62D440F2F;
 Wed, 20 Jul 2022 17:49:09 +0300 (IDT)
To: buildroot@busybox.net
Date: Wed, 20 Jul 2022 17:49:30 +0300
Message-Id: <bc4534b95dda219e91bd9b0de2ed758711bf53d3.1658328570.git.baruch@tkos.co.il>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1658328549;
 bh=X6AeJyNXM/5p0QZm/nFG6rPD8xnYyhJhmqMIBIqgY2M=;
 h=From:To:Cc:Subject:Date:From;
 b=EKA4pVh1+IEXv//X1vwM7scc8JzafF2QN6wRB0VhAqQtAQ9o+JO0mxVlDyhkMdEPt
 WmHQ9VY4xdPIAUhgkzybyzxg+cWKCbnjItM9YFxJ51XeGStNER4goq0GQBDFL2BGaj
 kRzoW/Z/n8/oBXlaRtUslX2N0V28ZrR3XAW/D42KwIvkSlDG3mv/2+tWKImcpPlpQv
 L4keqi0seQu4PVUIw8fC3/UNMNcZOElZFmmESQwt+MUvjlTUzAyEfpxpSbccaiIl1B
 pR6Kkf9cntZhM/fmlP41yGBICXOtnyGZQMBnQhWKOrjkS7fROteORWcw6AHLjOO/8j
 /cuiAisObHehA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=EKA4pVh1
Subject: [Buildroot] [PATCH] package/cjson: add option to build cJSON_Utils
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cJSON_Utils adds support for a few additional JSON RFCs. The size
increase is small (around 12K for ARM32), but it is more than half the
size of cJSON itself. So add a separate config option for cJSON_Utils.

Cc: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cjson/Config.in | 10 ++++++++++
 package/cjson/cjson.mk  |  6 ++++++
 2 files changed, 16 insertions(+)

diff --git a/package/cjson/Config.in b/package/cjson/Config.in
index ee18fced5cc6..b583e487569c 100644
--- a/package/cjson/Config.in
+++ b/package/cjson/Config.in
@@ -5,3 +5,13 @@ config BR2_PACKAGE_CJSON
 	  ANSI-C compliant JSON parser, under MIT license.
 
 	  https://github.com/DaveGamble/cJSON
+
+if BR2_PACKAGE_CJSON
+
+config BR2_PACKAGE_CJSON_UTILS
+	bool "cJSON utils"
+	help
+	  Supplementary library with support for JSON Pointer (RFC-6901),
+	  JSON Patch (RFC-6902), JSON Merge Patch (RFC-7386), and more.
+
+endif
diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ac8db5701f27..ad9d76a4bab2 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -25,4 +25,10 @@ else
 CJSON_CONF_OPTS += -DBUILD_SHARED_AND_STATIC_LIBS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_CJSON_UTILS),y)
+CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=ON
+else
+CJSON_CONF_OPTS += -DENABLE_CJSON_UTILS=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
