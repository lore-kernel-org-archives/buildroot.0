Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D174D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2B5860C1C;
	Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gn2mD2pRiCQc; Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22B7B60C34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333013;
	bh=0rbPxtBED09CVdagK4LOOXCtcmzH0oWeLuwE+uGw+rs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vd5lA9sKddY+myOkbJWjvC+6uDx5pQW/WncjGW9NZR5WvDYcGLHBhrKSjbENfp1px
	 CASfMSMggupdMsoVjqat5W9TseGrWJ81nXy27t/4x0ynggNESBX/WEItVdS3S2MqpK
	 cdDOoey3QzkeqMv8ESadsjHMV4l+LmgahkhHNtoH80U/PnMvqaO3qrwUTM2LZ6CABQ
	 AEqcr7c1tvrX9xKSAceis8Rq9aqnT1H6XsaV0V9qlQ4JI+vPHGponsEGQGTT5xP3/L
	 xC4mBPWffwB9/TRwlQFJN/Al08El+iRfUn+QFH1KJ76BrWkoe4svBNDbZAZxdQ35H3
	 P4KrKxdDfTFlg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22B7B60C34;
	Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0AA21C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1DCDD404C2
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW07fe6B5rWR for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77D3F404CA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 77D3F404CA
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 75BD886E71; Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:20:07 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 32dcee9454ea81c3be9b834a08d56f1df2b2ba04
X-Git-Newrev: f777594d19f696f8e5361afde1fc34a4114b1e3b
X-Patchwork-Hint: ignore
Message-Id: <20260113193618.75BD886E71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/zxing-cpp: drop
 support for Python bindings
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f777594d19f696f8e5361afde1fc34a4114b1e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since the bump of zxing-cpp to version 2.3.0 in Buildroot commit
fb032bd34acf57f86f62bd474cbabd4e1e750e67 ("package/zxing-cpp: bump to
version 2.3.0"), the build of the Python bindings has been broken. We
tried to figure things out, but couldn't, and nobody bothered fixing
this since February 2025, so let's drop support for the Python
bindings for the time being.

Fixes:

  https://autobuild.buildroot.net/results/93ffa69b9f92f142c65169f9c3a7c7ad0e733551/

Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f78163431c4ea5a7d8aa083639fc5435d8d64957)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zxing-cpp/zxing-cpp.mk | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 515daf590f..8c44e8ea9a 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -14,17 +14,8 @@ ZXING_CPP_DEPENDENCIES = host-pkgconf stb
 ZXING_CPP_CONF_OPTS = \
 	-DBUILD_BLACKBOX_TESTS=OFF \
 	-DBUILD_UNIT_TESTS=OFF \
-	-DBUILD_DEPENDENCIES=LOCAL
-
-ifeq ($(BR2_PACKAGE_PYTHON3)$(BR2_PACKAGE_PYTHON_PYBIND),yy)
-ZXING_CPP_DEPENDENCIES += python3 python-pybind
-ZXING_CPP_CONF_OPTS += \
-	-DBUILD_PYTHON_MODULE=ON \
-	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
-	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
-else
-ZXING_CPP_CONF_OPTS += -DBUILD_PYTHON_MODULE=OFF
-endif
+	-DBUILD_DEPENDENCIES=LOCAL \
+	-DBUILD_PYTHON_MODULE=OFF
 
 ifeq ($(BR2_PACKAGE_ZXING_CPP_READERS),y)
 ZXING_CPP_CONF_OPTS += -DBUILD_READERS=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
