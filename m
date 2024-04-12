Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC6BC4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 365204040B;
	Fri, 12 Apr 2024 13:58:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yPr5FXsUbza; Fri, 12 Apr 2024 13:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9EA94049A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9EA94049A;
	Fri, 12 Apr 2024 13:58:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 165061BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 107A94018B
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TOHS2JYpntGS for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:58:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.2;
 helo=m16.mail.163.com; envelope-from=tianyuanhao3@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CF8464014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CF8464014D
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF8464014D
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:58:51 +0000 (UTC)
Received: from ubuntu-jammy.. (unknown [123.185.17.20])
 by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wDXL_8QPhlmIvq0Aw--.33028S2;
 Fri, 12 Apr 2024 21:58:41 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 13:58:20 +0000
Message-Id: <20240412135820.1599-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDXL_8QPhlmIvq0Aw--.33028S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF45WF1UGw4rtF1kWF43trb_yoW8Xw1xpw
 47Jr4UX3y0grWrGFy3Cw17Xr4fXr4qgF18Kw17tw1Iq3WDtr1qg345Kay5Jry7Xr1Iy3y5
 JrnrKryUZa92y3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRkHUPUUUUU=
X-Originating-IP: [123.185.17.20]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBzhe+jWV4INd7ngAAsl
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LbvHp
 Lk4h+QALUWf92Hbo3LM14FDjKCBb/pUvyxdMK8=; b=K9dEJJdM78Xzj+SPMtJxx
 qfALzx0JPA5J152SPBdzVn6eieXR+yhgFcNNx+1sWIFvoIWZH8c65sn2WJc0DgZ6
 yVjOao9BGsbl0h+HgJg4LtLjnHvdUZB8JCWV235/SSfaA+qWnNbBPGZzLtTDOu8B
 m7+xKOnZg/PlS/fLx2VKdk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=K9dEJJdM
Subject: [Buildroot] [PATCH 1/1] package/ttyd: bump to version 1.7.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Notable changes:

- The web terminal is readonly by default now, to make it writable, use
  -W option.

Also set TTYD_CPE_ID_VALID.

cpe:2.3:a:ttyd_project:ttyd is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/detail/DBEDA75E-4E19-48C1-92D7-43E4035BC048

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/ttyd/ttyd.hash | 2 +-
 package/ttyd/ttyd.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/ttyd/ttyd.hash b/package/ttyd/ttyd.hash
index b11327c465..9a407a68fd 100644
--- a/package/ttyd/ttyd.hash
+++ b/package/ttyd/ttyd.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  300d8cef4b0b32b0ec30d7bf4d3721a5d180e22607f9467a95ab7b6d9652ca9b  ttyd-1.7.4.tar.gz
+sha256  039dd995229377caee919898b7bd54484accec3bba49c118e2d5cd6ec51e3650  ttyd-1.7.7.tar.gz
 sha256  8b7e100f8311cb428c57609164d93099bada2599f948359045d1ac876a7a625b  LICENSE
diff --git a/package/ttyd/ttyd.mk b/package/ttyd/ttyd.mk
index d0e144b252..e6cf791988 100644
--- a/package/ttyd/ttyd.mk
+++ b/package/ttyd/ttyd.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-TTYD_VERSION = 1.7.4
+TTYD_VERSION = 1.7.7
 TTYD_SITE = $(call github,tsl0922,ttyd,$(TTYD_VERSION))
 TTYD_LICENSE = MIT
 TTYD_LICENSE_FILES = LICENSE
 TTYD_DEPENDENCIES = json-c libuv libwebsockets openssl zlib
+TTYD_CPE_ID_VALID = YES
 
 $(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
