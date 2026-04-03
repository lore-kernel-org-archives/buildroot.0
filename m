Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3895E8537A
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 785FE80E03;
	Fri,  3 Apr 2026 17:26:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qIhOYNCzxyWB; Fri,  3 Apr 2026 17:26:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8323780DE1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237162;
	bh=DMvslfndB2InxKmxumG/2sPSL6JkqDOprdNernvNfcQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sqqr4RFal8FkyK1yIIMC1be9TRYZSqakETCJ7FxsOk9bA6VceaMMaBMP8//mIHw8W
	 evxwR1yJyuQzG3pehMv80aA+K++Vh4zIsVN3H2QNiPzWh174fDtZPF5PMg4G5y2StO
	 HNOE8y0tztd6mAWzehzrE1GEWaOkJ7CY/VxpI4WTV4Y0XqRJ49Y0PYePVYCEAM96LI
	 V/NhbIVhTOQmEwrlVWb5QAPVfbqYXhCtIr8jKLBzTqEnkW5LBez086Wb7qkQc9gapM
	 9zTo6JvUeWQ5QQQPb72N89Tgfdi8HOF8Ls5FNPg0mm8m/+vQSriSZLCTZooNViMuqQ
	 4HARsN+KGsXDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8323780DE1;
	Fri,  3 Apr 2026 17:26:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 67ED02CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 635FC60E9C
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pb0gs8N8PfNJ for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:25:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EDA560E69
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EDA560E69
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:25:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B868280094; Fri,  3 Apr 2026 17:25:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:23:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 011bc4b7472bf7782af4eb8187f5c9992a9f9cef
X-Git-Newrev: 6ba7970b83f27cac5b8ebe743530b8f70a4cd6e4
X-Patchwork-Hint: ignore
Message-Id: <20260403172558.B868280094@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ba7970b83f27cac5b8ebe743530b8f70a4cd6e4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index cabdd479a1..3fe82e9ba5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.3
+MESA3D_HEADERS_VERSION = 26.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index c938372b49..9a56e54406 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-March/000842.html
-sha256  ddb7443d328e89aa45b4b6b80f077bf937f099daeca8ba48cabe32aab769e134  mesa-26.0.3.tar.xz
-sha512  82a33d0fa0c2855a63f599e38753126a2195025a13e45f38e14fda7aa008cb05925bb74088e4a1e199c9237d9388f4d4408a2c95c1d7fe79d8e6e6f27c84187b  mesa-26.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html
+sha256  6d91541e086f29bb003602d2c81070f2be4c0693a90b181ca91e46fa3953fe78  mesa-26.0.4.tar.xz
+sha512  ddb59df633116a7ccd9d2d3a2e2009945909e3f774956efcbc032a2f963641cce50d0f319bebdc041df17700aa827aa2ccbc61c9e40b4020de9ff027eab27e23  mesa-26.0.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b9243dfaec..79f063d7e3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.3
+MESA3D_VERSION = 26.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
