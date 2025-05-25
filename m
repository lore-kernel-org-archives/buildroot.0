Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8DEC54F30
	for <buildroot@archiver.kernel.org>; Sun, 25 May 2025 21:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13D9980CD4;
	Sun, 25 May 2025 21:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYzCRnV9BJIr; Sun, 25 May 2025 21:44:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4042580CC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4042580CC4;
	Sun, 25 May 2025 21:44:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A060868
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CE6B80CC4
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ms5rCZHjhFRC for <buildroot@buildroot.org>;
 Sun, 25 May 2025 21:44:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.87;
 helo=smtpcmd0987.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DED72807B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DED72807B3
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DED72807B3
 for <buildroot@buildroot.org>; Sun, 25 May 2025 21:44:25 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id JJ8ouikZ90WuxJJ8ouN6df; Sun, 25 May 2025 23:44:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 25 May 2025 23:44:21 +0200
Message-Id: <20250525214421.404963-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFSxEhVREWHwrrxOI2c6fvNPVwwr9CEDEM32r5BFXFonh0f6HOBTPdt3KOYa6PXXMI3NNOsp0fBBrYbrnxD1h4dg9pDWqaxj4vLwa7Lv0YT2eiyfXWDk
 LehHMKl/I9wz5jJX3meN42ExwYKA7VgfRq0jrPDbFAezgtstTKEI6oPDZn6Vh6TDP7h1wasJPTypCHyjH+/D9py3tJiZ/8mVXmTj/JBkKhvoglkKb6+jvSf0
 BcdZIlUXoibIc7pNOIeMKHxxREHrI6JzxnQ42qNqqewh+s2flHasUn6oog9+N3EjoR+1z8axUu3gYFtshM+4rg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1748209462; bh=YicN5Gxb83H7At/ttx4z0egZh4UxbIv4QW5VzcplZeY=;
 h=From:To:Subject:Date:MIME-Version;
 b=D7pX/cx4Jipx62W8xRUcLwIFVGDI7K2oQveKCCzvKQJlo/n/3IqLdxxlsXxNilT/M
 7hNp843ANTHBVLJnfQIJsjpYSVo9tyjRevyXgjU1WTHh06xsghyoyyRgoWTAGZwinR
 cHcP9WVx5j7Q9wVlL3w0Y1s911qcLHWJLyp19ibQJYyF5v8Zi6Rl7SBy0a/RIhNdUU
 pb1llUGttJt3bJC2UYQL83+m1Isx7m2oAxnBeTyufXWgugi+VMeKgKLpEmC5XwunzN
 E/ZzKEeNyefROjiZ39phT3mgur7EFlnMcxbBGjqUIwEKvihwE2PC5vKs3bVWvNCPTx
 7epeuI3yuZUKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=temperror header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=D7pX/cx4
Subject: [Buildroot] [PATCH] package/rtl8821cu: bump to version 2025-05-08
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

With this version we can build with Linux 6.15.

Fixes:
https://autobuild.buildroot.org/results/b6aed17d0ddbedafc3249850fc0dc92cc240b956/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.hash | 2 +-
 package/rtl8821cu/rtl8821cu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821cu/rtl8821cu.hash b/package/rtl8821cu/rtl8821cu.hash
index f84be14b7c..e7418b4cd0 100644
--- a/package/rtl8821cu/rtl8821cu.hash
+++ b/package/rtl8821cu/rtl8821cu.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1f28db84937010a754ac84c21831fe06547f7add0be11f1c517cf7c81cf45fc7  rtl8821cu-96c65c58b544241178638e810b333dcc9aa26b91.tar.gz
+sha256  6b4bf57959d14ad1a2637a0385876c6fb319d6e4951986bbba18de3c0e65bb86  rtl8821cu-d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf.tar.gz
 sha256  22cdb0a9cf492dbf05c5b27381a5c0e73ae0d4622427b522b0ba92b7495e5fb0  LICENSE
diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index ee15910c7c..ac53b65fda 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821CU_VERSION = 96c65c58b544241178638e810b333dcc9aa26b91
+RTL8821CU_VERSION = d74134a1c68f59f2b80cdd6c6afb8c1a8a687cbf
 RTL8821CU_SITE = $(call github,morrownr,8821cu-20210916,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
