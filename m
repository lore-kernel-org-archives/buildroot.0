Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC7FCA0FE7
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 21:59:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 507756F5B6;
	Mon, 25 Aug 2025 21:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id siRD8kH6cf7y; Mon, 25 Aug 2025 21:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9281F6F5B7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9281F6F5B7;
	Mon, 25 Aug 2025 21:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2978CD
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B07FB6F5B5
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDIdKu3nI1Pk for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 21:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.188;
 helo=smtpcmd15188.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 358576F5B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 358576F5B2
Received: from smtpcmd15188.aruba.it (smtpcmd15188.aruba.it [62.149.156.188])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 358576F5B2
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 21:59:29 +0000 (UTC)
Received: from localhost.localdomain ([95.168.107.28])
 by Aruba SMTP with ESMTPSA
 id qfDqunHLfX2UCqfDquS2PK; Mon, 25 Aug 2025 23:59:27 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 25 Aug 2025 23:59:23 +0200
Message-ID: <20250825215924.480927-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMpG8bLHbgeMVTQ3KbGdt/QxQ5dNdvY93lDnnpiNAJ8+ooZNJN4tYTotz3MB8TRxsJ2stpSIlub0UsGQ3lPWI+wMk+35qNoW4F7NrQTkjTl+4e+MTgNR
 yeqwbp+WeCEpy70YTPJcpdXhlBJFKBVdiSdXNafx0piv2dhJYWQILiMVzjfbibP2o4JrPAIgioi12n9aMdZI1ak929arZgP4wAKpdT3Tz4/TdiuBXq6Wyd2/
 54YZPbZRWm2vWrn4lYI62tDTP56G9aJMVzHtm3GPnW3UsOaHd92cAgfHpfZaE3zH
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1756159167; bh=ViPMFaUzlSgBJdlqu61F6XBzVJ1MlyL/+u86GsiRfdY=;
 h=From:To:Subject:Date:MIME-Version;
 b=dcUg/7UyXR54N6ZQHGMr/DBekzTy7GjQ81jzeD3CYPBhMvcL27EBZ7Z0bHXLuBKAf
 yNWRAY4qwGv0T+V2EhxDWL8ynsTjv5Be0tSGj+vgvBUqgv13hPT4UfSe8sHhKm39nh
 THrJKk3D/gbxFyapEqRCWbBAau1PfZT5eBfwWs5n06rsNeQisxU3gnuKDvA1NRG6I2
 iIRxo3Q5YS3OhmMrknsPEuwZhwu6hVz+SOjvzCu1JE1rtvecTirzZEQMAR0UfTAX7P
 WLLtlufJnq8ccXro6dBK7G9JMn/dAQy+/zt1TZ7Z1nTnyFSKq8yS1mSaJRxNvG8JRn
 FgntOttfwhAyw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=dcUg/7Uy
Subject: [Buildroot] [for-next] package/libfuse3: bump to version 3.17.4
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

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.17.4

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index 73fe1a84d1..1091dbd6c1 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  99dcab8a4be0e5d3c44f882ab9d4a711533f8cb4a4298e41175ff9bb63770fe5  libfuse3-3.17.3.tar.gz
+sha256  dd21d1545c05e73ada594b93fe593351b7dbf10940fd93b934b9395513108b34  libfuse3-3.17.4.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6b6723dafc..6a6111a065 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.17.3
+LIBFUSE3_VERSION = 3.17.4
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
