Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32576C4829B
	for <buildroot@archiver.kernel.org>; Mon, 12 Feb 2024 09:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D189040BD9;
	Mon, 12 Feb 2024 09:55:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yVD7S6K-f-cg; Mon, 12 Feb 2024 09:55:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A526C402D7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A526C402D7;
	Mon, 12 Feb 2024 09:55:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C34F41BF292
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BCD0A4151C
 for <buildroot@lists.busybox.net>; Mon, 12 Feb 2024 09:55:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DaSlgsf9PG2G for <buildroot@lists.busybox.net>;
 Mon, 12 Feb 2024 09:55:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A0C340BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A0C340BD9
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A0C340BD9
 for <buildroot@buildroot.org>; Mon, 12 Feb 2024 09:55:18 +0000 (UTC)
Received: from tuxedoOT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9CAA72C837B0;
 Mon, 12 Feb 2024 10:55:15 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon, 12 Feb 2024 10:55:14 +0100
Message-Id: <20240212095514.11656-1-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1707731715; bh=l89NuWIYJxAZTUX2xIZoWMXv5hJBai/k+gl7l7YDvrA=;
 h=From:To:Cc:Subject:Date;
 b=r3M6lfvDuW+Sb3RTsdv+nXZf6Y2yk6LK+8YHpHI63LYVUA2fyZGE+9bhneg9NpXZL
 IgUHsbiDMCT61pM7n4Giy5kRncC5bdLtOtOBNFh1XYfzyVZUXCLVQQ5EZ8ZyH7cvpC
 gB/FgY+6IWp0iH1FcwiBnBFnkguFiAgKUxDk3Ru9D0RN+Cm65PKHYzdCcE5T183eok
 tkPJFvEn/XsAchlzl8Sk4Kxl9ZNUzSg7svjwAmc/aYwwFkXd2ceGA3EesZz3e9SAUq
 ftcierx+lyDHLqJb5vstx7jXnT+lPuPdNZWsK3zt+bSIyFgKqmZ7Iqa9O4SNze1eye
 sWFQWpTV4rNJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=r3M6lfvD
Subject: [Buildroot] [PATCH] package/python3: security bump to 3.12.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:
  * Skip .pth files with names starting with a dot or hidden file
    attribute. [1]

[1] https://docs.python.org/release/3.12.2/whatsnew/changelog.html#security
---
 package/python3/python3.hash | 6 +++---
 package/python3/python3.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 725c854050..611b8d0432 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
-# From https://www.python.org/downloads/release/python-3121/
-md5  50f827c800483776c8ef86e6a53831fa  Python-3.12.1.tar.xz
+# From https://www.python.org/downloads/release/python-3122/
+md5  e7c178b97bf8f7ccd677b94d614f7b3c  Python-3.12.2.tar.xz
 # Locally computed
-sha256  8dfb8f426fcd226657f9e2bd5f1e96e53264965176fa17d32658e873591aeb21  Python-3.12.1.tar.xz
+sha256  be28112dac813d2053545c14bf13a16401a21877f1a69eb6ea5d84c4a0f3d870  Python-3.12.2.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 42765abcf4..e500155c80 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).1
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).2
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
