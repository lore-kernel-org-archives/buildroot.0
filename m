Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A67C19F2D
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 03:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC8F83F88;
	Sun, 14 Aug 2022 03:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ACC8F83F88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QhT2tMqKFtgk; Sun, 14 Aug 2022 03:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C720683F7C;
	Sun, 14 Aug 2022 03:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C720683F7C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8375D1BF969
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EDA460B53
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 03:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EDA460B53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cX_NTbstsBw8 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 03:32:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9DFE60B4A
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9DFE60B4A
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 03:32:56 +0000 (UTC)
Received: from localhost.localdomain ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPSA
 id N4Mvou23R1ySPN4MwoJSY4; Sun, 14 Aug 2022 05:32:54 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 14 Aug 2022 05:32:53 +0200
Message-Id: <20220814033253.575354-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFCUoE27Wt38At+EXCAy2qWFxvMu2evXesch1JJaAWcMoCa87CxybBUvRN4x/BHZG6OTbJ5aFxHAWxQ5Qoli3xWtaWPKNMjzjXfh6mM+QziGjQgc3rJn
 XVDndOVIgcagwIPMHD9Cc/zQEc/6q2xUeyKGUVh7eC/HLkdUBUINFOaS0MBvZ15FhgVVVGxoX4ZsZnrqMr6JLLc2uY4SzwuUiPToGooJib56+S3VxgZWLzRC
 WKC4vB5k5I2ZOqIwH8CwltK9jc+uRRo7evgh2P2lL8H2iXGvsnnfBv8UqI0qmp3qXlTpDA8YU3+oXO2Szkc8bw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1660447974; bh=icXtvPZZAeKcoKhNDgMpgkzUoPlTxilBl+7rFYWxfvg=;
 h=From:To:Subject:Date:MIME-Version;
 b=e/uQQbxFyYNZ62HQlPzU1y8K3m3CW/JokyuEHRCeX1PMs9ACYxjYFol7Dr46MpMxv
 O9hOqTx941yW5EqeccSF3Glj1npRPlyiiBcAusPXIzK00G/8lXcieaLliDs1nY61AM
 35KOYP7A48m3k3gAljxvfawdihwROgrayOMcysTl71WsceqxTuiBW6LVUSQfyMPiwm
 KUqOiafvoTTMAFaFz6PkGlX4B9JldAXpAe8L4k9sdGgLd4cjlgC66EbRmGJwlsKjz7
 Vxf65yOKKtNApiq3tOeWlWyc3YFbAKsNwLx5cuRV1kPpm53lmO12Xj+29bQuqVIny/
 JYvoI8kLaBvZA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=e/uQQbxF
Subject: [Buildroot] [PATCH] package/ace: fix build failure due to gcc bug
 101915
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ace package exhibits gcc bug 101915 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y.

Fixes:
http://autobuild.buildroot.net/results/f8f/f8f8de99abe92175954c370ad99fee43942bcdcc/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/ace/ace.mk | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 7299f0d40c..6f381d5da5 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -17,9 +17,18 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
+ACE_CPPFLAGS = $(TARGET_CPPFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+ACE_CPPFLAGS += -O0
+endif
+
+# ace requires -std=c++11
+ACE_CPPFLAGS += -std=c++11
+
 ACE_MAKE_OPTS = \
 	ACE_ROOT="$(@D)" \
-	DEFFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+	DEFFLAGS="$(ACE_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ACE_LIBARIES += ace/SSL
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
