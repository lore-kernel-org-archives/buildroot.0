Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C002C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 15:26:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 499AA61B88;
	Mon, 25 Jul 2022 15:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 499AA61B88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eZwEN9PbubNF; Mon, 25 Jul 2022 15:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4927C61B8C;
	Mon, 25 Jul 2022 15:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4927C61B8C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F6AE1BF982
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDA6A60C0D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 15:25:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EDA6A60C0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oyPtkDgA6G0I for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 15:25:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1582460B0B
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1582460B0B
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:25:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPA id 0D16F24000D;
 Mon, 25 Jul 2022 15:25:33 +0000 (UTC)
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Peter Seiderer <ps.report@gmx.net>,
 Buildroot List <buildroot@buildroot.org>
Date: Mon, 25 Jul 2022 17:25:21 +0200
Message-Id: <20220725152522.1579992-6-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
References: <20220725152522.1579992-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658762734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aCUgm3a1LWHh/y7Mkmxh+FMhhf7UlTJXeoBkgjSSiCY=;
 b=DVWnhrMOyMckrvHkm4Ar+m/Mg8mtO9hRHPJuoPXb3x6BYHwFa+ESwaMWYGsc4G881HuyQw
 58UIW3eNTVsyS3qktOnMgiQeXF5EPr97E8vCZpP5hbiniO9gPV+60O0VBaLlrB1eGEtcBr
 jZappTNKQ0Eu6QAC1kAnwN+ANKXuAswCJasT0rogEpN+4boWvsA7H+6y1pwFQtgGwlMQEH
 LiNXbyY44nlJITaWhoT662cxzbXunkNrcb3XS9ah4Y+B04thA4QCIkPhJRC3ZVHOIOQi5T
 q074tQh4CWGlOa8jDtBsiWZxMzHv8YIQhwclG+MnwInGdkSjBkRmjK7DJWk6Gw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DVWnhrMO
Subject: [Buildroot] [PATCH 5/5] support/misc/toolchainfile.cmake.in: add
 definitions needed by Qt6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When compiling Qt6 applications for the target, CMake needs to have
two variables defined to find the host installation of Qt. These two
variables are unconditionally defined, regardless of whether Qt6 is
enabled in the configuration or not, as they do no harm when Qt6 is
not present/used.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/toolchainfile.cmake.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/support/misc/toolchainfile.cmake.in b/support/misc/toolchainfile.cmake.in
index 30c0e63bf2..5d2b8695b4 100644
--- a/support/misc/toolchainfile.cmake.in
+++ b/support/misc/toolchainfile.cmake.in
@@ -125,3 +125,12 @@ if(@@TOOLCHAIN_HAS_FORTRAN@@)
     set(CMAKE_Fortran_COMPILER "${RELOCATED_HOST_DIR}/@@TARGET_FC@@")
   endif()
 endif()
+
+# For Qt6
+if(NOT DEFINED QT_HOST_PATH)
+  set(QT_HOST_PATH "${RELOCATED_HOST_DIR}")
+endif()
+
+if(NOT DEFINED QT_HOST_PATH_CMAKE_DIR)
+  set(QT_HOST_PATH_CMAKE_DIR "${RELOCATED_HOST_DIR}/lib/cmake")
+endif()
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
