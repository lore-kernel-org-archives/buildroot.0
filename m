Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B5FC4332F
	for <buildroot@archiver.kernel.org>; Tue,  3 May 2022 14:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3971D817C0;
	Tue,  3 May 2022 14:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gQCDK2EuWRbx; Tue,  3 May 2022 14:27:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6014F817AD;
	Tue,  3 May 2022 14:27:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3A101BF41A
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D280D401C5
 for <buildroot@lists.busybox.net>; Tue,  3 May 2022 14:27:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linux.microsoft.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RM4CQeD17_7y for <buildroot@lists.busybox.net>;
 Tue,  3 May 2022 14:27:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A62E40ADC
 for <buildroot@buildroot.org>; Tue,  3 May 2022 14:27:17 +0000 (UTC)
Received: from pwmachine.home (154.pool92-186-13.dynamic.orange.es
 [92.186.13.154])
 by linux.microsoft.com (Postfix) with ESMTPSA id E293C20EB0C3;
 Tue,  3 May 2022 07:27:15 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E293C20EB0C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1651588037;
 bh=TBFcTXIBGp77Yd6LG0l4SzjvXjdCbMUgpft1pUnJptA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pgZr4YJdfHWmdKwTLBtNTuu9GwGLFtHp5GjOK1Xw9L6/7BeNNC+GuRJLGHiTr85rS
 otf8qiggWY5kvMBd1Ad5aokj/clZ6NVo7T83Em+btAdI8mNy7sdgdPBUd+z3XdA1Gx
 MO08MOm9cqb72mFR1u4ZHo/QP3lZBdydj/BQU29I=
From: Francis Laniel <flaniel@linux.microsoft.com>
To: buildroot@buildroot.org
Date: Tue,  3 May 2022 15:27:01 +0100
Message-Id: <20220503142701.14397-3-flaniel@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503142701.14397-1-flaniel@linux.microsoft.com>
References: <20220503142701.14397-1-flaniel@linux.microsoft.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/sysdig: bump to version 0.29.2
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
---
 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index 380c9dce1e..c953421f27 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e  sysdig-0.29.1.tar.gz
+sha256  38ea602085f706af5d07630189216fa240064122650a81456cb092579313ae8e  sysdig-0.29.2.tar.gz
 sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index 318746d44a..2d57c0043f 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.29.1
+SYSDIG_VERSION = 0.29.2
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = Apache-2.0
 SYSDIG_LICENSE_FILE = COPYING
@@ -32,6 +32,7 @@ SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR)
 	-DENABLE_DKMS=OFF \
 	-DUSE_BUNDLED_DEPS=OFF \
 	-DWITH_CHISEL=ON \
-	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
+	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson \
+	-DSYSDIG_VERSION=$(SYSDIG_VERSION)
 
 $(eval $(cmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
