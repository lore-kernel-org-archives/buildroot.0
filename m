Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87691C36002
	for <buildroot@archiver.kernel.org>; Wed,  9 Apr 2025 13:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6E14834E1;
	Wed,  9 Apr 2025 13:57:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AdBPik9VwI8Q; Wed,  9 Apr 2025 13:57:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA2DF820C4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2DF820C4;
	Wed,  9 Apr 2025 13:57:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 65ECD1F1
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 13:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B5C3820C4
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 13:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dUMCV83W4cIL for <buildroot@buildroot.org>;
 Wed,  9 Apr 2025 13:56:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 46162817AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46162817AB
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 46162817AB
 for <buildroot@buildroot.org>; Wed,  9 Apr 2025 13:56:58 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id CD3472C841F6;
 Wed, 09 Apr 2025 15:56:55 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed,  9 Apr 2025 15:56:54 +0200
Message-ID: <20250409135655.2733998-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1744207015; bh=nmfez4QeU5gmjpR+fJ6gQSDvhGuuFQBBI3emfUqeF7w=;
 h=From:To:Cc:Subject:Date;
 b=QLTjlcI81119Ih5SgWGiaPlDsQ7B/rAGXd5w6jvqQBqS/ihfVWXK3pVlUh0v5Uj1O
 mNpLMno3SFSgEAAlB/TJPnHPYDLm8XJ1dhyyzyD66y6DvARhU4Ztwk/kyhR4Zh/8Zk
 Ij5pMw62pmVLoeHOCFOjZ+N1vOtELmbYvBsQwab+/vhIHu85YEpT6SlBP6x8hNb2PY
 FnFP9QYY9j2v0VTGXB/F5ngRr70U1+KT938HnhOQz7GyL2a2tB4K4X8oddYHFJ9tWO
 ED+h5wX/6SAJq21YSNz5iNu9anbr734Te/Jye1x4Bq6inE5EWl+XZOqWb3rOo6fXUb
 mVwq61qfb4GSQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=QLTjlcI8
Subject: [Buildroot] [PATCH] package/liblinear: bump to 2.48
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

soname changed, so updating accordingly in the mk file.

COPYRIGHT year got updated[2]

[1] https://github.com/cjlin1/liblinear/commit/818442728081980e9786cd3e87034d4e2912f0c4
[2] https://github.com/cjlin1/liblinear/commit/6c0108dcf3f84262530b909c53e778007235bff5

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/liblinear/liblinear.hash | 4 ++--
 package/liblinear/liblinear.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 6bc72909d0..01c7254df6 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3c64eec45c01943a656baac7aeb8ffd782fe0aea53629aa9f5fdb8eec177c92f  liblinear-2.45.tar.gz
-sha256  d49b7898fd9ea7c29f0478e8c409ee7c0f621533d5eca7b7912e80391dc564e3  COPYRIGHT
+sha256  72ea3853a9fb430b49c3196177d8acdffd2dadb5901832ee323465792087e8cc  liblinear-2.48.tar.gz
+sha256  684e76f565a31ab057790c612bdacc2ee542f8a90b69f922377a92334771488c  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 134673a230..fb3dfdd38c 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.45
+LIBLINEAR_VERSION = 2.48
 LIBLINEAR_SITE = https://www.csie.ntu.edu.tw/~cjlin/liblinear/oldfiles
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
@@ -14,8 +14,8 @@ LIBLINEAR_CFLAGS = $(TARGET_CFLAGS)
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 # $1: destination directory
 define LIBLINEAR_INSTALL_SHARED
-	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.5 $(1)/usr/lib/liblinear.so.5
-	ln -sf liblinear.so.5 $(1)/usr/lib/liblinear.so
+	$(INSTALL) -m 0644 -D $(@D)/liblinear.so.6 $(1)/usr/lib/liblinear.so.6
+	ln -sf liblinear.so.6 $(1)/usr/lib/liblinear.so
 endef
 LIBLINEAR_CFLAGS += -fPIC
 endif
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
