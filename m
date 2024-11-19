Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50ABD6C295
	for <buildroot@archiver.kernel.org>; Tue, 19 Nov 2024 20:35:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84EE284373;
	Tue, 19 Nov 2024 20:35:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LeTtnzX29OQ2; Tue, 19 Nov 2024 20:35:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B27184448
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B27184448;
	Tue, 19 Nov 2024 20:35:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 445D5DB3
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 20:35:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 238DF42F4F
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 20:35:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1kn31mlf9_7Q for <buildroot@buildroot.org>;
 Tue, 19 Nov 2024 20:35:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 050DD41CAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 050DD41CAA
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 050DD41CAA
 for <buildroot@buildroot.org>; Tue, 19 Nov 2024 20:34:59 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:e4f5:8dbb:490c:d591])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A4B162003D0;
 Tue, 19 Nov 2024 21:34:53 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: zer0@droids-corp.org,
	robin@jarry.cc,
	Vincent Jardin <vjardin@free.fr>
Date: Tue, 19 Nov 2024 21:33:29 +0100
Message-ID: <20241119203329.57567-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732048496;
 bh=uaqogSBurVQZyyqg2Alg65guR1Hf5P2JNcSvvuFAoEU=;
 h=From:To:Cc:Subject:Date:From;
 b=opfxZ8e0OcH9bamRdvJfqrWKEdVyEIVxzdgE5Hhtqq+KKC8PVgCLWiRdb96Y2cmCe
 kMPJNqrjmc15LdzfU/5CB302tZ+eVYsdwwzfKeLbgQrrlQOkJ6qyXXrFrFg2sz9wrZ
 m2PETb/5BSdJjsu8/IncnJ0ZVHoCcAspmfIrLx6Lt4K52ttnUi1GFO52pJeTJiW/68
 joUd7KlGKi9FZdTlufrLxevh3peHrkz+GVNob31IQ2zWqeP3tfvsl4sTqS/oDV4WPY
 5AFedq9g2qzwbjJUFLq2qXILUrcwpXNre9r1vsx83h9GeUw421Ib5aEaEI6xr7cA6V
 TevYIp18kHgKw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=opfxZ8e0
Subject: [Buildroot] [PATCH 1/1] package/libecoli: bump version to 0.3.0
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

This new version includes the missing headers that will be needed for
grout. Its meson option has been revamped.

Signed-off-by: Vincent Jardin <vjardin@free.fr>
Suggested-by: Robin Jarry <robin@jarry.cc>
---
 package/libecoli/libecoli.hash |  2 +-
 package/libecoli/libecoli.mk   | 11 ++++++++++-
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/package/libecoli/libecoli.hash b/package/libecoli/libecoli.hash
index 0540ef7270..433550f91b 100644
--- a/package/libecoli/libecoli.hash
+++ b/package/libecoli/libecoli.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  0da8f953e054dd2ba75a0d1dcbbc8830b76747282035e1d1de6082ec3bb6f995  libecoli-0.2.0.tar.gz
+sha256  e66a85a35bae644b0baf9a4e6d084ff926ebaa12023f9df9f34e8f7a46834da8  libecoli-0.3.0.tar.gz
 sha256  e58bf9ec962bee9b3e37abcaa0bc0ec940b05efdc1d1a5a4d9e2fdbcc08b7bdd  LICENSE
diff --git a/package/libecoli/libecoli.mk b/package/libecoli/libecoli.mk
index c46f62b523..f518208e92 100644
--- a/package/libecoli/libecoli.mk
+++ b/package/libecoli/libecoli.mk
@@ -4,14 +4,23 @@
 #
 ################################################################################
 
-LIBECOLI_VERSION = 0.2.0
+LIBECOLI_VERSION = 0.3.0
 LIBECOLI_SITE = $(call github,rjarry,libecoli,v$(LIBECOLI_VERSION))
 LIBECOLI_INSTALL_STAGING = YES
 LIBECOLI_LICENSE = BSD-3-Clause
 LIBECOLI_LICENSE_FILES = LICENSE
 
+LIBECOLI_INSTALL_STAGING = YES
+
 LIBECOLI_DEPENDENCIES = \
 	host-pkgconf \
 	libedit
 
+LIBECOLI_CONF_OPTS = \
+	-Ddoc=disabled \
+	-Deditline=enabled \
+	-Dexamples=disabled \
+	-Dyaml=disabled \
+	-Dtests=disabled
+
 $(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
